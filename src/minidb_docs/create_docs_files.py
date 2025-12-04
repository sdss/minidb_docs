#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
# @Author: José Sánchez-Gallego (gallegoj@uw.edu)
# @Date: 2022-09-12
# @Filename: create_docs_files.py
# @License: BSD 3-clause (http://www.opensource.org/licenses/BSD-3-Clause)

from __future__ import annotations

import os
import pathlib
import shutil

from sdssdb.peewee.sdss5db import database

from minidb_docs import CURRENT_DR as DR
from minidb_docs import PREVIOUS_DR as PREV_DR
from minidb_docs import log


def create_docs_files(
    overwrite: bool = False,
    dr: str | None = None,
    prev_dr: str | None = None,
    no_copy_stubs: bool = False,
):
    database.set_profile("tunnel_operations")

    dr = dr or DR
    prev_dr = prev_dr or PREV_DR

    schema = f"minidb_{dr}"

    ROOT_DIR = pathlib.Path(__file__).parents[2]
    prev_dr_dir = ROOT_DIR / prev_dr

    dr_dir = ROOT_DIR / dr
    dr_dir.mkdir(exist_ok=True)

    tables = database.get_tables(schema)
    for fqtn in tables:
        if "." in fqtn:
            this_schema, table = fqtn.split(".")
        else:
            table = fqtn
            this_schema = schema

        # Small hack for legacy tables not yet in the minidb_dr20
        # schema but that will get the dr20_ prefix.
        fname = dr_dir / f"{table}.txt"
        if not table.startswith(f"{dr}_"):
            fname = dr_dir / f"{dr}_{table}.txt"
        fname_prev_dr = prev_dr_dir / fname.name.replace(f"{dr}_", f"{prev_dr}_")

        if os.path.exists(fname):
            if not overwrite:
                log.warning(f"{fname} already exists")
                continue
            else:
                os.remove(fname)

        if not no_copy_stubs and fname_prev_dr.exists():
            shutil.copyfile(fname_prev_dr, fname)
            continue

        f = open(fname, "w")

        f.write("Summary\n")
        f.write("-------\n")
        f.write("\n\n\n\n")

        f.write("Columns\n")
        f.write("-------\n")
        f.write("\n")

        columns = database.get_columns(str(table), this_schema)
        for column in columns:
            f.write(str(column.name) + " - \n")

        f.write("\n")
        f.close()


if __name__ == "__main__":
    create_docs_files(overwrite=False)
