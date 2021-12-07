# lab_7_database
variant 7
Database of electronic resource with books (schema. 1).
SAVED PROCEDURES
1. Ensure parameterized insertion of new values ​​in the Book table.
2. Create a package that inserts 10 rows into the Passwords table in the format <Noname + No>, for example Noname5, where the number is generated randomly. At the same time it is necessary to check that numbers did not coincide with already available.
3. Using the cursor, you use dynamic creation of a table containing columns with names from the Book table. The type of columns is arbitrary.
CUSTOM FUNCTIONS
1. For the user table write the function as it will look for the MIN column of the Rating. Then make a data sample (SELECT) using this function.
2. Write a function that extracts the value of the Password field by the key between the Users and Passwords tables. Then select all data (SELECT) from the user table using this function.
TRIGGERS
1. Ensure the integrity of the value for the database structure.
2. Users → Last name cannot end in 'other' or 'other';
3. In the field Users → Place of residence is allowed only for the following values: 'Lviv', 'Kyiv', 'Donetsk' and 'Odessa'.
4. Create a log table in which to keep logs with the time strain when deleting data for the Book table.
