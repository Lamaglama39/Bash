#!/bin/bash

TASK_DIR="$HOME/task"
TODAY_TASK="$(date "+%Y%m%d").md"

if [ -d "$TASK_DIR" ]; then
  BASE_TASK="$(ls -l $TASK_DIR | tail -n 1 | awk '{print $9}')"
  cp "$TASK_DIR/$BASE_TASK" "$TASK_DIR/$TODAY_TASK"
  echo "base task: ${BASE_TASK}"
  echo "today task: ${TODAY_TASK}"
else
  mkdir "$TASK_DIR"
  echo "first task: ${TODAY_TASK}"
  touch "$TASK_DIR/$TODAY_TASK"
fi
