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
  if [[ $file =~ .sh ]]; then
    output="$file"
  else 
    output="$file"'.sh'
  fi
  
  echo "#!/bin/bash
$partition
# Scrip tName  : $output
# Discription  :
# How to :
#     \$1 :
#     \$2 :
$partition" >> "$output"
echo 'set -euo pipefail
script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
cd $script_dir' >> "$output"

  chmod +x "$output"
  echo "$output: Executable file creation is complete."
done