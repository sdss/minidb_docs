#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
# @Author: José Sánchez-Gallego (gallegoj@uw.edu)
# @Date: 2022-09-14
# @Filename: run_all.py
# @License: BSD 3-clause (http://www.opensource.org/licenses/BSD-3-Clause)

from __future__ import annotations

import glob
import os
import shutil

from update_create_table import update_create_table


def run_all():

    files = glob.glob("dr18_*.txt")

    create_table_orig = "./create_minidb_dr18.sql"
    create_table_orig_updated = "./create_minidb_dr18_descriptions.sql"

    if os.path.exists(create_table_orig_updated):
        os.unlink(create_table_orig_updated)

    shutil.copyfile(create_table_orig, create_table_orig_updated)

    for fn in files:
        name = os.path.basename(fn)
        table = "minidb." + name.split(".")[0]

        try:
            print(fn)
            updated_text = update_create_table(fn, create_table_orig_updated, table)
        except Exception as err:
            print(f"[WARNING] - {fn}: {err}")
            continue

        with open(create_table_orig_updated, "w") as f:
            f.write(updated_text)


if __name__ == "__main__":
    run_all()
