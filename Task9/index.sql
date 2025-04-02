CREATE TABLE Sales (
    id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100) NOT NULL,
    sale_date DATE NOT NULL,
    amount DECIMAL(10,2) NOT NULL
);

INSERT INTO Sales (product_name, sale_date, amount) VALUES
('Laptop', '2024-03-01', 1200.00),
('Smartphone', '2024-03-05', 800.00),
('Tablet', '2024-03-10', 500.00),
('Monitor', '2024-03-15', 300.00),
('Keyboard', '2024-03-20', 100.00);

DELIMITER //
CREATE PROCEDURE GetTotalSales(IN start_date DATE, IN end_date DATE)
BEGIN
    SELECT SUM(amount) AS total_sales FROM Sales
    WHERE sale_date BETWEEN start_date AND end_date;
END //
DELIMITER ;

CALL GetTotalSales('2024-03-01', '2024-03-31');

DELIMITER //
CREATE FUNCTION ApplyDiscount(amount DECIMAL(10,2), discount_percentage INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    RETURN amount - (amount * discount_percentage / 100);
END //
DELIMITER ;


SELECT id, product_name, amount,
       ApplyDiscount(amount, 10) AS discounted_price
FROM Sales;