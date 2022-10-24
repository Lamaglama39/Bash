#!/bin/bash
######################################################################
# Scrip tName  : log.sh
# Discription  : Call it in a function and use it.
#                Specify the process 
#                to be executed as an argument to the log function.
# How to : log <Processing something>
######################################################################

LOGFILE="/tmp/${0##*/}.$(date '+%Y-%m-%dT%H:%M:%S').log"

function log() {
  local fname=${BASH_SOURCE[1]##*/}
  echo -e "$(date '+%Y-%m-%dT%H:%M:%S') ${HOSTNAME} (${fname}:${BASH_LINENO[0]}:${FUNCNAME[1]}) $@" | tee -a "${LOGFILE}"
}

function logtest() {
  log 'test from logtest function'
}

logtest