#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
# @Author: José Sánchez-Gallego (gallegoj@uw.edu)
# @Date: 2022-09-08
# @Filename: generate_graphs.py
# @License: BSD 3-clause (http://www.opensource.org/licenses/BSD-3-Clause)

from __future__ import annotations

import os
import re

from peewee import ForeignKeyField
from sdssdb.peewee import BaseModel
from sdssdb.peewee.sdss5db import database
from sdssdb.utils.schemadisplay import create_schema_graph

EXCLUDE_TABLES = ["dr18_carton_txt", "dr18_sdss_dr16_qso_original"]

database.set_profile("tunnel_operations")


class MinidbModel(BaseModel):
    class Meta:
        database = database
        schema = "minidb"
        primary_key = False
        use_reflection = True
        reflection_options = {
            "skip_foreign_keys": False,
            "use_peewee_reflection": False,
        }


def generate_minidb_graphs(columns: bool = False):

    all_tables = database.get_tables("minidb")
    valid_tables = [table for table in all_tables if table not in EXCLUDE_TABLES]

    models = {}

    for tname in valid_tables:

        class Meta:
            table_name = tname
            schema = "minidb"

        model_name = tname
        Model = type(model_name, (MinidbModel,), {"Meta": Meta})

        globals()[model_name] = Model
        models[tname] = Model

    for Model in models.values():
        tname = Model._meta.name
        constraints = list(
            database.execute_sql(
                "SELECT pg_get_constraintdef(c.oid) AS cdef "
                "FROM pg_constraint c "
                "JOIN pg_namespace n ON n.oid = c.connamespace "
                "WHERE n.nspname = 'minidb' "
                f"AND conrelid::regclass::text = 'minidb.{tname}';"
            )
        )

        for nn, constraint in enumerate(constraints):
            fks = re.match(
                r"FOREIGN KEY \((.+?)\) REFERENCES minidb\.(.+?)\((.+?)\)",
                constraint[0],
            )
            if fks:
                cols, referenced, ref_cols = fks.groups()
                Model._meta.add_field(
                    f"fk_{nn}",
                    ForeignKeyField(
                        models[referenced],
                        column_name=cols.split(",")[0],
                        field=ref_cols.split(",")[0],
                        backref="+",
                    ),
                )

    cwd = os.path.dirname(os.path.realpath(__file__))

    cdb_graph = create_schema_graph(
        base=MinidbModel,
        show_columns=columns,
        graph_options={"rankdir": "TB"},
    )
    cdb_graph.write_pdf(f"{cwd}/minidb_dr18{'_columns' if columns else ''}.pdf")


if __name__ == "__main__":
    generate_minidb_graphs()
    generate_minidb_graphs(columns=True)
