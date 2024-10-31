Create database Pinterest;
use Pinterest;

CREATE TABLE users (
  id INT AUTO_INCREMENT PRIMARY KEY,           
  username VARCHAR(50) UNIQUE,    
  email VARCHAR(100) UNIQUE,      
  password VARCHAR(255),            
  bio TEXT,                         
  is_deleted BOOLEAN DEFAULT false, 
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,             
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,             
  updated_by INT, 
  FOREIGN KEY (updated_by) REFERENCES users(id)
);

CREATE TABLE boards (
  id INT AUTO_INCREMENT PRIMARY KEY,           
  user_id INT, 
  title VARCHAR(255),               
  description TEXT,                 
  is_deleted BOOLEAN DEFAULT false, 
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,             
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,             
  updated_by INT, 
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (updated_by) REFERENCES users(id)
);

CREATE TABLE pins (
  id INT AUTO_INCREMENT PRIMARY KEY,           
  user_id INT,    
  board_id INT,  
  title VARCHAR(255),               
  description TEXT,                 
  image_url VARCHAR(255),           
  link_url VARCHAR(255),            
  is_deleted BOOLEAN DEFAULT false, 
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,             
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,             
  updated_by INT, 
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (board_id) REFERENCES boards(id),
  FOREIGN KEY (updated_by) REFERENCES users(id)
);

CREATE TABLE comments (
  id INT AUTO_INCREMENT PRIMARY KEY,           
  pin_id INT,      
  user_id INT,    
  text TEXT,                        
  is_deleted BOOLEAN DEFAULT false, 
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,             
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,             
  updated_by INT, 
  FOREIGN KEY (pin_id) REFERENCES pins(id),
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (updated_by) REFERENCES users(id)
);

CREATE TABLE categories (
  id INT AUTO_INCREMENT PRIMARY KEY,           
  name VARCHAR(255),                
  description TEXT,                 
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,             
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,             
  updated_by INT, 
  FOREIGN KEY (updated_by) REFERENCES users(id)
);

CREATE TABLE pin_categories (
  pin_id INT,      
  category_id INT, 
  PRIMARY KEY (pin_id, category_id),
  FOREIGN KEY (pin_id) REFERENCES pins(id),
  FOREIGN KEY (category_id) REFERENCES categories(id)
);

CREATE TABLE follows (
  id INT AUTO_INCREMENT PRIMARY KEY,           
  follower_id INT, 
  following_id INT, 
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,             
  FOREIGN KEY (follower_id) REFERENCES users(id),
  FOREIGN KEY (following_id) REFERENCES users(id)
);

CREATE TABLE likes (
  id INT AUTO_INCREMENT PRIMARY KEY,           
  user_id INT,    
  pin_id INT,      
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,             
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (pin_id) REFERENCES pins(id)
);

CREATE TABLE messages (
  id INT AUTO_INCREMENT PRIMARY KEY,           
  sender_id INT,  
  receiver_id INT, 
  text TEXT,                        
  is_deleted BOOLEAN DEFAULT false, 
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,             
  FOREIGN KEY (sender_id) REFERENCES users(id),
  FOREIGN KEY (receiver_id) REFERENCES users(id)
);

