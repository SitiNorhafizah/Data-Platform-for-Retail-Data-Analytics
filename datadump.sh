#!/bin/bash

# Database credentials
USER="root"
PASSWORD="uR28RpByS2uXUIYC79TzZuV4"
DATABASE="sales"

# Output file
OUTPUT="sales_data.sql"

# Export sales_data table
mysqldump -u $USER -p$PASSWORD $DATABASE sales_data > $OUTPUT

echo "Data from sales_data table has been exported to $OUTPUT"
