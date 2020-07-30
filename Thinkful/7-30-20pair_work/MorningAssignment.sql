-- Write a query that joins the purchase_items and product tables. 
--The query should return the purchase ID, title, quantity, and price fields for all returned laptop computers.
SELECT products.id, products.title, purchase_items.quantity, purchase_items.price
FROM products 
INNER JOIN purchase_items ON products.id = purchase_items.id
WHERE products.title = 'Laptop Computer'

-- Write a query that joins all 4 tables in the database and returns all MP3 Player purchase line 
--items that are in pending status and were 
--ordered from the state of Florida (FL) by email address Derek.Knittel@gmail.com. 
--The query should return the purchase ID, the order status, 
--the customer name, the state, the product name, the order quantity, the order price, and the customer email.
SELECT b.id
      ,a.state
      ,b.name
	  ,c.title
	  ,a.quantity
	  ,a.price
	  ,d.email
	  ,b.state
FROM purchase_items a
INNER JOIN purchases b ON a.purchase_id=b.id
INNER JOIN products c ON a.product_id=c.id
INNER JOIN users d ON b.user_id=d.id
WHERE c.title = 'MP3 Player' AND b.state = 'FL' AND d.email = 'Derek.Knittel@gmail.com' AND a.state = 'Pending'
