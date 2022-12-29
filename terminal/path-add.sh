#!/bin/bash
add=$1
echo 'PATH='"$add"':$PATH' >> ~/.bashrc
bash ~/.bashrc
