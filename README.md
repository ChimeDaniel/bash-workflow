# DBT Workflow

This repository contains the workflow folder of a dbt (Data Build Tool) project. The workflow folder contains several bash (.sh) files that automate and orchestrate the execution of dbt commands.

## Description
The workflow folder includes the following bash files:

- `dbt_script.sh`: Main script with conditional statements that detect when a dbt run command is executed.
- `raw.sh`: Script containing a specific model that is only run at the beginning of the week.
- `rqt.sh`: Script containing a list of all dbt modules in a "staging_name.marts_name" format that is executed with dbt run commands in `dbt_script.sh`.
- `run.sh`: Main execution script for running `dbt_script.sh` and `raw.sh`. This script is scheduled on a cronjob in a GCP Cloud instance to run hourly. It also contains git commands to keep the entire dbt project folder up to date by pulling and merging changes from the main branch.

## Usage
To use the dbt workflow scripts:
1. Ensure you have the necessary permissions and access to the dbt project and its dependencies.
2. Review the configuration settings in each bash script to ensure they match your environment.
3. Execute the `run.sh` script either manually or schedule it on a cronjob to run hourly.
4. Follow any prompts and instructions provided in the scripts during execution.

## Files
- `dbt_script.sh`: Main script for executing dbt run commands.
- `raw.sh`: Script for running a specific model at the beginning of the week.
- `rqt.sh`: Script containing a list of dbt modules for execution.
- `run.sh`: Main execution script for orchestrating dbt workflows and keeping the project up to date with git.

## Dependencies
- Bash shell environment
- Git

## Contributors
- Daniel Chime

Feel free to contribute by submitting pull requests or opening issues.
