#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
# @Author: José Sánchez-Gallego (gallegoj@uw.edu)
# @Date: 2022-09-14
# @Filename: update_create_table.py
# @License: BSD 3-clause (http://www.opensource.org/licenses/BSD-3-Clause)

from __future__ import annotations

import glob
import os
import pathlib
import re
import shutil
import textwrap

from rich import print as rprint

from minidb_docs import CURRENT_DR as DR


def run_all(dr: str | None = None):
    """Runs ``update_create_table`` for all summary files in the DR."""

    dr = dr or DR

    files = glob.glob(f"{dr}/{dr}_*.txt")

    output_dir = pathlib.Path(__file__).parent / dr
    output_dir.mkdir(exist_ok=True)

    create_table_orig = output_dir / f"create_minidb_{dr}.sql"
    create_table_orig_updated = output_dir / f"create_minidb_{dr}_descriptions.sql"

    if os.path.exists(create_table_orig_updated):
        os.unlink(create_table_orig_updated)

    shutil.copyfile(create_table_orig, create_table_orig_updated)

    for fn in files:
        name = os.path.basename(fn)
        table = f"minidb_{dr}." + name.split(".")[0]

        try:
            print(fn)
            updated_text = update_create_table(fn, create_table_orig_updated, table)
        except Exception as err:
            rprint(f"[bold yellow][WARNING] - {fn}: {err}[/]")
            continue

        with open(create_table_orig_updated, "w") as f:
            f.write(updated_text)


def update_create_table(
    summary_file: str | pathlib.Path,
    create_table_file: str | pathlib.Path,
    table_name: str,
):
    """Updates a CREATE TABLE file with the information from a table description file.

    Parameters
    ----------
    summary_file
        The file containing the table summary. The format must be similar to
        https://github.com/sdss/minidb_docs/blob/main/dr18/dr18_allwise.txt.
        Square bracket values at the end of a column description, if found,
        will be understood as units.
    create_table_file
        The SQL file containing the ``CREATE TABLE`` statement for that table.
        It can be a file containing multiple ``CREATE TABLE`` statements.
    table_name
        The name of the table, which must match the ``CREATE TABLE`` statement.

    Returns
    -------
    sub
        The text of ``create_table_file`` after the substitions have been done.

    """

    summary_file = pathlib.Path(summary_file)
    create_table_file = pathlib.Path(create_table_file)

    for file_ in [summary_file, create_table_file]:
        if not file_.exists():
            raise FileExistsError(f"{file_!s} does not exist.")

    match1 = re.search(
        r"Summary\n+\-+\n+((?:.|\n)+)?\n+Columns\n+\-+\n+((?:.|\n)+)",
        open(summary_file, "r").read(),
    )

    if not match1:
        raise ValueError("Summary file is badly formatted.")

    summary, columns = match1.groups()

    summary = (summary or "").strip()
    header, *description_list = summary.split("\n")

    header = header.strip()
    if header == "":
        raise ValueError("No description provided.")
    elif len(header) > 256:
        rprint(f"[bold yellow][WARNING]: header is {len(header)} characters.[/]")

    description_list = [item for item in description_list if item.strip() != ""]

    description_lines: list[str] = []
    for nline, line in enumerate(description_list):
        description_lines += textwrap.wrap(line, 80)
        if nline != len(description_list) - 1:
            description_lines[-1] += " <br>"

    description = "-" * 70 + "\n"
    description += "--/H " + header + "\n"
    if len(description_lines) > 0:
        for line in description_lines:
            description += "--/T " + line + "\n"

    description_len = len(description) - 70
    if description_len > 7200:
        rprint(
            f"[bold yellow][WARNING]: Description for {table_name!r} is "
            f"{description_len} characters.[/]"
        )

    description += "-" * 70 + "\n"

    orig = open(create_table_file, "r").read()
    if not re.search(f"CREATE TABLE {table_name}", orig, re.IGNORECASE):
        raise ValueError(f"Cannot find CREATE TABLE statement for {table_name}.")

    subd = re.sub(
        rf"(CREATE TABLE {table_name}\s*\(\n)((?:.|\n)+)",
        rf"\g<1>{description}\g<2>",
        orig,
    )

    column_list = columns.strip().split("\n")
    for column in column_list:
        if column.strip() == "":
            continue

        # Ensure that there is a [] at the end of the column description
        if not re.search(r"\s*\[(.*?)\]\s*$", column.strip()):
            column += " []"

        match_col = re.search(r"^(\w+?)\s*\-\s*(.*)\s*(?:\[(.*?)\])$", column.strip())
        if not match_col:
            raise ValueError(f"Column {column!r} is badly formatted.")

        column_name, column_description, column_units = match_col.groups()

        if column_description.strip() == "":
            column_description = None
        if column_description is None and column_units is None:
            continue

        column_sub = ""
        if column_units:
            column_sub += f" --/U {column_units}"

        if column_description:
            if len(column_description) > 2000:
                rprint(
                    f"[bold yellow][WARNING]: Column {table_name}.{column_name!r} "
                    f"description is {len(column_description)} characters.[/]"
                )
            column_sub += f" --/D {column_description}"

        subd = re.sub(
            rf"(CREATE TABLE {table_name}\s*\((?:.|\n)+?)"
            rf"(\n\s*\"?{column_name}\"?\s.+)\n",
            rf"\g<1>\g<2>{column_sub}\n",
            subd,
        )

    return subd
