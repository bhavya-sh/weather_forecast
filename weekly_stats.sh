#!/bin/bash

num_of_lines=$(($(wc -l synthetic_historical_fc_accuracy.tsv | cut -d " " -f1) - 1 ))
num_of_lines= echo $(($num_of_lines - 1)) 
echo $(tail -n $num_of_lines synthetic_historical_fc_accuracy.tsv | cut -f6) > scratch.txt

week_accuracy_data_array=($(echo $(cat scratch.txt)))
