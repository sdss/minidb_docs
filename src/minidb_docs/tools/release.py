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
from datamodel.generate import DataModel
from datamodel.models.yaml import ReleaseModel, YamlModel
from pydantic import ValidationError
from rich.console import Console

from sdss_access import Path, RsyncAccess
from tree import Tree


__all__ = [
    "generate_mos_target_tree_paths",
    "get_list_mos_target_fits_files",
    "mos_target_is_split",
    "download_mos_target_sample_files",
    "generate_datamodels",
    "update_datamodels",
    "validate_mos_target_tree_paths",
    "validate_datamodels",
]


console = Console()


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
        The directory where the ``mos_target`` FITS files are located.
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
    mos_target_files = get_list_mos_target_fits_files(mos_target_dir)

    # Check that all the minidb tables have a corresponding FITS file.
    missing_files_found: bool = False
    for ff in minidb_docs_files:
        base_name = ff.stem.replace(f"{dr}_", "")
        if base_name not in mos_target_files:
            missing_files_found = True
            console.print(
                f"[yellow]WARNING:[/] missing FITS file for table [cyan]{base_name}[/]."
            )

    if missing_files_found:
        if not force:
            console.print(
                "[red]ERROR:[/] missing FITS files found. Use [cyan]--force[/] to "
                "ignore this error and generate the paths anyway."
            )
            return
        else:
            console.print(
                "[yellow]WARNING:[/] missing FITS files found, but ignoring this "
                "error because [cyan]--force[/] was used."
            )

    # We check if there are extra FITS files that do not have a corresponding
    # documentation stub, but we do not fail if this is the case.
    for ff in mos_target_files:
        if ff not in [ff.stem.replace(f"{dr}_", "") for ff in minidb_docs_files]:
            console.print(
                f"[yellow]WARNING:[/] extra FITS file for table [cyan]{ff}[/] found "
                "without a corresponding documentation stub. It will be ignored."
            )

    print("[blue]Printing MOS target tree lines ...[/]\n")

    for ff in minidb_docs_files:
        tree_species = ff.stem.replace(f"{dr}_", "mos_target_")
        needs_num = mos_target_is_split(mos_target_dir, tree_species)

        print(f"{tree_species} = ", end="")
        if needs_num:
            print(f"$MOS_TARGET/{{v_targ}}/{tree_species}_{{num}}.fits")
        else:
            print(f"$MOS_TARGET/{{v_targ}}/{tree_species}_1.fits")


def download_mos_target_sample_files():
    """Downloads a target FITS file for each table from sdsswork to the local SAS."""

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
        re.sub(r"mos\_target\_(.+?)(\_[0-9]+)?$", r"\1", ff.stem) for ff in fits_files
    ]

    return sorted(set(mos_target_files))


def mos_target_is_split(mos_target_dir: str | pathlib.Path, tree_species: str) -> bool:
    """Checks if the given MOS target tree species is split in multiple FITS files."""

    mos_target_dir = pathlib.Path(mos_target_dir)

    fits_files = list(mos_target_dir.glob(f"{tree_species}_[0-9]*.fits"))

    return len(fits_files) > 1


def validate_mos_target_tree_paths(dr: str, verbose: bool = False):
    """Uses ``sdss-access`` to validate the MOS target tree paths for a data release."""

    path = Path(dr)
    tree = Tree(dr)

    for file_species in tree.paths:
        if file_species.startswith("mos_target_"):
            if verbose:
                console.print(f"Validating path for [cyan]{file_species}[/] ...")

            keys = {"num": 1} if "{num" in tree.paths[file_species] else {}

            try:
                pfull = path.full(file_species, **keys)
            except Exception as e:
                console.print(
                    "[red]ERROR:[/] failed to resolve path for "
                    f"[cyan]{file_species}[/]: {e}"
                )
                continue

            if not pathlib.Path(pfull).exists():
                console.print(f"[red]ERROR:[/] path [cyan]{pfull}[/] does not exist.")
                continue


def generate_datamodels(dr: str):
    """Generates the MOS target datamodels for the given data release."""

    tree = Tree(dr)

    for file_species in tree.paths:
        if file_species.startswith("mos_target_"):
            path = tree.paths[file_species].replace("$", "")

            # This is needed to ignore some old paths that are still in the tree.
            if "{v_targ}" in path:
                continue

            if "{num" in path:
                keys = ["num=1"]
            else:
                keys = []

            DataModel(
                file_spec=file_species,
                path=path,
                keywords=keys,
                release=dr.upper(),
            ).write_stubs()


