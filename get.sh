#!/bin/bash

scrapy crawl abonnes -o abonnes_temp

if [[ -f abonnes.csv  ]]
then
    tail -n 1 abonnes_temp >> abonnes.csv
    rm abonnes_temp
else
    mv abonnes_temp abonnes.csv
fi

git add abonnes.csv
git commit -m "Mise à jour du nombre d'abonnés"
git push origin master
