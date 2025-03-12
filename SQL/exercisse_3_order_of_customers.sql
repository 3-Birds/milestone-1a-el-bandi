/*
Question 1: Total Orders Per Customer

Write a query to display the total number of orders placed by each customer, 
along with their name and the date they joined. Sort the results by the total number of orders in descending order.
*/

SELECT count(orders.order_id) as NrOfOrders, customers.customer_name, customers.join_date
FROM orders
JOIN customers ON customers.customer_id = orders.customer_id
GROUP BY customers.customer_name, customers.join_date ORDER BY count(orders.order_id) DESC
/*
Question 2: Rank Customers by Spending

For each customer, calculate their total spending (sum of the total amounts from the `Orders` table) 
and rank them by total spending within their respective country. 
Use a **window function** to rank the customers.
*/

SELECT count(orders.order_id) as NrOfOrders, customers.customer_name, customers.country, sum(OrderItems.price * OrderItems.quantity) as totalSpending
FROM orders
JOIN customers ON customers.customer_id = orders.customer_id
JOIN OrderItems ON orders.order_id = OrderItems.order_id
GROUP BY customers.customer_name, customers.country
ORDER BY customers.country, totalSpending DESC

