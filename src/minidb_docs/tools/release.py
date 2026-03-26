#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
# @Author: José Sánchez-Gallego (gallegoj@uw.edu)
# @Date: 2026-03-09
# @Filename: release.py
# @License: BSD 3-clause (http://www.opensource.org/licenses/BSD-3-Clause)

from __future__ import annotations

import pathlib
import re

import oyaml as yaml
import polars
from rich.console import Console
from typing_extensions import Literal

from minidb_docs import console as log_console


__all__ = [
    "generate_mos_target_tree_paths",
    "get_list_mos_target_fits_files",
    "mos_target_is_split",
    "download_mos_target_sample_files",
    "generate_datamodels",
    "update_datamodels",
    "validate_mos_target_tree_paths",
    "validate_datamodels",
    "create_products_table",
    "create_mos_target_parquet_files",
    "validate_mos_target_parquet_files",
]


console = log_console or Console()


def generate_mos_target_tree_paths(
    dr: str,
    mos_target_dir: str | pathlib.Path,
    force: bool = False,
    quiet: bool = False,
) -> None:
    """Generates the MOS target paths for the ``tree`` product.

    Parameters
    ----------
    dr
        The data release for which to generate the paths.
    mos_target_dir
        The directory where the ``mos_target`` files are located. It is assumed that
        there are two directories, ``fits/`` and ``parquet/``, inside this directory,
        containing the FITS and Parquet files, respectively.
    force
        The function will check that the list of FITS files matches the list of
        ``minidb_docs`` documentation stubs for data release``dr`` and will fail if
        the lists do not match. If :obj:`True`, the function will ignore any mismatch
        and will generate the paths anyway.
    quiet
        If :obj:`True`, suppresses the output printouts of the function.

    """

    console.quiet = quiet

    mos_target_dir = pathlib.Path(mos_target_dir)
    minidb_docs_path = pathlib.Path(__file__).parent / f"../../../{dr}"

    minidb_docs_files = list(sorted(minidb_docs_path.glob(f"{dr}_*.txt")))
    mos_target_files = get_list_mos_target_fits_files(mos_target_dir / "fits")

    # Check that all the minidb tables have a corresponding FITS file.
    missing_files_found: bool = False
    for ff in minidb_docs_files:
        base_name = ff.stem.replace(f"{dr}_", "")
        if base_name not in mos_target_files:
            missing_files_found = True
            console.print(f"[yellow]Missing FITS file for table [cyan]{base_name}[/].")

    if missing_files_found:
        if not force:
            console.print(
                "[red]Missing FITS files found. Use [cyan]force=True[/] to "
                "ignore this error and generate the paths anyway.[/]"
            )
            return
        else:
            console.print(
                "[yellow]Missing FITS files found, but ignoring this "
                "error because [cyan]force=True[/] was used.[/]"
            )

    # We check if there are extra FITS files that do not have a corresponding
    # documentation stub, but we do not fail if this is the case.
    for ff in mos_target_files:
        if ff not in [ff.stem.replace(f"{dr}_", "") for ff in minidb_docs_files]:
            console.print(
                f"[yellow]Extra FITS file for table [cyan]{ff}[/] found without "
                "a corresponding documentation stub. It will be ignored.[/]"
            )

    print("# MOS Target FITS files")

    for ff in minidb_docs_files:
        tree_species = ff.stem.replace(f"{dr}_", "mos_target_")
        path_species = tree_species.replace("mos_target_", "mos_")

        n_num = mos_target_path_num(mos_target_dir / "fits", path_species)
        if n_num == 0:
            raise ValueError(f"No FITS files found for {tree_species}.")

        num_digits = len(str(n_num))

        print(f"{tree_species} = $MOS_TARGET/", end="")

        if dr.lower() == "sdsswork":
            print(f"fits/{tree_species}_1.fits")
        else:
            if n_num == 1:
                print(f"{{v_targ}}/fits/{path_species}.fits")
            else:
                if num_digits == 1:
                    print(f"{{v_targ}}/fits/{path_species}-{{num}}.fits")
                else:
                    print(f"{{v_targ}}/fits/{path_species}-{{num:0>{num_digits}}}.fits")

    print("\n# MOS Target Parquet files")

    for ff in minidb_docs_files:
        table_name = ff.stem.replace(f"{dr}_", "")

        parquet_file = mos_target_dir / "parquet" / f"mos_{table_name}.parquet"
        if not parquet_file.exists():
            console.print(f"[red]Missing Parquet file for table [cyan]{table_name}[/].")
            return

        tree_species = f"mos_target_{table_name}_parquet"
        print(f"{tree_species} = $MOS_TARGET/{{v_targ}}/parquet/{parquet_file.name}")