def update_datamodels(
    dr: str,
    datamodel_dir: str | pathlib.Path,
    tables: list[str] | None = None,
    force: bool = False,
):
    """Updates the MOS target datamodels for the given data release.

    Parameters
    ----------
    dr
        The data release for which to update the datamodels.
    datamodel_dir
        The directory where the datamodel YAML files are located.
    tables
        A list of tables to update. If :obj:`None`, all tables will be updated.
        They must be in the format `sdss_dr16_specobj`, without any `drX_` or
        `mos_target` prefixes.
    force
        Replaces the datamodel descriptions with the documentation descriptions
        even if they are not the default "replace me - with content".

    """

    from minidb_docs.tools import serialise_docs

    datamodel_dir = pathlib.Path(datamodel_dir)

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

        console.print(f"Updating datamodel for table [cyan]{table}[/] ...")

        # Find the corresponding datamodel file.
        model_filename = "mos_target_" + table
        model_file = datamodel_dir / f"{model_filename}.yaml"
        if not model_file.exists():
            console.print(
                f"[yellow]WARNING:[/] datamodel file [cyan]{model_file}[/] does not "
                "exist. It will be skipped."
            )
            continue

        # Load the YAML data as a dict. We are only interested in the hdus section.
        # We use oyaml to preserve the order of the columns when writing back the file.
        yaml_data: dict = yaml.safe_load(open(model_file, "r"))

        # Check if we need to update the general section. This should only happen
        # when the datamodel is first generated.
        general: dict = yaml_data["general"]

        if "replace me - " in general["short"]:
            general["short"] = f"MOS Target Table: {table}"

        if "replace me - " in general["description"]:
            table_description = data["tables"][docs_table]["description"]

            # Replace http:// and https:// URLs with <a href> tags
            table_description = re.sub(
                r"(https?://[^\s.]+(?:\.[^\s.]+)*)",
                r'<a href="\1">\1</a>',
                table_description,
            )

            general["description"] = table_description

        naming_convention = general["naming_convention"]
        if "replace me - " in naming_convention:
            mos_path_match = re.search(r"(\$MOS_TARGET.+?\.fits)", naming_convention)
            if not mos_path_match:
                console.print(
                    f"[yellow]WARNING:[/] could not find MOS target path in naming "
                    f"convention for table [cyan]{table}[/]. It will be left "
                    "unchanged."
                )
            else:
                mos_path = mos_path_match.group(1)
                mos_path = re.sub(r"(.+\[NUM)[0-9]+(\]\.fits)", r"\1\2", mos_path)

            general["naming_convention"] = mos_path

            if "[NUM" in mos_path:
                general["naming_convention"] += (
                    " where NUM>0 is the number of the FITS file "
                    "if the table is split in multiple files."
                )

        if "replace me - " in general["generated_by"]:
            general["generated_by"] = "sdss5db targeting database."

        hdus: dict = yaml_data["releases"]["DR20"]["hdus"]

        # Update HDU descriptions.
        hdus["hdu0"]["description"] = "Primary header"
        hdus["hdu1"]["description"] = f"MOS Target Table: {table}"

        # Loop over the columns in the minidb_docs data for the
        # table and update the datamodel descriptions and units.
        for column_data in data["tables"][docs_table]["columns"]:
            docs_column: str = column_data["name"]
            docs_description: str = column_data["description"]
            docs_unit: str = column_data["unit"]

            # Skip if the column does not exist in the datamodel,
            # but this should be checked.
            if docs_column not in hdus["hdu1"]["columns"]:
                console.print(
                    f"[yellow]WARNING:[/] column [cyan]{docs_column}[/] not "
                    f"found in datamodel for table [cyan]{table}[/]."
                )
                continue

            # Check if the model already has a description. If so and not forcing,
            # skip updating this column.
            model_column_data: dict = hdus["hdu1"]["columns"][docs_column]
            model_description: str = model_column_data["description"]

            if model_description == "replace me - with content" or force:
                hdus["hdu1"]["columns"][docs_column]["description"] = docs_description
                hdus["hdu1"]["columns"][docs_column]["unit"] = docs_unit

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
