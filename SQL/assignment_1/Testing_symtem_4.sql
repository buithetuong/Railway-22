-- Question 1: Viết lệnh để lấy ra danh sách nhân viên và thông tin phòng ban của họ
SELECT 		a.fullname, d.department_name
FROM 		departments d
INNER JOIN `accounts` a
	ON 		d.department_id = a.department_id;
    
    

-- Question 2: Viết lệnh để lấy ra thông tin các account được tạo sau ngày 20/12/2010
SELECT 		*
FROM 		`accounts`
WHERE 		create_date > '2010-12-20';



-- Question 3: Viết lệnh để lấy ra tất cả các 'Giao vien chu nhiem'
SELECT 			a.username
FROM 			`accounts` a
INNER JOIN 		positions p
	ON		 	a.position_id = p.position_id
WHERE 			p.position_id = 1;




-- Question 4: Viết lệnh để lấy ra danh sách các phòng ban có >1 nhân viên
SELECT 		d.department_name
FROM 		departments d
INNER JOIN 	`accounts` a
	  ON  	d.department_id = a.department_id
GROUP BY 	a.department_id
HAVING		 COUNT(a.department_id)>1;



-- Question 5: Viết lệnh để lấy ra danh sách câu hỏi được sử dụng trong đề thi nhiều nhất
SELECT 		q.content, COUNT(eq.question_id)
FROM 		questions q
LEFT JOIN 	exam_questions eq
   ON 		q.question_id = eq.question_id
GROUP BY 	eq.question_id
HAVING  	COUNT(eq.question_id) = 
(
	SELECT COUNT(question_id) 
	FROM exam_questions 	
	GROUP BY question_id
	ORDER BY COUNT(question_id) DESC
	LIMIT 1
);



-- Question 6: Thông kê mỗi category Question được sử dụng trong bao nhiêu Question
SELECT 		cq.category_name, COUNT(q.category_id)
FROM 		category_questions cq
LEFT JOIN 	questions q
  ON 		cq.category_id = q.category_id
GROUP BY 	q.category_id;



-- Question 7: Thông kê mỗi Question được sử dụng trong bao nhiêu Exam
SELECT 		q.content, COUNT(eq.question_id)
FROM 		questions q
LEFT JOIN 	exam_questions eq
 ON 		q.question_id = eq.question_id
GROUP BY 	eq.question_id;
 
 
-- Question 8: Lấy ra Question có nhiều câu trả lời nhất
SELECT 		q.content, COUNT(a.question_id)
FROM 		questions q
LEFT JOIN 	answers a
	ON 		q.question_id = a.question_id
GROUP BY 	a.question_id
HAVING 		COUNT(a.question_id) = 
(
	SELECT 	COUNT(question_id)
	FROM 	answers
	GROUP BY question_id
	ORDER BY COUNT(question_id) DESC 
	LIMIT 1
);



-- Question 9: Thống kê số lượng account trong mỗi group
SELECT 		group_name, COUNT(ga.group_id)
FROM 		`groups` g
LEFT JOIN	`group_accounts` ga
	ON 		g.group_id = ga.group_id
GROUP BY 	g.group_id
ORDER BY 	COUNT(ga.group_id);

-- Question 10: Tìm chức vụ có ít người nhất
SELECT 		p.position_name, COUNT(a.position_id) so_luong_nhan_vien
FROM 		positions p
LEFT JOIN 	`accounts` a
	ON 		p.position_id = a.position_id
GROUP BY 	a.position_id
HAVING 		COUNT(a.position_id) =
(
	SELECT	 COUNT(position_id)
	FROM 	`accounts`
	GROUP BY position_id
	ORDER BY position_id
	LIMIT 1
);
  
  
  
  -- Question 11: Thống kê mỗi phòng ban có bao nhiêu dev, test, scrum master, PM
 DROP VIEW IF EXISTS cross_dept_posi;
 CREATE VIEW cross_dept_posi AS
	SELECT 	d.department_id, 
			p.position_id
    FROM	departments d
    CROSS JOIN positions p
    WHERE
			p.position_name IN ('Giao vien chu nhiem','Giao vien bo mon','Giao vien hop dong', 'Giao vien chinh thuc')
    ORDER BY d.department_id , p.position_id;
    
