CREATE TABLE likes (
  id INT AUTO_INCREMENT PRIMARY KEY,           
  user_id INT,    
  pin_id INT,      
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,             
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (pin_id) REFERENCES pins(id)
);
