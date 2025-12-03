#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
# @Author: José Sánchez-Gallego (gallegoj@uw.edu)
# @Date: 2025-12-03
# @Filename: __main__.py
# @License: BSD 3-clause (http://www.opensource.org/licenses/BSD-3-Clause)

from __future__ import annotations

import click


@click.group()
def minidb_docs_cli():
    """minidb_docs command line interface."""

    pass


@minidb_docs_cli.command(name="create-stubs")
@click.option(
    "--overwrite",
    is_flag=True,
    help="Overwrite existing files.",
)
@click.option(
    "--dr",
    type=str,
    default=None,
    help="Data release to use (e.g. dr20).",
)
@click.option(
    "--prev-dr",
    type=str,
    default=None,
    help="Previous data release (used to copy stubs).",
)
@click.option(
    "--no-copy-stubs",
    is_flag=True,
    help="Do not copy stubs from previous DR.",
)
def create_docs_files_cli(
    overwrite: bool = False,
    dr: str | None = None,
    prev_dr: str | None = None,
    no_copy_stubs: bool = False,
):
    """Creates documentation stub files for all minidb tables."""

    from minidb_docs.create_docs_files import create_docs_files

    create_docs_files(
        overwrite=overwrite,
        dr=dr,
        prev_dr=prev_dr,
        no_copy_stubs=no_copy_stubs,
    )


@minidb_docs_cli.command(name="update-create-table")
@click.argument(
    "SUMMARY_FILE",
    type=click.Path(exists=True, dir_okay=False),
    required=False,
)
@click.argument(
    "CREATE_TABLE_FILE",
    type=click.Path(exists=True, dir_okay=False),
    required=False,
)
@click.argument(
    "TABLE_NAME",
    type=str,
    required=False,
)
@click.option(
    "-o",
    "--output",
    type=str,
    help="Output path. Otherwise prints to stdout.",
)
@click.option("--dr", type=str, default=None, help="Data release to use (e.g. dr20).")
def update_create_table_cli(
    summary_file: str | None = None,
    create_table_file: str | None = None,
    table_name: str | None = None,
    output: str | None = None,
    dr: str | None = None,
):
    """Updates a CREATE TABLE file with the information from a summary file."""

    from minidb_docs.update_create_table import run_all, update_create_table

    if not all([summary_file, create_table_file, table_name]):
        if all(v is None for v in [summary_file, create_table_file, table_name]):
            raise click.UsageError("Either provide all arguments or none.")

        run_all(dr=dr)

    assert summary_file is not None
    assert create_table_file is not None
    assert table_name is not None

    updated = update_create_table(str(summary_file), str(create_table_file), table_name)

    if output:
        with open(output, "w") as f:
            f.write(updated)
    else:
        print(updated)


if __name__ == "__main__":
    minidb_docs_cli()
