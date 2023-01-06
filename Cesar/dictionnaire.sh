#!/bin/bash
awk -F, 'NR > 1 {print $1,$2, $3, $4,$5,$6}' srioeye_stolen_data.csv | while read -r name birthday hire_date; do
  # Process the data for each employee

  for x in $name; do
    for y in $birthday; do
      for z in $hire_date; do
        echo "$x$y$z"
        echo "$y$x$z"
        echo "$z$y$x"
        echo "$x$z$y"
        echo "$y$z$x"
        echo "$z$x$y"
      done
    done
  done

done > dictionary.txt