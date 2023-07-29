#!/bin/bash

read -p "Please enter USER_NAME: " USER_NAME
read -sp "Please enter PASSWORD: " PASSWORD
echo -e

echo "${PASSWORD}" | docker login -u"$USER_NAME" --password-stdin