def download_mos_target_sample_files():
    """Downloads a target FITS file for each table from sdsswork to the local SAS."""

    try:
        from sdss_access import RsyncAccess
        from tree import Tree
    except ImportError:
        raise ImportError("The sdss-access and sdss-tree packages are required.")

    tree = Tree("sdsswork")

    rsync = RsyncAccess(release="sdsswork")
    rsync.remote()

    for path in tree.paths:
        if "mos_target" in path:
            remote_path = tree.paths[path]
            if remote_path.endswith("{num}.fits"):
                rsync.add(path, num=1)
            else:
                rsync.add(path)

    rsync.set_stream()
    rsync.commit()


def get_list_mos_target_fits_files(mos_target_dir: str | pathlib.Path) -> list[str]:
    """Returns a list of the MOS target FITS files in the given directory.

    The returned list does not include the ``.fits`` extension. For tables that have
    been divided in multiple fits files of the form ``mos_XXX-NUM.fits``, only the
    base name ``XXX`` is returned.

    """

    mos_target_dir = pathlib.Path(mos_target_dir)

    fits_files = sorted(mos_target_dir.glob("mos_*.fits"))

    mos_target_files = [
        re.sub(r"mos\_(.+?)(\-[0-9]+)?$", r"\1", ff.stem) for ff in fits_files
    ]

    return sorted(set(mos_target_files))


def mos_target_path_num(mos_target_dir: str | pathlib.Path, tree_species: str) -> int:
    """Returns the number of FITS files for the given MOS target tree species."""

    mos_target_dir = pathlib.Path(mos_target_dir)

    if len(list(mos_target_dir.glob(f"{tree_species}.fits"))) == 1:
        return 1

    fits_files = list(mos_target_dir.glob(f"{tree_species}-[0-9]*.fits"))

    return len(fits_files)


def mos_target_is_split(mos_target_dir: str | pathlib.Path, tree_species: str) -> bool:
    """Checks if the given MOS target tree species is split in multiple FITS files."""

    return mos_target_path_num(mos_target_dir, tree_species) > 1


def validate_mos_target_tree_paths(
    dr: str,
    v_targ: str | None = None,
    verbose: bool = False,
):
    """Uses ``sdss-access`` to validate the MOS target tree paths for a data release."""

    try:
        from sdss_access import Path
        from tree import Tree
    except ImportError:
        raise ImportError("The sdss-access and sdss-tree packages are required.")

    path = Path(dr)
    tree = Tree(dr)

    if dr.lower() != "sdsswork" and v_targ is None:
        raise ValueError("v_targ needs to be provided.")

    for file_species in tree.paths:
        if file_species.startswith("mos_target_"):
            # Skip some old paths that we don't want to generate datamodels for.
            if file_species in [
                "mos_target_allstar_dr17_synspec_rev1_1",
                "mos_target_catalog_to_uvotssc1_2",
                "mos_target_catalog_to_bhm_rm_v0_1",
                "mos_target_ebosstarget_v5_2",
            ]:
                continue

            if verbose:
                console.print(f"Validating path for [cyan]{file_species}[/] ...")

            keys = {"num": 1, "v_targ": v_targ or ""}

            for ftype in ["fits", "parquet"]:
                try:
                    pfull = path.full(file_species, ftype=ftype, **keys)
                except Exception as e:
                    raise
                    console.print(
                        "[red]ERROR:[/] failed to resolve path for "
                        f"[cyan]{file_species}[/] ({ftype}): {e}"
                    )
                    continue

                if not pathlib.Path(pfull).exists():
                    console.print(
                        f"[red]ERROR:[/] path [cyan]{pfull}[/] ({ftype}) "
                        "does not exist."
                    )
                    continue


