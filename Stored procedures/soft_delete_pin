CREATE PROCEDURE soft_delete_pin(IN p_pin_id INT, IN p_updated_by INT)
BEGIN
    UPDATE pins SET is_deleted = true, updated_by = p_updated_by WHERE id = p_pin_id;
END
