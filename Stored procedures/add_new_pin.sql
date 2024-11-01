CREATE PROCEDURE add_new_pin(
    IN user_id INT, 
    IN board_id INT, 
    IN pin_title VARCHAR(255), 
    IN pin_desc TEXT, 
    IN img_url VARCHAR(255), 
    IN link_url VARCHAR(255), 
    IN updated_by_user INT)
BEGIN
    INSERT INTO pins (user_id, board_id, title, description, image_url, link_url, is_deleted, updated_by) 
    VALUES (user_id, board_id, pin_title, pin_desc, img_url, link_url, false, updated_by_user);
END
