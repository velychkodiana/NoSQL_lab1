CREATE PROCEDURE soft_delete_user(IN user_id INT)
BEGIN
    UPDATE users 
    SET is_deleted = true, updated_at = CURRENT_TIMESTAMP 
    WHERE id = user_id;
END
