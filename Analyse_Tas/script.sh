#!/bin/bash

function getMaxSize(){ #Calcul de la taille maximale de la mémoire tampon

sizeMax=0

for line in `cat tas.txt` 
do
    if [ ${#line} -eq 17 ] || [ ${#line} -eq 21 ] || [ ${#line} -eq 23 ] || [ ${#line} -eq 25 ] && [[ $line != *"/"* ]] # Récupère les adresses mémoires
    then
        if [ ${#line} -eq 17 ]
        then
            debut=${line:0:8} #Récupère le début d'adresse
            fin=${line: -8} #Récupère la fin d'adresse
        fi
        if [ ${#line} -eq 21 ]
        then
            debut=${line:0:10} #Récupère le début d'adresse
            fin=${line: -10} #Récupère la fin d'adresse
        fi
        if [ ${#line} -eq 23 ]
        then
            debut=${line:0:11} #Récupère le début d'adresse
            fin=${line: -11} #Récupère la fin d'adresse
        fi
        if [ ${#line} -eq 25 ]
        then
            debut=${line:0:12} #Récupère le début d'adresse
            fin=${line: -12} #Récupère la fin d'adresse
        fi
        debutDix=$((16#$debut)) #Convertit en décimal
        finDix=$((16#$fin)) #Convertit en décimal
        size=$(($finDix-$debutDix)) #Taille de la zone
        size=$(($size/1024)) #Taille de la zone en KB
        if [ $sizeMax -lt $size ]
        then
            sizeMax=$size
        fi

        
    fi
done

echo $sizeMax "KB est la taille maximale de la mémoire pour le fichier tas.txt"

}

getMaxSize #Appel de la fonction


function zoneBuffer(){
 
    # path="/usr/bin/dbus-daemon" #Premier chemin du fichier

    for line in `cat tas.txt` 
    do  
        if [[ "$line" =~ "/usr/" ]] #On regarde le chemin
        then
            path=$line #On récupère le chemin
        fi
        if [ ${#line} -eq 17 ] || [ ${#line} -eq 21 ] || [ ${#line} -eq 23 ] || [ ${#line} -eq 25 ] && [[ $line != *"/"* ]] # Récupère les adresses mémoires
        then
        if [ ${#line} -eq 17 ]
        then
            debut=${line:0:8} #Récupère le début d'adresse
            fin=${line: -8} #Récupère la fin d'adresse
        fi
        if [ ${#line} -eq 21 ]
        then
            debut=${line:0:10} #Récupère le début d'adresse
            fin=${line: -10} #Récupère la fin d'adresse
        fi
        if [ ${#line} -eq 23 ]
        then
            debut=${line:0:11} #Récupère le début d'adresse
            fin=${line: -11} #Récupère la fin d'adresse
        fi
        if [ ${#line} -eq 25 ]
        then
            debut=${line:0:12} #Récupère le début d'adresse
            fin=${line: -12} #Récupère la fin d'adresse
        fi
        debutDix=$((16#$debut)) #Convertit en décimal
        finDix=$((16#$fin)) #Convertit en décimal
        sizeBuf=$(($finDix-$debutDix)) #Taille de la zone
        sizeBuf=$(($sizeBuf/1024)) #Taille de la zone en KB
        fi
        
        if [ ${#line} -eq 4 ] #On regarde les droits d'accès
        then
            if [ `expr index $line w` -eq 0 ] && [ `expr index $line p` -eq 0 ] #Si il y a buffer et child
            then
                echo "path : $path | sizeBufferOverflow : $sizeBuf KB | sizeChild : $sizeBuf KB "
            elif [ `expr index $line w` -eq 0 ] # Si il y a que buffer
            then
                echo $sizeBuf
                echo "path : $path | sizeBufferOverflow : $sizeBuf KB | sizeChild : NONE "
            elif [ `expr index $line p` -eq 0 ] # Si il y a que child
            then
                echo "path : $path | sizeBufferOverflow : NONE | sizeChild : $sizeBuf KB "
            fi
        fi
    done
}

zoneBuffer #Appel de la fonction