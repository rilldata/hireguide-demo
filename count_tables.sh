#!/bin/bash

DATABASE_NAME="analytics_prod"

# Get the list of tables and count the number of lines
table_count=$(aws glue get-tables --database-name $DATABASE_NAME --query 'TableList[*].Name' --output text | grep -v '^$' | wc -l)

echo "Number of tables in database $DATABASE_NAME: $table_count"