def generate_datamodels(
    dr: str,
    v_targ: str | None = None,
    filetypes: list[str] = ["fits", "parquet"],
):
    """Generates the MOS target datamodels for the given data release."""

    try:
        from datamodel.generate import DataModel
        from tree import Tree
    except ImportError:
        raise ImportError("The datamodel and sdss-tree packages are required.")

    tree = Tree(dr)

    if not dr.lower() == "sdsswork" and v_targ is None:
        raise ValueError("v_targ needs to be provided.")

    for file_species in tree.paths:
        if file_species.startswith("mos_target_"):
            # Skip some old paths that we don't want to generate datamodels for.
            if file_species in [
                "mos_target_allstar_dr17_synspec_rev1_1",
                "mos_target_catalog_to_uvotssc1_2",
                "mos_target_catalog_to_bhm_rm_v0_1",
                "mos_target_ebosstarget_v5_2",
            ]:
                continue

            path = tree.paths[file_species].replace("$", "")

            # Parquet files.
            if "parquet" in filetypes:
                # Remove the @mos_target_num(2|3)| part from the path.
                proc_path = re.sub(r"@mos_target_num[2-3]?\|", "", path)
                DataModel(
                    file_spec=file_species + "_parquet",
                    access_path_name=file_species,
                    path=proc_path,
                    keywords=[f"v_targ={v_targ}", "ftype=parquet"],
                    release=dr.upper() if dr != "sdsswork" else "WORK",
                    suffixes=[".parquet"],
                ).write_stubs()

            if "fits" in filetypes:
                # FITS files.

                # The Tree path may include the magic functions @mos_target_num(2|3)|,
                # and those are not filled in by the datamodel. We replace them with
                # a NUM variable that we can pass.
                proc_path = re.sub(r"@mos_target_num[2-3]?\|", r"-{num}", path)

                # We also need to figure out if we need to pad the NUM variable with
                # zeros. We do this by passing a string with the padding already there.
                num = "1"
                if match := re.search(r"@mos_target_num([2-3]?)\|", path):
                    num_digits = int(match.group(1)) if match.group(1) != "" else 0
                    num = f"{{num:0>{num_digits}}}".format(num=1)

                keys = [f"v_targ={v_targ}", "ftype=fits"]
                if "{num}" in proc_path:
                    keys += [f"num={num}"]

                DataModel(
                    file_spec=file_species,
                    path=proc_path,
                    keywords=keys,
                    release=dr.upper() if dr != "sdsswork" else "WORK",
                    suffixes=[".fits"],
                ).write_stubs()


