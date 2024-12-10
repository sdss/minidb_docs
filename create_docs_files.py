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
import warnings

from sdssdb.peewee.sdss5db import database


def create_docs_files(overwrite: bool = False):

    database.set_profile("tunnel_operations")
    schema = "minidb_dr19"

    output_dir = pathlib.Path(__file__).parent / "dr19"
    output_dir.mkdir(exist_ok=True)

    tables = database.get_tables(schema)
    legacy_tables = [
        "catalogdb.sdss_id_flat",
        "catalogdb.sdss_id_stacked",
        "catalogdb.sdss_id_to_catalog",
        "catalogdb.catalog_to_mangatarget",
        "catalogdb.mangatarget",
        "catalogdb.catalog_to_mastar_goodstars",
        "catalogdb.mastar_goodstars",
        "catalogdb.mastar_goodvisits",
        "catalogdb.catalog_to_allstar_dr17_synspec_rev1",
        "catalogdb.allstar_dr17_synspec_rev1",
        "catalogdb.catalog_to_marvels_dr11_star",
        "catalogdb.marvels_dr11_star",
        "catalogdb.catalog_to_marvels_dr12_star",
        "catalogdb.marvels_dr12_star",
        "catalogdb.catalog_to_sdss_dr16_specobj",
        "catalogdb.sdss_dr16_specobj",
        "catalogdb.catalog_to_sdss_dr17_specobj",
        "catalogdb.sdss_dr17_specobj",
        "catalogdb.mangadapall",
        "catalogdb.mangadrpall",
    ]
    for fqtn in tables + legacy_tables:
        if "." in fqtn:
            this_schema, table = fqtn.split(".")
        else:
            table = fqtn
            this_schema = schema

        # Small hack for legacy tables not yet in the minidb_dr19 schema but that
        # will get the dr19_ prefix.
        fname = output_dir / f"{table}.txt"
        if not table.startswith("dr19_"):
            fname = output_dir / f"dr19_{table}.txt"

        if os.path.exists(fname):
            if not overwrite:
                warnings.warn(f"{fname} already exists", UserWarning)
                continue
            else:
                os.remove(fname)

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
