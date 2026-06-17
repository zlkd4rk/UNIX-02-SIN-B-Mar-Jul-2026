#! /bin/bash
awk '{print $1,$2,$3}' log.txt
awk '{print $2}' log.txt
awk '{print $3}' log.txt
awk '{print $1}' log.txt

awk '{print $1,$NF}' log.txt
awk '{print $NF}' log.txt

awk -F',' '{print $1}' example_csv.txt

awk 'NR < 10' log.txt

grep "42.236.10.117" log.txt | awk '{print $7}'

sed 's/ //g' log.txt
sed 's/Mozilla/Godzilla/g' log.txt > newlog.txt
grep "Godzilla" newlog.txt


sed '1d' log.txt >> newlogd.txt
sed '$d' log.txt >> newlogl.txt
sed '5,7d' log.txt >> newlog57.txt
sed -n '2,15 p' log.txt
sed -i '1d' log.txt
