#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
# @Author: Joel Brownstein (joelbrownstein@astro.utah.edu)
# @Date: 2022-09-24
# @Filename: doc_to_yaml.py
# @License: BSD 3-clause (http://www.opensource.org/licenses/BSD-3-Clause)

import glob
import os
import shutil
import oyaml

from summary_from_txt import summary_from_txt

class Doc:
    product = "mos_target"
    version = "1.0.2"
    release = "dr19"
    debug = None
    ext = {'txt': ".txt"}
    verbose = True

    def num_from_sas(self, table = None):
        try:
            dir = os.path.join(os.environ['MOS_TARGET'], self.version)
        except:
            dir = None
            
        sas_path = os.path.join(dir, '%s_%s-*.fits' % (self.product, table)) if dir and self.product and table else None
        
        try:
            num = len(glob.glob(sas_path))
        except:
            num = 8
            
        return num


    def datamodel_yaml_file(self, table = None):

        try:
            datamodel_dir = os.environ['DATAMODEL_DIR']
        except:
            datamodel_dir = None
            
        datamodel_path = os.path.join('datamodel', 'products', 'yaml', '%s.yaml' % table) if table else None
        return os.path.join(datamodel_dir, datamodel_path) if datamodel_dir and datamodel_path else None

    def datamodel_from_yaml(self, table = None, yaml_file = None):

        if yaml_file is None and table is not None:
            yaml_file = self.datamodel_yaml_file(table = table)
            
        if yaml_file and os.path.exists(yaml_file):
            with open(yaml_file) as data_stream:
                try:
                    datamodel = oyaml.safe_load(data_stream)
                except Exception as e:
                    print("error: %r" % e)
                    datamodel = None

        else:
            datamodel = None
            
        return datamodel
        
    """
    In [13]: t['general']
    Out[13]:
    {'name': 'mos_target_target',
     'short': 'MOS Target table of targets',
     'description': 'This fits table stores the targets associated with DR18 target selection cartons. Note that the targets in this table are unique, but a target can be associated with multiple cartons. That many-to-many relationship is encoded in the mos_target_carton_to_target table',
     'datatype': 'FITS',
     'filesize': '457 MB',
     'releases': ['DR19'],
     'environments': ['MOS_TARGET'],
     'surveys': ['SDSS'],
     'naming_convention': '$MOS_TARGET/[V_TARG]/mos_target_target-[NUM].fits, where V_TARG=1.0 for DR18; and NUM = 1..8 to partition the file into 8 parts',
     'generated_by': 'sdss5db> targetdb, operations database server',
     'design': False}

    """

    def update_section(self, table = None, section_name = None, section = None, summary = None):
        filename = table.replace("mos_target_", "mos_") if table and table.startswith("mos_target_") else table
        if section_name == "general":
            rows = ['name', 'short', 'description', 'environments', 'surveys', 'naming_convention', 'generated_by']
            num = self.num_from_sas(table = table)
            for row in rows:
                value = None
                if row == "name":
                    value = table
                elif row == "short":
                    value = "MOS Target table: %s" % table
                elif row == "description":
                    if 'header' in summary: value = ": %(header)s" % summary
                elif row == "environments":
                    value = ["MOS_TARGET"]
                elif row == "surveys":
                    value = ["BHM", "MWM", "SDSS"]
                elif row == "naming_convention":
                    if num: value = "$MOS_TARGET/[V_TARG]/%s-[NUM].fits, where V_TARG=%s for %s; and NUM = 1..%r to partition the file into parts" % (filename, self.version, self.release.upper(), num)
                    else: value = "$MOS_TARGET/[V_TARG]/%s.fits, where V_TARG=%s for %s" % (filename, self.version, self.release.upper())
                elif row == "generated_by":
                    value = "sdss5db> targetdb, operations database server"
                if value is not None:
                    section[row] = value
                if self.verbose: print("general> %s=%r" % (row, value))
                    
        elif section_name == "dr19":
            rows = ['template', 'example', 'location', 'environment', 'access', 'survey', 'hdus']
            for row in rows:
                value = None
                if row == "hdus":
                    hdus = section[row] if row in section else None
                    hdu0, hdu1 = hdus['hdu0'], hdus['hdu1'] if len(hdus) == 2 else ( None, None )
                    
                    if hdu0['description'] == 'replace me description':
                        hdu0['description'] = 'Primary header'
                    if hdu1['description'] == 'replace me description':
                        hdu1['description'] = "MOS Target table: %s" % table
                    
                    datamodel_columns = hdu1['columns'] if 'columns' in hdu1 else {}
                    summary_columns = summary['columns'] if 'columns' in summary else []
                    
                    for column_name, datamodel_column in datamodel_columns.items():
                        summary_column = summary_columns[column_name] if column_name in summary_columns else None
                        if summary_column:
                            datamodel_column['description'] = summary_column['description']
                            datamodel_column['unit']  = summary_column['units'] if summary_column['units'] else ''
                    if self.verbose: print("dr19> %s=%r" % (row, value))

        return section

    def update_datamodel(self, summary = None, datamodel = None, table = None):

        sections = {'general': datamodel['general'], 'dr19': datamodel['releases']['DR19'] }
        for section_name, section in sections.items():
            if self.verbose: print("Updating Section> %s" % section_name)
            section = self.update_section(table = table, section_name = section_name, section = section, summary = summary)

        return datamodel
        
    def table_for_file(self, file = None):

        if self.release and file:
            if os.path.exists(file):
                name = os.path.basename(file)
                if name.startswith(self.release) and name.endswith(self.ext["txt"]):
                    table = self.product + ( name[len(self.release):] )[:-len(self.ext["txt"])]
                else:
                    table = None
            else:
                table = None

        return table

    def txt_to_datamodel(self, file = None):

        if self.release and file:
            table = self.table_for_file(file = file)
            print("Text to Datamodel for file=%r --> table=%r" % (file, table))
            datamodel = self.datamodel_from_yaml(table = table)
            summary = summary_from_txt(summary_file = file, table_name = table)
            datamodel = self.update_datamodel(summary = summary, datamodel = datamodel, table = table)
        else:
            datamodel = table = None
        return ( datamodel, table )

    def file_txt_to_datamodel(self, file = None):

        if file:
            datamodel, table = self.txt_to_datamodel(file = file)
            if self.debug:
                print("DATAMODEL[%r]> %r" % (table, datamodel))
            else:
                yaml_file = self.datamodel_yaml_file(table = table)
                if os.path.exists(yaml_file):
                    try:
                        with open(yaml_file, 'w') as output:
                            e = oyaml.dump(datamodel, output)
                            print("DATAMODEL> YAML %s updated." % yaml_file)
                    except Exception as e:
                        print("DATAMODEL> YAML Error: %r" % e)
                else:
                    print("DATAMODEL NO YAML at %s" % yaml_file)

    def all_txt_to_datamodel(self):

        for file in glob.glob(self.release + "_*.txt"):
            self.file_txt_to_datamodel(file = file)

"""
doc = Doc()
doc.all_txt_to_datamodel()
"""

"""
doc = Doc()
doc.file_txt_to_datamodel(file = "mos_target_bhm_rm_tweaks")
"""
