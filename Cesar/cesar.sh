#!/bin/bash

cryptFile(){
    echo cryptFile dictionary.txt
    #cipher de cesar de 3
    echo $(cat "dictionary.txt" | tr '[A-Za-z0-9]' '[E-ZA-De-za-d4-90-3]') > "dictCrypte.txt"
}

cryptFile