def update_datamodels(
    dr: str,
    datamodel_dir: str | pathlib.Path,
    mos_target_dir: str | pathlib.Path,
    v_targ: str,
    filetype: Literal["fits", "parquet"] = "fits",
    tables: list[str] | None = None,
    changes: str | None = None,
    force: bool = False,
):
    """Updates the MOS target datamodels for the given data release.

    Parameters
    ----------
    dr
        The data release for which to update the datamodels.
    datamodel_dir
        The directory where the datamodel YAML files are located.
    mos_target_dir
        The directory where the ``mos_target`` files are located.
    v_targ
        The value of the ``v_targ`` variable to use in the datamodel paths.
        This will be used to update the ``naming_convention`` field in the
        datamodel YAML files.
    tables
        A list of tables to update. If :obj:`None`, all tables will be updated.
        They must be in the format `sdss_dr16_specobj`, without any `drX_` or
        `mos_target` prefixes.
    changes
        A description of the changes made to the datamodels. This will be added to the
        "changelog" section of the datamodel YAML files for the given release.
        If :obj:`None`, no changes will be recorded.
    force
        Replaces the datamodel descriptions with the documentation descriptions
        even if they are not the default "replace me - with content".

    """

    from minidb_docs.tools import serialise_docs

    datamodel_dir = pathlib.Path(datamodel_dir)
    mos_target_dir = pathlib.Path(mos_target_dir)

    if not datamodel_dir.is_dir():
        raise ValueError(f"{datamodel_dir} is not a valid directory.")
    elif not datamodel_dir.parts[-1] == "yaml":
        raise ValueError("datamodel must point to the yaml/ directory.")

    data = serialise_docs(dr)

    # Loop over minidb_docs serialised table data.
    for docs_table in data["tables"]:
        # This is the name without prefixes. I.e., dr20_sdss_dr16_qso -> sdss_dr16_qso.
        table: str = docs_table.replace(f"{dr.lower()}_", "")

        if tables is not None and table not in tables:
            continue

        if filetype == "fits":
            console.print(f"Updating FITS datamodel for table [cyan]{table}[/] ...")
        elif filetype == "parquet":
            console.print(f"Updating Parquet datamodel for table [cyan]{table}[/] ...")
        else:
            raise ValueError("filetype must be either 'fits' or 'parquet'.")

        # Find the corresponding datamodel file.
        model_filename = "mos_target_" + table
        if filetype == "parquet":
            model_filename += "_parquet"

        model_file = datamodel_dir / f"{model_filename}.yaml"
        if not model_file.exists():
            console.print(
                f"  [yellow]Datamodel file [cyan]{model_file}[/] does not "
                "exist. It will be skipped.[/]"
            )
            continue

        # Load the YAML data as a dict. We are only interested in the hdus section.
        # We use oyaml to preserve the order of the columns when writing back the file.
        yaml_data: dict = yaml.safe_load(open(model_file, "r"))

        # Check if we need to update the general section. This should only happen
        # when the datamodel is first generated.
        general: dict = yaml_data["general"]

        if "replace me - " in general["short"] or force:
            general["short"] = f"MOS Target Table: {table}"

        if "replace me - " in general["description"] or force:
            table_description = data["tables"][docs_table]["description"]

            # Replace http:// and https:// URLs with <a href> tags
            table_description = re.sub(
                r"(https?://[^\s.]+(?:\.[^\s.]+)*)",
                r'<a href="\1">\1</a>',
                table_description,
            )

            general["description"] = table_description

        # Update changelog.
        if changes is not None and dr.upper() in yaml_data["changelog"]["releases"]:
            yaml_data["changelog"]["releases"][dr.upper()]["note"] = changes

        if "replace me - " in general["generated_by"] or force:
            general["generated_by"] = "sdss5db targeting database."

        if filetype == "fits":
            # Update naming convention.
            n_files = mos_target_path_num(mos_target_dir, f"mos_{table}")

            template = yaml_data["releases"][dr.upper()]["template"]
            template = re.sub(r"(.+\[NUM)[0-9]+(\]\.fits)", r"\1\2", template)

            naming_convention = f"{template} with FTYPE='fits'"

            if "[NUM]" in template:
                naming_convention += f", V_TARG='{v_targ}', and NUM=1..{n_files}"
            else:
                naming_convention += f" and V_TARG='{v_targ}'"

            naming_convention += f" for {dr.upper()}."

            general["naming_convention"] = naming_convention

            # This is a a hack for DR20 when we want to add a changelog but only if
            # the path template includes [NUM].
            if (
                changes is None
                and dr.upper() == "DR20"
                and "DR20" in yaml_data["changelog"]["releases"]
                and "[NUM]" in template
            ):
                yaml_data["changelog"]["releases"][dr.upper()]["note"] = (
                    "The [NUM] chunk is now separated from the main file "
                    "species name by a dash instead of an underscore."
                )

            # Update the path_kwargs with NUM if needed.
            path_kwargs = yaml_data["releases"]["DR20"]["access"]["path_kwargs"]
            if "[NUM]" in template and "num" not in path_kwargs:
                path_kwargs.append("num")
            yaml_data["releases"]["DR20"]["access"]["path_kwargs"] = path_kwargs

            # Update HDUs
            hdus: dict = yaml_data["releases"]["DR20"]["hdus"]

            # Update HDU descriptions.
            hdus["hdu0"]["description"] = "Primary header"
            hdus["hdu1"]["description"] = f"MOS Target Table: {table}"

            # Loop over the columns in the minidb_docs data for the
            # table and update the datamodel descriptions and units.
            for column_data in data["tables"][docs_table]["columns"]:
                docs_column: str = column_data["name"]
                docs_descr: str = column_data["description"]
                docs_unit: str = column_data["unit"]

                # Skip if the column does not exist in the datamodel,
                # but this should be checked.
                if docs_column not in hdus["hdu1"]["columns"]:
                    console.print(
                        f"  [yellow]Column [cyan]{docs_column}[/] not "
                        f"found in datamodel for table [cyan]{table}[/].[/]"
                    )
                    continue

                # Check if the model already has a description. If so and not forcing,
                # skip updating this column.
                model_column_data: dict = hdus["hdu1"]["columns"][docs_column]
                model_description: str = model_column_data["description"]

                if model_description == "replace me - with content" or force:
                    hdus["hdu1"]["columns"][docs_column]["description"] = docs_descr
                    hdus["hdu1"]["columns"][docs_column]["unit"] = docs_unit

        elif filetype == "parquet":
            template = yaml_data["releases"][dr.upper()]["template"]

            naming_convention = (
                f"{template} with FTYPE='parquet' and "
                f"V_TARG='{v_targ}' for {dr.upper()}."
            )
            general["naming_convention"] = naming_convention

            columns = yaml_data["releases"][dr.upper()]["dataframe"]["columns"]

            # Loop over the columns in the minidb_docs data for the
            # table and update the datamodel descriptions and units.
            for column_data in data["tables"][docs_table]["columns"]:
                docs_column: str = column_data["name"]
                docs_descr: str = column_data["description"]
                docs_unit: str = column_data["unit"]

                # Skip if the column does not exist in the datamodel,
                # but this should be checked.
                if docs_column not in columns:
                    console.print(
                        f"  [yellow]Column [cyan]{docs_column}[/] not "
                        f"found in datamodel for table [cyan]{table}[/].[/]"
                    )
                    continue

                # Check if the model already has a description. If so and not forcing,
                # skip updating this column.
                model_column_data: dict = columns[docs_column]
                model_description: str = model_column_data["description"]

                if model_description == "replace me - with content" or force:
                    columns[docs_column]["description"] = docs_descr
                    columns[docs_column]["unit"] = docs_unit

        # Write the updated YAML data back to the file.
        yaml.safe_dump(yaml_data, open(model_file, "w"))


