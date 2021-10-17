-- Question 1: Thêm ít nhất 10 record vào mỗi table


-- Question 2: lấy ra tất cả các phòng ban
SELECT		 *
FROM		 departments;


-- Question 3: lấy ra id của phòng ban "Giao vien Van"
SELECT	 	department_id
FROM 		departments
WHERE 		department_name = 'Giao vien Van';


-- Question 4: lấy ra thông tin account có full name dài nhất
-- Cách 1 
SELECT 		*
FROM 		`accounts`
WHERE 		LENGTH(fullname) = (SELECT MAX(LENGTH(fullname))
FROM 		`accounts`)
ORDER BY 	fullname;
-- Cách 2 
SELECT *, LENGTH(fullname)
FROM 		`accounts`
GROUP BY 	fullname
ORDER BY 	LENGTH(fullname) DESC 
LIMIT 		1; 


-- Question 5: Lấy ra thông tin account có full name dài nhất và thuộc phòng ban có id= 3
SELECT *
FROM 		`accounts`
GROUP BY 	fullname
HAVING 		department_id = 3
ORDER BY 	LENGTH(fullname) DESC 
LIMIT 		1; 


-- Question 6: Lấy ra tên group đã tham gia trước ngày 20/12/2019
SELECT 		group_name
FROM 		`groups`
WHERE 		create_date< '2019-12-20';



-- Question 7: Lấy ra ID của question có >= 3 câu trả lời
SELECT 		question_id
FROM 		answers
GROUP BY 	question_id
HAVING 		COUNT(question_id) >= 3;


-- Question 8: Lấy ra các mã đề thi có thời gian thi >= 60 phút và được tạo trước ngày 20/12/2019
SELECT 		`code`
FROM 		exams
WHERE 		duration >=60 AND createdate < '2019/12/20';


-- Question 9: Lấy ra 5 group được tạo gần đây nhất
SELECT 		group_name
FROM 		`groups`
ORDER BY    create_date DESC
LIMIT 		5;

-- Question 10: Đếm số nhân viên thuộc department có id = 2
SELECT COUNT(department_id)
FROM 		`accounts`
GROUP BY 	department_id
HAVING 		department_id = 2;
-- Question 11: Lấy ra nhân viên có tên bắt đầu bằng chữ "D" và kết thúc bằng chữ "g"
SELECT 		fullname
FROM 		`accounts`
WHERE 		fullname LIKE 'D%g';

-- Question 12: Xóa tất cả các exam được tạo trước ngày 20/12/2019
DELETE 		
FROM 		exam_questions
WHERE 		exam_id IN  (SELECT exam_id FROM exams WHERE createdate < '2019/12/20');
DELETE 
FROM 		exams
WHERE 		createdate < '2019/12/20';

-- Question 13: Xóa tất cả các question có nội dung bắt đầu bằng từ "Cau hoi T
DELETE 
FROM 		answers
WHERE 		question_id IN (SELECT question_id FROM questions WHERE content LIKE 'Cau hoi T%');

DELETE 
FROM 		exam_questions
WHERE 		question_id IN (SELECT question_id FROM questions WHERE content LIKE 'Cau hoi T%');

DELETE 
FROM 		questions
WHERE 		content LIKE 'Cau hoi T%';
-- Question 14: Update thông tin của account có id = 5 thành tên "Nguyễn Bá Lộc" và email thành loc.nguyenba@vti.com.vn

UPDATE 		`accounts`
SET 		email = 'loc.nguyenba@vti.com.vn',
			fullname = 'Nguyễn Bá Lộc'
WHERE 		account_id = 5;
    

-- Question 15: update account có id = 5 sẽ thuộc group có id = 4

UPDATE  	`group_accounts`
SET 		group_id = 4
WHERE 		account_id = 5;
