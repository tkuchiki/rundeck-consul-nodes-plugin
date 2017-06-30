#!/bin/bash

version=$(grep version plugin.yaml | awk '{print $2}')
plugin_name=$(grep ^name plugin.yaml | awk '{print $2}')

zip --exclude build.sh --exclude LICENSE --exclude README.md --exclude *.git* -r ${plugin_name}-${version}-plugin.zip .