def validate_datamodels(
    datamodel_dir: str | pathlib.Path,
    dr: str | None = None,
    verbose: bool = False,
):
    """Validates the MOS target datamodels.

    Parameters
    ----------
    datamodel_dir
        The directory where the datamodel YAML files are located.
    dr
        If provided, only the data release specified here will be validated.
    verbose
        Additional printouts will be shown if :obj:`True`.

    """

    try:
        from pydantic import ValidationError

        from datamodel.models.yaml import ReleaseModel, YamlModel
    except ImportError:
        raise ImportError("The datamodel package is required.")

    dr = dr.upper() if dr is not None else None

    datamodel_dir = pathlib.Path(datamodel_dir)

    if not datamodel_dir.is_dir():
        raise ValueError(f"{datamodel_dir} is not a valid directory.")
    elif not datamodel_dir.parts[-1] == "yaml":
        raise ValueError("datamodel must point to the yaml/ directory.")

    for model_file in datamodel_dir.glob("mos_target_*.yaml"):
        model_name = model_file.stem

        if verbose:
            console.print(f"Validating datamodel file [cyan]{model_file}[/] ...")

        try:
            model = yaml.safe_load(open(model_file, "r"))

            if dr is not None:
                ReleaseModel.model_validate(model["releases"][dr])
            else:
                YamlModel.model_validate(model)
        except ValidationError as err:
            console.print(
                f"[red]ERROR:[/] datamodel [cyan]{model_name}[/] failed "
                f"validation. {err.error_count()} errors found."
            )
        except Exception as err:
            console.print(
                f"[red]ERROR:[/] failed validating datamodel [cyan]{model_name}[/]. "
                f"Error: {err}"
            )


