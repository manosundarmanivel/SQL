CREATE TABLE Orders (
    id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(100) NOT NULL,
    order_date DATE NOT NULL,
    amount DECIMAL(10,2) NOT NULL
);

INSERT INTO Orders (customer_name, order_date, amount) VALUES
('Alice Johnson', '2024-03-01', 250.75),
('Bob Smith', '2024-03-15', 320.50),
('Charlie Brown', '2024-02-20', 150.00),
('Diana Green', '2024-02-28', 500.00),
('Ethan White', '2024-03-10', 275.30),
('Fiona Blue', '2024-02-01', 600.90);

SELECT id, customer_name, order_date,
       DATEDIFF(CURDATE(), order_date) AS days_since_order
FROM Orders;

SELECT id, customer_name, order_date,
       DATE_ADD(order_date, INTERVAL 7 DAY) AS estimated_delivery
FROM Orders;

SELECT id, customer_name, order_date, amount
FROM Orders
WHERE order_date >= DATE_SUB(CURDATE(), INTERVAL 30 DAY);

SELECT id, customer_name,
       DATE_FORMAT(order_date, '%M %d, %Y') AS formatted_date
FROM Orders;