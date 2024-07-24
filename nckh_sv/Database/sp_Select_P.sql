
CREATE PROCEDURE [dbo].[SelectProject]  
AS  
BEGIN
	SELECT projects.projectid,title,departments.departmentname as Khoa,advisors.advisorname as gv
	,grade
	FROM projects
	JOIN departments ON departments.departmentid = projects.departmentid
	JOIN advisors ON advisors.advisorid = projects.advisorid 
END