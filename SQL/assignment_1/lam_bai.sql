-- 2.Viết lệnh lấy ra thông tin của khách hàng: tên, số lượng oto khách hàng đã
-- mua và sắp sếp tăng dần theo số lượng oto đã mua.
SELECT cu.Customer_name, IFNULL(SUM(co.Amount), '0')
FROM Customer cu
LEFT JOIN Car_order co
	ON cu.Customer_id = co.Customer_id AND co.Staus = "1"
GROUP BY cu.Customer_id
ORDER BY SUM(co.Amount);

-- 3. Viết hàm (không có parameter) trả về tên hãng sản xuất đã bán được nhiều
-- oto nhất trong năm nay.

SET GLOBAL log_bin_trust_function_creators = 1;
    DELIMITER $$ 
CREATE FUNCTION best_maker () RETURNS VARCHAR(100)
BEGIN
	DECLARE maker VARCHAR(100);
	SELECT c.Maker 
    INTO maker
	FROM Car_order co
	INNER JOIN Car c
		ON co.Car_id = c.Car_id AND Staus = "1"
	GROUP BY c.Maker 
	ORDER BY SUM(co.Amount) DESC
	LIMIT 1;
	RETURN  maker;
END$$
	DELIMITER ;

    

-- 4. Viết 1 thủ tục (không có parameter) để xóa các đơn hàng đã bị hủy của
-- những năm trước. In ra số lượng bản ghi đã bị xóa.

DROP PROCEDURE IF EXISTS Delete_order_cancel;
DELIMITER $$
CREATE PROCEDURE Delete_order_cancel()
BEGIN
DELETE 
FROM Car_order
WHERE Staus = '2' AND YEAR(Order_date) < YEAR(NOW());


DROP TABLE IF EXISTS order_cancel;
CREATE TABLE order_cancel
(
  ID 				INT PRIMARY KEY AUTO_INCREMENT,
  car_order_id	 	INT
  );

INSERT INTO order_cancel(car_order_id)
SELECT car_order_id
FROM Car_order
WHERE Staus = '2' AND YEAR(Order_date) < YEAR(NOW());

SELECT COUNT(oc.car_order_id) 
FROM order_cancel oc
INNER JOIN Car_order co
 ON oc.car_order_id = co.car_order_id;

DROP TABLE IF EXISTS order_cancel;
END$$
DELIMITER ;




-- 5. Viết 1 thủ tục (có CustomerID parameter) để in ra thông tin của các đơn
-- hàng đã đặt hàng bao gồm: tên của khách hàng, mã đơn hàng, số lượng oto
-- và tên hãng sản xuất.

DELIMITER $$ 
DROP FUNCTION IF EXISTS order_infor;
CREATE PROCEDURE order_infor (IN Customerid TINYINT)
			BEGIN
SELECT cu.Customer_id, cu.Customer_name, co.car_order_id, co.Amount, c.Maker
FROM Car c
INNER JOIN Car_order co
	ON c.Car_id = co.Car_id AND co.Staus = "1"
INNER JOIN Customer cu 
	ON cu.Customer_id = co.Customer_id AND co.Staus = "1";
END$$
DELIMITER ;



SELECT cu.Customer_id, cu.Customer_name, co.car_order_id, co.Amount, c.Maker
FROM Car c
INNER JOIN Car_order co
	ON c.Car_id = co.Car_id AND co.Staus = "1"
INNER JOIN Customer cu 
	ON cu.Customer_id = co.Customer_id AND co.Staus = "1";

