USE [master]
GO
/****** Object:  Database [emilima]    Script Date: 10/2/2022 9:36:35 PM ******/
CREATE DATABASE [emilima]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'emilima', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLSERVER\MSSQL\DATA\emilima.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'emilima_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLSERVER\MSSQL\DATA\emilima_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [emilima] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [emilima].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [emilima] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [emilima] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [emilima] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [emilima] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [emilima] SET ARITHABORT OFF 
GO
ALTER DATABASE [emilima] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [emilima] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [emilima] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [emilima] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [emilima] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [emilima] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [emilima] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [emilima] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [emilima] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [emilima] SET  DISABLE_BROKER 
GO
ALTER DATABASE [emilima] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [emilima] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [emilima] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [emilima] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [emilima] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [emilima] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [emilima] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [emilima] SET RECOVERY FULL 
GO
ALTER DATABASE [emilima] SET  MULTI_USER 
GO
ALTER DATABASE [emilima] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [emilima] SET DB_CHAINING OFF 
GO
ALTER DATABASE [emilima] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [emilima] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [emilima] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [emilima] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'emilima', N'ON'
GO
ALTER DATABASE [emilima] SET QUERY_STORE = OFF
GO
USE [emilima]
GO
/****** Object:  Schema [emilima]    Script Date: 10/2/2022 9:36:35 PM ******/
CREATE SCHEMA [emilima]
GO
/****** Object:  Table [emilima].[document]    Script Date: 10/2/2022 9:36:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [emilima].[document](
	[serial_number] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](45) NOT NULL,
	[description] [nvarchar](max) NULL,
	[upload_date] [datetime2](0) NULL,
	[creation_date] [datetime2](0) NULL,
	[file_id] [nvarchar](48) NOT NULL,
	[document_type_id] [int] NOT NULL,
	[documental_serie_id] [nchar](6) NOT NULL,
 CONSTRAINT [PK_document_serial_number] PRIMARY KEY CLUSTERED 
(
	[serial_number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [document$name_UNIQUE] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [emilima].[document_request]    Script Date: 10/2/2022 9:36:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [emilima].[document_request](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](45) NOT NULL,
	[description] [nvarchar](max) NOT NULL,
	[creation_date] [datetime2](0) NULL,
	[state_id] [int] NOT NULL,
	[user_id] [nvarchar](45) NOT NULL,
	[organic_unit_id] [int] NOT NULL,
 CONSTRAINT [PK_document_request_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [emilima].[document_type]    Script Date: 10/2/2022 9:36:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [emilima].[document_type](
	[id] [int] NOT NULL,
	[name] [nvarchar](80) NOT NULL,
 CONSTRAINT [PK_document_type_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [emilima].[documental_serie]    Script Date: 10/2/2022 9:36:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [emilima].[documental_serie](
	[code] [nchar](6) NOT NULL,
	[name] [nvarchar](200) NOT NULL,
	[hierarchical_dependency_id] [int] NOT NULL,
	[organic_unit_id] [int] NOT NULL,
	[definition] [nvarchar](max) NOT NULL,
	[service_frequency] [nvarchar](45) NOT NULL,
	[normative_scope] [nvarchar](max) NOT NULL,
	[is_public] [binary](1) NULL,
	[phisical_features] [nvarchar](45) NULL,
	[documental_serie_value] [nchar](1) NOT NULL,
	[years_in_management_archive] [int] NOT NULL,
	[years_in_central_archive] [int] NOT NULL,
	[elaboration_date] [datetime2](0) NOT NULL,
 CONSTRAINT [PK_documental_serie_code] PRIMARY KEY CLUSTERED 
(
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [documental_serie$name_UNIQUE] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [emilima].[file]    Script Date: 10/2/2022 9:36:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [emilima].[file](
	[id] [nvarchar](48) NOT NULL,
	[filename] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_file_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [emilima].[hierarchical_dependency]    Script Date: 10/2/2022 9:36:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [emilima].[hierarchical_dependency](
	[id] [int] NOT NULL,
	[name] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_hierarchical_dependency_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [hierarchical_dependency$name_UNIQUE] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [emilima].[organic_unit]    Script Date: 10/2/2022 9:36:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [emilima].[organic_unit](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](80) NOT NULL,
 CONSTRAINT [PK_organic_unit_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [emilima].[request_state]    Script Date: 10/2/2022 9:36:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [emilima].[request_state](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](45) NOT NULL,
 CONSTRAINT [PK_request_state_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [request_state$name_UNIQUE] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [emilima].[user]    Script Date: 10/2/2022 9:36:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [emilima].[user](
	[username] [nvarchar](45) NOT NULL,
	[password] [nvarchar](45) NOT NULL,
	[email] [nvarchar](100) NOT NULL,
	[role_id] [int] NOT NULL,
	[photo_id] [nvarchar](48) NOT NULL,
	[position_id] [int] NOT NULL,
 CONSTRAINT [PK_user_username] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [emilima].[user_position]    Script Date: 10/2/2022 9:36:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [emilima].[user_position](
	[id] [int] NOT NULL,
	[name] [nvarchar](200) NOT NULL,
	[organic_unit_id] [int] NOT NULL,
	[hierarchical_dependency_id] [int] NOT NULL,
 CONSTRAINT [PK_user_position_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [user_position$name_UNIQUE] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [emilima].[user_role]    Script Date: 10/2/2022 9:36:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [emilima].[user_role](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](45) NOT NULL,
	[description] [nvarchar](max) NULL,
 CONSTRAINT [PK_user_role_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [user_role$name_UNIQUE] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [emilima].[usuario]    Script Date: 10/2/2022 9:36:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [emilima].[usuario](
	[id] [int] NOT NULL,
 CONSTRAINT [PK_usuario_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [fk_documentation_documental_serie_idx]    Script Date: 10/2/2022 9:36:35 PM ******/
