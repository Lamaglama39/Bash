#!/bin/bash

if [ "$(git branch | grep master)" ]; then
  echo -e "main branch : master"
  git checkout master
  git fetch
elif [ "$(git branch | grep main)" ]; then
  echo -e "main branch : main"
  git checkout main
  git fetch
fi

BRANCH_LIST=$(git branch -r)
echo "$BRANCH_LIST"
select FULL_NAME in "$BRANCH_LIST"
do
  TARGET_BRANCH=$(echo $FULL_NAME | sed '/origin\///')

  echo "remote checkout target: $TARGET_BRANCH"
  git checkout -b "$TARGET_BRANCH" "origin/$TARGET_BRANCH"
  git branch --contains
  echo -c
  break
done
