#!/bin/bash

DB_USER="Your username"
DB_PASSWORD="Your password"
DB_NAME="my_chat_db"

BACKUP_FILE="db.sql"

display_error() {
    echo "Error: $1"
    exit 1
}

# is mySql is installed ?
if ! command -v mysql &> /dev/null; then
    display_error "MySQL is not installed. Please install MySQL before running this script."
fi

# is username and password changed ?
if [ "$DB_USER" == "Your username" ] || [ "$DB_PASSWORD" == "Your password" ]; then
    display_error "MySQL username or password has not been updated. Please change the username and password in the script according to your MySQL."
fi

# Is there a user, name and database provided ?
if [ -z "$DB_USER" ] || [ -z "$DB_PASSWORD" ] || [ -z "$DB_NAME" ]; then
    display_error "MySQL username, password, and database name must be provided."
fi

# Can I connect with your username and password ?
if ! sudo mysql -u "$DB_USER" -p"$DB_PASSWORD" -e "SELECT 1;" &> /dev/null; then
    display_error "Failed to connect to the database. Check your MySQL username and password provided in the script."
fi

# Is the database exist ?
if ! sudo mysql -u "$DB_USER" -p"$DB_PASSWORD" -e "USE $DB_NAME;" &> /dev/null; then
    display_error "Database '$DB_NAME' does not exist. Please make sure the database name is correct."
fi

# Run the script
sudo mysqldump -u "$DB_USER" -p"$DB_PASSWORD" "$DB_NAME" > "$BACKUP_FILE"

echo "The database was successfully saved into $BACKUP_FILE"