def create_products_table(data_dir: str | pathlib.Path, dr: str):
    """Creates the products table for the MOS target documentation."""

    from minidb_docs.tools import serialise_docs

    data = serialise_docs(dr)
    data_dir = pathlib.Path(data_dir)

    dm_base_url = "https://data.sdss.org/datamodel/files/MOS_TARGET/V_TARG/"

    print('<figure class="wp-block-table is-style-stripes">')
    print("  <table>")
    print("    <thead>")
    print("      <tr>")
    print("        <th style='width: 30%;'>Product</th>")
    print("        <th style='width: 40%;'>Description</th>")
    print("        <th style='width: 8%;'>Data model</th>")
    print("        <th style='width: 8%;'># chunks</th>")
    print("      </tr>")
    print("    </thead>")
    print("    <tbody>")

    for table in data["tables"]:
        product = table.replace(f"{dr}_", "mos_")

        description = data["tables"][table]["description"]
        short_description = description.splitlines()[0].strip()

        # Replace http:// and https:// URLs with <a href> tags
        short_description = re.sub(
            r"(https?://[^\s.]+(?:\.[^\s.]+)*)",
            r'<a href="\1">\1</a>',
            short_description,
        )

        n_chunks = len(list(data_dir.glob(f"{product}*.fits")))
        url = f"{dm_base_url}{product.replace('mos_', 'mos_target_')}.html"

        print("      <tr>")
        print(f"        <td>{product}</td>")
        print(f"        <td>{short_description}</td>")
        print(f"        <td><a href='{url}' target='_blank'>⤴️</a></td>")
        print(f"        <td>{n_chunks}</td>")
        print("      </tr>")

    print("    </tbody>")
    print("  </table>")
    print("</figure>")


