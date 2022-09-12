#!/bin/bash

# pushd () 
# {
#     dirname=$1
#     if cd ${dirname:?"missing directory name."}
#     then
#         DIR_STACK="$dirname ${DIR_STACK:-$PWD}"
#         echo "$DIR_STACK"
#     else
#         echo "Still in $PWD."
#     fi
# }

# pushd

#pushd ()
##{
#    dirname=$1
#    if [ -n "$dirname" ] && [ \( -d "$dirname" \) -a \( -x "$dirname" \) ]; then
#        DIR_STACK="$dirname ${DIR_STACK:-$PWD}"
#        cd $dirname
#        echo "$DIR_STACK"
#    else
#        echo "Still in $PWD"
#    fi
#}

selectd ()
{
    DIR_STACK="/home /bin /user"
    PS3='directory?'
    dirstack=" $DIR_STACK "

    select selection in $dirstack; do
      if [ $selection ]; then
        DIR_STACK="$selection${dirstack%% $selection *}"
        DIR_STACK="$DIR_STACK ${dirstack##* $selection }"
        DIR_STACK=${DIR_STACK% }
        echo $selection
        cd $selection
        
        break
      else
        echo 'invalid selection.'
      fi
    done
}

selectd