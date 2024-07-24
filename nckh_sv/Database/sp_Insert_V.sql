
CREATE PROCEDURE Them_v
    @projectid int,
	@versionname nvarchar(50),
    @description nvarchar(100),
    @FilePath nvarchar(1000)
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
    INSERT INTO projectversions (projectid, versionname, description, projectnew)
    VALUES (@projectid,@versionname,@description,@FileContent);

    IF @@ROWCOUNT > 0 BEGIN RETURN 1 END
	ELSE BEGIN RETURN 0 END;
END;
