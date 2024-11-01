CREATE TABLE pin_categories (
  pin_id INT,      
  category_id INT, 
  PRIMARY KEY (pin_id, category_id),
  FOREIGN KEY (pin_id) REFERENCES pins(id),
  FOREIGN KEY (category_id) REFERENCES categories(id)
);
