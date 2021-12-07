USE book_db;
DROP TRIGGER IF EXISTS user_filter_insert;
DROP TRIGGER IF EXISTS user_filter_update;

DELIMITER //

CREATE TRIGGER user_filter_insert BEFORE INSERT ON user FOR EACH ROW 
BEGIN
	IF (new.surname rlike '[%ін]|[%іна]')
    THEN SIGNAL SQLSTATE "45000"
			SET MESSAGE_TEXT = "format invalid";
    END IF;
    IF (new.birth_place not rlike 'Львів|Київ|Донецьк|Одесса')
    THEN SIGNAL SQLSTATE "45000"
			SET MESSAGE_TEXT = "place of birth invalid can be (Львів, Київ, Донецьк, Одесса)";
    END IF;

END //

CREATE TRIGGER user_filter_update BEFORE UPDATE ON user FOR EACH ROW 
BEGIN
	IF (new.surname rlike '[%ін]|[%іна]')
    THEN SIGNAL SQLSTATE "45000"
			SET MESSAGE_TEXT = "format invalid";
    END IF;
    
	IF (new.birth_place not rlike 'Львів|Київ|Донецьк|Одесса')
    THEN SIGNAL SQLSTATE "45000"
			SET MESSAGE_TEXT = "place of birth invalid can be (Львів, Київ, Донецьк, Одесса)";
    END IF;
END //
