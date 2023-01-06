#!/bin/bash



#chiffrement=`cat $1 | jq '.chiffrement.users[].name' | xargs -n1 echo`

name=""
droit=""
taille=4





for droits in $(cat $1 | jq '.chiffrement.users[].droits' | xargs -n1 echo)
    do
    
    size=`echo $droits | tr '-' '!' | grep -o '!' |  wc -l`
    size2=`expr $int + $size`

    if [ $size2 -le $taille ]
    then
    taille=$size2
    
    droit=$droits
    name=`cat $1 | jq --arg u "$droits" -r '.chiffrement.users[] | select(.droits==$u) | .name' | xargs -n1 echo`
    
    fi

done

echo "Celui qui a le plus de droits pour chiffrement est '$name' avec les droits '$droit'"

name=""
droit=""
taille=4


for droits in $(cat $1 | jq '.codebackeend.users[].droits' | xargs -n1 echo)
    do
    
    size=`echo $droits | tr '-' '!' | grep -o '!' |  wc -l`
    size2=`expr $int + $size`

    if [ $size2 -le $taille ]
    then
    taille=$size2
    
    droit=$droits
    name=`cat $1 | jq --arg u "$droits" -r '.codebackeend.users[] | select(.droits==$u) | .name' | xargs -n1 echo`
    
    fi

done

echo "Celui qui a le plus de droits pour codebackeend est '$name' avec les droits '$droit'"

name=""
droit=""
taille=4


for droits in $(cat $1 | jq '.codesmonitoring.users[].droits' | xargs -n1 echo)
    do
    
    size=`echo $droits | tr '-' '!' | grep -o '!' |  wc -l`
    size2=`expr $int + $size`

    if [ $size2 -le $taille ]
    then
    taille=$size2
    
    droit=$droits
    name=`cat $1 | jq --arg u "$droits" -r '.codesmonitoring.users[] | select(.droits==$u) | .name' | xargs -n1 echo`
    
    fi

done

echo "Celui qui a le plus de droits pour codesmonitoring est '$name' avec les droits '$droit'"