CREATE FUNCTION has_user_liked_pin(p_user_id INT, p_pin_id INT) RETURNS BOOLEAN
DETERMINISTIC
BEGIN
    DECLARE like_exists BOOLEAN;
    SELECT EXISTS(SELECT 1 FROM likes WHERE user_id = p_user_id AND pin_id = p_pin_id) INTO like_exists;
    RETURN like_exists;
END
