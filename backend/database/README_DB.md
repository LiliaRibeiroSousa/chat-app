# LILIA DATABASE

## FILES
Inside the folder backend/database you have 4 files (db.sql, load_db.sh, save_db.sh):

*db.sql*
a .sql file that contains your database as a file.

*load_db.sh* 
a script that will load you db into mysql. If the database doesn't exist, it'll create it for you.

*save_db.sh*
a script that will save the actual state of your database, even the entries.

*db_schema.png*
a image that describe the database provided

## REQUIEREMENTS
!!! ONLY WORKS ON LINUX OR WSL !!!
You need to have mysql installed
To ensure that, write in your terminal :
```
mysql --version
```
if the answer is something "mysql  Ver 8.0.26", it's good to continue.
Otherwise, install mysql and set the user + password.

## HOW TO USE IT

### load_db.sh

First of all, you'll need to make some change in this file.
You have to change those 2 lines and provide your access.
```
DB_USER="Your username" 
DB_PASSWORD="You password"
```

Secondly, you need to authorise the script to be launched.
Inside you terminal, insert :
```
chmod +x load_db.sh

```

Finally, go to the point chat-app/backend/database
If you write "ls" you should be able to see the two scripts. 
If not, you are not in the good spot.

If yes, type in your terminal :
```
./load_db.sh
```
Here we go, your database is setup.
The name of your database is my_chat_db

### save_db.sh

First of all, you'll need to make some change in this file.
You have to change those 2 lines and provide your access.
```
DB_USER="Your username" 
DB_PASSWORD="You password"
```

Secondly, you need to authorise the script to be launched.
Inside you terminal, insert :
```
chmod +x save_db.sh

```

Finally, go to the point chat-app/backend/database
If you write "ls" you should be able to see the two scripts. 
If not, you are not in the good spot.

If yes, type in your terminal :
```
./save_db.sh
```
Here we go, your database is saved into db.sql