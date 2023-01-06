#!/bin/bash

#recupere le dossier passe en argument 2
cd $2
dossier=$(pwd)
cd ..

inotifywait -m "$dossier" -e modify |
while read path action file lautre; do
    date_actu=$(date +"%d-%m-%Y  -  %H:%M:%S")
    echo "$date_actu : Le fichier $file a été modifié"
  # Ajoute une ligne dans le fichier log
  echo "$date_actu : Le fichier $file a été modifié dans $path" >> $1
done


