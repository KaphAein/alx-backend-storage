-- Adding trigger to decrease quantity after inserting into orders
DELIMITER //
DROP TRIGGER IF EXISTS quantity_decrease;
CREATE TRIGGER quantity_decrease
AFTER INSERT ON orders
FOR EACH ROW
BEGIN
    UPDATE items
    SET quantity = quantity - NEW.number
    WHERE name = NEW.item_name;
END //

DELIMITER ;
