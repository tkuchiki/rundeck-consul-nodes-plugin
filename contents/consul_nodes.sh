#!/bin/bash

set -e

SERVICE="${RD_CONFIG_SERVICE:-consul}"
if [ "${SERVICE}" != "consul" -a "${SERVICE}" != "serf" ]; then
    echo "config.service-name = (consul|serf)"
    exit 1
fi

STATUSES="${RD_CONFIG_TARGET_STATUSES:-alive}"

GREP=""

if [ "${RD_CONFIG_INCLUDE_NODES}" != "" ]; then
    GREP="| grep -E ${RD_CONFIG_INCLUDE_NODES}"
fi

if [ "${RD_CONFIG_EXCLUDE_NODES}" != "" ]; then
    GREP="${GREP} | grep -v -E ${RD_CONFIG_EXCLUDE_NODES}"
fi

TMP_IFS=${IFS}
IFS=$'\n'
for line in $(bash -c "${SERVICE} members -status=${STATUSES} ${GREP} | awk '\$1 != \"Node\" && \$2 != \"Address\" { print \$1, \$2 }' | awk -F ':' '{ print \$1 }'"); do
    IFS=${TMP_IFS}
    set -- $line
    nodename="${1}"
    hostname="${2}"

    echo "- ${nodename}:
  nodename: ${nodename}
  hostname: ${hostname}"
done

exit 0
