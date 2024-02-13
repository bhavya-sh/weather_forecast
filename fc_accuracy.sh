#!/bin/bash
row=$(tail -1 rx_poc.log)
year=$(echo $row | cut -d " " -f1)
month=$(echo $row | cut -d " " -f2)
day=$(echo $row | cut -d " " -f3)
yesterday_fc=$(tail -2 rx_poc.log | head -1 | cut -d " " -f5)
today_temp=$(tail -1 rx_poc.log | cut -d " " -f4)
accuracy=$(($yesterday_fc-$today_temp))
echo "accuracy is $accuracy"

if [ $accuracy -eq 0 ] && [ $accuracy -eq 1 ] && [ $accuracy -eq -1 ] 
then
    accuracy_range=Excellent!
elif [ $accuracy -eq 2 ] && [ $accuracy -eq -2 ] 
then
    accuracy_range=Good
elif [ $accuracy -eq 3 ] && [ $accuracy -eq -3 ] 
then
    accuracy_range=Fair
else
    accuracy_range=Poor
fi 
echo "Forecast Accuracy is $accuracy_range"


data="$year\t$month\t$day\t$today_temp\t$yesterday_fc\t$accuracy\t$accuracy_range"
echo -e $data >> historical_fc_accuracy.tsv
