#!/bin/bash

cryptFile(){
    echo cryptFile dictionary.txt
    #cipher de cesar de 3
    echo $(cat "dictionary.txt" | tr '[AB-DEF-HIJ-NOP-TUV-XYZab-def-hij-nop-tuvwxyz0-9]' '[DF-HHJ-LLN-RRT-XXZABBDdf-hhj-lln-rrt-xxzabbd4-90-3]') > "dictCrypte.txt"
}

cryptFile