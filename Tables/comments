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
