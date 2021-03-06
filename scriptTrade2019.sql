USE [master]
GO
/****** Object:  Database [Trade]    Script Date: 09.06.2022 21:48:28 ******/
CREATE DATABASE [Trade]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Trade', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS01\MSSQL\DATA\Trade.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Trade_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS01\MSSQL\DATA\Trade_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Trade] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Trade].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Trade] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Trade] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Trade] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Trade] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Trade] SET ARITHABORT OFF 
GO
ALTER DATABASE [Trade] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Trade] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Trade] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Trade] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Trade] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Trade] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Trade] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Trade] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Trade] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Trade] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Trade] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Trade] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Trade] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Trade] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Trade] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Trade] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Trade] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Trade] SET RECOVERY FULL 
GO
ALTER DATABASE [Trade] SET  MULTI_USER 
GO
ALTER DATABASE [Trade] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Trade] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Trade] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Trade] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Trade] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Trade] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Trade] SET QUERY_STORE = OFF
GO
USE [Trade]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 09.06.2022 21:48:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryID] [int] NOT NULL,
	[CategoryName] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manufacturer]    Script Date: 09.06.2022 21:48:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manufacturer](
	[ManufacturerID] [int] NOT NULL,
	[ManufacturerName] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Manufacturer] PRIMARY KEY CLUSTERED 
(
	[ManufacturerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 09.06.2022 21:48:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [int] NOT NULL,
	[OrderStatus] [int] NOT NULL,
	[OrderDeliveryDate] [date] NOT NULL,
	[OrderPickupPoint] [int] NOT NULL,
	[OrderUser] [int] NOT NULL,
	[OrderDate] [date] NOT NULL,
	[OrderReceivingCode] [int] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderProduct]    Script Date: 09.06.2022 21:48:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderProduct](
	[OrderID] [int] NOT NULL,
	[ProductArticleNumber] [nvarchar](100) NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_OrderProduct] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[ProductArticleNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderStatus]    Script Date: 09.06.2022 21:48:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderStatus](
	[StatusID] [int] NOT NULL,
	[StatusName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_OrderStatus] PRIMARY KEY CLUSTERED 
(
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PickupPoint]    Script Date: 09.06.2022 21:48:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PickupPoint](
	[PickupPointID] [int] NOT NULL,
	[PostalCode] [varchar](6) NOT NULL,
	[Town] [nvarchar](100) NOT NULL,
	[Address] [nvarchar](100) NOT NULL,
	[House] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_PickupPoint] PRIMARY KEY CLUSTERED 
