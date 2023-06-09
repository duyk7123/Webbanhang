USE [SHOESSHOPSB]
GO
/****** Object:  Table [dbo].[chitietdonhangs]    Script Date: 19/10/2022 8:38:08 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[chitietdonhangs](
	[ma_don_hang] [int] NOT NULL,
	[ma_giay] [int] NOT NULL,
	[so_luong] [int] NULL,
	[don_gia] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ma_don_hang] ASC,
	[ma_giay] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[donhangs]    Script Date: 19/10/2022 8:38:08 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[donhangs](
	[ma_don_hang] [int] IDENTITY(1,1) NOT NULL,
	[ngay_dat_hang] [datetime] NULL,
	[ten_nguoi_nhan] [nvarchar](50) NULL,
	[dia_chi] [nvarchar](300) NULL,
	[so_dien_thoai] [varchar](20) NULL,
	[ghi_chu_khach_hang] [nvarchar](300) NULL,
	[ghi_chu_admin] [nvarchar](300) NULL,
	[trang_thai] [nvarchar](20) NULL,
	[tong_tien] [int] NULL,
	[ngay_giao_du_kien] [date] NULL,
	[tai_khoan] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[ma_don_hang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Giays]    Script Date: 19/10/2022 8:38:08 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Giays](
	[ma_giay] [int] IDENTITY(1,1) NOT NULL,
	[ten_giay] [nvarchar](500) NULL,
	[don_gia] [int] NULL,
	[giam_gia] [float] NULL,
	[mo_ta] [nvarchar](max) NULL,
	[hinh_anh] [varchar](max) NULL,
	[ma_loai_giay] [int] NULL,
	[ma_hang] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ma_giay] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HangGiays]    Script Date: 19/10/2022 8:38:08 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HangGiays](
	[ma_hang] [int] IDENTITY(1,1) NOT NULL,
	[ten_hang] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ma_hang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[khachhangs]    Script Date: 19/10/2022 8:38:08 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[khachhangs](
	[tai_khoan] [varchar](20) NOT NULL,
	[mat_khau] [varchar](20) NULL,
	[ten_khach_hang] [nvarchar](100) NULL,
	[so_dien_thoai] [varchar](20) NULL,
	[dia_chi] [nvarchar](max) NULL,
	[quyen] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[tai_khoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiGiays]    Script Date: 19/10/2022 8:38:08 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiGiays](
	[ma_loai_giay] [int] IDENTITY(1,1) NOT NULL,
	[ten_loai] [nvarchar](20) NULL,
	[gioi_tinh] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ma_loai_giay] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[chitietdonhangs]  WITH CHECK ADD FOREIGN KEY([ma_don_hang])
REFERENCES [dbo].[donhangs] ([ma_don_hang])
GO
ALTER TABLE [dbo].[chitietdonhangs]  WITH CHECK ADD FOREIGN KEY([ma_giay])
REFERENCES [dbo].[Giays] ([ma_giay])
GO
ALTER TABLE [dbo].[donhangs]  WITH CHECK ADD FOREIGN KEY([tai_khoan])
REFERENCES [dbo].[khachhangs] ([tai_khoan])
GO
ALTER TABLE [dbo].[Giays]  WITH CHECK ADD FOREIGN KEY([ma_hang])
REFERENCES [dbo].[HangGiays] ([ma_hang])
GO
ALTER TABLE [dbo].[Giays]  WITH CHECK ADD FOREIGN KEY([ma_loai_giay])
REFERENCES [dbo].[LoaiGiays] ([ma_loai_giay])
GO
/****** Object:  StoredProcedure [dbo].[DOANH_THU_NAM]    Script Date: 19/10/2022 8:38:08 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DOANH_THU_NAM] @year int
AS
SELECT 
(
	SELECT SUM(tong_tien)
	FROM donhangs
	WHERE MONTH(ngay_giao_du_kien) = 1
	AND YEAR(ngay_giao_du_kien)=@year
) as N'Thang1' ,
(
	SELECT SUM(tong_tien)
	FROM donhangs
	WHERE MONTH(ngay_giao_du_kien) = 2
	AND YEAR(ngay_giao_du_kien)=@year
) as N'Thang2' ,
(
	SELECT SUM(tong_tien)
	FROM donhangs
	WHERE MONTH(ngay_giao_du_kien) = 3
	AND YEAR(ngay_giao_du_kien)=@year
) as N'Thang3' ,
(
	SELECT SUM(tong_tien)
	FROM donhangs
	WHERE MONTH(ngay_giao_du_kien) = 4
	AND YEAR(ngay_giao_du_kien)=@year
) as N'Thang4' ,
(
	SELECT SUM(tong_tien)
	FROM donhangs
	WHERE MONTH(ngay_giao_du_kien) = 5
	AND YEAR(ngay_giao_du_kien)=@year
) as N'Thang5' ,
(
	SELECT SUM(tong_tien)
	FROM donhangs
	WHERE MONTH(ngay_giao_du_kien) = 6
	AND YEAR(ngay_giao_du_kien)=@year
) as N'Thang6' ,
(
	SELECT SUM(tong_tien)
	FROM donhangs
	WHERE MONTH(ngay_giao_du_kien) = 7
	AND YEAR(ngay_giao_du_kien)=@year
) as N'Thang7' ,
(
	SELECT SUM(tong_tien)
	FROM donhangs
	WHERE MONTH(ngay_giao_du_kien) = 8
	AND YEAR(ngay_giao_du_kien)=@year
) as N'Thang8' ,
(
	SELECT SUM(tong_tien)
	FROM donhangs
	WHERE MONTH(ngay_giao_du_kien) = 9
	AND YEAR(ngay_giao_du_kien)=@year
) as N'Thang9' ,
(
	SELECT SUM(tong_tien)
	FROM donhangs
	WHERE MONTH(ngay_giao_du_kien) = 10
	AND YEAR(ngay_giao_du_kien)=@year
) as N'Thang10' ,
(
	SELECT SUM(tong_tien)
	FROM donhangs
	WHERE MONTH(ngay_giao_du_kien) = 11
	AND YEAR(ngay_giao_du_kien)=@year
) as N'Thang11' ,
(
	SELECT SUM(tong_tien)
	FROM donhangs
	WHERE MONTH(ngay_giao_du_kien) = 12
	AND YEAR(ngay_giao_du_kien)=@year
) as N'Thang12' 

--exec DOANH_THU_NAM 2020


--select * from donhangs
--select * from chitietdonhangs
GO
