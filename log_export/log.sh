#!/bin/bash -
LOGFILE="/tmp/${0##*/}.$(date '+%Y-%m-%dT%H:%M:%S').log"

function log() {
  local fname=${BASH_SOURCE[1]##*/}
  echo -e "$(date '+%Y-%m-%dT%H:%M:%S') ${HOSTNAME} (${fname}:${BASH_LINENO[0]}:${FUNCNAME[1]}) $@" | tee -a ${LOGFILE}
}


#
# MAIN
#

log "This is test message 1"
log "Test 2"
log "Test 3"

function logtest() {
  log "test from logtest function"
}

logtest