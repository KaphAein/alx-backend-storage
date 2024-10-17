-- Adding trigger to decrease quantity after inserting into orders
DELIMITER //
DROP TRIGGER IF EXISTS validate_email;
CREATE TRIGGER validate_email
BEFORE UPDATE ON users
FOR EACH ROW
BEGIN
    IF OLD.email != NEW.email THEN
        SET NEW.valid_email = 0;
    END IF;
END //
DELIMITER ;
