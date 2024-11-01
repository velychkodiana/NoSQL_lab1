CREATE FUNCTION get_view_count(p_pin_id INT) RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE view_count INT;
    SELECT COUNT(*) INTO view_count
    FROM views
    WHERE pin_id = p_pin_id;
    RETURN view_count;
END