SELECT * FROM 	cross_dept_posi;
DROP VIEW IF EXISTS T2;
CREATE VIEW T2 AS
	SELECT 
        d.department_id,
		p.position_id,
		COUNT(a.account_id) AS number_of_account
    FROM
        positions p
    LEFT JOIN `accounts` a ON p.position_id = a.position_id
    RIGHT JOIN departments d ON a.department_id = d.department_id
    WHERE
				p.position_name IN ('Giao vien chu nhiem','Giao vien bo mon','Giao vien hop dong', 'Giao vien chinh thuc')
    GROUP BY 	d.department_id , p.position_id;
    
SELECT * FROM T2;

SELECT 
    t1.department_id,
    t1.position_id,
    IF((t2.number_of_account IS NULL),0,t2.number_of_account) AS number_of_account
FROM
    (SELECT * FROM cross_dept_posi) AS t1
        LEFT JOIN
    (SELECT * FROM T2) AS t2 ON t1.department_id = t2.department_id
        AND t1.position_id = t2.position_id
GROUP BY t1.department_id , t1.position_id
ORDER BY t1.department_id , t1.position_id;
     
-- Question 12: Lấy thông tin chi tiết của câu hỏi bao gồm: thông tin cơ bản của question, loại câu hỏi, ai là người tạo ra câu hỏi, câu trả lời là gì, ...
-- Question 13: Lấy ra số lượng câu hỏi của mỗi loại tự luận hay trắc nghiệm
SELECT		t.type_name, COUNT(q.type_id)
FROM 		type_questions t
LEFT JOIN 	questions q
  ON		t.type_id = q.type_id
GROUP BY	q.type_id
ORDER BY 	COUNT(q.type_id);


-- Question 14:Lấy ra group không có account nào
SELECT 		g.group_name
FROM 		`groups` g
LEFT JOIN 	`group_accounts` ga
	ON 		g.group_id = ga.group_id
WHERE 		ga.group_id IS NULL;



-- Question 16: Lấy ra question không có answer nào\
SELECT 		q.content
FROM 		questions q
LEFT JOIN 	answers a
	ON 		q.question_id = a.question_id
WHERE 		a.question_id IS NULL;

-- Question 17:
-- a) Lấy các account thuộc nhóm thứ 1

SELECT * 
FROM `accounts` a 
INNER JOIN `group_accounts` ga
	ON a.account_id = ga.account_id
WHERE ga.group_id = 1;


-- b) Lấy các account thuộc nhóm thứ 2
SELECT * 
FROM `accounts` a 
INNER JOIN `group_accounts` ga
	ON a.account_id = ga.account_id
WHERE ga.group_id = 2;


-- c) Ghép 2 kết quả từ câu a) và câu b) sao cho không có record nào trùng nhau
SELECT * 
FROM `accounts` a 
INNER JOIN `group_accounts` ga
	ON a.account_id = ga.account_id
WHERE ga.group_id = 1
UNION
SELECT * 
FROM `accounts` a 
INNER JOIN `group_accounts` ga
	ON a.account_id = ga.account_id
WHERE ga.group_id = 2;


-- Question 18:
-- a) Lấy các group có lớn hơn 1 thành viên
SELECT *
FROM `groups` g
LEFT JOIN `group_accounts` ga
	ON g.group_id = ga.group_id
GROUP BY g.group_id
HAVING COUNT(g.group_id) > 1;

-- b) Lấy các group có nhỏ hơn 3 thành viên
SELECT *
FROM `groups` g
LEFT JOIN `group_accounts` ga
	ON g.group_id = ga.group_id
GROUP BY g.group_id
HAVING COUNT(g.group_id) < 3;

-- c) Ghép 2 kết quả từ câu a) và câu b)
SELECT *,COUNT(g.group_id)
FROM `groups` g
LEFT JOIN `group_accounts` ga
	ON g.group_id = ga.group_id
GROUP BY g.group_id
HAVING COUNT(g.group_id) > 1
UNION  
SELECT *, COUNT(g.group_id)
FROM `groups` g
LEFT JOIN `group_accounts` ga
	ON g.group_id = ga.group_id
GROUP BY g.group_id
HAVING COUNT(g.group_id) < 3;


