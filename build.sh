#!/bin/bash

version=$(grep version plugin.yaml | awk '{print $2}')
plugin_name=$(grep ^name plugin.yaml | awk '{print $2}')

plugin_dir="${plugin_name}-${version}-plugin"
mkdir -p ${plugin_dir}
perl -pe "s/date: .*/date: $(date +%Y-%m-%dT%H:%M:%S)/" -i plugin.yaml
cp -a contents plugin.yaml ${plugin_dir}
zip -r ${plugin_dir}.zip ${plugin_dir}
rm -rf ${plugin_dir}
