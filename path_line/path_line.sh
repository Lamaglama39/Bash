#!/bin/bash

echo -e ${PATH//:/'\n'} | sort
echo -e ${PATH//:/'\n'} | wc -c