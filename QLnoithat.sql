USE [master]
GO
/****** Object:  Database [QLNoithat]    Script Date: 08-Jan-22 02:22:30 PM ******/
CREATE DATABASE [QLNoithat]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QLNoithat', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\QLNoithat.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QLNoithat_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\QLNoithat_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [QLNoithat] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLNoithat].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLNoithat] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLNoithat] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLNoithat] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLNoithat] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLNoithat] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLNoithat] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QLNoithat] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLNoithat] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLNoithat] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLNoithat] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLNoithat] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLNoithat] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLNoithat] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLNoithat] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLNoithat] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QLNoithat] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLNoithat] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLNoithat] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLNoithat] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLNoithat] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLNoithat] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLNoithat] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLNoithat] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QLNoithat] SET  MULTI_USER 
GO
ALTER DATABASE [QLNoithat] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLNoithat] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLNoithat] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLNoithat] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QLNoithat] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QLNoithat] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [QLNoithat] SET QUERY_STORE = OFF
GO
USE [QLNoithat]
GO
/****** Object:  Table [dbo].[Hoadon]    Script Date: 08-Jan-22 02:22:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hoadon](
	[MaHoaDon] [nvarchar](50) NOT NULL,
	[MaKhachHang] [nvarchar](50) NULL,
	[MaHang] [nvarchar](50) NULL,
	[TenKhachHang] [nvarchar](50) NULL,
	[SoDienThoai] [int] NULL,
	[SoLuongMua] [int] NULL,
	[Gia] [int] NULL,
 CONSTRAINT [PK_Hoadon] PRIMARY KEY CLUSTERED 
(
	[MaHoaDon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Khachhang]    Script Date: 08-Jan-22 02:22:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Khachhang](
	[MaKhachHang] [nvarchar](50) NOT NULL,
	[TenKhachHang] [nvarchar](50) NULL,
	[GioiTinh] [nvarchar](50) NULL,
	[SoDienThoai] [int] NULL,
	[DiaChi] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
 CONSTRAINT [PK_Khachhang] PRIMARY KEY CLUSTERED 
(
	[MaKhachHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kho]    Script Date: 08-Jan-22 02:22:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kho](
	[MaHang] [nvarchar](50) NOT NULL,
	[LoaiHang] [nvarchar](50) NULL,
	[DonViTinh] [int] NULL,
	[TonKho] [int] NULL,
	[GiaTriTon] [int] NULL,
 CONSTRAINT [PK_Kho] PRIMARY KEY CLUSTERED 
(
	[MaHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Noithat]    Script Date: 08-Jan-22 02:22:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Noithat](
	[MaHang] [nvarchar](50) NOT NULL,
	[TenHang] [nvarchar](50) NULL,
	[NgayNhap] [date] NULL,
	[Gia] [int] NULL,
	[TrangThai] [nvarchar](50) NULL,
	[DanhGia] [nvarchar](50) NULL,
 CONSTRAINT [PK_Noithat] PRIMARY KEY CLUSTERED 
(
	[MaHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Hoadon] ([MaHoaDon], [MaKhachHang], [MaHang], [TenKhachHang], [SoDienThoai], [SoLuongMua], [Gia]) VALUES (N'A1', N'KH01', N'G01', N'Nguyen Van Thanh', 343162187, 2, 2500000)
GO
INSERT [dbo].[Hoadon] ([MaHoaDon], [MaKhachHang], [MaHang], [TenKhachHang], [SoDienThoai], [SoLuongMua], [Gia]) VALUES (N'A2', N'KH01', N'JX9', N'Nguyen Van Thanh ', 343162187, 1, 1520300)
GO
INSERT [dbo].[Hoadon] ([MaHoaDon], [MaKhachHang], [MaHang], [TenKhachHang], [SoDienThoai], [SoLuongMua], [Gia]) VALUES (N'A3', N'KH03', N'G31', N'Nguyen Van Anh', 876765878, 2, 256632)
GO
INSERT [dbo].[Hoadon] ([MaHoaDon], [MaKhachHang], [MaHang], [TenKhachHang], [SoDienThoai], [SoLuongMua], [Gia]) VALUES (N'A4', N'KH02', N'JX9', N'Nguyen Thi Hang', 578758668, 1, 2155500)
GO
INSERT [dbo].[Hoadon] ([MaHoaDon], [MaKhachHang], [MaHang], [TenKhachHang], [SoDienThoai], [SoLuongMua], [Gia]) VALUES (N'A5', N'KH04', N'NV2', N'Nguyen Tuan Hung', 387698658, 1, 200000)
GO
INSERT [dbo].[Khachhang] ([MaKhachHang], [TenKhachHang], [GioiTinh], [SoDienThoai], [DiaChi], [Email]) VALUES (N'KH01', N'Nguyen Van Thanh', N'Nam', 343162187, N'abc', N'fewfw')
GO
INSERT [dbo].[Khachhang] ([MaKhachHang], [TenKhachHang], [GioiTinh], [SoDienThoai], [DiaChi], [Email]) VALUES (N'KH02', N'Nguyen Thi Hang', N'Nu', 578758668, N'fdsf', N'fedfsds')
GO
INSERT [dbo].[Khachhang] ([MaKhachHang], [TenKhachHang], [GioiTinh], [SoDienThoai], [DiaChi], [Email]) VALUES (N'KH03', N'Nguyen Van Anh', N'Nam', 876765878, N'trre', N'ẻwer')
GO
INSERT [dbo].[Khachhang] ([MaKhachHang], [TenKhachHang], [GioiTinh], [SoDienThoai], [DiaChi], [Email]) VALUES (N'KH04', N'Nguyen Tuan Hung', N'Nam', 387698658, N'fweew', N'rewf')
GO
INSERT [dbo].[Khachhang] ([MaKhachHang], [TenKhachHang], [GioiTinh], [SoDienThoai], [DiaChi], [Email]) VALUES (N'KH05', N'Nguyen Thi Minh Hang ', N'Nu', 175578587, N'fefds', N'ẻwert')
GO
INSERT [dbo].[Khachhang] ([MaKhachHang], [TenKhachHang], [GioiTinh], [SoDienThoai], [DiaChi], [Email]) VALUES (N'KH06', N'Nguyen Minh Vuong', N'Nam', 314625745, N'rtrte', N'tytgt')
GO
INSERT [dbo].[Kho] ([MaHang], [LoaiHang], [DonViTinh], [TonKho], [GiaTriTon]) VALUES (N'G01', N'Gương', 1, 3, 2500000)
GO
INSERT [dbo].[Kho] ([MaHang], [LoaiHang], [DonViTinh], [TonKho], [GiaTriTon]) VALUES (N'G02', N'Gối', 2, 5, 2512000)
GO
INSERT [dbo].[Kho] ([MaHang], [LoaiHang], [DonViTinh], [TonKho], [GiaTriTon]) VALUES (N'G31', N'Bàn', 4, 2, 256352)
GO
INSERT [dbo].[Kho] ([MaHang], [LoaiHang], [DonViTinh], [TonKho], [GiaTriTon]) VALUES (N'JX9', N'Ð?ng h?', 40, 2, 200101)
GO
INSERT [dbo].[Kho] ([MaHang], [LoaiHang], [DonViTinh], [TonKho], [GiaTriTon]) VALUES (N'NV2', N'Tủ', 1, 0, 0)
GO
INSERT [dbo].[Kho] ([MaHang], [LoaiHang], [DonViTinh], [TonKho], [GiaTriTon]) VALUES (N'NV3', N'Gối', 5, 2, 225000)
GO
INSERT [dbo].[Kho] ([MaHang], [LoaiHang], [DonViTinh], [TonKho], [GiaTriTon]) VALUES (N'S03', N'Giá treo', 3, 0, 0)
GO
INSERT [dbo].[Noithat] ([MaHang], [TenHang], [NgayNhap], [Gia], [TrangThai], [DanhGia]) VALUES (N'G01', N'Guong treo tu?ng', CAST(N'2021-10-25' AS Date), 1200000, N'Còn hàng', N'52234')
GO
INSERT [dbo].[Noithat] ([MaHang], [TenHang], [NgayNhap], [Gia], [TrangThai], [DanhGia]) VALUES (N'G02', N'Vỏ gối ngù', CAST(N'2021-10-20' AS Date), 150000, N'Còn hàng', N'4.5')
GO
INSERT [dbo].[Noithat] ([MaHang], [TenHang], [NgayNhap], [Gia], [TrangThai], [DanhGia]) VALUES (N'G04', N'Bình s?', CAST(N'2021-10-20' AS Date), 15200000, N'H?t hàng', N'5230')
GO
INSERT [dbo].[Noithat] ([MaHang], [TenHang], [NgayNhap], [Gia], [TrangThai], [DanhGia]) VALUES (N'G31', N'Bàn trang điểm', CAST(N'2021-10-26' AS Date), 1580000, N'Còn hàng', N'4.5')
GO
INSERT [dbo].[Noithat] ([MaHang], [TenHang], [NgayNhap], [Gia], [TrangThai], [DanhGia]) VALUES (N'JX9', N'Ð?ng h? báo th?c', CAST(N'2021-11-01' AS Date), 123000, N'Còn hàng', N'5')
GO
INSERT [dbo].[Noithat] ([MaHang], [TenHang], [NgayNhap], [Gia], [TrangThai], [DanhGia]) VALUES (N'NM7', N'Giá kệ', CAST(N'2021-02-12' AS Date), 870000, N'Còn hàng', N'4.6')
GO
INSERT [dbo].[Noithat] ([MaHang], [TenHang], [NgayNhap], [Gia], [TrangThai], [DanhGia]) VALUES (N'NV2', N'Tủ đầu giường', CAST(N'2021-11-01' AS Date), 500000, N'Hết hàng', N'4.5')
GO
INSERT [dbo].[Noithat] ([MaHang], [TenHang], [NgayNhap], [Gia], [TrangThai], [DanhGia]) VALUES (N'NV3', N'Gối ôm', CAST(N'2021-02-12' AS Date), 240000, N'Còn hàng', N'4.7')
GO
INSERT [dbo].[Noithat] ([MaHang], [TenHang], [NgayNhap], [Gia], [TrangThai], [DanhGia]) VALUES (N'S03', N'Thanh treo quần áo', CAST(N'2021-10-26' AS Date), 300000, N'Hết hàng', N'4.7')
GO
ALTER TABLE [dbo].[Hoadon]  WITH CHECK ADD  CONSTRAINT [FK_Hoadon_Khachhang] FOREIGN KEY([MaKhachHang])
REFERENCES [dbo].[Khachhang] ([MaKhachHang])
GO
ALTER TABLE [dbo].[Hoadon] CHECK CONSTRAINT [FK_Hoadon_Khachhang]
GO
ALTER TABLE [dbo].[Hoadon]  WITH CHECK ADD  CONSTRAINT [FK_Hoadon_Noithat] FOREIGN KEY([MaHang])
REFERENCES [dbo].[Noithat] ([MaHang])
GO
ALTER TABLE [dbo].[Hoadon] CHECK CONSTRAINT [FK_Hoadon_Noithat]
GO
ALTER TABLE [dbo].[Kho]  WITH CHECK ADD  CONSTRAINT [FK_Kho_Noithat] FOREIGN KEY([MaHang])
REFERENCES [dbo].[Noithat] ([MaHang])
GO
ALTER TABLE [dbo].[Kho] CHECK CONSTRAINT [FK_Kho_Noithat]
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteNoithat]    Script Date: 08-Jan-22 02:22:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_DeleteNoithat]
@MaHang nvarchar(50)
as
Delete from NoiThat
where MaHang = @MaHang
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllNoithat]    Script Date: 08-Jan-22 02:22:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_GetAllNoithat]
as
select*from Noithat
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertNoithat]    Script Date: 08-Jan-22 02:22:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_InsertNoithat]
@MaHang nvarchar(50),
@TenHang nvarchar(50),        
@NgayNhap date,
@Gia int,
@TrangThai nvarchar(50),
@DanhGia nvarchar(50)
as
insert into Noithat(MaHang,TenHang,NgayNhap,Gia,TrangThai,DanhGia)
values(@MaHang,@TenHang,@NgayNhap,@Gia,@TrangThai,@DanhGia)
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateNoithat]    Script Date: 08-Jan-22 02:22:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_UpdateNoithat]
@MaHang nvarchar(50),
@TenHang nvarchar(50),        
@NgayNhap date,
@Gia int,
@TrangThai nvarchar(50),
@DanhGia nvarchar(50)
as
Update Noithat
set TenHang =@TenHang,
NgayNhap = @ngayNhap,
Gia = @Gia,
TrangThai = @TrangThai,
DanhGia = @DanhGia
where MaHang = @MaHang

GO
USE [master]
GO
ALTER DATABASE [QLNoithat] SET  READ_WRITE 
GO
