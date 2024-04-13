#!/bin/bash

# dbt bin file location
dbt="/home/user_name/.local/bin/dbt"
# dbt="dbt" # test

# names of different dbt modules in a "STAGING_NAME.MARTS_NAME" format
declare -a array=("performance_report.performance_report" 
                "promo_campaign_user_report.promo_campaign_user" 
                "merchant_analysis.merchant"
                "nomba_pos_reports.nomba_pos_report"
                "kaduna_vend_request.kaduna_report"
                "common.common"
                "executive_business_report.executive_business"
                "verification_service_report.verification_service_report"
                "agent_transactions_analysis.agent_transactions"
                "error_logs_report.errors_log"
                "exposure_analysis.exposure"
                "users_with_debt_report.users_with_debts"
                "watchlist_analysis.watchlist"
                "growth_analysis.growth"
                "reconcilation_report.reconcilation"
                "new_transactions_report.new_transaction_report"
                "vend_analysis.vends"
                "bpvs_analytics.bpvs"
                "accounting_report.accounting"
                ) 