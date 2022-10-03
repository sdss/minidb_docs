#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
# @Author: Joel Brownstein (joelbrownstein@astro.utah.edu)
# @Date: 2022-09-24
# @Filename: doc_to_yaml.py
# @License: BSD 3-clause (http://www.opensource.org/licenses/BSD-3-Clause)

from __future__ import annotations

import glob
import os
import shutil
import oyaml
import yaml

from summary_from_txt import summary_from_txt

product = "mos_target"
version = "1.0.1"
release = "dr18"
ext = {'txt': ".txt"}
debug = verbose = True

def num_from_sas(table = None):
    try:
        dir = os.path.join(os.environ['MOS_TARGET'], version)
    except:
        dir = None
        
    sas_path = os.path.join(dir, '%s-*.fits' % table) if dir and product and table else None
    
    try:
        num = len(glob.glob(sas_path))
        if verbose: print("Found %r files for table=%r" % (num, table))
    except:
        num = 1
        if verbose: print("Forcing %r file for table=%r" % (num, table))
        
    return num


def datamodel_yaml_file(table = None):

    try:
        datamodel_dir = os.environ['DATAMODEL_DIR']
    except:
        datamodel_dir = None
        if verbose: print("Usage: Set DATAMODEL_DIR")
        
    datamodel_path = os.path.join('datamodel', 'products', 'yaml', '%s.yaml' % table) if table else None
    return os.path.join(datamodel_dir, datamodel_path) if datamodel_dir and datamodel_path else None

def datamodel_from_yaml(table = None, yaml_file = None):

    if yaml_file is None and table is not None:
        yaml_file = datamodel_yaml_file(table = table)
        
    if yaml_file and os.path.exists(yaml_file):
        with open(yaml_file) as data_stream:
            try:
                datamodel = oyaml.safe_load(data_stream)
                if verbose: print("Reading %s [found %r keys]" % (yaml_file, len(datamodel) if datamodel else 0))
            except Exception as e:
                print("Error: %r" % e)
                datamodel = None
    else:
        datamodel = None
        if verbose: print("Error: yaml_file=%r" % yaml_file)
        
    return datamodel
    
"""
In [13]: t['general']
Out[13]:
{'name': 'mos_target_target',
 'short': 'MOS Target table of targets',
 'description': 'This fits table stores the targets associated with DR18 target selection cartons. Note that the targets in this table are unique, but a target can be associated with multiple cartons. That many-to-many relationship is encoded in the mos_target_carton_to_target table',
 'datatype': 'FITS',
 'filesize': '457 MB',
 'releases': ['WORK'],
 'environments': ['MOS_TARGET'],
 'surveys': ['SDSS'],
 'naming_convention': '$MOS_TARGET/[V_TARG]/mos_target_target-[NUM].fits, where V_TARG=1.0 for DR18; and NUM = 1..8 to partition the file into 8 parts',
 'generated_by': 'sdss5db> targetdb, operations database server',
 'design': False}

"""

def short_description(table = None):
    description = None
    if table:
        prefix = "%s_" % product
        description = "MOS Target Table"
        if table.startswith(prefix):
            description += ": %s" % table[len(prefix):]
            
    return description
            
def update_section(table = None, section_name = None, section = None, summary = None):
    if section_name == "general":
        rows = ['name', 'short', 'description', 'environments', 'surveys', 'naming_convention', 'generated_by']
        num = num_from_sas(table = table)
        for row in rows:
            value = None
            if row == "name":
                value = table
            elif row == "short":
                value = short_description(table = table)
            elif row == "description":
                if 'header' in summary: value = "%(header)s" % summary
            elif row == "environments":
                value = ["MOS_TARGET"]
            elif row == "surveys":
                value = ["BHM", "MWM"]
            elif row == "naming_convention":
                if num:
                    one = '1' if num<9 else '01'
                    value = "$MOS_TARGET/[V_TARG]/%s-[NUM].fits, where V_TARG=1.0.1 for DR18; and NUM = %s..%r to partition the file into parts" % (table, one, num)
                else: value = "$MOS_TARGET/[V_TARG]/%s.fits, where V_TARG=1.0.1 for DR18" % table
            elif row == "generated_by":
                value = "sdss5db> targetdb, operations database server"
            if value is not None:
                section[row] = value
            if verbose: print("general> %s=%r" % (row, value))
                
    elif section_name == "sdsswork":
        rows = ['template', 'example', 'location', 'environment', 'access', 'survey', 'hdus']
        for row in rows:
            value = None
            if row == "hdus":
                hdus = section[row] if row in section else None
                hdu0, hdu1 = hdus['hdu0'], hdus['hdu1'] if len(hdus) == 2 else ( None, None )
                
                hdu0['description'] = "Primary header"
                hdu1['description'] = short_description(table = table)
                
                datamodel_columns = hdu1['columns'] if 'columns' in hdu1 else {}
                summary_columns = summary['columns'] if 'columns' in summary else []
                
                for column_name, datamodel_column in datamodel_columns.items():
                    summary_column = summary_columns[column_name] if column_name in summary_columns else None
                    if summary_column:
                        datamodel_column['description'] = summary_column['description']
                        datamodel_column['unit']  = summary_column['units']
                        if verbose: print("sdsswork> %s=%r" % (column_name, datamodel_column))

    return section

def update_datamodel(summary = None, datamodel = None, table = None):

    if datamodel and 'general' in datamodel and 'releases' in datamodel:
        sections = {'general': datamodel['general'], 'sdsswork': datamodel['releases']['WORK'] }
        for section_name, section in sections.items():
            if verbose: print("Updating Section> %s" % section_name)
            section = update_section(table = table, section_name = section_name, section = section, summary = summary)

    return datamodel
    
def table_for_file(release = None, file = None):

    if release and file:
        if os.path.exists(file):
            name = os.path.basename(file)
            if name.startswith(release) and name.endswith(ext["txt"]):
                table = product + ( name[len(release):] )[:-len(ext["txt"])]
            else:
                table = None
        else:
            table = None

    return table

def load_datamodel_summary(release = None, file = None):

    if release and file:
        table = table_for_file(release = release, file = file)
        datamodel = datamodel_from_yaml(table = table)
        summary = summary_from_txt(summary_file = file, table_name = table, release = release, product = product)
        if verbose: print("Reading %s [%r keys]" % (file, len(summary) if summary else None))
    else:
        datamodel = summary = None
    return datamodel, summary

def save_datamodel_yaml(table = None, datamodel = None):
    yaml_file = datamodel_yaml_file(table = table)
    if os.path.exists(yaml_file):
        try:
            with open(yaml_file, 'w') as output:
                e = yaml.dump(datamodel, output)
                if verbose: print("DATAMODEL> %s updated." % yaml_file)
        except Exception as e:
            print("DATAMODEL> YAML Error: %r" % e)
    else:
        print("DATAMODEL NO YAML at %s" % yaml_file)

def all_txt_to_datamodel(release = None):

    if release:
        for file in glob.glob(release + "_*.txt"):
            datamodel, summary = load_datamodel_summary(release= release, file = file)
            datamodel = update_datamodel(summary = summary, datamodel = datamodel, table = table)
            if debug:
                print("DATAMODEL> %r" % datamodel)
            else:
                save_datamodel_yaml(table = table, datamodel = datamodel)

if __name__ == "__main__":
    all_txt_to_datamodel()
