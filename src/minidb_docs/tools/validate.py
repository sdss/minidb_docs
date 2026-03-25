#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
# @Author: José Sánchez-Gallego (gallegoj@uw.edu)
# @Date: 2026-03-25
# @Filename: validate.py
# @License: BSD 3-clause (http://www.opensource.org/licenses/BSD-3-Clause)

from __future__ import annotations

import pathlib

from rich.console import Console

from minidb_docs import console as log_console
from minidb_docs.tools import serialise_docs


__all__ = ["validate_docs"]


console = log_console or Console()


def validate_docs(
    path: pathlib.Path | str,
    dr: str | None = None,
    verbose: bool = False,
):
    """Validates a set of documentation files for a given data release.

    Parameters
    ----------
    path
        Path to the directory with the documentation files.
    dr
        Data release. If :obj:`None`, defaults to the name of the parent directory.
    verbose
        If :obj:`True`, prints detailed information about the validation process.

    """

    path = pathlib.Path(path)
    if not path.is_dir():
        raise ValueError(f"{path} is not a directory.")

    dr = (dr or path.name).lower()

    docs_data = serialise_docs(path, dr)

    console.print(f"[blue]Validating documentation for {dr} ...[/]")

    for table in sorted(docs_data["tables"].keys()):
        description = docs_data["tables"][table].get("description", "").strip()

        failed_validation: bool = False

        if description == "":
            console.print(f"{table}: [red]No description provided.[/red]")
        else:
            lines = description.splitlines()

            header = lines[0]
            if len(header) > 256:
                failed_validation = True
                console.print(
                    f"{table}: [red]Description header is "
                    "too long (>256 characters).[/red]"
                )

            if len(lines) > 1:
                long_description = "\n".join(lines[1:]).strip()
                if len(long_description) > 7200:
                    failed_validation = True
                    console.print(
                        f"{table}: [red]Long description is "
                        "too long (>7200 characters).[/red]"
                    )

        for column_data in docs_data["tables"][table]["columns"]:
            column_name = column_data["name"]
            column_description = column_data["description"].strip()
            column_unit = column_data["unit"].strip()

            if column_description == "":
                failed_validation = True
                console.print(
                    f"{table}: [red]No description provided for column "
                    f"[bold blue]{column_name}[/].[/]"
                )

            if "[" in column_unit or "]" in column_unit:
                console.print(
                    f"{table}: [yellow]Column unit for "
                    f"[bold blue]{column_name}[/] contains square brackets.[/]"
                )

        if not failed_validation and verbose:
            console.print(f"[bright_black]{table}: Validation passed.[/]")
