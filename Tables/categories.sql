CREATE TABLE categories (
  id INT AUTO_INCREMENT PRIMARY KEY,           
  name VARCHAR(255),                
  description TEXT,                 
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,             
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,             
  updated_by INT, 
  FOREIGN KEY (updated_by) REFERENCES users(id)
);