CREATE TABLE notifications (
  id INT AUTO_INCREMENT PRIMARY KEY,           
  user_id INT,    
  text TEXT,                        
  is_read BOOLEAN DEFAULT false, 
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,             
  FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE report_reasons (
  id INT AUTO_INCREMENT PRIMARY KEY,           
  reason TEXT
);

CREATE TABLE reports (
  id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT,
  pin_id INT,
  report_reason_id INT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (pin_id) REFERENCES pins(id),
  FOREIGN KEY (report_reason_id) REFERENCES report_reasons(id)
);


CREATE TABLE tags (
  id INT AUTO_INCREMENT PRIMARY KEY,           
  name VARCHAR(255)
);

CREATE TABLE pin_tags (
  pin_id INT,      
  tag_id INT,      
  PRIMARY KEY (pin_id, tag_id),
  FOREIGN KEY (pin_id) REFERENCES pins(id),
  FOREIGN KEY (tag_id) REFERENCES tags(id)
);

CREATE TABLE views (
  id INT AUTO_INCREMENT PRIMARY KEY,           
  user_id INT,    
  pin_id INT,      
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,             
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (pin_id) REFERENCES pins(id)
);

INSERT INTO pins (user_id, board_id, title, description, image_url, link_url, is_deleted, updated_by) VALUES 
(1, 1, 'Pin 1', 'Description for Pin 1', 'http://example.com/image1.jpg', 'http://example.com/link1', false, 1),
(2, 1, 'Pin 2', 'Description for Pin 2', 'http://example.com/image2.jpg', 'http://example.com/link2', false, 2),
(3, 2, 'Pin 3', 'Description for Pin 3', 'http://example.com/image3.jpg', 'http://example.com/link3', false, 3),
(4, 2, 'Pin 4', 'Description for Pin 4', 'http://example.com/image4.jpg', 'http://example.com/link4', false, 1),
(5, 3, 'Pin 5', 'Description for Pin 5', 'http://example.com/image5.jpg', 'http://example.com/link5', false, 2),
(6, 4, 'Pin 6', 'Description for Pin 6', 'http://example.com/image6.jpg', 'http://example.com/link6', false, 3),
(7, 5, 'Pin 7', 'Description for Pin 7', 'http://example.com/image7.jpg', 'http://example.com/link7', false, 4),
(8, 6, 'Pin 8', 'Description for Pin 8', 'http://example.com/image8.jpg', 'http://example.com/link8', false, 5),
(9, 7, 'Pin 9', 'Description for Pin 9', 'http://example.com/image9.jpg', 'http://example.com/link9', false, 1),
(10, 8, 'Pin 10', 'Description for Pin 10', 'http://example.com/image10.jpg', 'http://example.com/link10', false, 2);

INSERT INTO pins (user_id, board_id, title, description, image_url, link_url, is_deleted, updated_by)
VALUES 
(1, 1, 'Pin 1', 'Description for Pin 1', 'image1.jpg', 'link1.com', false, 1),
(2, 1, 'Pin 2', 'Description for Pin 2', 'image2.jpg', 'link2.com', false, 2),
(3, 2, 'Pin 3', 'Description for Pin 3', 'image3.jpg', 'link3.com', false, 3),
(4, 2, 'Pin 4', 'Description for Pin 4', 'image4.jpg', 'link4.com', false, 4),
(5, 3, 'Pin 5', 'Description for Pin 5', 'image5.jpg', 'link5.com', false, 5),
(6, 3, 'Pin 6', 'Description for Pin 6', 'image6.jpg', 'link6.com', false, 1),
(7, 4, 'Pin 7', 'Description for Pin 7', 'image7.jpg', 'link7.com', false, 2),
(8, 4, 'Pin 8', 'Description for Pin 8', 'image8.jpg', 'link8.com', false, 3);

select * from pins;

INSERT INTO comments (pin_id, user_id, text, is_deleted, updated_by) VALUES 
(1, 2, 'Comment for Pin 1 by User 2', false, 1),
(1, 3, 'Comment for Pin 1 by User 3', false, 2),
(2, 1, 'Comment for Pin 2 by User 1', false, 1),
(3, 4, 'Comment for Pin 3 by User 4', false, 3),
(4, 5, 'Comment for Pin 4 by User 5', false, 4),
(5, 6, 'Comment for Pin 5 by User 6', false, 5),
(6, 7, 'Comment for Pin 6 by User 7', false, 1),
(7, 8, 'Comment for Pin 7 by User 8', false, 2),
(8, 9, 'Comment for Pin 8 by User 9', false, 3);

select * from pins;
INSERT INTO comments (pin_id, user_id, text, is_deleted, updated_by) VALUES 
(1, 2, 'Comment for Pin 1 by User 2', false, 1),
(1, 3, 'Comment for Pin 1 by User 3', false, 2),
(2, 1, 'Comment for Pin 2 by User 1', false, 1),
(3, 4, 'Comment for Pin 3 by User 4', false, 3),
(4, 5, 'Comment for Pin 4 by User 5', false, 4),
(5, 6, 'Comment for Pin 5 by User 6', false, 5),
(6, 7, 'Comment for Pin 6 by User 7', false, 1),
(7, 8, 'Comment for Pin 7 by User 8', false, 2),
(8, 9, 'Comment for Pin 8 by User 9', false, 3);

INSERT INTO categories (name, description, updated_by) VALUES 
('Category 1', 'Description for Category 1', 1),
('Category 2', 'Description for Category 2', 2),
('Category 3', 'Description for Category 3', 3),
('Category 4', 'Description for Category 4', 4),
('Category 5', 'Description for Category 5', 5);

INSERT INTO pin_categories (pin_id, category_id) VALUES 
(1, 1),
(1, 2),
(2, 2),
(3, 3),
(4, 1),
(5, 4),
(6, 5),
(7, 2),
(8, 3),
(9, 4),
(10, 5);

INSERT INTO follows (follower_id, following_id) VALUES 
(1, 2),
(1, 3),
(2, 3),
(3, 1),
(2, 4),
(3, 5),
(4, 1),
(5, 6),
(6, 7),
(7, 8),
(8, 9),
(9, 10),
(10, 1);

INSERT INTO report_reasons (reason) VALUES 
('Spam'),
('Inappropriate content'),
('Harassment'),
('Misleading information'),
('Other');

INSERT INTO reports (user_id, pin_id, report_reason_id) VALUES 
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 6, 1),
(7, 7, 2),
(8, 1, 3);