(
	[PickupPointID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 09.06.2022 21:48:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductArticleNumber] [nvarchar](100) NOT NULL,
	[ProductName] [nvarchar](max) NOT NULL,
	[ProductDescription] [nvarchar](max) NOT NULL,
	[ProductCategory] [int] NOT NULL,
	[ProductPhoto] [varchar](100) NOT NULL,
	[ProductManufacturer] [int] NOT NULL,
	[ProductCost] [decimal](19, 4) NOT NULL,
	[ProductDiscountAmount] [tinyint] NULL,
	[ProductCurrentDiscount] [tinyint] NULL,
	[ProductQuantityInStock] [int] NOT NULL,
	[ProductStatus] [int] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductArticleNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 09.06.2022 21:48:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [int] NOT NULL,
	[RoleName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 09.06.2022 21:48:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[StatusID] [int] IDENTITY(1,1) NOT NULL,
	[StatusName] [varchar](4) NOT NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 09.06.2022 21:48:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] NOT NULL,
	[UserSurname] [nvarchar](100) NULL,
	[UserName] [nvarchar](100) NULL,
	[UserPatronymic] [nvarchar](100) NULL,
	[UserLogin] [nvarchar](max) NULL,
	[UserPassword] [nvarchar](max) NULL,
	[UserRole] [int] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (1, N'Серьги')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (2, N'Подвеска')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (3, N'Ожерелье')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (4, N'Браслет')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (5, N'Брошь')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (6, N'Кольцо')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (7, N'Колье')
GO
INSERT [dbo].[Manufacturer] ([ManufacturerID], [ManufacturerName]) VALUES (1, N'ЮвелирКарат')
INSERT [dbo].[Manufacturer] ([ManufacturerID], [ManufacturerName]) VALUES (2, N'ЮвелирТорг')
GO
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint], [OrderUser], [OrderDate], [OrderReceivingCode]) VALUES (1, 1, CAST(N'2022-05-16' AS Date), 15, 11, CAST(N'2022-05-10' AS Date), 931)
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint], [OrderUser], [OrderDate], [OrderReceivingCode]) VALUES (2, 1, CAST(N'2022-05-17' AS Date), 36, 7, CAST(N'2022-05-11' AS Date), 932)
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint], [OrderUser], [OrderDate], [OrderReceivingCode]) VALUES (3, 1, CAST(N'2022-05-19' AS Date), 18, 9, CAST(N'2022-05-13' AS Date), 933)
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint], [OrderUser], [OrderDate], [OrderReceivingCode]) VALUES (4, 1, CAST(N'2022-05-19' AS Date), 11, 11, CAST(N'2022-05-13' AS Date), 934)
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint], [OrderUser], [OrderDate], [OrderReceivingCode]) VALUES (5, 1, CAST(N'2022-05-20' AS Date), 10, 11, CAST(N'2022-05-14' AS Date), 935)
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint], [OrderUser], [OrderDate], [OrderReceivingCode]) VALUES (6, 1, CAST(N'2022-05-22' AS Date), 34, 11, CAST(N'2022-05-16' AS Date), 936)
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint], [OrderUser], [OrderDate], [OrderReceivingCode]) VALUES (7, 1, CAST(N'2022-05-22' AS Date), 3, 11, CAST(N'2022-05-16' AS Date), 937)
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint], [OrderUser], [OrderDate], [OrderReceivingCode]) VALUES (8, 1, CAST(N'2022-05-23' AS Date), 20, 11, CAST(N'2022-05-17' AS Date), 938)
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint], [OrderUser], [OrderDate], [OrderReceivingCode]) VALUES (9, 1, CAST(N'2022-05-23' AS Date), 20, 8, CAST(N'2022-05-17' AS Date), 939)
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint], [OrderUser], [OrderDate], [OrderReceivingCode]) VALUES (10, 1, CAST(N'2022-05-23' AS Date), 25, 10, CAST(N'2022-05-17' AS Date), 940)
GO
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Quantity]) VALUES (1, N'G843Y6', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Quantity]) VALUES (1, N'А112Т4', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Quantity]) VALUES (2, N'D493Y7', 2)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Quantity]) VALUES (2, N'S648N6', 2)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Quantity]) VALUES (3, N'C635R4', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Quantity]) VALUES (3, N'F735H6', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Quantity]) VALUES (4, N'S538J7', 5)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Quantity]) VALUES (4, N'V835G5', 5)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Quantity]) VALUES (5, N'P846H6', 2)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Quantity]) VALUES (5, N'S530N6', 2)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Quantity]) VALUES (6, N'S530N6', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Quantity]) VALUES (6, N'S844B6', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Quantity]) VALUES (7, N'B846B6', 4)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Quantity]) VALUES (7, N'L486B6', 2)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Quantity]) VALUES (8, N'F047G5', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Quantity]) VALUES (8, N'H845N5', 2)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Quantity]) VALUES (9, N'B835H6', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Quantity]) VALUES (9, N'C453B6', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Quantity]) VALUES (10, N'B964G6', 4)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Quantity]) VALUES (10, N'N764H5', 5)
GO
INSERT [dbo].[OrderStatus] ([StatusID], [StatusName]) VALUES (1, N'Новый')
INSERT [dbo].[OrderStatus] ([StatusID], [StatusName]) VALUES (2, N'Завершённый')
GO
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalCode], [Town], [Address], [House]) VALUES (1, N'344288', N' г. Михайловка', N' ул. Чехова', N' 1')
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalCode], [Town], [Address], [House]) VALUES (2, N'614164', N' г. Михайловка', N'  ул. Степная', N' 30')
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalCode], [Town], [Address], [House]) VALUES (3, N'394242', N' г. Михайловка', N' ул. Коммунистическая', N' 43')
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalCode], [Town], [Address], [House]) VALUES (4, N'660540', N' г. Михайловка', N' ул. Солнечная', N' 25')
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalCode], [Town], [Address], [House]) VALUES (5, N'125837', N' г. Михайловка', N' ул. Шоссейная', N' 40')
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalCode], [Town], [Address], [House]) VALUES (6, N'125703', N' г. Михайловка', N' ул. Партизанская', N' 49')
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalCode], [Town], [Address], [House]) VALUES (7, N'625283', N' г. Михайловка', N' ул. Победы', N' 46')
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalCode], [Town], [Address], [House]) VALUES (8, N'614611', N' г. Михайловка', N' ул. Молодежная', N' 50')
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalCode], [Town], [Address], [House]) VALUES (9, N'454311', N' г. Михайловка', N' ул. Новая', N' 19')
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalCode], [Town], [Address], [House]) VALUES (10, N'660007', N' г. Михайловка', N' ул. Октябрьская', N' 19')
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalCode], [Town], [Address], [House]) VALUES (11, N'603036', N' г. Михайловка', N' ул. Садовая', N' 4')
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalCode], [Town], [Address], [House]) VALUES (12, N'450983', N' г.Михайловка', N' ул. Комсомольская', N' 26')
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalCode], [Town], [Address], [House]) VALUES (13, N'394782', N' г. Михайловка', N' ул. Чехова', N' 3')
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalCode], [Town], [Address], [House]) VALUES (14, N'603002', N' г. Михайловка', N' ул. Дзержинского', N' 28')
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalCode], [Town], [Address], [House]) VALUES (15, N'450558', N' г. Михайловка', N' ул. Набережная', N' 30')
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalCode], [Town], [Address], [House]) VALUES (16, N'394060', N' г.Михайловка', N' ул. Фрунзе', N' 43')
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalCode], [Town], [Address], [House]) VALUES (17, N'410661', N' г. Михайловка', N' ул. Школьная', N' 50')
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalCode], [Town], [Address], [House]) VALUES (18, N'625590', N' г. Михайловка', N' ул. Коммунистическая', N' 20')
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalCode], [Town], [Address], [House]) VALUES (19, N'625683', N' г. Михайловка', N' ул. Марта', N' 8')
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalCode], [Town], [Address], [House]) VALUES (20, N'400562', N' г. Михайловка', N' ул. Зеленая', N' 32')
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalCode], [Town], [Address], [House]) VALUES (21, N'614510', N' г. Михайловка', N' ул. Маяковского', N' 47')
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalCode], [Town], [Address], [House]) VALUES (22, N'410542', N' г. Михайловка', N' ул. Светлая', N' 46')
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalCode], [Town], [Address], [House]) VALUES (23, N'620839', N' г. Михайловка', N' ул. Цветочная', N' 8')
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalCode], [Town], [Address], [House]) VALUES (24, N'443890', N' г. Михайловка', N' ул. Коммунистическая', N' 1')
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalCode], [Town], [Address], [House]) VALUES (25, N'603379', N' г. Михайловка', N' ул. Спортивная', N' 46')
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalCode], [Town], [Address], [House]) VALUES (26, N'603721', N' г. Михайловка', N' ул. Гоголя', N' 41')
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalCode], [Town], [Address], [House]) VALUES (27, N'410172', N' г. Михайловка', N' ул. Северная', N' 13')
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalCode], [Town], [Address], [House]) VALUES (28, N'420151', N' г. Михайловка', N' ул. Вишневая', N' 32')
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalCode], [Town], [Address], [House]) VALUES (29, N'125061', N' г. Михайловка', N' ул. Подгорная', N' 8')
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalCode], [Town], [Address], [House]) VALUES (30, N'630370', N' г. Михайловка', N' ул. Шоссейная', N' 24')
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalCode], [Town], [Address], [House]) VALUES (31, N'614753', N' г. Михайловка', N' ул. Полевая', N' 35')
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalCode], [Town], [Address], [House]) VALUES (32, N'426030', N' г. Михайловка', N' ул. Маяковского', N' 44')
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalCode], [Town], [Address], [House]) VALUES (33, N'450375', N' г. Михайловка ', N' ул. Клубная', N'44')
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalCode], [Town], [Address], [House]) VALUES (34, N'625560', N' г. Михайловка', N' ул. Некрасова', N' 12')
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalCode], [Town], [Address], [House]) VALUES (35, N'630201', N' г. Михайловка', N' ул. Комсомольская', N' 17')
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalCode], [Town], [Address], [House]) VALUES (36, N'190949', N' г. Михайловка', N' ул. Мичурина', N' 26')
GO
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductCurrentDiscount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'A485H6', N'Кольцо', N'Кольцо из серебра с позолотой', 6, N'picture.png', 1, CAST(1110.0000 AS Decimal(19, 4)), 5, 4, 11, 1)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductCurrentDiscount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'B835H6', N'Колье', N'Ювелирное колье из серебра 925 пробы с фианитами', 7, N'picture.png', 1, CAST(2600.0000 AS Decimal(19, 4)), 20, 4, 5, 1)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductCurrentDiscount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'B845B6', N'Серьги', N'Серьги с фианитами и гематитами из серебра с позолотой', 1, N'picture.png', 2, CAST(5200.0000 AS Decimal(19, 4)), 30, 3, 6, 1)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductCurrentDiscount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'B846B6', N'Браслет', N'Браслет из золота "Бесконечность" яхонт', 4, N'picture.png', 1, CAST(5900.0000 AS Decimal(19, 4)), 15, 3, 6, 1)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductCurrentDiscount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'B936H6', N'Колье', N'Колье Эстет Золотое колье', 7, N'picture.png', 2, CAST(17500.0000 AS Decimal(19, 4)), 5, 3, 9, 1)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductCurrentDiscount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'B964G6', N'Подвеска', N'Подвеска с 1 бриллиантом из красного золота', 2, N'picture.png', 2, CAST(5350.0000 AS Decimal(19, 4)), 5, 2, 6, 1)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductCurrentDiscount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'C453B6', N'Подвеска', N'Подвеска из красного золота', 2, N'picture.png', 1, CAST(5300.0000 AS Decimal(19, 4)), 25, 2, 16, 1)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductCurrentDiscount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'C635R4', N'Ожерелье', N'Ожерелье Lace (муассанит, круг, BS Regular, 6,5мм, 2 муассанит Кр-57 6мм', 3, N'C635R4.jpg', 2, CAST(590000.0000 AS Decimal(19, 4)), 10, 2, 16, 1)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductCurrentDiscount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'D493Y7', N'Ожерелье', N'Ожерелье Cordelia (муассанит, 11шт, 3,5мм, круг, BS Regular, 40см', 3, N'D493Y7.jpg', 1, CAST(79000.0000 AS Decimal(19, 4)), 30, 3, 2, 1)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductCurrentDiscount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'D936R6', N'Серьги', N'Серьги со стразами Swarovski 2129919/96П Ювелир Карат', 1, N'D936R6.jpg', 2, CAST(890.0000 AS Decimal(19, 4)), 30, 3, 6, 1)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductCurrentDiscount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'F047G5', N'Брошь', N'Брошь PLATINA jewelry из серебра 925 пробы с эмалью', 5, N'picture.png', 1, CAST(7100.0000 AS Decimal(19, 4)), 10, 3, 2, 1)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductCurrentDiscount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'F735H6', N'Серьги', N'Серьги из золота с эмалью', 1, N'F735H6.jpg', 2, CAST(12000.0000 AS Decimal(19, 4)), 5, 4, 5, 1)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductCurrentDiscount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'G836H6', N'Подвеска', N'Подвеска серебряная в позолоте с фианитами 2139189/9п Ювелир Карат', 2, N'G836H6.jpg', 2, CAST(140.0000 AS Decimal(19, 4)), 10, 2, 16, 1)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductCurrentDiscount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'G843Y6', N'Подвеска', N'Подвеска серебряная с фианитами 2138729/9 Ювелир Карат', 2, N'G843Y6.jpg', 2, CAST(240.0000 AS Decimal(19, 4)), 25, 3, 6, 1)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductCurrentDiscount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'H845N5', N'Серьги', N'Серьги из серебра с позолотой', 1, N'picture.png', 2, CAST(2400.0000 AS Decimal(19, 4)), 25, 4, 5, 1)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductCurrentDiscount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'K943G6', N'Серьги', N'Серьги из золота с эмалью', 1, N'picture.png', 2, CAST(11545.0000 AS Decimal(19, 4)), 25, 3, 2, 1)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductCurrentDiscount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'L486B6', N'Серьги', N'Серьги из красного золота', 1, N'picture.png', 1, CAST(7000.0000 AS Decimal(19, 4)), 30, 2, 16, 1)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductCurrentDiscount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'L596G5', N'Серьги', N'Серьги из красного золота', 1, N'picture.png', 2, CAST(11000.0000 AS Decimal(19, 4)), 15, 3, 6, 1)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductCurrentDiscount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'N385N6', N'Серьги', N'Серьги-продевки из золота с фианитами', 1, N'picture.png', 1, CAST(6200.0000 AS Decimal(19, 4)), 20, 4, 5, 1)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductCurrentDiscount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'N764H5', N'Серьги', N'Платина Серьги из красного золота без камней', 1, N'picture.png', 1, CAST(10600.0000 AS Decimal(19, 4)), 10, 4, 3, 1)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductCurrentDiscount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'P033N7', N'Подвеска', N'Подвеска из красного золота', 2, N'picture.png', 1, CAST(4300.0000 AS Decimal(19, 4)), 5, 3, 2, 1)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductCurrentDiscount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'P846H6', N'Подвеска', N'Подвеска из красного золота П142-4547', 2, N'picture.png', 2, CAST(5195.0000 AS Decimal(19, 4)), 5, 3, 6, 1)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductCurrentDiscount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'S395J7', N'Серьги', N'Серьги из золота 029038', 1, N'S395J7.jpg', 1, CAST(7000.0000 AS Decimal(19, 4)), 25, 3, 6, 1)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductCurrentDiscount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'S530N6', N'Серьги', N'Серебряные серьги c ювелирной керамикой', 1, N'picture.png', 1, CAST(2900.0000 AS Decimal(19, 4)), 15, 2, 16, 1)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductCurrentDiscount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'S538J7', N'Серьги', N'Серьги с 4 фианитами из серебра с позолотой', 1, N'S538J7.jpg', 1, CAST(2300.0000 AS Decimal(19, 4)), 30, 3, 2, 1)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductCurrentDiscount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'S648N6', N'Серьги', N'Серьги "Бабочки" в позолоте', 1, N'S648N6.png', 1, CAST(990.0000 AS Decimal(19, 4)), 5, 4, 5, 1)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductCurrentDiscount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'S844B6', N'Подвеска', N'Подвеска из серебра с позолотой', 2, N'picture.png', 2, CAST(2100.0000 AS Decimal(19, 4)), 6, 3, 6, 1)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductCurrentDiscount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'V494H6', N'Подвеска', N'Подвеска серебряная с фианитами', 2, N'picture.png', 1, CAST(480.0000 AS Decimal(19, 4)), 15, 2, 12, 1)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductCurrentDiscount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'V835G5', N'Подвеска', N'Подвеска из золочёного серебра с фианитами', 2, N'picture.png', 1, CAST(695.0000 AS Decimal(19, 4)), 10, 3, 6, 1)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductCurrentDiscount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'А112Т4', N'Серьги', N'Серьги серебряные в позолоте продёвки на цепочке "Звезда"', 1, N'А112Т4.png', 1, CAST(590.0000 AS Decimal(19, 4)), 30, 3, 6, 1)
GO
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (1, N'Администратор')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (2, N'Менеджер')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (3, N'Клиент')
GO
SET IDENTITY_INSERT [dbo].[Status] ON 

