#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
# @Author: José Sánchez-Gallego (gallegoj@uw.edu)
# @Date: 2025-12-03
# @Filename: serialise.py
# @License: BSD 3-clause (http://www.opensource.org/licenses/BSD-3-Clause)

from __future__ import annotations

import json
import pathlib
import re

from minidb_docs import CURRENT_DR as DR
from minidb_docs import log


def serialise_docs(
    path: str | pathlib.Path,
    dr: str | None = None,
    output_file: str | pathlib.Path | None = None,
):
    """Serialises the minidb docs into a single file for easier viewing.

    Parameters
    ----------
    path
        Path to the directory with the documentation files.
    dr
        Data release. If :obj:`None`, defaults to the name of the parent directory.
    output_file
        If provided, saves the serialised documentation to this file in JSON format.

    Returns
    -------
    dict
        A dictionary with the documentation data.

    """

    path = pathlib.Path(path)
    if not path.is_dir():
        raise ValueError(f"{path} is not a directory.")

    dr = (dr or path.name).lower()
    if not dr.startswith("dr"):
        dr = DR

    docs = {"dr": dr, "tables": {}}

    for file in sorted(path.glob("*.txt")):
        table_name = file.stem
        docs["tables"][table_name] = serialise_table(file)

    if output_file:
        output_file = pathlib.Path(output_file)
        with open(output_file, "w") as f:
            json.dump(docs, f, indent=4)

    return docs


def serialise_table(path: str | pathlib.Path):
    """Serialises a single table documentation file."""

    path = pathlib.Path(path)
    data = open(path).read()

    description_re = re.compile(r"^Summary\n\-+\n(.+)Columns", re.MULTILINE | re.DOTALL)
    description_match = description_re.match(data)

    if not description_match:
        raise ValueError(f"Could not find summary in {path}.")

    description = description_match.group(1).strip()

    columns_re = re.compile(r"Columns\n\-+\n(.+)", re.MULTILINE | re.DOTALL)
    columns_match = columns_re.search(data)
    if not columns_match:
        raise ValueError(f"Could not find columns in {path}.")

    columns_data = columns_match.group(1).strip()
    columns_raw = columns_data.split("\n")

    columns: list[dict[str, str]] = []

    column_re = re.compile(r"^(\w+?)\s*\-\s*(.*)\s*(?:\[(.*?)\])$")
    for col_line in columns_raw:
        if not re.search(r"\s*\[(.*?)\]\s*$", col_line.strip()):
            col_line += " []"

        col_match = column_re.match(col_line.strip())
        if not col_match:
            log.warning(f"{path.name} - Could not parse column line: {col_line}")
            continue

        column_name, column_description, column_units = col_match.groups()

        columns.append(
            {
                "name": column_name.strip(),
                "description": column_description.strip(),
                "unit": column_units.strip(),
            }
        )

    return {"table_name": path.stem, "description": description, "columns": columns}