INSERT INTO notifications (user_id, text, is_read) 
VALUES 
(1, 'Your pin has received a like.', false), 
(2, 'You have a new follower.', false), 
(3, 'Your board has been updated.', true), 
(4, 'Your pin has been commented on.', false), 
(5, 'Your profile has been viewed.', true), 
(1, 'You have a new message.', false), 
(2, 'Your comment received a reply.', true), 
(3, 'A new pin was added to your board.', false);

INSERT INTO views (user_id, pin_id) 
VALUES 
(1, 1), 
(2, 2), 
(3, 3), 
(4, 4), 
(5, 5), 
(1, 2), 
(2, 3), 
(3, 4), 
(4, 5), 
(5, 1);


INSERT INTO tags (name) 
VALUES 
('Tag 1'), 
('Tag 2'), 
('Tag 3'), 
('Tag 4'), 
('Tag 5');

INSERT INTO tags (name) 
VALUES 
('Tag 1'), 
('Tag 2'), 
('Tag 3'), 
('Tag 4'), 
('Tag 5');

DELIMITER //

CREATE PROCEDURE soft_delete_user(IN user_id INT)
BEGIN
    UPDATE users 
    SET is_deleted = true, updated_at = CURRENT_TIMESTAMP 
    WHERE id = user_id;
END //

DELIMITER ;

UPDATE users 
SET bio = 'Updated bio', updated_by = 1, updated_at = CURRENT_TIMESTAMP
WHERE id = 1;

DELIMITER //

CREATE TRIGGER before_user_update
BEFORE UPDATE ON users
FOR EACH ROW
BEGIN
    SET NEW.updated_at = CURRENT_TIMESTAMP;
    -- NEW.updated_by має бути встановлений в ручному режимі або автоматично через бізнес-логіку
END //

DELIMITER ;

DELIMITER //

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
END //

DELIMITER ;

DELIMITER //

CREATE FUNCTION get_pin_likes_count(pin_id INT) 
RETURNS INT
BEGIN
    DECLARE likes_count INT;
    SELECT COUNT(*) INTO likes_count 
    FROM likes 
    WHERE pin_id = pin_id;
    RETURN likes_count;
END //

DELIMITER ;

CREATE VIEW active_users AS
SELECT id, username, email, created_at, updated_at 
FROM users 
WHERE is_deleted = false;

DELIMITER $$

CREATE FUNCTION get_pin_likes_count(pin_id INT) 
RETURNS INT
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE likes_count INT;
    SELECT COUNT(*) INTO likes_count 
    FROM likes 
    WHERE pin_id = pin_id;
    RETURN likes_count;
END $$

DELIMITER ;

