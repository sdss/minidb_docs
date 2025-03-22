#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
# @Author: Joel Brownstein (joelbrownstein@astro.utah.edu)
# @Date: 2022-09-24
# @Filename: summary_from_txt.py
# @License: BSD 3-clause (http://www.opensource.org/licenses/BSD-3-Clause)

from __future__ import annotations
from collections import OrderedDict

import pathlib
import re

import click


def summary_from_txt(summary_file = None, table_name = None):

    """
    Get a dictionary from a table description file.

    Parameters
    ----------
    summary_file
        The file containing the table summary. The format must be similar to
        https://github.com/sdss/minidb_docs/blob/main/dr18_allwise.txt.
        Square bracket values at the end of a column description, if found,
        will be understood as units.
    table_name
        The name of the table, which must match the ``CREATE TABLE`` statement.

    Returns
    data
        A dictionary with the documentation found in the summary file.

    """

    data = OrderedDict()
    if summary_file:
        summary_file = pathlib.Path(summary_file)

        if not summary_file.exists():
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

        data['header'] = header = header.strip()
        data['description'] = description_list = [item for item in description_list if item.strip() != ""]
        data['columns'] = OrderedDict()

        column_list = columns.strip().split("\n")
        for column in column_list:
            if column.strip() == "":
                continue

            match_col = re.search(r"(\w+)\s*\-?\s*([^\[]*)(?:\s*\[(.*)\])?", column.strip())
            if not match_col:
                raise ValueError(f"Column {column!r} is badly formatted.")

            column_name, column_description, column_units = match_col.groups()
            column_description = column_description.strip()
            
            if column_description == "":
                column_description = None
            elif column_description.startswith(": "):
                column_description = column_description.lstrip(": ")
                                
            data['columns'][column_name] = {
                'description': column_description,
                'units': column_units
            }

    return data


@click.command(name="doc-as-data")
@click.argument("SUMMARY_FILE", type=click.Path(exists=True, dir_okay=False))
@click.argument("TABLE_NAME", type=str)
@click.option(
    "-j",
    "--json",
    type=str,
    help="Output to json path. Otherwise prints to stdout.",
)
def cli(
    summary_file: str,
    create_table_file: str,
    table_name: str,
    json: str | None = None,
):
    """Returns data as a dictionary from  the information from a summary file."""

    data = summary_from_txt(str(summary_file), table_name)

    if json:
        with open(json, "w") as f:
            f.write(data)
    else:
        print(data)


if __name__ == "__main__":
    cli()


"""
#not sure why this didn't work:

def summary_from_txt(
    summary_file: str | pathlib.Path,
    table_name: str,
):
"""

