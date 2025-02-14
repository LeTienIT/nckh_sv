USE [master]
GO
/****** Object:  Database [ql_da_nckh]    Script Date: 03/04/2024 7:38:41 CH ******/
CREATE DATABASE [ql_da_nckh]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ql_da_nckh', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER01\MSSQL\DATA\ql_da_nckh.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ql_da_nckh_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER01\MSSQL\DATA\ql_da_nckh_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ql_da_nckh] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ql_da_nckh].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ql_da_nckh] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ql_da_nckh] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ql_da_nckh] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ql_da_nckh] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ql_da_nckh] SET ARITHABORT OFF 
GO
ALTER DATABASE [ql_da_nckh] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ql_da_nckh] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ql_da_nckh] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ql_da_nckh] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ql_da_nckh] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ql_da_nckh] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ql_da_nckh] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ql_da_nckh] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ql_da_nckh] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ql_da_nckh] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ql_da_nckh] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ql_da_nckh] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ql_da_nckh] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ql_da_nckh] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ql_da_nckh] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ql_da_nckh] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ql_da_nckh] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ql_da_nckh] SET RECOVERY FULL 
GO
ALTER DATABASE [ql_da_nckh] SET  MULTI_USER 
GO
ALTER DATABASE [ql_da_nckh] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ql_da_nckh] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ql_da_nckh] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ql_da_nckh] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ql_da_nckh] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ql_da_nckh] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ql_da_nckh', N'ON'
GO
ALTER DATABASE [ql_da_nckh] SET QUERY_STORE = OFF
GO
USE [ql_da_nckh]
GO
/****** Object:  Table [dbo].[activitylog]    Script Date: 03/04/2024 7:38:41 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[activitylog](
	[logid] [int] IDENTITY(1,1) NOT NULL,
	[userid] [int] NULL,
	[type] [nvarchar](50) NULL,
	[logtime] [datetime] NULL,
	[details] [nvarchar](max) NULL,
 CONSTRAINT [PK_activitylog] PRIMARY KEY CLUSTERED 
(
	[logid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[advisors]    Script Date: 03/04/2024 7:38:41 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[advisors](
	[advisorid] [int] IDENTITY(1,1) NOT NULL,
	[advisorname] [nvarchar](50) NULL,
	[departmentid] [int] NULL,
 CONSTRAINT [PK_advisors] PRIMARY KEY CLUSTERED 
(
	[advisorid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[departments]    Script Date: 03/04/2024 7:38:41 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[departments](
	[departmentid] [int] IDENTITY(1,1) NOT NULL,
	[departmentname] [nvarchar](50) NULL,
 CONSTRAINT [PK_departments] PRIMARY KEY CLUSTERED 
(
	[departmentid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[projectparticipants]    Script Date: 03/04/2024 7:38:41 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[projectparticipants](
	[projectparticipantid] [int] IDENTITY(1,1) NOT NULL,
	[studentid] [int] NULL,
	[projectid] [int] NULL,
	[leader] [int] NULL,
 CONSTRAINT [PK_projectparticipants] PRIMARY KEY CLUSTERED 
(
	[projectparticipantid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[projects]    Script Date: 03/04/2024 7:38:41 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[projects](
	[projectid] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](100) NULL,
	[departmentid] [int] NULL,
	[advisorid] [int] NULL,
	[startdate] [datetime] NULL,
	[enddate] [datetime] NULL,
	[projectcontent] [varbinary](max) NULL,
	[grade] [int] NULL,
	[versionname] [nvarchar](50) NULL,
	[typeproject] [int] NULL,
 CONSTRAINT [PK_projects] PRIMARY KEY CLUSTERED 
(
	[projectid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[projectversions]    Script Date: 03/04/2024 7:38:41 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[projectversions](
	[versionid] [int] IDENTITY(1,1) NOT NULL,
	[projectid] [int] NULL,
	[versionname] [nvarchar](50) NULL,
	[description] [nvarchar](100) NULL,
	[projectnew] [varbinary](max) NULL,
	[datecreate] [datetime] NULL,
 CONSTRAINT [PK_projectversions] PRIMARY KEY CLUSTERED 
(
	[versionid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[students]    Script Date: 03/04/2024 7:38:41 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[students](
	[studentid] [int] IDENTITY(1,1) NOT NULL,
	[studentname] [nvarchar](50) NULL,
	[major] [nvarchar](50) NULL,
	[email] [varchar](50) NULL,
	[departmentid] [int] NULL,
 CONSTRAINT [PK_students] PRIMARY KEY CLUSTERED 
(
	[studentid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 03/04/2024 7:38:41 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[userid] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](50) NULL,
	[fullname] [nvarchar](100) NULL,
	[email] [nvarchar](100) NULL,
	[address] [nvarchar](100) NULL,
	[phone] [varchar](10) NULL,
	[password] [varchar](10) NULL,
	[role] [int] NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[userid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[activitylog] ADD  CONSTRAINT [DF_activitylog_logtime]  DEFAULT (getdate()) FOR [logtime]
GO
ALTER TABLE [dbo].[projects] ADD  CONSTRAINT [DF_projects_startdate]  DEFAULT (getdate()) FOR [startdate]
GO
ALTER TABLE [dbo].[projectversions] ADD  CONSTRAINT [DF_projectversions_datecreate]  DEFAULT (getdate()) FOR [datecreate]
GO
ALTER TABLE [dbo].[activitylog]  WITH CHECK ADD  CONSTRAINT [FK_activitylog_users] FOREIGN KEY([userid])
REFERENCES [dbo].[users] ([userid])
GO
ALTER TABLE [dbo].[activitylog] CHECK CONSTRAINT [FK_activitylog_users]
GO
ALTER TABLE [dbo].[advisors]  WITH CHECK ADD  CONSTRAINT [FK_advisors_departments] FOREIGN KEY([departmentid])
REFERENCES [dbo].[departments] ([departmentid])
GO
ALTER TABLE [dbo].[advisors] CHECK CONSTRAINT [FK_advisors_departments]
GO
ALTER TABLE [dbo].[projectparticipants]  WITH CHECK ADD  CONSTRAINT [FK_projectparticipants_projects] FOREIGN KEY([projectid])
REFERENCES [dbo].[projects] ([projectid])
GO
ALTER TABLE [dbo].[projectparticipants] CHECK CONSTRAINT [FK_projectparticipants_projects]
GO
ALTER TABLE [dbo].[projectparticipants]  WITH CHECK ADD  CONSTRAINT [FK_projectparticipants_students] FOREIGN KEY([studentid])
REFERENCES [dbo].[students] ([studentid])
GO
ALTER TABLE [dbo].[projectparticipants] CHECK CONSTRAINT [FK_projectparticipants_students]
GO
ALTER TABLE [dbo].[projects]  WITH CHECK ADD  CONSTRAINT [FK_projects_advisors] FOREIGN KEY([advisorid])
REFERENCES [dbo].[advisors] ([advisorid])
GO
ALTER TABLE [dbo].[projects] CHECK CONSTRAINT [FK_projects_advisors]
GO
ALTER TABLE [dbo].[projects]  WITH CHECK ADD  CONSTRAINT [FK_projects_departments] FOREIGN KEY([departmentid])
REFERENCES [dbo].[departments] ([departmentid])
GO
ALTER TABLE [dbo].[projects] CHECK CONSTRAINT [FK_projects_departments]
GO
ALTER TABLE [dbo].[projectversions]  WITH CHECK ADD  CONSTRAINT [FK_projectversions_projects] FOREIGN KEY([projectid])
REFERENCES [dbo].[projects] ([projectid])
GO
ALTER TABLE [dbo].[projectversions] CHECK CONSTRAINT [FK_projectversions_projects]
GO
ALTER TABLE [dbo].[students]  WITH CHECK ADD  CONSTRAINT [FK_students_departments] FOREIGN KEY([departmentid])
REFERENCES [dbo].[departments] ([departmentid])
GO
ALTER TABLE [dbo].[students] CHECK CONSTRAINT [FK_students_departments]
GO
/****** Object:  StoredProcedure [dbo].[SelectProject]    Script Date: 03/04/2024 7:38:41 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SelectProject]  
AS  
BEGIN
	SELECT projects.projectid,title,departments.departmentname as Khoa,advisors.advisorname as gv
	,grade
	FROM projects
	JOIN departments ON departments.departmentid = projects.departmentid
	JOIN advisors ON advisors.advisorid = projects.advisorid
END
GO
/****** Object:  StoredProcedure [dbo].[sp_UserLogin]    Script Date: 03/04/2024 7:38:41 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_UserLogin]
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
GO
/****** Object:  StoredProcedure [dbo].[Them_v]    Script Date: 03/04/2024 7:38:41 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Them_v]
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
GO
/****** Object:  StoredProcedure [dbo].[ThemProject]    Script Date: 03/04/2024 7:38:41 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ThemProject]
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
GO
/****** Object:  StoredProcedure [dbo].[ThemSV]    Script Date: 03/04/2024 7:38:41 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ThemSV]
    @studentname nvarchar(50),
    @major nvarchar(50),
    @email nvarchar(50), 
    @departmentid int
AS  
BEGIN
    INSERT INTO students VALUES(@studentname,@major,@email,@departmentid)

	DECLARE @ProjectId INT;
    IF @@ROWCOUNT > 0 
    BEGIN 
        SELECT TOP 1 @ProjectId = studentid FROM students ORDER BY studentid DESC; 
		RETURN @ProjectId;
    END
    ELSE 
    BEGIN 
        RETURN 0; 
    END;
END;
GO
/****** Object:  StoredProcedure [dbo].[Update_P]    Script Date: 03/04/2024 7:38:41 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Update_P]
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
GO
USE [master]
GO
ALTER DATABASE [ql_da_nckh] SET  READ_WRITE 
GO
