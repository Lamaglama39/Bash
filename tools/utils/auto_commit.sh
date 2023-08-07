#!/bin/bash
######################################################################
# Scrip tName  : auto_commit.sh
# Discription  : Automatically updates files specified in the script.
#                Let the grass grow endlessly on github :)
# How to : auto_commit.sh
######################################################################

#Full path to root directory.(Rewrite it to your environment)
DIR="${HOME}/github/"
#Path to file to be updated.(Rewrite it to your environment)
newline_file="/Bash/auto_commit.sh"

#Insert a newline at the last line of $DIR$newline_file.
echo "" >>"$DIR""$newline_file"

#Commit and push to github
cd "$DIR"
git add .
git commit -m"I skipped the update today...(:-<"
git push origin main