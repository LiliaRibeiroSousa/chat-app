#!/bin/bash

DB_USER="Your username"
DB_PASSWORD="Your password"
DB_NAME="my_chat_db"

BACKUP_FILE="db.sql"

display_error() {
    echo "Error: $1"
    exit 1
}

# Check if MySQL is installed
if ! command -v mysql &> /dev/null; then
    display_error "MySQL is not installed. Please install MySQL before running this script."
fi

# Check if username and password have been changed
if [ "$DB_USER" == "Your username" ] || [ "$DB_PASSWORD" == "Your password" ]; then
    display_error "MySQL username or password has not been updated. Please change the username and password in the script according to your MySQL."
fi

# Check if username, password, and database name are provided
if [ -z "$DB_USER" ] || [ -z "$DB_PASSWORD" ] || [ -z "$DB_NAME" ]; then
    display_error "MySQL username, password, and database name must be provided."
fi

# Test database connection
if ! sudo mysql -u "$DB_USER" -p"$DB_PASSWORD" -e "SELECT 1;" &> /dev/null; then
    display_error "Failed to connect to the database. Check your MySQL username and password provided in the script."
fi

# Run the script
DB_EXISTS=$(sudo mysql -u "$DB_USER" -p"$DB_PASSWORD" -e "SHOW DATABASES" | grep -o "\<$DB_NAME\>")
if [ "$DB_EXISTS" == "$DB_NAME" ]; then
    echo "Database already exists. Updating..."

    if ! sudo mysql -u "$DB_USER" -p"$DB_PASSWORD" "$DB_NAME" < "$BACKUP_FILE"; then
        display_error "Failed to update the database. Please check the backup file and try again."
    fi
    echo "Database '$DB_NAME' has been successfully updated from '$BACKUP_FILE'"
else
    echo "Database does not exist. Creating..."
    if ! sudo mysql -u "$DB_USER" -p"$DB_PASSWORD" -e "CREATE DATABASE IF NOT EXISTS $DB_NAME"; then
        display_error "Failed to create the database. Please check your MySQL credentials and try again."
    fi
    if ! sudo mysql -u "$DB_USER" -p"$DB_PASSWORD" "$DB_NAME" < "$BACKUP_FILE"; then
        display_error "Failed to restore data into the new database. Please check the backup file and try again."
    fi
    echo "Database '$DB_NAME' has been successfully created and restored from '$BACKUP_FILE'"
fi
