#!/bin/bash

set -e

TMP_IFS=${IFS}
IFS=$'\n'
for line in $(consul members -status=alive | awk 'NR > 1 { print $1, $2 }' | awk -F ':' '{ print $1 }'); do
    IFS=${TMP_IFS}
    set -- $line
    nodename="${1}"
    hostname="${2}"

    echo "- ${nodename}:
  nodename: ${nodename}
  hostname: ${hostname}"
done

exit 0
