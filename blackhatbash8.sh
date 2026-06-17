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


sleep 100&
ps -ef | grep sleep
# root        4033    1213  0 13:13 pts/0    00:00:00 sleep 100
jobs
#[1]+  Ejecutando                 sleep 100 &
fg %1 #Move to the foreground the action with the jobs identifier
#sleep 100

sleep 100
#ctrl+z
#[1]+  Detenido                   sleep 100

bg %!
#[1]+ sleep 100 &

nohup ./evaluate_blackhatbash.sh & #Put in the background the proccess and the output go into a nohup.out

