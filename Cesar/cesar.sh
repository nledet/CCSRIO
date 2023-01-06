#!/bin/bash


cryptName(){
    echo cryptName $1
    local modif=$(echo $1 | tr '[A-Za-z0-9]' '[D-ZA-Cd-za-c3-90-2]')
    mv "$2/$1" "$2/$modif"

}

cryptFile(){
    echo cryptFile $1
    #cipher de cesar de 3
    echo $(cat "$2/$1" | tr '[A-Za-z0-9]' '[E-ZA-De-za-d4-90-3]') > "$2/$1"
}

cryptFile dictionnaire.sh $1



