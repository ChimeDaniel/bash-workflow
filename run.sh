#!/bin/bash
#export DBT_PROFILES_DIR=/home/shared/.dbt
pip install -r ../requirement.txt
git pull origin main
git merge origin main
current_hour=$(date +%-H)
current_day=$(date +%u)  
if [[ $current_hour -eq 5 || $current_hour -eq 11 ]]; then
    echo "Running Raw and Raw BPVS"
    source ./raw.sh
fi
source ./dbt_script.sh