CREATE PROCEDURE add_like(IN p_user_id INT, IN p_pin_id INT)
BEGIN
    IF NOT EXISTS (SELECT 1 FROM likes WHERE user_id = p_user_id AND pin_id = p_pin_id) THEN
        INSERT INTO likes (user_id, pin_id) VALUES (p_user_id, p_pin_id);
    END IF;
END
