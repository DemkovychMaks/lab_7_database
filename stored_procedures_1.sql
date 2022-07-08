CREATE DEFINER=`root`@`localhost` PROCEDURE `insertIntoBooks`(
IN name VARCHAR(45),
IN authors VARCHAR(45),
IN udk_index INT,
IN rate DOUBLE,
IN directory_tree_id INT
)
BEGIN
INSERT INTO book(`name`, `authors`, `udk_index`, `rate`, `directory_tree_id`) VALUES 
(name, authors, udk_index, rate, directory_tree_id);
END