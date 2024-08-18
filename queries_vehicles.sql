-- first query
SELECT * FROM owners  
  FULL JOIN vehicles v 
    ON owner.id=vehicle.owner_id;

-- second query
SELECT first_name, last_name, 
  COUNT(owner_id) FROM owners  
  JOIN vehicles v on owner.id=vehicle.owner_id 
  GROUP BY (first_name, last_name) 
ORDER BY first_name;


-- third query
SELECT 
  first_name, last_name, 
  ROUND(AVG(price)) as average_price, 
  COUNT(owner_id) 
FROM owners  
JOIN vehicles on owner.id=vehicle.owner_id 
GROUP BY 
  (first_name, last_name) 
HAVING 
  COUNT(owner_id) > 1 AND ROUND(AVG(price)) > 10000 
ORDER BY first_name DESC;