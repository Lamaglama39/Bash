#!/bin/bash
##################################################
# Scrip tName  :
# Discription  :
# How to :
#        : -
#        : -
##################################################

filename="$1"'.sh'
partition="##################################################"

echo "#!/bin/bash
$partition
# Scrip tName  : $filename
# Discription  :
# How to :
#     \$1 : -
#     \$2 : -
$partition
" > "$filename"

chmod +x "$filename"