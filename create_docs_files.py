#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
# @Author: José Sánchez-Gallego (gallegoj@uw.edu)
# @Date: 2022-09-12
# @Filename: create_docs_files.py
# @License: BSD 3-clause (http://www.opensource.org/licenses/BSD-3-Clause)

from __future__ import annotations
import os
import warnings

from sdssdb.peewee.sdss5db import database


def create_docs_files():

    database.set_profile('tunnel_operations')

    tables = database.get_tables('minidb')
    for table in tables:
        fname = str(table) + '.txt'
        if os.path.exists(fname):
            warnings.warn(f'{fname} already exists')
            continue

        f = open(fname, 'w')

        f.write('Summary\n')
        f.write('-------\n')
        f.write('\n\n\n\n')

        f.write('Columns\n')
        f.write('-------\n')
        f.write('\n')

        columns = database.get_columns(str(table), 'minidb')
        for column in columns:
            f.write(str(column.name) + ' - \n')

        f.write('\n')
        f.close()


if __name__ == "__main__":
    create_docs_files()
