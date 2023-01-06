#!/bin/bash
awk -F, 'NR > 1 {print $1,$2, $3, $4,$5,$6}' srioeye_stolen_data.csv | while read -r fname lname birth embauche children parent ; do
  # Process the data for each employee

  for x in $fname; do
    for y in $lname; do
      for z in $birth; do
        for a in $embauche; do
          for b in $children; do
            for c in $parent; do
              echo "$x$y$z$a$b$c"
              echo "$y$x$z$a$b$c"
              echo "$z$y$x$a$b$c"
              echo "$x$z$y$a$b$c"
              echo "$y$z$x$a$b$c"
              echo "$z$x$y$a$b$c"
              echo "$x$y$z$c$b$a"
              echo "$y$x$z$c$b$a"
              echo "$z$y$x$c$b$a"
              echo "$x$z$y$c$b$a"
              echo "$y$z$x$c$b$a"
              echo "$z$x$y$c$b$a"
              echo "$x$y$z$b$c$a"
              echo "$a$y$x$b$c$z"
              echo "$a$z$y$b$c$x"
              echo "$a$x$z$b$c$y"
              echo "$a$y$z$b$c$x"
              echo "$a$z$x$b$c$y"
              echo "$a$x$y$b$c$z"
              echo "$a$y$z$c$b$x"
              echo "$b$y$x$c$a$z"
              echo "$b$z$y$c$a$x"
              echo "$b$x$z$c$a$y"
            done
          done
        done
      done
    done
  done

done > dictionary.txt