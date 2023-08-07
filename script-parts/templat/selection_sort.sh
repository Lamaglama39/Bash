#!/bin/bash

selection ()
{
  values=(39 2 4 12 53 2 66 12 11 35 12 42)
  numvalues=${#values[@]}
  
  for (( i=0; i < numvalues; i++ )); do
    lowest=$i
    
    for (( j=i; j < numvalues; j++ )); do
      if [ ${values[j]} -le ${values[$lowest]} ]; then
        lowest=$j
      fi
    done

    temp=${values[i]}
    values[i]=${values[lowest]}
    values[lowest]=$temp
  done

  for (( i=0; i < numvalues; i++ )); do
    echo -ne "${values[$i]}\t"
  done
  echo
}

selection