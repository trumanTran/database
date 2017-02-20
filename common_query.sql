--check maximum id(p-key) from a table, increase it by 1 to create a new id
select max(account_id) from customer_account;

--register a new customer
INSERT INTO customer_account VALUES
((select max(account_id) from customer_account)+1, '9176780912', 'jhunters01@cuny.edu', 'Jack', 'Hunter', '11 67ST', 'New York', 'NY', '10024', TO_DATE('1998/01/22 00:00:00', 'yyyy/mm/dd hh24:mi:ss'));

--display all available phone
select * from cell_phone_category c where c.num_of_storage>0;

--filter by OS
select * from cell_phone_category  where num_of_storage>0 and os='iOS'

--add cell phone(s) to cart
--first check if there is existing tuple
select * from shopping  where account_id=1 and phone_id=2
--if there are result
update shopping_cart
	set quantity = (select quantity from shopping_cart where account_id=1 and phone_id=2)+1
	WHERE account_id=1 and phone_id=2;
--if there are no such line
INSERT INTO shopping_cart VALUES
	(1, 2, 1);
	
	
--place an order for customer id 1
INSERT INTO orders VALUES
((select max(order_number) from orders)+1, (select payment_id from payment where account_id=2), 2, 'Received', 0.0, 'Economy', 0.0, 'xx', 'xx', 'xx', 'xx', 'xx', 0.0, CURRENT_DATE);
--suppose current order num is 1, move all shopping art tuple to order entry
select phone_id, quantity from shopping_cart where  account_id=1
--create a loop to insert them into order_entry
INSERT INTO order_entry VALUES
(1, phone_id_just_selected, quantity_just_selected)

--other queries we can use 


--Find out first name and last name of customers who had their order received/confirmed/shipped/deleivered (in this case shipped)
SELECT c.fname, c.lname, o.status FROM customer_account c JOIN orders o USING(account_id) WHERE o.status = 'Shipped'; 

--most least popular phone
SELECT distinct p.model, e.quantity FROM cell_phone_category p JOIN order_entry e USING(PHONE_ID) WHERE quantity = (select min(quantity) from order_entry); 


