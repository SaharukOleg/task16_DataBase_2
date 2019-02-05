 1) SELECT DISTINCT p.maker
 FROM Product p  
 JOIN PC 
 ON p.model = PC.model 
 WHERE p.maker
 NOT IN (
		SELECT ip.maker  
        FROM Laptop il  
        JOIN  Product ip 
        ON il.model = ip.model
);

2) SELECT DISTINCT p.maker
 FROM Product p  
 JOIN PC 
 ON p.model = PC.model 
 WHERE p.maker !=
  ALL  (
		SELECT ip.maker  
        FROM Laptop il  
        JOIN  Product ip 
        ON il.model = ip.model
);

3) SELECT DISTINCT  maker FROM Labor_SQL.Product  WHERE type = 'PC' AND NOT model = ANY (SELECT model  FROM PC) ;

4) SELECT DISTINCT p.maker
 FROM Product p  
 JOIN PC 
 ON p.model = PC.model 
 WHERE p.maker
  IN (
		SELECT ip.maker  
        FROM Laptop il  
        JOIN  Product ip 
        ON il.model = ip.model
);

5) SELECT distinct maker FROM product pr WHERE 
  NOT pr.model != ALL(SELECT pc.model FROM pc)
  AND
  NOT pr.maker !=ALL(SELECT distinct maker FROM laptop JOIN product as pr2 
  ON laptop.model = pr2.model WHERE pr2.maker = pr.maker);	

6) SELECT DISTINCT p.maker
 FROM Product p  
 JOIN PC 
 ON p.model = PC.model 
 WHERE p.maker =
  any  (
		SELECT ip.maker  
        FROM Laptop il  
        JOIN  Product ip 
        ON il.model = ip.model
);

6) 2).  SELECT DISTINCT maker
FROM Product
WHERE (maker=ANY(SELECT maker FROM Product WHERE type='PC'))
AND type='Laptop';
________________________________________________________________________________

 SELECT distinct maker 
FROM Product 
Where Type='PC' 
AND maker 
not in (	
		SELECT maker 
        FROM Product 
        WHERE NOT EXISTS 
        (Select*FROM 
        PC WHERE 
        PC.model=Product.model)
        AND type= 'PC'); 

