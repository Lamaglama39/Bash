#!/bin/bash

upower --enumerate | xargs -i upower -i {} \
  | grep -e "icon-name:" -e "energy:" -e "percentage:" \
  | sed '/percentage/ a\----------------------\' | sed "s/'//g"
