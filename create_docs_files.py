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
import warnings

from sdssdb.peewee.sdss5db import database


def create_docs_files(overwrite: bool = False):

    database.set_profile("tunnel_operations")
    schema = "minidb_dr20"

    dr19_dir = pathlib.Path(__file__).parent / "dr19"

    dr20_dir = pathlib.Path(__file__).parent / "dr20"
    dr20_dir.mkdir(exist_ok=True)

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

        # Small hack for legacy tables not yet in the minidb_dr20 schema but that
        # will get the dr20_ prefix.
        fname = dr20_dir / f"{table}.txt"
        if not table.startswith("dr20_"):
            fname = dr20_dir / f"dr20_{table}.txt"
        fname_dr19 = dr19_dir / fname.name.replace("dr20_", "dr19_")

        if os.path.exists(fname):
            if not overwrite:
                warnings.warn(f"{fname} already exists", UserWarning)
                continue
            else:
                os.remove(fname)

        if fname_dr19.exists():
            shutil.copyfile(fname_dr19, fname)
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
