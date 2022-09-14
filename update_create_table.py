#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
# @Author: José Sánchez-Gallego (gallegoj@uw.edu)
# @Date: 2022-09-14
# @Filename: update_create_table.py
# @License: BSD 3-clause (http://www.opensource.org/licenses/BSD-3-Clause)

from __future__ import annotations

import pathlib
import re
import textwrap

import click


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
        https://github.com/sdss/minidb_docs/blob/main/dr18_allwise.txt.
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
    elif len(header) > 80:
        print(f"[WARNING]: header is {len(header)} characters.")

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

        match_col = re.search(r"(\w+)\s*\-?\s*([^\[]*)(?:\s*\[(.*)\])?", column.strip())
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
            column_sub += f" --/D {column_description}"

        subd = re.sub(
            rf"(CREATE TABLE {table_name}\s*\((?:.|\n)+?)"
            rf"(\n\s*\"?{column_name}\"?\s.+)\n",
            rf"\g<1>\g<2>{column_sub}\n",
            subd,
        )

    return subd


@click.command(name="update-create-table")
@click.argument("SUMMARY_FILE", type=click.Path(exists=True, dir_okay=False))
@click.argument("CREATE_TABLE_FILE", type=click.Path(exists=True, dir_okay=False))
@click.argument("TABLE_NAME", type=str)
@click.option(
    "-o",
    "--output",
    type=str,
    help="Output path. Otherwise prints to stdout.",
)
def cli(
    summary_file: str,
    create_table_file: str,
    table_name: str,
    output: str | None = None,
):
    """Updates a CREATE TABLE file with the information from a summary file."""

    updated = update_create_table(str(summary_file), str(create_table_file), table_name)

    if output:
        with open(output, "w") as f:
            f.write(updated)
    else:
        print(updated)


if __name__ == "__main__":
    cli()
