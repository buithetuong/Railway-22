INSERT INTO departments(department_name)
VALUES
						('Giao vien Toan'),
						('Giao vien Van'),
						('Giao vien Anh'),
						('Giao vien Ly'),
						('Giao vien Hoa'),
						('Giao vien Sinh'),
						('Giao vien Su'),
						('Giao vien Đia'),
						('Giao vien GDCD'),
						('Giao vien The Duc');

INSERT INTO positions(position_name) 
VALUES 					
						('Giao vien chu nhiem'),
						('Giao vien bo mon'),
						('Giao vien hop dong'),
						('Giao vien chinh thuc'); 

INSERT INTO `accounts`(email							, username			, fullname				, department_id	, 		position_id, 		create_date)
VALUES 				('luuvanthanh@gmail.com'		, 'thanhthieugia'	,'Luu Van Thanh'			,   '2'				,   '2'				,'2020-03-05'),
					('tungle@gmail.com'				, 'tungdi'			,'le Ba Tung'				,   '7'				,   '1'				,'2020-03-05'),
                    ('lenhan@gmail.com'				, 'lenhanhut'		,'Le Cong Nhan'				,   '4'				,   '2'				,'2020-03-07'),
                    ('trancongphan@gmail.com'		, 'phantran'		,'Tran Cong Phan'			,   '8'				,   '4'				,'2020-03-08'),
                    ('tuyenlethanh@gmail.com'		, 'thanhtuyena3'	,'Le Thanh Tuyen'			,   '1'				,   '1'				,'2020-03-10'),
                    ('thiennguyenxuan@gmail.com'	, 'thienronaldo'	,'Nguyen Xuan Thien'		,   '6'				,   '2'				,'2020-04-05'),
                    ('huesoo@gmail.com'				, 'huelt'			,'Luu Thi Hue'				,   '1'				,   '3'				, '2020-04-05'),
                    ('trantuan@gmail.com'			, 'trangden'		,'Nguyen Thi Trang'			,   '5'				,   '3'				,'2020-04-07'),
                    ('tuyennguyen@gmail.com'		, 'tuyentinh'		,'Nguyen Thi Tuyen'			,   '3'				,   '3'				,'2020-04-07'),
                    ('docongdong@gmail.com'			, 'dongngoi'		,'Do Cong Dong'				,   '5'				,   '4'				,'2020-04-09');

INSERT INTO `groups`	( group_name	, creator_id		, create_date)
VALUES 				('Khoi A0'			,  	5			,'2019-03-05'),
					('Khoi A1'			,   3			,'2020-03-07'),
                    ('Khoi A2'			,   6			,'2020-03-09'),
                    ('Khoi A3'			,   2			,'2020-03-10'),
                    ('Khoi B0'			,   8			,'2020-03-28'),
                    ('Khoi B1'			,   6			,'2020-04-06'),
                    ('Khoi B2'			,   7			,'2020-04-07'),
                    ('Khoi B3'			,   1			,'2020-04-08'),
                    ('Khoi C0'			,   4			,'2020-04-09'),
                    ('Khoi C1'			,   1			,'2020-04-10'),
					('Khoi C2'			,   10			,'2020-04-10'),
					('Khoi C3'			,   2			,'2020-04-10');
                    
INSERT INTO `group_accounts`	(  group_id	, account_id	, join_date	 )
VALUES 							(	2		,    9		,'2019-03-05'),
								(	3		,    3		,'2020-03-07'),
								(	5		,    5		,'2020-03-09'),
								(	1		,    8		,'2020-03-10'),
								(	1		,    10		,'2020-03-28'),
								(	8		,    1		,'2020-04-06'),
								(	4		,    2		,'2020-04-07'),
								(	7		,    4		,'2020-04-08'),
								(	2		,    7		,'2020-04-09'),
								(	3		,    6		,'2020-04-10');

INSERT INTO type_questions (type_name			) 
VALUES 						('essay'			), 
							('multiple_choice'	); 

INSERT INTO category_questions (category_name)
VALUES 								('Toan'		),
									('Ly'		),
									('Hoa'		),
									('Sinh'		),
									('Su'		),
									('Dia'		),
									('Van'		),
									('Anh'		),
									('The Duc'	),
									('GDCD'		);


INSERT INTO questions	(content			, category_id, type_id		, creator_id	, create_date )
VALUES 					('Cau hoi Ly'		,	2		,   '2'			,   '3'		,'2020-04-05'),
						('Cau hoi Hoa'		,	1		,   '2'			,   '8'		,'2020-04-05'),
						('Cau hoi Toan'		,	1		,   '2'			,   '7'		,'2020-04-06'),
						('Cau hoi Van'		,	7		,   '1'			,   '1'		,'2020-04-06'),
						('Cau hoi Anh'		,	8		,   '2'			,   '9'		,'2020-04-06'),
						('Cau hoi Sinh'		,	1		,   '2'			,   '6'		,'2020-04-06'),
						('Cau hoi Su'		,	5		,   '1'			,   '2'		,'2020-04-06'),
						('Cau hoi Dia'		,	6		,   '1'			,   '4'		,'2020-04-07'),
						('Cau hoi The Duc'	,	9		,   '1'			,   '6'		,'2020-04-07'),
						('Cau hoi GDCD'		,	10		,   '2'			,   '7'		,'2020-04-07');


INSERT INTO answers	(  content		, question_id	, iscorrect	)
VALUES 				('Cau tra loi 1'	,   1			,	0		),
					('Cau tra loi 2'	,   2			,	1		),
                    ('Cau tra loi 3'	,   5			,	0		),
                    ('Cau tra loi 4'	,   3			,	1		),
                    ('Cau tra loi 5'	,   1			,	1		),
                    ('Cau tra loi 6'	,   8			,	0		),
                    ('Cau tra loi 7'	,   6			,	1		),
                    ('Cau tra loi 8'	,   1			,	1		),
                    ('Cau tra loi 9'	,   3			,	1		),
                    ('Cau tra loi 10'	,   3			,	1		);

INSERT INTO exams	(`code`			, title					, category_id	, duration	, creator_id	, createdate )
VALUES 				('12a301'		,'De thi Toan'			,	1			,	150		,   '7'			,'2019-04-05'),
					('12a302'		,'De thi Ly'			,	2			,	60		,   '3'			,'2019-04-05'),
                    ('12a303'		,'De thi Van'			,	7			,	150		,   '1'			,'2019-04-07'),
                    ('12a304'		,'De thi Su'			,	5			,	45		,   '2'			,'2020-04-08'),
                    ('12a305'		,'De thi Dia'			,	6			,	45		,   '4'			,'2020-04-10'),
                    ('12a306'		,'De thi Sinh'			,	4			,	60		,   '6'			,'2020-04-05'),
                    ('12a307'		,'De thi Hoa'			,	3			,	60		,   '8'			,'2020-04-05'),
                    ('12a308'		,'De thi Anh'			,	8			,	90		,   '9'			,'2020-04-07'),
                    ('12a309'		,'De thi The Duc'		,	9			,	60		,   '6'			,'2020-04-07'),
                    ('12a310'		,'De thi GDCD'			,	10			,	45		,   '7'			,'2020-04-08');
                    
INSERT INTO exam_questions(exam_id	, question_id) 
VALUES 					(	1	,		3		),
						(	2	,		1		), 
						(	3	,		4		), 
						(	4	,		7		), 
						(	5	,		8		), 
						(	6	,		6		), 
						(	7	,		3		), 
						(	8	,		5		), 
						(	9	,		3		), 
						(	10	,		10		); 