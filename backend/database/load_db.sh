#!/bin/bash

DB_USER="Your username"
DB_PASSWORD="You password"
DB_NAME="my_chat_db"

BACKUP_FILE="db.sql"

DB_EXISTS=$(sudo mysql -u $DB_USER -p$DB_PASSWORD -e "SHOW DATABASES LIKE '$DB_NAME'" | grep "$DB_NAME")

if [ "$DB_EXISTS" == "$DB_NAME" ]; then
    echo "Database already exists. Updating..."
    sudo mysql -u $DB_USER -p$DB_PASSWORD $DB_NAME < $BACKUP_FILE
    echo "Database $DB_NAME has been successfully updated from $BACKUP_FILE"
else

    echo "Database does not exist. Creating..."
    sudo mysql -u $DB_USER -p$DB_PASSWORD -e "CREATE DATABASE $DB_NAME"
    sudo mysql -u $DB_USER -p$DB_PASSWORD $DB_NAME < $BACKUP_FILE
    echo "Database $DB_NAME has been successfully created and restored from $BACKUP_FILE"
fi
