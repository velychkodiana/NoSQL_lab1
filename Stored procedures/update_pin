CREATE PROCEDURE update_pin(IN p_pin_id INT, IN p_new_title VARCHAR(255), IN p_new_description TEXT, IN p_updated_by INT)
BEGIN
    UPDATE pins SET title = p_new_title, description = p_new_description, updated_by = p_updated_by
    WHERE id = p_pin_id;
END
