CREATE PROCEDURE update_user_bio(IN p_user_id INT, IN p_new_bio TEXT, IN p_updated_by INT)
BEGIN
    UPDATE users SET bio = p_new_bio, updated_by = p_updated_by WHERE id = p_user_id;
END
