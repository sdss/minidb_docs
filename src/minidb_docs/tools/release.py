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

from rich.console import Console

import minidb_docs


__all__ = [
    "generate_mos_target_tree_paths",
    "get_list_mos_target_fits_files",
    "mos_target_is_split",
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

    fits_files = list(mos_target_dir.glob(f"{tree_species}*.fits"))

    return len(fits_files) > 1
