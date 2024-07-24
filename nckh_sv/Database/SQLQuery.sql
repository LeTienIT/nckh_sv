
insert into advisors values ('GV 1', 1)
insert into projects values
('one',1,1,'2024-02-03','2024-02-03',0x0123456789ABCDEF,0,'0')

select * from projects

DROP PROCEDURE [ThemProject]
DROP PROCEDURE [ThemProject]
SELECT TOP 1 studentid FROM students ORDER BY studentid DESC

ThemProject N'test ss',1,1,'2024-02-03',
'2024-02-03',N'C:\Users\Admin\Desktop\Ngan_Hang_Cau_Hoi\Buoi_online_29_12_2023.docx',1,N'1'

SELECT ps.projectparticipantid, s.studentid,s.studentname,d.departmentname,s.major,s.email,
CASE 
    WHEN ps.leader = 1 THEN 'Leader'
    ELSE 'Member'
END AS leader
from students s
JOIN projectparticipants ps ON ps.studentid = s.studentid
JOIN departments d ON s.departmentid = d.departmentid 
WHERE ps.projectid = 3

SELECT *--projectcontent 
FROM projects 
WHERE projectid = 3

UPDATE projects SET typeproject = 0
DECLARE @OriginalHash varbinary(64);
DECLARE @SavedHash varbinary(64);
DECLARE @FilePath nvarchar(1000) = N'C:\Users\Admin\Desktop\Ngan_Hang_Cau_Hoi\Buoi_online_29_12_2023.docx';
SELECT (SELECT TOP 1 projectid FROM projects ORDER BY projectid DESC)


ThemSV N'Thanh', N'CNTT', N'no', 1 

select * from students

INSERT INTO projectparticipants VALUES(1,3,)

SELECT TOP 1 projectid FROM projects ORDER BY projectid DESC; 

select * from projectparticipants p
join students s ON s.studentid =1
where p.projectid = 3 and p.studentid = 1

SELECT versionid,versionname,description,
	   datecreate 
FROM projectversions 
WHERE projectid = 3

SELECT a.advisorid,a.advisorname,d.departmentname FROM advisors a
JOIN departments d ON d.departmentid = a.departmentid

INSERT INTO activitylog VALUES(1,N'CREATE',getdate(),N'Thêm tài khoản')
SELECT * FROM activitylog

select * from users

ALTER TABLE activitylog
ALTER COLUMN details NVARCHAR(MAX);

