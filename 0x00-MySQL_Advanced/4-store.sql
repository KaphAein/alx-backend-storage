-- Adding trigger
DELIMITER //
CREATE TRIGGER IF NOT EXISTS quantity_decrease
AFTER INSERT ON order
FOR EACH ROW
    UPDATE items
        SET quatntity = quantity - NEW.number
        WHERE name = NEW.item_name;
//
DELIMITER ;
