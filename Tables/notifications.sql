CREATE TABLE notifications (
  id INT AUTO_INCREMENT PRIMARY KEY,           
  user_id INT,    
  text TEXT,                        
  is_read BOOLEAN DEFAULT false, 
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,             
  FOREIGN KEY (user_id) REFERENCES users(id)
);
