#!/bin/bash
awk -F, 'NR > 1 {print $1,$2, $3, $4,$5,$6}' srioeye_stolen_data.csv | while read -r fname lname birth embauche children parent ; do
  # Process the data for each employee

# Déclaration de l'array contenant les données
data=($fname $lname $birth $embauche $children $parent)
debut=$(date +%s)
# Génération de toutes les permutations et écriture dans le fichier
for i in "${data[@]}"
do
  for j in "${data[@]}"
  do
    for k in "${data[@]}"
    do
      for l in "${data[@]}"
      do
        for m in "${data[@]}"
        do
          for n in "${data[@]}"
          do
            echo "$i$j$k$l$m$n" >> permutations.txt
          done
        done
      done
    done
  done
done
fin=$(date +%s)
echo "debut : $debut"
echo "fin : $fin"
duree=$(( $fin - $debut ))
echo "latence moyenne : $duree secondes"
done
