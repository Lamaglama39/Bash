#!/bin/bash

recls(){
    singletab="\t"

    for tryfile in "$@"; do
      echo $tryfile
      if [ -d "$tryfile" ]; then
        thisfile = $tryfile
        recdir $(command ls $tryfile)
      fi
    done

    unset dir singletab tab
}