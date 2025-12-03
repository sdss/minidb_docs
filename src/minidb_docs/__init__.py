#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
# @Author: José Sánchez-Gallego (gallegoj@uw.edu)
# @Date: 2025-12-03
# @Filename: __init__.py
# @License: BSD 3-clause (http://www.opensource.org/licenses/BSD-3-Clause)

from __future__ import annotations

import os

from sdsstools.logger import get_logger


CURRENT_DR = os.getenv("MINIDB_DR", "dr20")
PREVIOUS_DR = os.getenv("MINIDB_PREVIOUS_DR", "dr19")


log = get_logger("minidb_docs")  # Mostly for formatting of warnings
