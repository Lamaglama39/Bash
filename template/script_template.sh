#!/bin/bash
######################################################################
# Scrip tName  : script_template.sh
# Discription  : Create an executable file describing how to use it.
# How to : script_template.sh $1 $2 ...
#     $1 : Name of executable file you want to create.
#     $2 : Name of executable file you want to create.
######################################################################

partition="############################################################"

for file in "$@"
do
  output="$file"'.sh'
  echo "#!/bin/bash
$partition
# Scrip tName  : $output
# Discription  :
# How to :
#     \$1 :
#     \$2 :
$partition
set -euo pipefail
  " >> "$output"

  chmod +x "$output"
  echo "$output: Executable file creation is complete."
done