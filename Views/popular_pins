CREATE VIEW popular_pins AS
SELECT p.id, p.title, p.description, COUNT(l.id) AS like_count
FROM pins p
JOIN likes l ON p.id = l.pin_id
WHERE p.is_deleted = false
GROUP BY p.id
HAVING like_count > 3;
