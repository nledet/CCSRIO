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


explore() {
    echo path $1
    for file in `ls $1`
    do
        if [ -f $1/$file ]
        then
            echo file $file
            cryptFile $file $1
            cryptName $file $1
        elif [ -d $1/$file ]
        then
            echo folder $file
            local saveFile=$file
            explore "$1/$file"
            echo crypt
            echo path crypt $1
            echo fichier a crypter $saveFile
            cryptName $saveFile $1
            echo fin 
        fi
    done
}

explore $1

