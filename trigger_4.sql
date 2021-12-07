CREATE DEFINER=`root`@`localhost` TRIGGER `book_logs` AFTER DELETE ON `book` FOR EACH ROW BEGIN
	INSERT INTO book_journal(name, timestamp) VALUES (old.name, current_timestamp());
END