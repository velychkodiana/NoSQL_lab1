CREATE PROCEDURE add_comment(IN p_pin_id INT, IN p_user_id INT, IN p_text TEXT, IN p_updated_by INT)
BEGIN
    INSERT INTO comments (pin_id, user_id, text, is_deleted, updated_by)
    VALUES (p_pin_id, p_user_id, p_text, false, p_updated_by);
END
