INSERT INTO Customer(Customer_name, Phone, Email, Address, Note)
VALUES
						('Le Cong Nhan'		,'0964782345','lenhanhut@gmail.com','Bac Ninh', NULL),
						('Le Thanh Tuyen'	,'0978234888','thanhtuyen@gmail.com','Bac Ninh', NULL),
						('Luu Van Thanh'	,'0973578868','luuvanthanh@gmail.com','Ha Noi', NULL),
						('Tran Cong Phan'	,'0932534888','trancongphan@gmail.com','Bac Giang', NULL),
						('le Ba Tung'		,'0989354868','tungle@gmail.com','Nam Dinh', NULL);
						
INSERT INTO Car(Maker, Model, `Year`, Color, Note)
VALUES 					
						('Nissan','A','2000','black', NULL),
						('Honda','B', '2010','white', NULL),
						('Honda','C', '2010','red', NULL),
						('Toyota','D', '2011','yellow', NULL),
						('Nissan','E', '2012','green', NULL);

INSERT INTO Car_order(Customer_id, Car_id, Amount, Sale_price, Order_date, Delivery_date, Delivery_address, Staus, Note)
VALUES 				('2', '2','1', '200','2020-03-05','2020-04-05','BN','0',NULL),
					('1', '3','2', '700','2020-03-05','2020-04-05','HN','1',NULL),
                    ('3', '4','1', '400','2020-03-07','2020-04-07','HN','2',NULL),
                    ('2', '4','1', '400','2020-03-08','2020-04-08','BG','2',NULL),
                    ('4', '5','1', '500','2020-03-10','2020-04-10','HN','1',NULL),
                    ('1', '2','1', '200','2020-05-10','2020-06-10','HN','1',NULL);

