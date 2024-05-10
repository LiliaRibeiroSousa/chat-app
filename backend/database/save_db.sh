#!/bin/bash

DB_USER="Your username"
DB_PASSWORD="You password"
DB_NAME="my_chat_db"

BACKUP_FILE="db.sql"

sudo mysqldump -u $DB_USER -p$DB_PASSWORD $DB_NAME > $BACKUP_FILE

echo "The database was successfully saved into $BACKUP_FILE"