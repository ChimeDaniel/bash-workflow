#!/bin/bash
. ./rqt.sh
$dbt run --models staging.raw staging.raw_bpvs