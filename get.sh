#!/bin/bash
temp=abonnes_temp.csv

cd $(dirname "$0")

pwd

scrapy=/home/$USER/.local/bin/scrapy

echo $scrapy

$scrapy crawl abonnes -o $temp

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
