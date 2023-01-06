#!/bin/bash
awk -F, 'NR > 1 {print $1,$2, $3, $4,$5,$6}' srioeye_stolen_data.csv | while read -r fname lname birth embauche children parent ; do
  # Process the data for each employee

data=($fname $lname $birth $embauche $children $parent)
size=${#data[@]}
count=0
exec 3>dictionary.txt
while [ $count -lt 720 ]
do
  random=$(echo $(seq $size) | shuf) 
  count=$((count+1))

  for i in $random
  do 
    echo -n "${data[$i-1]}" 1>&3
  done 
  echo 1>&3
done 
exec 3>&-
done