## Question 2
On a tout d’abord créé un fichier JSON contenant chaque dossier contenant les users et ses droits associés. 
Pour chaque dossier, nous regardons les droits des utilisateurs, nous cherchons celui qui possède le plus de droits. 
Pour cela, nous avons compté le nombre de ‘-’ pour chaque droit. Celui possédant le moins de ‘-’ aura donc le plus de droits. 


## Question 3
Ici on prend en entrée le fichier dans lequel on veut enregistrer les logs et en second argument le dossier que l'on souhaite surveiller.
On utilise inotifywait pour la surveillance. Cette commande attend des évènements de notification de changement de fichier.
