CREATE DEFINER=`root`@`localhost` PROCEDURE `CreateTableByBooksNameCursor`()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE name VARCHAR(45);
    DECLARE BooksNameCursor CURSOR FOR
    SELECT name FROM book;
    DECLARE CONTINUE HANDLER FOR NOT FOUND
    SET done = TRUE;
    SET @request= 'CREATE TABLE IF NOT EXISTS book_name (id INT AUTO_INCREMENT, name VARCHAR(45), PRIMARY KEY (id));';
    PREPARE myQuery FROM @request;
    EXECUTE myQuery;
    OPEN BooksNameCursor;
    BooksNameCursorLoop: LOOP
        FETCH BooksNameCursor INTO name;
        IF done = TRUE THEN LEAVE BooksNameCursorLoop;
        END IF;
        SET @request = CONCAT('INSERT INTO book_name (name) VALUES ("',name,'");');
		PREPARE myQuery FROM @request;
		EXECUTE myQuery;
    END LOOP;
    DEALLOCATE PREPARE myQuery;
CLOSE BooksNameCursor;
END