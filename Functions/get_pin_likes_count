CREATE FUNCTION get_pin_likes_count(pinId INT) 
RETURNS INT 
DETERMINISTIC
BEGIN
    DECLARE count INT;
    
    SELECT COUNT(*) INTO count
    FROM likes
    WHERE pin_id = pinId;

    RETURN count;
END
