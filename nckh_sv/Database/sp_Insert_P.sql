USE [ql_da_nckh]
GO
/****** Object:  StoredProcedure [dbo].[ThemProject]    Script Date: 06/03/2024 6:47:17 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[ThemProject]
    @title nvarchar(100),
    @departmentid int,
    @advisorid int, 
    @startdate datetime,
    @enddate datetime,
    @FilePath nvarchar(1000),
    @grade int,
    @version nvarchar(50),
	@typeproject int
AS  
BEGIN
    -- Biến tạm thời để lưu trữ nội dung từ tệp tin
    DECLARE @FileContent varbinary(MAX);
    
    -- Biến lưu trữ câu lệnh dynamic SQL
    DECLARE @OpenRowsetCommand NVARCHAR(MAX);

    -- Tạo câu lệnh dynamic SQL
    SET @OpenRowsetCommand = 'SELECT @FileContent = BulkColumn FROM OPENROWSET(BULK ''' + @FilePath + ''', SINGLE_BLOB) AS FileContent';

    -- Thực thi câu lệnh dynamic SQL
    EXEC sp_executesql @OpenRowsetCommand, N'@FileContent varbinary(MAX) OUTPUT', @FileContent OUTPUT;

    -- Thêm dự án vào bảng projects
    INSERT INTO projects (title, departmentid, advisorid, startdate, enddate, projectcontent, grade, versionname,typeproject)
    VALUES (@title, @departmentid, @advisorid, @startdate, @enddate, @FileContent, @grade, '0',@typeproject);

    -- Kiểm tra số dòng bị ảnh hưởng và trả về kết quả
    DECLARE @ProjectId INT;
    IF @@ROWCOUNT > 0 
    BEGIN 
		SELECT @ProjectId = (SELECT TOP 1 projectid FROM projects ORDER BY projectid DESC)
    END
    ELSE 
    BEGIN 
        SELECT -1;
    END;
END;
