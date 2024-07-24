
CREATE PROCEDURE Update_P
	@projectid int,
	@title nvarchar(100),
    @departmentid int,
    @advisorid int, 
    @startdate datetime,
    @enddate datetime,
    @grade int
AS  
BEGIN
	UPDATE projects SET title=@title,
						departmentid = @departmentid,
						advisorid = @advisorid,
						startdate = @startdate,
						enddate = @enddate,
						grade = @grade
					WHERE projectid = @projectid
	IF @@ROWCOUNT > 0 BEGIN RETURN 1 END
	ELSE BEGIN RETURN 0 END;
END