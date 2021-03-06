USE [master]
GO
/****** Object:  Database [PS08464_GundamShop]    Script Date: 6/24/2019 10:28:47 PM ******/
CREATE DATABASE [PS08464_GundamShop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PS08464_GundamShop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\PS08464_GundamShop.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PS08464_GundamShop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\PS08464_GundamShop_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [PS08464_GundamShop] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PS08464_GundamShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PS08464_GundamShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PS08464_GundamShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PS08464_GundamShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PS08464_GundamShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PS08464_GundamShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [PS08464_GundamShop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PS08464_GundamShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PS08464_GundamShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PS08464_GundamShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PS08464_GundamShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PS08464_GundamShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PS08464_GundamShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PS08464_GundamShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PS08464_GundamShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PS08464_GundamShop] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PS08464_GundamShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PS08464_GundamShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PS08464_GundamShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PS08464_GundamShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PS08464_GundamShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PS08464_GundamShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PS08464_GundamShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PS08464_GundamShop] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PS08464_GundamShop] SET  MULTI_USER 
GO
ALTER DATABASE [PS08464_GundamShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PS08464_GundamShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PS08464_GundamShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PS08464_GundamShop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PS08464_GundamShop] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PS08464_GundamShop] SET QUERY_STORE = OFF
GO
USE [PS08464_GundamShop]
GO
/****** Object:  User [admin_gundamshop]    Script Date: 6/24/2019 10:28:47 PM ******/
CREATE USER [admin_gundamshop] FOR LOGIN [admin_gundamshop] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [admin_gundamshop]
GO
/****** Object:  Table [dbo].[DonHang]    Script Date: 6/24/2019 10:28:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonHang](
	[maDonHang] [int] IDENTITY(1,1) NOT NULL,
	[ngayDatHang] [date] NULL,
	[tenTaiKhoanKhachHang] [varchar](50) NULL,
 CONSTRAINT [PK_DonHang] PRIMARY KEY CLUSTERED 
(
	[maDonHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DonHangChiTiet]    Script Date: 6/24/2019 10:28:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonHangChiTiet](
	[maDonHang] [int] NOT NULL,
	[maSanPham] [int] NOT NULL,
	[donGia] [float] NULL,
	[soLuong] [int] NULL,
 CONSTRAINT [PK_DonHangChiTiet] PRIMARY KEY CLUSTERED 
(
	[maDonHang] ASC,
	[maSanPham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DonHangNgoai]    Script Date: 6/24/2019 10:28:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonHangNgoai](
	[maDonHangNgoai] [int] IDENTITY(1,1) NOT NULL,
	[tenKhachHangNgoai] [nvarchar](75) NULL,
	[gioiTinh] [bit] NULL,
	[diaChi] [nvarchar](255) NULL,
	[email] [varchar](75) NULL,
	[dienThoai] [varchar](12) NULL,
	[ngayDatHang] [date] NULL,
 CONSTRAINT [PK_DonHangNgoai] PRIMARY KEY CLUSTERED 
(
	[maDonHangNgoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DonHangNgoaiChiTiet]    Script Date: 6/24/2019 10:28:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonHangNgoaiChiTiet](
	[maDonHangNgoai] [int] NOT NULL,
	[maSanPham] [int] NOT NULL,
	[donGia] [float] NULL,
	[soLuong] [int] NULL,
 CONSTRAINT [PK_DonHangNgoaiChiTiet_1] PRIMARY KEY CLUSTERED 
(
	[maDonHangNgoai] ASC,
	[maSanPham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 6/24/2019 10:28:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[tenTaiKhoan] [varchar](50) NOT NULL,
	[matKhau] [varchar](50) NULL,
	[hoTen] [nvarchar](100) NULL,
	[gioiTinh] [bit] NULL,
	[diaChi] [nvarchar](255) NULL,
	[ngaySinh] [date] NULL,
	[email] [varchar](75) NULL,
	[dienThoai] [varchar](12) NULL,
	[hinh] [varchar](50) NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[tenTaiKhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiSanPham]    Script Date: 6/24/2019 10:28:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiSanPham](
	[maLoai] [int] NOT NULL,
	[tenLoai] [nvarchar](100) NULL,
 CONSTRAINT [PK_LoaiSanPham] PRIMARY KEY CLUSTERED 
(
	[maLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuanTriVien]    Script Date: 6/24/2019 10:28:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuanTriVien](
	[tenTaiKhoan] [varchar](50) NOT NULL,
	[matKhau] [varchar](50) NULL,
	[hoTen] [nvarchar](100) NULL,
 CONSTRAINT [PK_QuanTriVien] PRIMARY KEY CLUSTERED 
(
	[tenTaiKhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 6/24/2019 10:28:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[maSanPham] [int] IDENTITY(1,1) NOT NULL,
	[tenSanPham] [nvarchar](100) NULL,
	[donGia] [float] NULL,
	[soLuong] [int] NULL,
	[maLoai] [int] NULL,
	[hinh] [nvarchar](50) NULL,
	[luotThich] [int] NULL,
 CONSTRAINT [PK_SanPham] PRIMARY KEY CLUSTERED 
(
	[maSanPham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[DonHang] ON 

INSERT [dbo].[DonHang] ([maDonHang], [ngayDatHang], [tenTaiKhoanKhachHang]) VALUES (1, CAST(N'2019-06-19' AS Date), N'trung')
INSERT [dbo].[DonHang] ([maDonHang], [ngayDatHang], [tenTaiKhoanKhachHang]) VALUES (2, CAST(N'2019-06-19' AS Date), N'trung')
INSERT [dbo].[DonHang] ([maDonHang], [ngayDatHang], [tenTaiKhoanKhachHang]) VALUES (3, CAST(N'2019-06-19' AS Date), N'trung')
INSERT [dbo].[DonHang] ([maDonHang], [ngayDatHang], [tenTaiKhoanKhachHang]) VALUES (6, CAST(N'2019-06-19' AS Date), N'trung')
INSERT [dbo].[DonHang] ([maDonHang], [ngayDatHang], [tenTaiKhoanKhachHang]) VALUES (7, CAST(N'2019-06-19' AS Date), N'trung')
INSERT [dbo].[DonHang] ([maDonHang], [ngayDatHang], [tenTaiKhoanKhachHang]) VALUES (15, CAST(N'2019-06-19' AS Date), N'trung')
INSERT [dbo].[DonHang] ([maDonHang], [ngayDatHang], [tenTaiKhoanKhachHang]) VALUES (17, CAST(N'2019-06-19' AS Date), N'trung')
INSERT [dbo].[DonHang] ([maDonHang], [ngayDatHang], [tenTaiKhoanKhachHang]) VALUES (18, CAST(N'2019-06-19' AS Date), N'trung')
INSERT [dbo].[DonHang] ([maDonHang], [ngayDatHang], [tenTaiKhoanKhachHang]) VALUES (20, CAST(N'2019-06-19' AS Date), N'tri')
INSERT [dbo].[DonHang] ([maDonHang], [ngayDatHang], [tenTaiKhoanKhachHang]) VALUES (21, CAST(N'2019-06-19' AS Date), N'tri')
INSERT [dbo].[DonHang] ([maDonHang], [ngayDatHang], [tenTaiKhoanKhachHang]) VALUES (22, CAST(N'2019-06-19' AS Date), N'tri')
INSERT [dbo].[DonHang] ([maDonHang], [ngayDatHang], [tenTaiKhoanKhachHang]) VALUES (25, CAST(N'2019-06-20' AS Date), N'trung')
INSERT [dbo].[DonHang] ([maDonHang], [ngayDatHang], [tenTaiKhoanKhachHang]) VALUES (31, CAST(N'2019-06-21' AS Date), N'hao')
INSERT [dbo].[DonHang] ([maDonHang], [ngayDatHang], [tenTaiKhoanKhachHang]) VALUES (35, CAST(N'2019-06-21' AS Date), N'hao')
SET IDENTITY_INSERT [dbo].[DonHang] OFF
INSERT [dbo].[DonHangChiTiet] ([maDonHang], [maSanPham], [donGia], [soLuong]) VALUES (1, 9, 1400, 1)
INSERT [dbo].[DonHangChiTiet] ([maDonHang], [maSanPham], [donGia], [soLuong]) VALUES (2, 9, 1400, 2)
INSERT [dbo].[DonHangChiTiet] ([maDonHang], [maSanPham], [donGia], [soLuong]) VALUES (2, 11, 1000, 1)
INSERT [dbo].[DonHangChiTiet] ([maDonHang], [maSanPham], [donGia], [soLuong]) VALUES (3, 9, 1400, 2)
INSERT [dbo].[DonHangChiTiet] ([maDonHang], [maSanPham], [donGia], [soLuong]) VALUES (3, 11, 1000, 1)
INSERT [dbo].[DonHangChiTiet] ([maDonHang], [maSanPham], [donGia], [soLuong]) VALUES (6, 6, 1000, 1)
INSERT [dbo].[DonHangChiTiet] ([maDonHang], [maSanPham], [donGia], [soLuong]) VALUES (6, 9, 1400, 2)
INSERT [dbo].[DonHangChiTiet] ([maDonHang], [maSanPham], [donGia], [soLuong]) VALUES (6, 11, 1000, 1)
INSERT [dbo].[DonHangChiTiet] ([maDonHang], [maSanPham], [donGia], [soLuong]) VALUES (7, 6, 1000, 1)
INSERT [dbo].[DonHangChiTiet] ([maDonHang], [maSanPham], [donGia], [soLuong]) VALUES (7, 9, 1400, 3)
INSERT [dbo].[DonHangChiTiet] ([maDonHang], [maSanPham], [donGia], [soLuong]) VALUES (7, 11, 1000, 1)
INSERT [dbo].[DonHangChiTiet] ([maDonHang], [maSanPham], [donGia], [soLuong]) VALUES (15, 6, 1000, 1)
INSERT [dbo].[DonHangChiTiet] ([maDonHang], [maSanPham], [donGia], [soLuong]) VALUES (15, 11, 1000, 1)
INSERT [dbo].[DonHangChiTiet] ([maDonHang], [maSanPham], [donGia], [soLuong]) VALUES (17, 6, 1000, 1)
INSERT [dbo].[DonHangChiTiet] ([maDonHang], [maSanPham], [donGia], [soLuong]) VALUES (17, 9, 1400, 1)
INSERT [dbo].[DonHangChiTiet] ([maDonHang], [maSanPham], [donGia], [soLuong]) VALUES (17, 11, 1000, 2)
INSERT [dbo].[DonHangChiTiet] ([maDonHang], [maSanPham], [donGia], [soLuong]) VALUES (18, 9, 1400, 1)
INSERT [dbo].[DonHangChiTiet] ([maDonHang], [maSanPham], [donGia], [soLuong]) VALUES (18, 11, 1000, 1)
INSERT [dbo].[DonHangChiTiet] ([maDonHang], [maSanPham], [donGia], [soLuong]) VALUES (20, 6, 1000, 1)
INSERT [dbo].[DonHangChiTiet] ([maDonHang], [maSanPham], [donGia], [soLuong]) VALUES (20, 11, 1000, 1)
INSERT [dbo].[DonHangChiTiet] ([maDonHang], [maSanPham], [donGia], [soLuong]) VALUES (21, 6, 1000, 2)
INSERT [dbo].[DonHangChiTiet] ([maDonHang], [maSanPham], [donGia], [soLuong]) VALUES (21, 9, 1400, 1)
INSERT [dbo].[DonHangChiTiet] ([maDonHang], [maSanPham], [donGia], [soLuong]) VALUES (21, 11, 1000, 2)
INSERT [dbo].[DonHangChiTiet] ([maDonHang], [maSanPham], [donGia], [soLuong]) VALUES (22, 6, 1000, 1)
INSERT [dbo].[DonHangChiTiet] ([maDonHang], [maSanPham], [donGia], [soLuong]) VALUES (22, 9, 1400, 1)
INSERT [dbo].[DonHangChiTiet] ([maDonHang], [maSanPham], [donGia], [soLuong]) VALUES (22, 11, 1000, 2)
INSERT [dbo].[DonHangChiTiet] ([maDonHang], [maSanPham], [donGia], [soLuong]) VALUES (25, 1, 800, 1)
INSERT [dbo].[DonHangChiTiet] ([maDonHang], [maSanPham], [donGia], [soLuong]) VALUES (25, 2, 800, 1)
INSERT [dbo].[DonHangChiTiet] ([maDonHang], [maSanPham], [donGia], [soLuong]) VALUES (25, 3, 1400, 1)
INSERT [dbo].[DonHangChiTiet] ([maDonHang], [maSanPham], [donGia], [soLuong]) VALUES (25, 6, 1000, 3)
INSERT [dbo].[DonHangChiTiet] ([maDonHang], [maSanPham], [donGia], [soLuong]) VALUES (25, 9, 1400, 7)
INSERT [dbo].[DonHangChiTiet] ([maDonHang], [maSanPham], [donGia], [soLuong]) VALUES (25, 11, 1000, 8)
INSERT [dbo].[DonHangChiTiet] ([maDonHang], [maSanPham], [donGia], [soLuong]) VALUES (25, 12, 2500, 1)
INSERT [dbo].[DonHangChiTiet] ([maDonHang], [maSanPham], [donGia], [soLuong]) VALUES (25, 14, 2500, 1)
INSERT [dbo].[DonHangChiTiet] ([maDonHang], [maSanPham], [donGia], [soLuong]) VALUES (31, 6, 1000, 2)
INSERT [dbo].[DonHangChiTiet] ([maDonHang], [maSanPham], [donGia], [soLuong]) VALUES (31, 9, 1400, 1)
INSERT [dbo].[DonHangChiTiet] ([maDonHang], [maSanPham], [donGia], [soLuong]) VALUES (31, 11, 1000, 2)
INSERT [dbo].[DonHangChiTiet] ([maDonHang], [maSanPham], [donGia], [soLuong]) VALUES (35, 6, 1000, 3)
INSERT [dbo].[DonHangChiTiet] ([maDonHang], [maSanPham], [donGia], [soLuong]) VALUES (35, 9, 1400, 2)
INSERT [dbo].[DonHangChiTiet] ([maDonHang], [maSanPham], [donGia], [soLuong]) VALUES (35, 11, 1000, 3)
SET IDENTITY_INSERT [dbo].[DonHangNgoai] ON 

INSERT [dbo].[DonHangNgoai] ([maDonHangNgoai], [tenKhachHangNgoai], [gioiTinh], [diaChi], [email], [dienThoai], [ngayDatHang]) VALUES (26, N'Nguyễn Quang Huy', 1, N'ádấdấd', N'huynqps08514@fpt.edu.vn', N'0123456789', CAST(N'2019-06-19' AS Date))
INSERT [dbo].[DonHangNgoai] ([maDonHangNgoai], [tenKhachHangNgoai], [gioiTinh], [diaChi], [email], [dienThoai], [ngayDatHang]) VALUES (27, N'Huy Hihi', 1, N'asdasdad', N'huynqps08514@fpt.edu.vn', N'0123456789', CAST(N'2019-06-19' AS Date))
INSERT [dbo].[DonHangNgoai] ([maDonHangNgoai], [tenKhachHangNgoai], [gioiTinh], [diaChi], [email], [dienThoai], [ngayDatHang]) VALUES (28, N'Huy', 1, N'asdasd', N'huynqps08514@fpt.edu.vn', N'0123456789', CAST(N'2019-06-19' AS Date))
INSERT [dbo].[DonHangNgoai] ([maDonHangNgoai], [tenKhachHangNgoai], [gioiTinh], [diaChi], [email], [dienThoai], [ngayDatHang]) VALUES (29, N'Huy', 1, N'asadasdadsads', N'huynqps08514@fpt.edu.vn', N'0123456789', CAST(N'2019-06-19' AS Date))
INSERT [dbo].[DonHangNgoai] ([maDonHangNgoai], [tenKhachHangNgoai], [gioiTinh], [diaChi], [email], [dienThoai], [ngayDatHang]) VALUES (30, N'Huy', 1, N'asdasd', N'huynqps08514@fpt.edu.vn', N'0123456789', CAST(N'2019-06-19' AS Date))
INSERT [dbo].[DonHangNgoai] ([maDonHangNgoai], [tenKhachHangNgoai], [gioiTinh], [diaChi], [email], [dienThoai], [ngayDatHang]) VALUES (31, N'Huy', 1, N'aasdasd', N'huynqps08514@fpt.edu.vn', N'0123456789', CAST(N'2019-06-19' AS Date))
INSERT [dbo].[DonHangNgoai] ([maDonHangNgoai], [tenKhachHangNgoai], [gioiTinh], [diaChi], [email], [dienThoai], [ngayDatHang]) VALUES (32, N'Huy', 1, N'asdasd', N'huynqps08514@fpt.edu.vn', N'0123456789', CAST(N'2019-06-19' AS Date))
INSERT [dbo].[DonHangNgoai] ([maDonHangNgoai], [tenKhachHangNgoai], [gioiTinh], [diaChi], [email], [dienThoai], [ngayDatHang]) VALUES (33, N'Huy', 1, N'asd', N'huynqps08514@fpt.edu.vn', N'0123456789', CAST(N'2019-06-19' AS Date))
INSERT [dbo].[DonHangNgoai] ([maDonHangNgoai], [tenKhachHangNgoai], [gioiTinh], [diaChi], [email], [dienThoai], [ngayDatHang]) VALUES (34, N'Huy', 1, N'asdasdads', N'huynqps08514@fpt.edu.vn', N'0123456789', CAST(N'2019-06-19' AS Date))
INSERT [dbo].[DonHangNgoai] ([maDonHangNgoai], [tenKhachHangNgoai], [gioiTinh], [diaChi], [email], [dienThoai], [ngayDatHang]) VALUES (35, N'Huy', 1, N'asdasdads', N'huynqps08514@fpt.edu.vn', N'0123456789', CAST(N'2019-06-19' AS Date))
INSERT [dbo].[DonHangNgoai] ([maDonHangNgoai], [tenKhachHangNgoai], [gioiTinh], [diaChi], [email], [dienThoai], [ngayDatHang]) VALUES (36, N'Sơn', 1, N'áđá', N'sontn1309@gmail.com', N'0123456789', CAST(N'2019-06-19' AS Date))
INSERT [dbo].[DonHangNgoai] ([maDonHangNgoai], [tenKhachHangNgoai], [gioiTinh], [diaChi], [email], [dienThoai], [ngayDatHang]) VALUES (37, N'Trung Gà', 1, N'áđasdá', N'trunglvps08925@fpt.edu.vn', N'0123456789', CAST(N'2019-06-19' AS Date))
INSERT [dbo].[DonHangNgoai] ([maDonHangNgoai], [tenKhachHangNgoai], [gioiTinh], [diaChi], [email], [dienThoai], [ngayDatHang]) VALUES (38, N'Áđá', 1, N'ádádấđâsd', N'tripmps08931@fpt.edu.vn', N'0398621402', CAST(N'2019-06-19' AS Date))
INSERT [dbo].[DonHangNgoai] ([maDonHangNgoai], [tenKhachHangNgoai], [gioiTinh], [diaChi], [email], [dienThoai], [ngayDatHang]) VALUES (39, N'Hào', 1, N'áđá', N'daihao12mc@gmail.com', N'0376555796', CAST(N'2019-06-20' AS Date))
INSERT [dbo].[DonHangNgoai] ([maDonHangNgoai], [tenKhachHangNgoai], [gioiTinh], [diaChi], [email], [dienThoai], [ngayDatHang]) VALUES (40, N'Hào', 1, N'áđá', N'thongddps08464@fpt.edu.vn', N'0376555796', CAST(N'2019-06-20' AS Date))
INSERT [dbo].[DonHangNgoai] ([maDonHangNgoai], [tenKhachHangNgoai], [gioiTinh], [diaChi], [email], [dienThoai], [ngayDatHang]) VALUES (41, N'Hào', 1, N'áđâsd', N'daihao12mc@gmail.com', N'0376555796', CAST(N'2019-06-20' AS Date))
INSERT [dbo].[DonHangNgoai] ([maDonHangNgoai], [tenKhachHangNgoai], [gioiTinh], [diaChi], [email], [dienThoai], [ngayDatHang]) VALUES (42, N'Huy', 1, N'áđâsd', N'thongddps08464@fpt.edu.vn', N'0961561330', CAST(N'2019-06-20' AS Date))
INSERT [dbo].[DonHangNgoai] ([maDonHangNgoai], [tenKhachHangNgoai], [gioiTinh], [diaChi], [email], [dienThoai], [ngayDatHang]) VALUES (43, N'Asdsdasd', 0, N'asdasdsd', N'asdasd@gmail.com', N'0961561330', CAST(N'2019-06-21' AS Date))
INSERT [dbo].[DonHangNgoai] ([maDonHangNgoai], [tenKhachHangNgoai], [gioiTinh], [diaChi], [email], [dienThoai], [ngayDatHang]) VALUES (44, N'Zcascac', 0, N'ascasc', N'thongddps08464@fpt.edu.vn', N'0123456789', CAST(N'2019-06-24' AS Date))
SET IDENTITY_INSERT [dbo].[DonHangNgoai] OFF
INSERT [dbo].[DonHangNgoaiChiTiet] ([maDonHangNgoai], [maSanPham], [donGia], [soLuong]) VALUES (26, 1, 800, 2)
INSERT [dbo].[DonHangNgoaiChiTiet] ([maDonHangNgoai], [maSanPham], [donGia], [soLuong]) VALUES (26, 2, 800, 1)
INSERT [dbo].[DonHangNgoaiChiTiet] ([maDonHangNgoai], [maSanPham], [donGia], [soLuong]) VALUES (26, 5, 1000, 1)
INSERT [dbo].[DonHangNgoaiChiTiet] ([maDonHangNgoai], [maSanPham], [donGia], [soLuong]) VALUES (27, 6, 1000, 1)
INSERT [dbo].[DonHangNgoaiChiTiet] ([maDonHangNgoai], [maSanPham], [donGia], [soLuong]) VALUES (27, 11, 1000, 4)
INSERT [dbo].[DonHangNgoaiChiTiet] ([maDonHangNgoai], [maSanPham], [donGia], [soLuong]) VALUES (28, 9, 1400, 1)
INSERT [dbo].[DonHangNgoaiChiTiet] ([maDonHangNgoai], [maSanPham], [donGia], [soLuong]) VALUES (28, 11, 1000, 1)
INSERT [dbo].[DonHangNgoaiChiTiet] ([maDonHangNgoai], [maSanPham], [donGia], [soLuong]) VALUES (29, 6, 1000, 1)
INSERT [dbo].[DonHangNgoaiChiTiet] ([maDonHangNgoai], [maSanPham], [donGia], [soLuong]) VALUES (29, 9, 1400, 1)
INSERT [dbo].[DonHangNgoaiChiTiet] ([maDonHangNgoai], [maSanPham], [donGia], [soLuong]) VALUES (29, 11, 1000, 1)
INSERT [dbo].[DonHangNgoaiChiTiet] ([maDonHangNgoai], [maSanPham], [donGia], [soLuong]) VALUES (30, 9, 1400, 1)
INSERT [dbo].[DonHangNgoaiChiTiet] ([maDonHangNgoai], [maSanPham], [donGia], [soLuong]) VALUES (30, 11, 1000, 1)
INSERT [dbo].[DonHangNgoaiChiTiet] ([maDonHangNgoai], [maSanPham], [donGia], [soLuong]) VALUES (31, 9, 1400, 1)
INSERT [dbo].[DonHangNgoaiChiTiet] ([maDonHangNgoai], [maSanPham], [donGia], [soLuong]) VALUES (31, 11, 1000, 1)
INSERT [dbo].[DonHangNgoaiChiTiet] ([maDonHangNgoai], [maSanPham], [donGia], [soLuong]) VALUES (32, 9, 1400, 1)
INSERT [dbo].[DonHangNgoaiChiTiet] ([maDonHangNgoai], [maSanPham], [donGia], [soLuong]) VALUES (32, 11, 1000, 1)
INSERT [dbo].[DonHangNgoaiChiTiet] ([maDonHangNgoai], [maSanPham], [donGia], [soLuong]) VALUES (33, 9, 1400, 1)
INSERT [dbo].[DonHangNgoaiChiTiet] ([maDonHangNgoai], [maSanPham], [donGia], [soLuong]) VALUES (33, 11, 1000, 1)
INSERT [dbo].[DonHangNgoaiChiTiet] ([maDonHangNgoai], [maSanPham], [donGia], [soLuong]) VALUES (34, 6, 1000, 1)
INSERT [dbo].[DonHangNgoaiChiTiet] ([maDonHangNgoai], [maSanPham], [donGia], [soLuong]) VALUES (34, 9, 1400, 1)
INSERT [dbo].[DonHangNgoaiChiTiet] ([maDonHangNgoai], [maSanPham], [donGia], [soLuong]) VALUES (34, 11, 1000, 2)
INSERT [dbo].[DonHangNgoaiChiTiet] ([maDonHangNgoai], [maSanPham], [donGia], [soLuong]) VALUES (36, 6, 1000, 1)
INSERT [dbo].[DonHangNgoaiChiTiet] ([maDonHangNgoai], [maSanPham], [donGia], [soLuong]) VALUES (36, 9, 1400, 1)
INSERT [dbo].[DonHangNgoaiChiTiet] ([maDonHangNgoai], [maSanPham], [donGia], [soLuong]) VALUES (36, 11, 1000, 1)
INSERT [dbo].[DonHangNgoaiChiTiet] ([maDonHangNgoai], [maSanPham], [donGia], [soLuong]) VALUES (37, 6, 1000, 1)
INSERT [dbo].[DonHangNgoaiChiTiet] ([maDonHangNgoai], [maSanPham], [donGia], [soLuong]) VALUES (37, 9, 1400, 1)
INSERT [dbo].[DonHangNgoaiChiTiet] ([maDonHangNgoai], [maSanPham], [donGia], [soLuong]) VALUES (37, 11, 1000, 1)
INSERT [dbo].[DonHangNgoaiChiTiet] ([maDonHangNgoai], [maSanPham], [donGia], [soLuong]) VALUES (38, 9, 1400, 1)
INSERT [dbo].[DonHangNgoaiChiTiet] ([maDonHangNgoai], [maSanPham], [donGia], [soLuong]) VALUES (38, 11, 1000, 1)
INSERT [dbo].[DonHangNgoaiChiTiet] ([maDonHangNgoai], [maSanPham], [donGia], [soLuong]) VALUES (39, 6, 1000, 1)
INSERT [dbo].[DonHangNgoaiChiTiet] ([maDonHangNgoai], [maSanPham], [donGia], [soLuong]) VALUES (39, 11, 1000, 2)
INSERT [dbo].[DonHangNgoaiChiTiet] ([maDonHangNgoai], [maSanPham], [donGia], [soLuong]) VALUES (40, 6, 1000, 1)
INSERT [dbo].[DonHangNgoaiChiTiet] ([maDonHangNgoai], [maSanPham], [donGia], [soLuong]) VALUES (40, 9, 1400, 1)
INSERT [dbo].[DonHangNgoaiChiTiet] ([maDonHangNgoai], [maSanPham], [donGia], [soLuong]) VALUES (40, 11, 1000, 1)
INSERT [dbo].[DonHangNgoaiChiTiet] ([maDonHangNgoai], [maSanPham], [donGia], [soLuong]) VALUES (41, 9, 1400, 1)
INSERT [dbo].[DonHangNgoaiChiTiet] ([maDonHangNgoai], [maSanPham], [donGia], [soLuong]) VALUES (41, 11, 1000, 1)
INSERT [dbo].[DonHangNgoaiChiTiet] ([maDonHangNgoai], [maSanPham], [donGia], [soLuong]) VALUES (42, 6, 1000, 1)
INSERT [dbo].[DonHangNgoaiChiTiet] ([maDonHangNgoai], [maSanPham], [donGia], [soLuong]) VALUES (42, 9, 1400, 1)
INSERT [dbo].[DonHangNgoaiChiTiet] ([maDonHangNgoai], [maSanPham], [donGia], [soLuong]) VALUES (42, 11, 1000, 1)
INSERT [dbo].[DonHangNgoaiChiTiet] ([maDonHangNgoai], [maSanPham], [donGia], [soLuong]) VALUES (43, 6, 1000, 1)
INSERT [dbo].[DonHangNgoaiChiTiet] ([maDonHangNgoai], [maSanPham], [donGia], [soLuong]) VALUES (43, 11, 1000, 1)
INSERT [dbo].[DonHangNgoaiChiTiet] ([maDonHangNgoai], [maSanPham], [donGia], [soLuong]) VALUES (44, 15, 2500, 1)
INSERT [dbo].[DonHangNgoaiChiTiet] ([maDonHangNgoai], [maSanPham], [donGia], [soLuong]) VALUES (44, 16, 2500, 2)
INSERT [dbo].[DonHangNgoaiChiTiet] ([maDonHangNgoai], [maSanPham], [donGia], [soLuong]) VALUES (44, 17, 2500, 1)
INSERT [dbo].[KhachHang] ([tenTaiKhoan], [matKhau], [hoTen], [gioiTinh], [diaChi], [ngaySinh], [email], [dienThoai], [hinh]) VALUES (N'hao', N'123', N'Nguyễn Đại Hào', 1, N'Quận Gò Vấp', CAST(N'1994-09-09' AS Date), N'daihao12mc@gmail.com', N'0376555796', N'hao.jpg')
INSERT [dbo].[KhachHang] ([tenTaiKhoan], [matKhau], [hoTen], [gioiTinh], [diaChi], [ngaySinh], [email], [dienThoai], [hinh]) VALUES (N'thong', N'123', N'Đinh Đạt Thông', 1, N'Quận Bình Thạnh', CAST(N'1999-01-14' AS Date), N'user1@fpt.edu.vn', N'0156489653', N'thong.jpg')
INSERT [dbo].[KhachHang] ([tenTaiKhoan], [matKhau], [hoTen], [gioiTinh], [diaChi], [ngaySinh], [email], [dienThoai], [hinh]) VALUES (N'trang', N'123', N'Nguyễn Thị Minh Trang', 0, N'Quận Gò Vấp', CAST(N'1997-05-08' AS Date), N'user5@fpt.edu.vn', N'01846545656', N'trang.jpg')
INSERT [dbo].[KhachHang] ([tenTaiKhoan], [matKhau], [hoTen], [gioiTinh], [diaChi], [ngaySinh], [email], [dienThoai], [hinh]) VALUES (N'tri', N'123', N'Phan Minh Trí', 1, N'Quận 1', CAST(N'1997-09-18' AS Date), N'tripmps08931@fpt.edu.vn', N'0928742213', N'tri.jpg')
INSERT [dbo].[KhachHang] ([tenTaiKhoan], [matKhau], [hoTen], [gioiTinh], [diaChi], [ngaySinh], [email], [dienThoai], [hinh]) VALUES (N'trung', N'123', N'Lê Văn Trung', 1, N'Bình Dương', CAST(N'1995-10-10' AS Date), N'trunglvps08925@fpt.edu.vn', N'0337860990', N'trung.jpg')
INSERT [dbo].[LoaiSanPham] ([maLoai], [tenLoai]) VALUES (1, N'Super Deformed')
INSERT [dbo].[LoaiSanPham] ([maLoai], [tenLoai]) VALUES (2, N'Real Grade')
INSERT [dbo].[LoaiSanPham] ([maLoai], [tenLoai]) VALUES (3, N'Master Grade')
INSERT [dbo].[QuanTriVien] ([tenTaiKhoan], [matKhau], [hoTen]) VALUES (N'admin', N'123', N'Đinh Đạt Thông')
INSERT [dbo].[QuanTriVien] ([tenTaiKhoan], [matKhau], [hoTen]) VALUES (N'trang', N'123', N'Nguyễn Thị Minh Trang')
SET IDENTITY_INSERT [dbo].[SanPham] ON 

INSERT [dbo].[SanPham] ([maSanPham], [tenSanPham], [donGia], [soLuong], [maLoai], [hinh], [luotThich]) VALUES (1, N'RX-78-2 Gundam', 800, 80, 1, N'1.jpg', 150)
INSERT [dbo].[SanPham] ([maSanPham], [tenSanPham], [donGia], [soLuong], [maLoai], [hinh], [luotThich]) VALUES (2, N'XM-X1 Crossbone Gundam X-1', 800, 20, 1, N'2.jpg', 107)
INSERT [dbo].[SanPham] ([maSanPham], [tenSanPham], [donGia], [soLuong], [maLoai], [hinh], [luotThich]) VALUES (3, N'MSN-04II Nightingale', 1400, 30, 1, N'3.jpg', 240)
INSERT [dbo].[SanPham] ([maSanPham], [tenSanPham], [donGia], [soLuong], [maLoai], [hinh], [luotThich]) VALUES (4, N'MS-06F Zaku II', 800, 10, 1, N'4.jpg', 140)
INSERT [dbo].[SanPham] ([maSanPham], [tenSanPham], [donGia], [soLuong], [maLoai], [hinh], [luotThich]) VALUES (5, N'MSZ-006 Zeta Gundam', 1000, 24, 1, N'5.jpg', 52)
INSERT [dbo].[SanPham] ([maSanPham], [tenSanPham], [donGia], [soLuong], [maLoai], [hinh], [luotThich]) VALUES (6, N'GN-0000DVR/A Gundam 00 Diver Ace', 1000, 21, 1, N'6.jpg', 500)
INSERT [dbo].[SanPham] ([maSanPham], [tenSanPham], [donGia], [soLuong], [maLoai], [hinh], [luotThich]) VALUES (7, N'RX-0 Unicorn Gundam 03 Phenex', 1200, 18, 1, N'7.jpg', 350)
INSERT [dbo].[SanPham] ([maSanPham], [tenSanPham], [donGia], [soLuong], [maLoai], [hinh], [luotThich]) VALUES (8, N'ZGMF-X10A Freedom Gundam', 1000, 44, 1, N'8.jpg', 312)
INSERT [dbo].[SanPham] ([maSanPham], [tenSanPham], [donGia], [soLuong], [maLoai], [hinh], [luotThich]) VALUES (9, N'LRX-077 Sisquiede', 1400, 42, 1, N'9.jpg', 412)
INSERT [dbo].[SanPham] ([maSanPham], [tenSanPham], [donGia], [soLuong], [maLoai], [hinh], [luotThich]) VALUES (10, N'LRX-077 Sisquiede (Titans colors)', 1400, 54, 1, N'10.jpg', 126)
INSERT [dbo].[SanPham] ([maSanPham], [tenSanPham], [donGia], [soLuong], [maLoai], [hinh], [luotThich]) VALUES (11, N'RX-79[G] Gundam Ground Type', 1000, 34, 1, N'11.jpg', 495)
INSERT [dbo].[SanPham] ([maSanPham], [tenSanPham], [donGia], [soLuong], [maLoai], [hinh], [luotThich]) VALUES (12, N'RX-78-2 Gundam', 2500, 42, 2, N'12.jpg', 213)
INSERT [dbo].[SanPham] ([maSanPham], [tenSanPham], [donGia], [soLuong], [maLoai], [hinh], [luotThich]) VALUES (13, N'MS-06S Zaku II', 2500, 15, 2, N'13.jpg', 452)
INSERT [dbo].[SanPham] ([maSanPham], [tenSanPham], [donGia], [soLuong], [maLoai], [hinh], [luotThich]) VALUES (14, N'GAT-X105 Aile Strike Gundam', 2500, 46, 2, N'14.jpg', 114)
INSERT [dbo].[SanPham] ([maSanPham], [tenSanPham], [donGia], [soLuong], [maLoai], [hinh], [luotThich]) VALUES (15, N'MS-06F Zaku II', 2500, 77, 2, N'15.jpg', 113)
INSERT [dbo].[SanPham] ([maSanPham], [tenSanPham], [donGia], [soLuong], [maLoai], [hinh], [luotThich]) VALUES (16, N'ZGMF-X10A Freedom Gundam', 2500, 14, 2, N'16.jpg', 122)
INSERT [dbo].[SanPham] ([maSanPham], [tenSanPham], [donGia], [soLuong], [maLoai], [hinh], [luotThich]) VALUES (17, N'FX-550 Skygrasper', 2500, 77, 2, N'17.jpg', 163)
INSERT [dbo].[SanPham] ([maSanPham], [tenSanPham], [donGia], [soLuong], [maLoai], [hinh], [luotThich]) VALUES (18, N'RX-178 Gundam Mk-II Titans', 2500, 52, 2, N'18.jpg', 184)
INSERT [dbo].[SanPham] ([maSanPham], [tenSanPham], [donGia], [soLuong], [maLoai], [hinh], [luotThich]) VALUES (19, N'RX-178 Gundam Mk-II A.E.U.G.', 2500, 42, 2, N'19.jpg', 294)
INSERT [dbo].[SanPham] ([maSanPham], [tenSanPham], [donGia], [soLuong], [maLoai], [hinh], [luotThich]) VALUES (20, N'ZGMF-X09A Justice Gundam', 2500, 71, 2, N'20.jpg', 469)
INSERT [dbo].[SanPham] ([maSanPham], [tenSanPham], [donGia], [soLuong], [maLoai], [hinh], [luotThich]) VALUES (21, N'MSZ-006 Zeta Gundam', 3000, 41, 2, N'21.jpg', 375)
INSERT [dbo].[SanPham] ([maSanPham], [tenSanPham], [donGia], [soLuong], [maLoai], [hinh], [luotThich]) VALUES (22, N'ZGMF-X42S Destiny Gundam', 2500, 11, 2, N'22.jpg', 314)
SET IDENTITY_INSERT [dbo].[SanPham] OFF
ALTER TABLE [dbo].[SanPham] ADD  CONSTRAINT [DF_SanPham_luotThich]  DEFAULT ((0)) FOR [luotThich]
GO
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD  CONSTRAINT [FK_DonHang_KhachHang] FOREIGN KEY([tenTaiKhoanKhachHang])
REFERENCES [dbo].[KhachHang] ([tenTaiKhoan])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DonHang] CHECK CONSTRAINT [FK_DonHang_KhachHang]
GO
ALTER TABLE [dbo].[DonHangChiTiet]  WITH CHECK ADD  CONSTRAINT [FK_DonHangChiTiet_DonHang] FOREIGN KEY([maDonHang])
REFERENCES [dbo].[DonHang] ([maDonHang])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DonHangChiTiet] CHECK CONSTRAINT [FK_DonHangChiTiet_DonHang]
GO
ALTER TABLE [dbo].[DonHangChiTiet]  WITH CHECK ADD  CONSTRAINT [FK_DonHangChiTiet_SanPham] FOREIGN KEY([maSanPham])
REFERENCES [dbo].[SanPham] ([maSanPham])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DonHangChiTiet] CHECK CONSTRAINT [FK_DonHangChiTiet_SanPham]
GO
ALTER TABLE [dbo].[DonHangNgoaiChiTiet]  WITH CHECK ADD  CONSTRAINT [FK_DonHangNgoaiChiTiet_DonHangNgoai] FOREIGN KEY([maDonHangNgoai])
REFERENCES [dbo].[DonHangNgoai] ([maDonHangNgoai])
GO
ALTER TABLE [dbo].[DonHangNgoaiChiTiet] CHECK CONSTRAINT [FK_DonHangNgoaiChiTiet_DonHangNgoai]
GO
ALTER TABLE [dbo].[DonHangNgoaiChiTiet]  WITH CHECK ADD  CONSTRAINT [FK_DonHangNgoaiChiTiet_SanPham] FOREIGN KEY([maSanPham])
REFERENCES [dbo].[SanPham] ([maSanPham])
GO
ALTER TABLE [dbo].[DonHangNgoaiChiTiet] CHECK CONSTRAINT [FK_DonHangNgoaiChiTiet_SanPham]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_LoaiSanPham] FOREIGN KEY([maLoai])
REFERENCES [dbo].[LoaiSanPham] ([maLoai])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_LoaiSanPham]
GO
/****** Object:  StoredProcedure [dbo].[sp_danhSachTaiTrang]    Script Date: 6/24/2019 10:28:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_danhSachTaiTrang]
	@maLoai int,
	@soTrang int
as
	select maSanPham, tenSanPham, donGia, soLuong, maLoai, hinh, luotThich from
	(
	   select row_number() over (order by maSanPham) num,
	   * from SanPham
	   where maLoai = @maLoai
	) A
	where num >= 6*@soTrang - 5 and num <= 6*@soTrang
GO
/****** Object:  StoredProcedure [dbo].[sp_demDonHang]    Script Date: 6/24/2019 10:28:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_demDonHang] 
	@tenTaiKhoanKhachHang varchar(50)
as
	select count(*) from 
	DonHang, KhachHang
	where tenTaiKhoanKhachHang = tenTaiKhoan
	and tenTaiKhoan = @tenTaiKhoanKhachHang
GO
USE [master]
GO
ALTER DATABASE [PS08464_GundamShop] SET  READ_WRITE 
GO
