#!/bin/bash

CURRENT_BRANCH=$(git branch --contains | cut -d " " -f 2)
if [ "$(git branch | grep master)" ]; then
  git checkout master
  echo -e "checkout: master"
  echo -e

  git pull
  git checkout "$CURRENT_BRANCH"
  git rebase master
elif [ "$(git branch | grep main)" ]; then
  git checkout main
  echo -e "checkout: main"
  echo -e

  git pull
  git checkout "$CURRENT_BRANCH"
  git rebase main
fi
