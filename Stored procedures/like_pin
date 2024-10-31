CREATE PROCEDURE like_pin(IN user_id INT, IN pin_id INT)
BEGIN
    IF (SELECT COUNT(*) FROM likes WHERE user_id = user_id AND pin_id = pin_id) = 0 THEN
        INSERT INTO likes (user_id, pin_id) VALUES (user_id, pin_id);
    ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'User already liked this pin';
    END IF;
END
