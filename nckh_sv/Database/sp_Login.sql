USE [ql_da_nckh]
GO
/****** Object:  StoredProcedure [dbo].[sp_UserLogin]    Script Date: 28/02/2024 6:41:36 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[sp_UserLogin]
    @Username NVARCHAR(50),
    @Password VARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @userid INT;

    -- Kiểm tra xem thông tin đăng nhập có chính xác hay không

	SELECT @userid=userid
	FROM users
	WHERE username COLLATE Latin1_General_CS_AS = @Username 
	  AND password COLLATE Latin1_General_CS_AS = @Password;
    -- Trả về kết quả
    IF @userid IS NOT NULL
    BEGIN
        -- Trả về toàn bộ thông tin người dùng
        SELECT * FROM users WHERE userid = @userid
    END
END;