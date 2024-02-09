#!/bin/bash

env="tes prd"
set=""
select set in $env
do
  if [ "${REPLY}" = "q" ]; then
    echo "status: exit"
    exit 0
  fi

  if [ -n "${set}" ]; then
    break
  else
    echo "status: invalid value"
  fi
done

gcloud config configurations activate "$set"
gcloud config configurations list | grep "True"

gcloud auth login
gcloud auth application-default login