INSERT [dbo].[Status] ([StatusID], [StatusName]) VALUES (1, N'есть')
INSERT [dbo].[Status] ([StatusID], [StatusName]) VALUES (2, N'нету')
SET IDENTITY_INSERT [dbo].[Status] OFF
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (1, N'Савин', N'Станислав', N'Гордеевич', N'dlh4o1tzrbse@yahoo.com', N'2L6KZG', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (2, N'Григорьева', N'Есения', N'Александровна', N'rdgm3tpai7ch@outlook.com', N'uzWC67', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (3, N'Копылова', N'Алиса', N'Кирилловна', N'048anwxsgze1@outlook.com', N'8ntwUp', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (4, N'Кузнецов', N'Лев', N'Фёдорович', N'9zg4lmtik3ja@yahoo.com', N'YOyhfR', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (5, N'Иванов', N'Михаил', N'Тимофеевич', N'1p4khxif7awq@mail.com', N'RSbvHv', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (6, N'Крюков', N'Тимофей', N'Ильич', N'zu56nc4l30xm@outlook.com', N'rwVDh9', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (7, N'Игнатов', N'Роман', N'Степанович', N'iuf9onrqs1l4@mail.com', N'LdNyos', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (8, N'Анисимова', N'Алисия', N'Сергеевна', N'hkonmlp8tdy2@mail.com', N'gynQMT', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (9, N'Лебедева', N'Софья', N'Марковна', N'9ovm3eqak0jz@mail.com', N'AtnDjr', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (10, N'Волков', N'Богдан', N'Денисович', N'5lfozwx7erq2@outlook.com', N'JlFRCZ', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (11, NULL, NULL, NULL, NULL, NULL, 3)
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_OrderStatus] FOREIGN KEY([OrderStatus])
REFERENCES [dbo].[OrderStatus] ([StatusID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_OrderStatus]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_PickupPoint] FOREIGN KEY([OrderPickupPoint])
REFERENCES [dbo].[PickupPoint] ([PickupPointID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_PickupPoint]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_User1] FOREIGN KEY([OrderUser])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_User1]
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD  CONSTRAINT [FK_OrderProduct_Order] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([OrderID])
GO
ALTER TABLE [dbo].[OrderProduct] CHECK CONSTRAINT [FK_OrderProduct_Order]
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD  CONSTRAINT [FK_OrderProduct_Product] FOREIGN KEY([ProductArticleNumber])
REFERENCES [dbo].[Product] ([ProductArticleNumber])
GO
ALTER TABLE [dbo].[OrderProduct] CHECK CONSTRAINT [FK_OrderProduct_Product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([ProductCategory])
REFERENCES [dbo].[Category] ([CategoryID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Manufacturer] FOREIGN KEY([ProductManufacturer])
REFERENCES [dbo].[Manufacturer] ([ManufacturerID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Manufacturer]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Status] FOREIGN KEY([ProductStatus])
REFERENCES [dbo].[Status] ([StatusID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Status]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role1] FOREIGN KEY([UserRole])
REFERENCES [dbo].[Role] ([RoleID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role1]
GO
USE [master]
GO
ALTER DATABASE [Trade] SET  READ_WRITE 
GO
