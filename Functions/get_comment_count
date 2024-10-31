CREATE FUNCTION get_comment_count(p_pin_id INT) RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE comment_count INT;
    SELECT COUNT(*) INTO comment_count
    FROM comments
    WHERE pin_id = p_pin_id AND is_deleted = false;
    RETURN comment_count;
END 