def create_mos_target_parquet_files(
    dr: str,
    output_path: str | pathlib.Path,
    only_in_minidb_docs: bool = True,
    uri: str = "postgres://sdss@operations.sdss.org/sdss5db",
    overwrite: bool = False,
    use_chunking: bool = True,
    chunk_size: int = 10_000_000,
    tables: list[str] | None = None,
):
    """Creates Parquet files for each MOS target table from minidb.

    Parameters
    ----------
    dr
        The data release for which to create the Parquet files.
    output_path
        The directory where the Parquet files will be saved.
    only_in_minidb_docs
        If :obj:`True`, only tables that are present in the minidb_docs documentation
        will be included. If :obj:`False`, all tables in the minidb database
        will be included.
    uri
        The URI for the minidb database. It should be in the format
        ``postgres://user@host/database``.
    overwrite
        If :obj:`True`, existing Parquet files with the same name will be overwritten.
    use_chunking
        If :obj:`True`, the tables will be read and written in chunks to avoid memory
        issues with large tables. After reading each chunk, it will be appended to the
        final, monolithic Parquet file and the chunk files will be deleted.
    chunk_size
        If :obj:`use_chunking` is :obj:`True`, this parameter specifies the number of
        rows per chunk.
    tables
        A list of database tables to process. If not provided, all tables will be
        processed.

    """

    from minidb_docs.tools import serialise_docs

    minidb_docs_tables = serialise_docs(dr)["tables"]
    docs_tables = list(minidb_docs_tables)

    db_tables = polars.read_database_uri(
        f"SELECT table_name "
        f"FROM information_schema.tables "
        f"WHERE table_schema = 'minidb_{dr}';",
        uri,
        engine="adbc",
    )

    for db_table in sorted(db_tables["table_name"]):
        if only_in_minidb_docs and db_table not in docs_tables:
            continue

        if tables is not None and tables != [] and db_table not in tables:
            continue

        console.print(f"Creating Parquet file for table [cyan]{db_table}[/] ...")

        mos_table_name = db_table.replace(f"{dr}_", "mos_")
        output_file = pathlib.Path(output_path) / f"{mos_table_name}.parquet"

        if output_file.exists() and not overwrite:
            console.print(
                f"  [yellow]Parquet file [cyan]{output_file.name}[/] "
                "already exists. Skipping this table.[/]"
            )
            continue

        # Get the primary keys.
        pks = get_primary_keys(db_table, f"minidb_{dr}", uri)

        if len(pks) == 0 and use_chunking:
            console.print(
                f"  [yellow]Table [cyan]{db_table}[/] does not have a "
                "primary key. Chunking will be disabled for this table.[/]"
            )

        # Get the total number of rows in the table
        n_rows = polars.read_database_uri(
            f"SELECT COUNT(*) FROM minidb_{dr}.{db_table};",
            uri,
            engine="adbc",
        )[0, 0]

        n_chunks_table = int(max(1, (n_rows // chunk_size) + 1))

        if not use_chunking or len(pks) == 0 or n_chunks_table == 1:
            polars.read_database_uri(
                f"SELECT * FROM minidb_{dr}.{db_table};",
                uri,
                engine="adbc",
            ).write_parquet(output_file)

        else:
            chunk_files: list[pathlib.Path] = []
            for ii in range(n_chunks_table):
                console.print(f"  [bright_black]Chunk {ii + 1}/{n_chunks_table} ...[/]")

                # We always overwrite the chunk files if they already exist.
                # This is because it is possible to rerun the script with a different
                # chunk size and then existing files would be invalid.
                chunk_file = output_file.parent / f"{output_file.stem}_{ii}.parquet"

                offset = ii * chunk_size

                chunk_df = polars.read_database_uri(
                    f"SELECT * FROM minidb_{dr}.{db_table} "
                    f"ORDER BY {', '.join(pks)} "
                    f"LIMIT {chunk_size} OFFSET {offset};",
                    uri,
                    engine="adbc",
                )

                if chunk_df.is_empty():
                    break

                chunk_df.write_parquet(chunk_file)
                chunk_files.append(chunk_file)

            # Now we read the chunk files and append them to the final Parquet file.
            console.print("  [bright_black]Writing final Parquet file ...[/]")
            df = polars.scan_parquet(chunk_files)
            df.sink_parquet(output_file)

            # Delete the chunk files.
            for chunk_file in chunk_files:
                chunk_file.unlink()

        # Check that the number of rows matches.
        df = polars.scan_parquet(output_file)
        final_n_rows = df.select(polars.len()).collect().item()  # type: ignore
        if final_n_rows != n_rows:
            raise ValueError(
                f"Number of rows in final Parquet file ({final_n_rows}) does not "
                f"match the number of rows in the database ({n_rows})."
            )


def validate_mos_target_parquet_files(
    dr: str,
    parquet_dir: str | pathlib.Path,
    uri: str = "postgres://sdss@operations.sdss.org/sdss5db",
):
    """Validates the MOS target Parquet files by comparing their row counts."""

    from minidb_docs.tools import serialise_docs

    minidb_docs_tables = list(serialise_docs(dr)["tables"])

    parquet_dir = pathlib.Path(parquet_dir)
    parquet_files = sorted(parquet_dir.glob("mos_*.parquet"))

    db_tables = polars.read_database_uri(
        f"SELECT table_name "
        f"FROM information_schema.tables "
        f"WHERE table_schema = 'minidb_{dr}';",
        uri,
        engine="adbc",
    )["table_name"].to_list()

    for parquet_file in parquet_files:
        table_name = parquet_file.stem.replace("mos_", "")

        console.print(f"Validating Parquet file [cyan]{parquet_file.name}[/] ...")

        db_table_name = f"{dr}_{table_name}"

        # Check that the table is in the minidb_docs documentation.
        if db_table_name not in minidb_docs_tables:
            console.print(
                f"  [yellow]Parquet file [cyan]{parquet_file.name}[/] does "
                "not have a corresponding table in the minidb_docs documentation.[/]"
            )
            continue

        # Check that the table is in the minidb database.
        if db_table_name not in db_tables:
            console.print(
                f"  [yellow]Parquet file [cyan]{parquet_file.name}[/] does "
                "not have a corresponding table in the minidb database.[/]"
            )
            continue

        # Check the number of rows.
        df = polars.scan_parquet(parquet_file)
        n_rows_parquet = get_lazyframe_len(df)

        n_rows_db = polars.read_database_uri(
            f"SELECT COUNT(*) FROM minidb_{dr}.{db_table_name}",
            uri,
            engine="adbc",
        )[0, 0]

        if n_rows_parquet != n_rows_db:
            console.print(
                f"  [red]Parquet file [cyan]{parquet_file.name}[/] has "
                f"{n_rows_parquet} rows, but the database has {n_rows_db} rows.[/]"
            )
            continue

        # Check that there are no duplicate rows based on the primary keys.
        pks = get_primary_keys(db_table_name, f"minidb_{dr}", uri)
        if len(pks) == 0:
            n_rows_distinct = get_lazyframe_len(df)
            if n_rows_parquet != n_rows_distinct:
                console.print(
                    f"  [red]Parquet file [cyan]{parquet_file.name}[/] "
                    "has duplicate rows.[/]"
                )
                continue
        else:
            n_rows_distinct = get_lazyframe_len(df.select(polars.col(pks)).unique())
            if n_rows_parquet != n_rows_distinct:
                console.print(
                    f"  [red]Parquet file [cyan]{parquet_file.name}[/] has duplicate "
                    "rows based on the primary keys.[/]"
                )
                continue

    # Validate that all tables in the minidb_docs documentation have a
    # corresponding Parquet file.
    for docs_table in minidb_docs_tables:
        mos_table_name = docs_table.replace(f"{dr}_", "mos_")
        parquet_file = parquet_dir / f"{mos_table_name}.parquet"

        if not parquet_file.exists():
            console.print(
                "[red]Parquet file not found for table "
                f"[cyan]{docs_table}[/] in the minidb_docs.[/]"
            )


def get_lazyframe_len(df: polars.LazyFrame) -> int:
    """Returns the number of rows in a LazyFrame without collecting it."""

    return df.select(polars.len()).collect().item()  # type: ignore


def get_primary_keys(
    table: str,
    schema: str,
    uri: str = "postgres://sdss@operations.sdss.org/sdss5db",
):
    """Returns the primary key columns for a given table in the minidb database."""

    query = f"""
        SELECT pg_get_constraintdef(oid)
            FROM pg_constraint
            WHERE contype = 'p' AND conrelid = '{schema}.{table}'::regclass
    """

    primary_keys = polars.read_database_uri(query, uri, engine="adbc")
    if len(primary_keys) == 0:
        return []

    pg_get_constraintdef = primary_keys[0, "pg_get_constraintdef"]

    pks = re.findall(r"\((.*?)\)", pg_get_constraintdef)[0].split(", ")

    return pks
