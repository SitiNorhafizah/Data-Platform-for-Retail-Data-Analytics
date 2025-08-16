#!/bin/bash

# MongoDB credentials
MONGO_USER="root"
MONGO_PASS="YOUR PASSWORD"
MONGO_HOST="localhost"
MONGO_DB="catalog"
COLLECTION="electronics"
DATA_FILE="catalog.json"

echo "=== MongoDB Export ==="
# Export collection to JSON
mongoexport \
  -u $MONGO_USER -p $MONGO_PASS \
  --authenticationDatabase admin \
  --db $MONGO_DB \
  --collection $COLLECTION \
  --out $DATA_FILE \
  --jsonArray

echo "Export completed: $DATA_FILE"

echo "=== MongoDB Import ==="
# Import collection from JSON
mongoimport \
  -u $MONGO_USER -p $MONGO_PASS \
  --authenticationDatabase admin \
  --db $MONGO_DB \
  --collection $COLLECTION \
  --file $DATA_FILE \
  --jsonArray \
  --drop

echo "Import completed for collection '$COLLECTION'."
