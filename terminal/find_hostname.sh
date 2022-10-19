#!/bin/bash

find_ip ()  {
  case "$#" in
    1)
      ;;
    *)
      echo "Usage: $0 ip-addres" 1>&2
  esac

  while read ip host
  do
    case "$1" in
      "$ip")
        echo "$host"
        exit 0
        ;;
    esac
  done < /etc/hosts

  echo "$1" 'not found' 1>&2
  exit 1
}

find_ip "$@"