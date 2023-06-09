USE [master]
GO
/****** Object:  Database [ProductDb]    Script Date: 13.03.2023 21:31:34 ******/
CREATE DATABASE [ProductDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ProductDb', FILENAME = N'C:\Users\Kaptan\ProductDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ProductDb_log', FILENAME = N'C:\Users\Kaptan\ProductDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ProductDb] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ProductDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ProductDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ProductDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ProductDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ProductDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ProductDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [ProductDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ProductDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ProductDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ProductDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ProductDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ProductDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ProductDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ProductDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ProductDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ProductDb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ProductDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ProductDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ProductDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ProductDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ProductDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ProductDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ProductDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ProductDb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ProductDb] SET  MULTI_USER 
GO
ALTER DATABASE [ProductDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ProductDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ProductDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ProductDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ProductDb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ProductDb] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ProductDb] SET QUERY_STORE = OFF
GO
USE [ProductDb]
GO
/****** Object:  Table [dbo].[tblUrunler]    Script Date: 13.03.2023 21:31:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUrunler](
	[UrunID] [int] IDENTITY(1,1) NOT NULL,
	[UrunAd] [varchar](30) NULL,
	[Stok] [smallint] NULL,
	[AlisFiyat] [decimal](18, 2) NULL,
	[SatisFiyat] [decimal](18, 2) NULL,
	[Kategori] [int] NULL,
 CONSTRAINT [PK_tblUrunler] PRIMARY KEY CLUSTERED 
(
	[UrunID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblMusteri]    Script Date: 13.03.2023 21:31:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMusteri](
	[MusteriID] [int] IDENTITY(1,1) NOT NULL,
	[Ad] [varchar](20) NULL,
	[Soyad] [varchar](20) NULL,
	[Sehir] [varchar](20) NULL,
	[Bakiye] [decimal](18, 2) NULL,
 CONSTRAINT [PK_tblMusteri] PRIMARY KEY CLUSTERED 
(
	[MusteriID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblSatislar]    Script Date: 13.03.2023 21:31:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSatislar](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Urun] [int] NULL,
	[Musteri] [int] NULL,
	[Adet] [int] NULL,
	[Fiyat] [decimal](18, 2) NULL,
	[Toplam] [decimal](18, 2) NULL,
	[Tarih] [datetime] NULL,
 CONSTRAINT [PK_tblSatislar] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[View_1]    Script Date: 13.03.2023 21:31:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_1]
AS
SELECT        dbo.tblSatislar.ID, dbo.tblUrunler.UrunAd, dbo.tblMusteri.Ad, dbo.tblMusteri.Soyad, dbo.tblSatislar.Adet, dbo.tblSatislar.Fiyat, dbo.tblSatislar.Toplam, dbo.tblSatislar.Tarih
FROM            dbo.tblSatislar INNER JOIN
                         dbo.tblMusteri ON dbo.tblSatislar.Musteri = dbo.tblMusteri.MusteriID INNER JOIN
                         dbo.tblUrunler ON dbo.tblSatislar.Urun = dbo.tblUrunler.UrunID
GO
/****** Object:  Table [dbo].[tblAdmin]    Script Date: 13.03.2023 21:31:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAdmin](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Kullanici] [varchar](10) NULL,
	[Sifre] [varchar](10) NULL,
 CONSTRAINT [PK_tblAdmin] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblKategori]    Script Date: 13.03.2023 21:31:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblKategori](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Ad] [varchar](50) NULL,
 CONSTRAINT [PK_tblKategori] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblStok]    Script Date: 13.03.2023 21:31:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblStok](
	[Adet] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblStoklar]    Script Date: 13.03.2023 21:31:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblStoklar](
	[Adet] [int] NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tblAdmin] ON 

INSERT [dbo].[tblAdmin] ([ID], [Kullanici], [Sifre]) VALUES (1, N'cptmfs', N'8008')
INSERT [dbo].[tblAdmin] ([ID], [Kullanici], [Sifre]) VALUES (2, N'kbilisim', N'1334')
INSERT [dbo].[tblAdmin] ([ID], [Kullanici], [Sifre]) VALUES (3, N'seymahacat', N'sey123')
SET IDENTITY_INSERT [dbo].[tblAdmin] OFF
GO
SET IDENTITY_INSERT [dbo].[tblKategori] ON 

INSERT [dbo].[tblKategori] ([ID], [Ad]) VALUES (1, N'Beyaz Esya')
INSERT [dbo].[tblKategori] ([ID], [Ad]) VALUES (2, N'Bilgisayar')
INSERT [dbo].[tblKategori] ([ID], [Ad]) VALUES (3, N'Küçük Ev Aletleri')
INSERT [dbo].[tblKategori] ([ID], [Ad]) VALUES (5, N'Telefon ve Tablet')
INSERT [dbo].[tblKategori] ([ID], [Ad]) VALUES (1003, N'Mobilya')
SET IDENTITY_INSERT [dbo].[tblKategori] OFF
GO
SET IDENTITY_INSERT [dbo].[tblMusteri] ON 

INSERT [dbo].[tblMusteri] ([MusteriID], [Ad], [Soyad], [Sehir], [Bakiye]) VALUES (1, N'Muhammed  Ferit', N'Simsek', N'Istanbul', CAST(10000.00 AS Decimal(18, 2)))
INSERT [dbo].[tblMusteri] ([MusteriID], [Ad], [Soyad], [Sehir], [Bakiye]) VALUES (2, N'Tahir', N'Ucar', N'Kocaeli', CAST(36000.00 AS Decimal(18, 2)))
INSERT [dbo].[tblMusteri] ([MusteriID], [Ad], [Soyad], [Sehir], [Bakiye]) VALUES (3, N'Ali', N'Simsek', N'Istanbul', CAST(28000.00 AS Decimal(18, 2)))
INSERT [dbo].[tblMusteri] ([MusteriID], [Ad], [Soyad], [Sehir], [Bakiye]) VALUES (4, N'Mehmet Nuri', N'Sariel', N'Eskisehir', CAST(18000.00 AS Decimal(18, 2)))
INSERT [dbo].[tblMusteri] ([MusteriID], [Ad], [Soyad], [Sehir], [Bakiye]) VALUES (5, N'Resul', N'Altintas', N'Mus', CAST(48500.00 AS Decimal(18, 2)))
INSERT [dbo].[tblMusteri] ([MusteriID], [Ad], [Soyad], [Sehir], [Bakiye]) VALUES (6, N'Baris', N'Aktas', N'Corum', CAST(36850.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[tblMusteri] OFF
GO
SET IDENTITY_INSERT [dbo].[tblSatislar] ON 

INSERT [dbo].[tblSatislar] ([ID], [Urun], [Musteri], [Adet], [Fiyat], [Toplam], [Tarih]) VALUES (1, 2, 1, 1, CAST(9000.00 AS Decimal(18, 2)), CAST(9000.00 AS Decimal(18, 2)), CAST(N'2023-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[tblSatislar] ([ID], [Urun], [Musteri], [Adet], [Fiyat], [Toplam], [Tarih]) VALUES (2, 5, 1, 2, CAST(2200.00 AS Decimal(18, 2)), CAST(4400.00 AS Decimal(18, 2)), CAST(N'2023-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[tblSatislar] ([ID], [Urun], [Musteri], [Adet], [Fiyat], [Toplam], [Tarih]) VALUES (3, 6, 2, 3, CAST(750.00 AS Decimal(18, 2)), CAST(2250.00 AS Decimal(18, 2)), CAST(N'2023-02-02T00:00:00.000' AS DateTime))
INSERT [dbo].[tblSatislar] ([ID], [Urun], [Musteri], [Adet], [Fiyat], [Toplam], [Tarih]) VALUES (4, 1005, 3, 2, CAST(11000.00 AS Decimal(18, 2)), CAST(11000.00 AS Decimal(18, 2)), CAST(N'2023-03-10T00:00:00.000' AS DateTime))
INSERT [dbo].[tblSatislar] ([ID], [Urun], [Musteri], [Adet], [Fiyat], [Toplam], [Tarih]) VALUES (5, 8, 4, 4, CAST(1300.00 AS Decimal(18, 2)), CAST(5200.00 AS Decimal(18, 2)), CAST(N'2023-03-07T00:00:00.000' AS DateTime))
INSERT [dbo].[tblSatislar] ([ID], [Urun], [Musteri], [Adet], [Fiyat], [Toplam], [Tarih]) VALUES (6, 4, 5, 1, CAST(17500.00 AS Decimal(18, 2)), CAST(17500.00 AS Decimal(18, 2)), CAST(N'2023-02-18T00:00:00.000' AS DateTime))
INSERT [dbo].[tblSatislar] ([ID], [Urun], [Musteri], [Adet], [Fiyat], [Toplam], [Tarih]) VALUES (7, 3, 1, 1, CAST(22500.00 AS Decimal(18, 2)), CAST(22500.00 AS Decimal(18, 2)), CAST(N'2023-02-22T00:00:00.000' AS DateTime))
INSERT [dbo].[tblSatislar] ([ID], [Urun], [Musteri], [Adet], [Fiyat], [Toplam], [Tarih]) VALUES (8, 1007, 6, 2, CAST(3000.00 AS Decimal(18, 2)), CAST(3000.00 AS Decimal(18, 2)), CAST(N'2023-03-13T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[tblSatislar] OFF
GO
INSERT [dbo].[tblStok] ([Adet]) VALUES (16)
GO
INSERT [dbo].[tblStoklar] ([Adet]) VALUES (893)
GO
SET IDENTITY_INSERT [dbo].[tblUrunler] ON 

INSERT [dbo].[tblUrunler] ([UrunID], [UrunAd], [Stok], [AlisFiyat], [SatisFiyat], [Kategori]) VALUES (1, N'Çamasir Makinesi', 50, CAST(11000.00 AS Decimal(18, 2)), CAST(14000.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[tblUrunler] ([UrunID], [UrunAd], [Stok], [AlisFiyat], [SatisFiyat], [Kategori]) VALUES (2, N'Bulasik Makinesi', 29, CAST(9000.00 AS Decimal(18, 2)), CAST(15000.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[tblUrunler] ([UrunID], [UrunAd], [Stok], [AlisFiyat], [SatisFiyat], [Kategori]) VALUES (3, N'LENOVO Thinkpad T470', 20, CAST(17500.00 AS Decimal(18, 2)), CAST(22500.00 AS Decimal(18, 2)), 2)
INSERT [dbo].[tblUrunler] ([UrunID], [UrunAd], [Stok], [AlisFiyat], [SatisFiyat], [Kategori]) VALUES (4, N'DELL Latitude 7420', 10, CAST(14500.00 AS Decimal(18, 2)), CAST(17500.00 AS Decimal(18, 2)), 2)
INSERT [dbo].[tblUrunler] ([UrunID], [UrunAd], [Stok], [AlisFiyat], [SatisFiyat], [Kategori]) VALUES (5, N'Ütü', 50, CAST(1900.00 AS Decimal(18, 2)), CAST(2100.00 AS Decimal(18, 2)), 3)
INSERT [dbo].[tblUrunler] ([UrunID], [UrunAd], [Stok], [AlisFiyat], [SatisFiyat], [Kategori]) VALUES (6, N'Su isitici', 100, CAST(550.00 AS Decimal(18, 2)), CAST(750.00 AS Decimal(18, 2)), 3)
INSERT [dbo].[tblUrunler] ([UrunID], [UrunAd], [Stok], [AlisFiyat], [SatisFiyat], [Kategori]) VALUES (7, N'Buz Dolabi', 15, CAST(18000.00 AS Decimal(18, 2)), CAST(23000.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[tblUrunler] ([UrunID], [UrunAd], [Stok], [AlisFiyat], [SatisFiyat], [Kategori]) VALUES (8, N'Avize', 250, CAST(900.00 AS Decimal(18, 2)), CAST(1300.00 AS Decimal(18, 2)), 3)
INSERT [dbo].[tblUrunler] ([UrunID], [UrunAd], [Stok], [AlisFiyat], [SatisFiyat], [Kategori]) VALUES (1004, N'Thinkpad X1 Yoga', 300, CAST(18000.00 AS Decimal(18, 2)), CAST(21000.00 AS Decimal(18, 2)), 2)
INSERT [dbo].[tblUrunler] ([UrunID], [UrunAd], [Stok], [AlisFiyat], [SatisFiyat], [Kategori]) VALUES (1005, N'Kurutma Makinesi', 20, CAST(9000.00 AS Decimal(18, 2)), CAST(11000.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[tblUrunler] ([UrunID], [UrunAd], [Stok], [AlisFiyat], [SatisFiyat], [Kategori]) VALUES (1006, N'Kahve Makinesi', 60, CAST(2500.00 AS Decimal(18, 2)), CAST(3500.00 AS Decimal(18, 2)), 3)
INSERT [dbo].[tblUrunler] ([UrunID], [UrunAd], [Stok], [AlisFiyat], [SatisFiyat], [Kategori]) VALUES (1007, N'Xiaomi AirFreyer', 80, CAST(2000.00 AS Decimal(18, 2)), CAST(3000.00 AS Decimal(18, 2)), 3)
INSERT [dbo].[tblUrunler] ([UrunID], [UrunAd], [Stok], [AlisFiyat], [SatisFiyat], [Kategori]) VALUES (1008, N'Mi Robot Süpürge', 70, CAST(3200.00 AS Decimal(18, 2)), CAST(4000.00 AS Decimal(18, 2)), 3)
INSERT [dbo].[tblUrunler] ([UrunID], [UrunAd], [Stok], [AlisFiyat], [SatisFiyat], [Kategori]) VALUES (1009, N'Iphone 14 Pro Max', 66, CAST(47500.00 AS Decimal(18, 2)), CAST(51250.00 AS Decimal(18, 2)), 5)
INSERT [dbo].[tblUrunler] ([UrunID], [UrunAd], [Stok], [AlisFiyat], [SatisFiyat], [Kategori]) VALUES (2002, N'Iphone 13', 18, CAST(25999.00 AS Decimal(18, 2)), CAST(27999.00 AS Decimal(18, 2)), 5)
INSERT [dbo].[tblUrunler] ([UrunID], [UrunAd], [Stok], [AlisFiyat], [SatisFiyat], [Kategori]) VALUES (2004, N'iPad Gen 9 ', 22, CAST(7000.00 AS Decimal(18, 2)), CAST(7999.00 AS Decimal(18, 2)), 5)
INSERT [dbo].[tblUrunler] ([UrunID], [UrunAd], [Stok], [AlisFiyat], [SatisFiyat], [Kategori]) VALUES (2006, N'Tost Makinesi', 10, CAST(780.00 AS Decimal(18, 2)), CAST(900.00 AS Decimal(18, 2)), 3)
INSERT [dbo].[tblUrunler] ([UrunID], [UrunAd], [Stok], [AlisFiyat], [SatisFiyat], [Kategori]) VALUES (2007, N'Yatak Odasi Takimi', 5, CAST(18000.00 AS Decimal(18, 2)), CAST(25000.00 AS Decimal(18, 2)), 1003)
INSERT [dbo].[tblUrunler] ([UrunID], [UrunAd], [Stok], [AlisFiyat], [SatisFiyat], [Kategori]) VALUES (2008, N'Mouse', 280, CAST(150.00 AS Decimal(18, 2)), CAST(190.00 AS Decimal(18, 2)), 2)
SET IDENTITY_INSERT [dbo].[tblUrunler] OFF
GO
ALTER TABLE [dbo].[tblSatislar]  WITH CHECK ADD  CONSTRAINT [FK_tblSatislar_tblMusteri] FOREIGN KEY([Musteri])
REFERENCES [dbo].[tblMusteri] ([MusteriID])
GO
ALTER TABLE [dbo].[tblSatislar] CHECK CONSTRAINT [FK_tblSatislar_tblMusteri]
GO
ALTER TABLE [dbo].[tblSatislar]  WITH CHECK ADD  CONSTRAINT [FK_tblSatislar_tblUrunler] FOREIGN KEY([Urun])
REFERENCES [dbo].[tblUrunler] ([UrunID])
GO
ALTER TABLE [dbo].[tblSatislar] CHECK CONSTRAINT [FK_tblSatislar_tblUrunler]
GO
ALTER TABLE [dbo].[tblUrunler]  WITH CHECK ADD  CONSTRAINT [FK_tblUrunler_tblKategori] FOREIGN KEY([Kategori])
REFERENCES [dbo].[tblKategori] ([ID])
GO
ALTER TABLE [dbo].[tblUrunler] CHECK CONSTRAINT [FK_tblUrunler_tblKategori]
GO
/****** Object:  StoredProcedure [dbo].[SatislarListesi]    Script Date: 13.03.2023 21:31:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[SatislarListesi]
as
Select ID,Urun,Musteri,Adet,Fiyat,Toplam,Tarih,UrunAd,Ad+' '+Soyad as 'Müsteri Ad Soyad' from tblSatislar
inner join tblUrunler on tblSatislar.Urun=tblUrunler.UrunID
inner join tblMusteri on tblSatislar.Musteri=tblMusteri.MusteriID


GO
/****** Object:  StoredProcedure [dbo].[SatisListesi]    Script Date: 13.03.2023 21:31:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[SatisListesi]
as
Select ID,UrunAd,Adet,Ad+' '+Soyad as 'AD Soyad',Fiyat,Toplam,Tarih from tblSatislar
inner join tblUrunler on tblSatislar.Urun=tblUrunler.UrunID
inner join tblMusteri on tblSatislar.Musteri=tblMusteri.MusteriID
GO
/****** Object:  StoredProcedure [dbo].[UrunGetir]    Script Date: 13.03.2023 21:31:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Create Procedure SatislarListesi
--as
--Select ID,UrunAd,Adet,Ad+' '+Soyad as 'Ad Soyad',Fiyat,Toplam,Tarih from tblSatislar
--inner join tblUrunler on tblSatislar.Urun=tblUrunler.UrunID
--inner join tblMusteri on tblSatislar.Musteri=tblMusteri.MusteriID


--Execute SatisListesi
Create Procedure [dbo].[UrunGetir](@ID int)
as
select * from tblUrunler where UrunID=@ID
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "tblSatislar"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 194
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblMusteri"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 185
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblUrunler"
            Begin Extent = 
               Top = 6
               Left = 454
               Bottom = 200
               Right = 624
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_1'
GO
USE [master]
GO
ALTER DATABASE [ProductDb] SET  READ_WRITE 
GO