CREATE VIEW popular_pins AS
SELECT p.id, p.title, p.description, COUNT(l.id) AS like_count
FROM pins p
JOIN likes l ON p.id = l.pin_id
WHERE p.is_deleted = false
GROUP BY p.id
HAVING like_count > 5;

CREATE TABLE likes (
  id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT,
  pin_id INT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (pin_id) REFERENCES pins(id)
);

CREATE VIEW popular_pins AS
SELECT p.id, p.title, p.description, COUNT(l.id) AS like_count
FROM pins p
JOIN likes l ON p.id = l.pin_id
WHERE p.is_deleted = false
GROUP BY p.id
HAVING like_count > 5;

DELIMITER //

CREATE PROCEDURE like_pin(IN user_id INT, IN pin_id INT)
BEGIN
    IF (SELECT COUNT(*) FROM likes WHERE user_id = user_id AND pin_id = pin_id) = 0 THEN
        INSERT INTO likes (user_id, pin_id) VALUES (user_id, pin_id);
    ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'User already liked this pin';
    END IF;
END //

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE add_like(IN p_user_id INT, IN p_pin_id INT)
BEGIN
    IF NOT EXISTS (SELECT 1 FROM likes WHERE user_id = p_user_id AND pin_id = p_pin_id) THEN
        INSERT INTO likes (user_id, pin_id) VALUES (p_user_id, p_pin_id);
    END IF;
END $$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE add_comment(IN p_pin_id INT, IN p_user_id INT, IN p_text TEXT, IN p_updated_by INT)
BEGIN
    INSERT INTO comments (pin_id, user_id, text, is_deleted, updated_by)
    VALUES (p_pin_id, p_user_id, p_text, false, p_updated_by);
END $$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE soft_delete_pin(IN p_pin_id INT, IN p_updated_by INT)
BEGIN
    UPDATE pins SET is_deleted = true, updated_by = p_updated_by WHERE id = p_pin_id;
END $$

DELIMITER ;

DELIMITER $$

CREATE FUNCTION get_comment_count(p_pin_id INT) RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE comment_count INT;
    SELECT COUNT(*) INTO comment_count
    FROM comments
    WHERE pin_id = p_pin_id AND is_deleted = false;
    RETURN comment_count;
END $$

DELIMITER ;

DELIMITER $$

CREATE FUNCTION get_view_count(p_pin_id INT) RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE view_count INT;
    SELECT COUNT(*) INTO view_count
    FROM views
    WHERE pin_id = p_pin_id;
    RETURN view_count;
END $$

DELIMITER ;

DELIMITER $$

CREATE FUNCTION has_user_liked_pin(p_user_id INT, p_pin_id INT) RETURNS BOOLEAN
DETERMINISTIC
BEGIN
    DECLARE like_exists BOOLEAN;
    SELECT EXISTS(SELECT 1 FROM likes WHERE user_id = p_user_id AND pin_id = p_pin_id) INTO like_exists;
    RETURN like_exists;
END $$



CREATE PROCEDURE update_user_bio(IN p_user_id INT, IN p_new_bio TEXT, IN p_updated_by INT)
BEGIN
    UPDATE users SET bio = p_new_bio, updated_by = p_updated_by WHERE id = p_user_id;
END $$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE update_pin(IN p_pin_id INT, IN p_new_title VARCHAR(255), IN p_new_description TEXT, IN p_updated_by INT)
BEGIN
    UPDATE pins SET title = p_new_title, description = p_new_description, updated_by = p_updated_by
    WHERE id = p_pin_id;
END $$

DELIMITER ;

INSERT INTO likes (user_id, pin_id) 
VALUES 
(1, 1), 
(2, 1), 
(3, 2), 
(4, 3), 
(5, 3), 
(1, 2), 
(2, 4), 
(3, 5), 
(4, 5), 
(5, 1), 
(1, 4), 
(2, 5);

DELIMITER //

DELIMITER //

CREATE FUNCTION get_pin_likes_count(pinId INT) 
RETURNS INT 
DETERMINISTIC
BEGIN
    DECLARE count INT;
    
    SELECT COUNT(*) INTO count
    FROM likes
    WHERE pin_id = pinId;

    RETURN count;
END //

DELIMITER ;

