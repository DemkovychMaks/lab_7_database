CREATE DEFINER=`root`@`localhost` FUNCTION `getPassword`(password_id INT) RETURNS varchar(100) CHARSET utf8mb4
BEGIN
RETURN(
	SELECT password FROM password WHERE id =(SELECT password_id FROM user WHERE id = password_id)
    );
END