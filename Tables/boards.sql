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
