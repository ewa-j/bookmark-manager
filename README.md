First user story:
```
As an user 
to be able to see bookmarks
I can see a list of bookmarks that I and other users have added
```

![Domain Model Diagram](https://lucid.app/publicSegments/view/4166db72-d53d-4956-97a6-c0d0527ec625/image.png)

How to setup a database:
```
1. Connect to psql
2. Create the database using the psql command CREATE DATABASE bookmark_manager;
3. Connect to the database using the pqsl command \c bookmark_manager;
4. Run the query we have saved in the file 01_create_bookmarks_table.sql
```

To set up a test database:
```
$> psql
admin=# CREATE DATABASE "bookmark_manager_test";
admin=# CREATE TABLE bookmarks(id SERIAL PRIMARY KEY, url VARCHAR(60));
```