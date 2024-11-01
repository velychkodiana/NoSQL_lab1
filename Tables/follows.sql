CREATE TABLE follows (
  id INT AUTO_INCREMENT PRIMARY KEY,           
  follower_id INT, 
  following_id INT, 
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,             
  FOREIGN KEY (follower_id) REFERENCES users(id),
  FOREIGN KEY (following_id) REFERENCES users(id)
);
