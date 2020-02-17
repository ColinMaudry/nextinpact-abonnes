#!/bin/bash
temp=abonnes_temp.csv

scrapy crawl abonnes -o $temp

if [[ -f abonnes.csv  ]]
then
    tail -n 1 $temp >> abonnes.csv
    rm $temp
else
    mv $temp abonnes.csv
fi

git add abonnes.csv
git commit -m "Mise à jour du nombre d'abonnés"
git push origin master
