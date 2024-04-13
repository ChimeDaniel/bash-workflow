#!/bin/bash
# Run requirements bash script to get dbt executable file source and model names
. ./rqt.sh

# Function to execute dbt models based on priority
execute_models() {
    local priority=$1

    # Define the various priority cases
    case $priority in
        "high")
            # High priority logic
            if [[ ($current_hour -ge 7 && $current_hour -lt 16 && $is_weekend -eq 0) || (($current_hour -eq 7 || $current_hour -eq 16) && $is_weekend -eq 1) ]]; then
                for name in "${array[@]}"
                do
                    staging_name=$( echo $name | cut -d "." -f 1)
                    marts_name=$( echo $name | cut -d "." -f 2)
                    echo "Running: Marts --> $marts_name, Staging --> $staging_name"
                    $dbt run --models staging.$staging_name.high marts.$marts_name.high
                    echo " "
                    echo " "
                done
            fi
            ;;
        "normal")
            # Normal priority logic
            if [[ (($current_hour -eq 5 || $current_hour -eq 13) && $is_weekend -eq 0) || ($current_hour -eq 11 && $is_weekend -eq 1) ]]; then
                for name in "${array[@]}"
                do
                    staging_name=$( echo $name | cut -d "." -f 1)
                    marts_name=$( echo $name | cut -d "." -f 2)
                    echo "Running: Marts --> $marts_name, Staging --> $staging_name"
                    $dbt run --models staging.$staging_name.normal marts.$marts_name.normal
                    echo " "
                    echo " "
                done
            fi
            ;;
        "medium")
            # Medium priority logic
            if [[ (($current_hour -eq 5 || $current_hour -eq 11 || $current_hour -eq 17) && $is_weekend -eq 0) || ($current_hour -eq 11 && $is_weekend -eq 1) ]]; then
                for name in "${array[@]}"
                do
                    staging_name=$( echo $name | cut -d "." -f 1)
                    marts_name=$( echo $name | cut -d "." -f 2)
                    echo "Running: Marts --> $marts_name, Staging --> $staging_name"
                    $dbt run --models staging.$staging_name.medium marts.$marts_name.medium
                    echo " "
                    echo " "
                done
            fi
            ;;
        "low")
            # Low priority logic
            if [[ $current_hour -eq 7 && $is_weekend -eq 0 ]]; then
                for name in "${array[@]}"
                do
                    staging_name=$( echo $name | cut -d "." -f 1)
                    marts_name=$( echo $name | cut -d "." -f 2)
                    echo "Running: Marts --> $marts_name, Staging --> $staging_name"
                    $dbt run --models staging.$staging_name.low marts.$marts_name.low
                    echo " "
                    echo " "
                done
            fi
            ;;
        *)
            echo "Invalid priority"
            ;;
    esac
}

# Get current hour and day of the week
current_hour=$(date +%-H)
current_day=$(date +%u)  # 1-7, where 1 is Monday and 7 is Sunday
is_weekend=0

# Check if it's the weekend
if [[ $current_day -eq 6 || $current_day -eq 7 ]]; then
    is_weekend=1
fi

# Execute function for different priorities
execute_models "high" 
execute_models "normal" 
execute_models "medium" 
execute_models "low"