CREATE NONCLUSTERED INDEX [fk_documentation_documental_serie_idx] ON [emilima].[document]
(
	[documental_serie_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [fk_documentation_documentation_type_idx]    Script Date: 10/2/2022 9:36:35 PM ******/
CREATE NONCLUSTERED INDEX [fk_documentation_documentation_type_idx] ON [emilima].[document]
(
	[document_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [fk_documentation_file1_idx]    Script Date: 10/2/2022 9:36:35 PM ******/
CREATE NONCLUSTERED INDEX [fk_documentation_file1_idx] ON [emilima].[document]
(
	[file_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [fk_request_organic_unit_idx]    Script Date: 10/2/2022 9:36:35 PM ******/
CREATE NONCLUSTERED INDEX [fk_request_organic_unit_idx] ON [emilima].[document_request]
(
	[organic_unit_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [fk_request_request_state_idx]    Script Date: 10/2/2022 9:36:35 PM ******/
CREATE NONCLUSTERED INDEX [fk_request_request_state_idx] ON [emilima].[document_request]
(
	[state_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [user_id_idx]    Script Date: 10/2/2022 9:36:35 PM ******/
CREATE NONCLUSTERED INDEX [user_id_idx] ON [emilima].[document_request]
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [fk_documental_serie_hierarchical_dependency_idx]    Script Date: 10/2/2022 9:36:35 PM ******/
CREATE NONCLUSTERED INDEX [fk_documental_serie_hierarchical_dependency_idx] ON [emilima].[documental_serie]
(
	[hierarchical_dependency_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [fk_documental_serie_organic_unit_idx]    Script Date: 10/2/2022 9:36:35 PM ******/
CREATE NONCLUSTERED INDEX [fk_documental_serie_organic_unit_idx] ON [emilima].[documental_serie]
(
	[organic_unit_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [fk_user_user_position_idx]    Script Date: 10/2/2022 9:36:35 PM ******/
CREATE NONCLUSTERED INDEX [fk_user_user_position_idx] ON [emilima].[user]
(
	[position_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [photo_idx]    Script Date: 10/2/2022 9:36:35 PM ******/
CREATE NONCLUSTERED INDEX [photo_idx] ON [emilima].[user]
(
	[photo_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [role_idx]    Script Date: 10/2/2022 9:36:35 PM ******/
CREATE NONCLUSTERED INDEX [role_idx] ON [emilima].[user]
(
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [fk_user_position_hierarchical_dependency_idx]    Script Date: 10/2/2022 9:36:35 PM ******/
CREATE NONCLUSTERED INDEX [fk_user_position_hierarchical_dependency_idx] ON [emilima].[user_position]
(
	[hierarchical_dependency_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [fk_user_position_organic_unit_idx]    Script Date: 10/2/2022 9:36:35 PM ******/
CREATE NONCLUSTERED INDEX [fk_user_position_organic_unit_idx] ON [emilima].[user_position]
(
	[organic_unit_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [emilima].[document] ADD  DEFAULT (getdate()) FOR [upload_date]
GO
ALTER TABLE [emilima].[document] ADD  DEFAULT (getdate()) FOR [creation_date]
GO
ALTER TABLE [emilima].[document_request] ADD  DEFAULT (getdate()) FOR [creation_date]
GO
ALTER TABLE [emilima].[documental_serie] ADD  DEFAULT (0x01) FOR [is_public]
GO
ALTER TABLE [emilima].[documental_serie] ADD  DEFAULT (N'ND') FOR [phisical_features]
GO
ALTER TABLE [emilima].[user] ADD  DEFAULT (N'c4042c2a-f106-11ec-8ea0-0242ac120002') FOR [photo_id]
GO
ALTER TABLE [emilima].[document]  WITH CHECK ADD  CONSTRAINT [document$fk_documentation_documental_serie] FOREIGN KEY([documental_serie_id])
REFERENCES [emilima].[documental_serie] ([code])
GO
ALTER TABLE [emilima].[document] CHECK CONSTRAINT [document$fk_documentation_documental_serie]
GO
ALTER TABLE [emilima].[document]  WITH CHECK ADD  CONSTRAINT [document$fk_documentation_documentation_type] FOREIGN KEY([document_type_id])
REFERENCES [emilima].[document_type] ([id])
GO
ALTER TABLE [emilima].[document] CHECK CONSTRAINT [document$fk_documentation_documentation_type]
GO
ALTER TABLE [emilima].[document]  WITH CHECK ADD  CONSTRAINT [document$fk_documentation_file] FOREIGN KEY([file_id])
REFERENCES [emilima].[file] ([id])
GO
ALTER TABLE [emilima].[document] CHECK CONSTRAINT [document$fk_documentation_file]
GO
ALTER TABLE [emilima].[document_request]  WITH CHECK ADD  CONSTRAINT [document_request$fk_request_organic_unit] FOREIGN KEY([organic_unit_id])
REFERENCES [emilima].[organic_unit] ([id])
GO
ALTER TABLE [emilima].[document_request] CHECK CONSTRAINT [document_request$fk_request_organic_unit]
GO
ALTER TABLE [emilima].[document_request]  WITH CHECK ADD  CONSTRAINT [document_request$fk_request_request_state] FOREIGN KEY([state_id])
REFERENCES [emilima].[request_state] ([id])
GO
ALTER TABLE [emilima].[document_request] CHECK CONSTRAINT [document_request$fk_request_request_state]
GO
ALTER TABLE [emilima].[document_request]  WITH CHECK ADD  CONSTRAINT [document_request$fk_request_user] FOREIGN KEY([user_id])
REFERENCES [emilima].[user] ([username])
GO
ALTER TABLE [emilima].[document_request] CHECK CONSTRAINT [document_request$fk_request_user]
GO
ALTER TABLE [emilima].[documental_serie]  WITH CHECK ADD  CONSTRAINT [documental_serie$fk_documental_serie_hierarchical_dependency] FOREIGN KEY([hierarchical_dependency_id])
REFERENCES [emilima].[hierarchical_dependency] ([id])
GO
ALTER TABLE [emilima].[documental_serie] CHECK CONSTRAINT [documental_serie$fk_documental_serie_hierarchical_dependency]
GO
ALTER TABLE [emilima].[documental_serie]  WITH CHECK ADD  CONSTRAINT [documental_serie$fk_documental_serie_organic_unit] FOREIGN KEY([organic_unit_id])
REFERENCES [emilima].[organic_unit] ([id])
GO
ALTER TABLE [emilima].[documental_serie] CHECK CONSTRAINT [documental_serie$fk_documental_serie_organic_unit]
GO
ALTER TABLE [emilima].[user]  WITH CHECK ADD  CONSTRAINT [user$fk_user_file] FOREIGN KEY([photo_id])
REFERENCES [emilima].[file] ([id])
GO
ALTER TABLE [emilima].[user] CHECK CONSTRAINT [user$fk_user_file]
GO
ALTER TABLE [emilima].[user]  WITH CHECK ADD  CONSTRAINT [user$fk_user_user_position] FOREIGN KEY([position_id])
REFERENCES [emilima].[user_position] ([id])
GO
ALTER TABLE [emilima].[user] CHECK CONSTRAINT [user$fk_user_user_position]
GO
ALTER TABLE [emilima].[user]  WITH CHECK ADD  CONSTRAINT [user$fk_user_user_role] FOREIGN KEY([role_id])
REFERENCES [emilima].[user_role] ([id])
GO
ALTER TABLE [emilima].[user] CHECK CONSTRAINT [user$fk_user_user_role]
GO
ALTER TABLE [emilima].[user_position]  WITH CHECK ADD  CONSTRAINT [user_position$fk_user_position_hierarchical_dependency] FOREIGN KEY([hierarchical_dependency_id])
REFERENCES [emilima].[hierarchical_dependency] ([id])
GO
ALTER TABLE [emilima].[user_position] CHECK CONSTRAINT [user_position$fk_user_position_hierarchical_dependency]
GO
ALTER TABLE [emilima].[user_position]  WITH CHECK ADD  CONSTRAINT [user_position$fk_user_position_organic_unit] FOREIGN KEY([organic_unit_id])
REFERENCES [emilima].[organic_unit] ([id])
GO
ALTER TABLE [emilima].[user_position] CHECK CONSTRAINT [user_position$fk_user_position_organic_unit]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'emilima.document' , @level0type=N'SCHEMA',@level0name=N'emilima', @level1type=N'TABLE',@level1name=N'document'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'emilima.document_request' , @level0type=N'SCHEMA',@level0name=N'emilima', @level1type=N'TABLE',@level1name=N'document_request'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'emilima.document_type' , @level0type=N'SCHEMA',@level0name=N'emilima', @level1type=N'TABLE',@level1name=N'document_type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'emilima.documental_serie' , @level0type=N'SCHEMA',@level0name=N'emilima', @level1type=N'TABLE',@level1name=N'documental_serie'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'emilima.file' , @level0type=N'SCHEMA',@level0name=N'emilima', @level1type=N'TABLE',@level1name=N'file'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'emilima.hierarchical_dependency' , @level0type=N'SCHEMA',@level0name=N'emilima', @level1type=N'TABLE',@level1name=N'hierarchical_dependency'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'emilima.organic_unit' , @level0type=N'SCHEMA',@level0name=N'emilima', @level1type=N'TABLE',@level1name=N'organic_unit'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'emilima.request_state' , @level0type=N'SCHEMA',@level0name=N'emilima', @level1type=N'TABLE',@level1name=N'request_state'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'emilima.`user`' , @level0type=N'SCHEMA',@level0name=N'emilima', @level1type=N'TABLE',@level1name=N'user'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'emilima.user_position' , @level0type=N'SCHEMA',@level0name=N'emilima', @level1type=N'TABLE',@level1name=N'user_position'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'emilima.user_role' , @level0type=N'SCHEMA',@level0name=N'emilima', @level1type=N'TABLE',@level1name=N'user_role'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'emilima.usuario' , @level0type=N'SCHEMA',@level0name=N'emilima', @level1type=N'TABLE',@level1name=N'usuario'
GO
USE [master]
GO
ALTER DATABASE [emilima] SET  READ_WRITE 
GO
