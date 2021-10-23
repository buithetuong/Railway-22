DROP DATABASE IF EXISTS rdbms;
CREATE DATABASE rdbms;
USE rdbms;


DROP TABLE IF EXISTS
	Customer,
	Car,
    Car_order;
    
CREATE TABLE Customer
(
	Customer_id 		TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	Customer_name 	 	VARCHAR(100) NOT NULL,
    Phone				INT  NOT NULL,
    Email				VARCHAR (50) NOT NULL,
    Address				VARCHAR (200),
    Note				TEXT
);

CREATE TABLE Car
(
	Car_id 				TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Maker 				ENUM('Honda', 'Toyota', 'Nissan'),
    Model 				VARCHAR (50) NOT NULL,
    `Year`				YEAR,
    Color				VARCHAR(20),
    Note				TEXT
);

CREATE TABLE Car_order
(
	car_order_id			TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	Customer_id			TINYINT UNSIGNED,
    Car_id 				TINYINT UNSIGNED,
    Amount				INT DEFAULT 1,
    Sale_price			INT,
    Order_date			DATE,
    Delivery_date		DATE,
    Delivery_address	VARCHAR (200),
    Staus				ENUM('0','1','2') DEFAULT '0',
	Note				TEXT,
    
    FOREIGN KEY(Customer_id) REFERENCES Customer(Customer_id),
    FOREIGN KEY(Car_id) REFERENCES Car(Car_id)
);

