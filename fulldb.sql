USE [MGiangStore]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 25/10/2023 12:37:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[AccountId] [int] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](255) NOT NULL,
	[Password] [varchar](255) NOT NULL,
	[Fullname] [nvarchar](max) NOT NULL,
	[Avatar] [varchar](max) NULL,
	[DOB] [date] NULL,
	[Gender] [bit] NULL,
	[Phone] [varchar](50) NOT NULL,
	[Address] [nvarchar](max) NULL,
	[RoleId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AccountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Carts]    Script Date: 25/10/2023 12:37:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carts](
	[CartId] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[AccountId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CartId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 25/10/2023 12:37:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 25/10/2023 12:37:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderDetailId] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Price] [money] NOT NULL,
	[Discount] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 25/10/2023 12:37:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[AccountId] [int] NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[TotalAmount] [money] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 25/10/2023 12:37:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](max) NOT NULL,
	[ProductImage] [varchar](max) NOT NULL,
	[ProductDescription] [nvarchar](max) NULL,
	[CategoryId] [int] NOT NULL,
	[Price] [money] NOT NULL,
	[Discount] [float] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Active] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 25/10/2023 12:37:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Accounts] ON 

INSERT [dbo].[Accounts] ([AccountId], [Email], [Password], [Fullname], [Avatar], [DOB], [Gender], [Phone], [Address], [RoleId]) VALUES (1, N'Admin@gmail.com', N'123', N'Admin', N'IMG_6526.jpg', CAST(N'2023-07-23' AS Date), 1, N'123456', N'test', 1)
INSERT [dbo].[Accounts] ([AccountId], [Email], [Password], [Fullname], [Avatar], [DOB], [Gender], [Phone], [Address], [RoleId]) VALUES (2, N'giang@gmail.com', N'123456', N'Pham Minh GIang', N'IMG_9499.jpg', CAST(N'2001-01-01' AS Date), 1, N'123', N'hy', 2)
INSERT [dbo].[Accounts] ([AccountId], [Email], [Password], [Fullname], [Avatar], [DOB], [Gender], [Phone], [Address], [RoleId]) VALUES (3, N'string', N'123', N'Vo Viet Phuc Huy', N'IMG_3614.JPG', CAST(N'2023-07-22' AS Date), 1, N'123', N'NA', 2)
INSERT [dbo].[Accounts] ([AccountId], [Email], [Password], [Fullname], [Avatar], [DOB], [Gender], [Phone], [Address], [RoleId]) VALUES (4, N'phu@gmail.com', N'123456', N'Phu Nguyen Dinh', N'25dc0cac426a7ed8402e3261044787ea.jpg', CAST(N'2023-07-20' AS Date), 1, N'0964156248', N'Ha Noi', 2)
INSERT [dbo].[Accounts] ([AccountId], [Email], [Password], [Fullname], [Avatar], [DOB], [Gender], [Phone], [Address], [RoleId]) VALUES (5, N'dong@gmail.com', N'123456', N'dong', N'Coffin-meme-CraveFX-Mobile.jpg', CAST(N'2023-07-13' AS Date), 0, N'123', N'123', 2)
INSERT [dbo].[Accounts] ([AccountId], [Email], [Password], [Fullname], [Avatar], [DOB], [Gender], [Phone], [Address], [RoleId]) VALUES (1002, N'hanh@gmail.com', N'123', N'Hong Hanh', N'IMG_6745.jpg', CAST(N'2023-07-17' AS Date), 0, N'123', N'AN', 2)
INSERT [dbo].[Accounts] ([AccountId], [Email], [Password], [Fullname], [Avatar], [DOB], [Gender], [Phone], [Address], [RoleId]) VALUES (1003, N'thinh@gmail.com', N'123', N'thinh', N'IMG_6526.jpg', CAST(N'2023-06-28' AS Date), 1, N'123', N'hy', 1)
INSERT [dbo].[Accounts] ([AccountId], [Email], [Password], [Fullname], [Avatar], [DOB], [Gender], [Phone], [Address], [RoleId]) VALUES (1004, N'long@gmail.com', N'123', N'Pham Thanh Long', N'75cb0647934f9be6c49634ee72a3bcc1.jpg', CAST(N'2023-07-18' AS Date), 1, N'123', N'Ha Noi', 2)
INSERT [dbo].[Accounts] ([AccountId], [Email], [Password], [Fullname], [Avatar], [DOB], [Gender], [Phone], [Address], [RoleId]) VALUES (1005, N'test@gmail.com', N'123', N'Test Name', N'IMG_3463.JPG', CAST(N'2023-07-25' AS Date), 1, N'123', N'Hưng Yên', 2)
SET IDENTITY_INSERT [dbo].[Accounts] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (1, N'Moto')
INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (2, N'Car')
INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (3, N'Plane')
INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (4, N'Train')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderID], [ProductId], [Quantity], [Price], [Discount]) VALUES (5, 6, 1014, 2, 460000.0000, 0.2)
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderID], [ProductId], [Quantity], [Price], [Discount]) VALUES (6, 6, 1005, 1, 350000.0000, 0.1)
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderID], [ProductId], [Quantity], [Price], [Discount]) VALUES (7, 7, 1012, 2, 315000.0000, 0.1)
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderID], [ProductId], [Quantity], [Price], [Discount]) VALUES (1002, 1002, 1019, 1, 850000.0000, 0.2)
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderID], [ProductId], [Quantity], [Price], [Discount]) VALUES (1003, 1002, 1005, 1, 350000.0000, 0.1)
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderID], [ProductId], [Quantity], [Price], [Discount]) VALUES (1004, 1003, 1005, 1, 350000.0000, 0.1)
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderID], [ProductId], [Quantity], [Price], [Discount]) VALUES (1005, 1003, 1019, 1, 850000.0000, 0.2)
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderID], [ProductId], [Quantity], [Price], [Discount]) VALUES (1006, 1004, 1020, 3, 680000.0000, 0.1)
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderID], [ProductId], [Quantity], [Price], [Discount]) VALUES (1007, 1005, 1012, 1, 315000.0000, 0.1)
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderID], [ProductId], [Quantity], [Price], [Discount]) VALUES (1008, 1006, 1008, 1, 430000.0000, 0.15)
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderID], [ProductId], [Quantity], [Price], [Discount]) VALUES (1009, 1007, 1018, 2, 420000.0000, 0.05)
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderID], [ProductId], [Quantity], [Price], [Discount]) VALUES (1010, 1008, 1020, 1, 680000.0000, 0.1)
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderID], [ProductId], [Quantity], [Price], [Discount]) VALUES (1011, 1008, 1017, 1, 365000.0000, 0.1)
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderID], [ProductId], [Quantity], [Price], [Discount]) VALUES (1012, 1009, 1004, 1, 289000.0000, 0.1)
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderID], [ProductId], [Quantity], [Price], [Discount]) VALUES (1013, 1011, 1004, 1, 289000.0000, 0.1)
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderID], [ProductId], [Quantity], [Price], [Discount]) VALUES (1014, 1012, 1004, 1, 289000.0000, 0.1)
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderID], [ProductId], [Quantity], [Price], [Discount]) VALUES (1015, 1013, 1004, 1, 289000.0000, 0.1)
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderID], [ProductId], [Quantity], [Price], [Discount]) VALUES (1016, 1014, 1004, 1, 289000.0000, 0.1)
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderID], [ProductId], [Quantity], [Price], [Discount]) VALUES (1017, 1015, 1006, 1, 280000.0000, 0.05)
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderID], [ProductId], [Quantity], [Price], [Discount]) VALUES (1018, 1015, 1005, 1, 350000.0000, 0.1)
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderID], [ProductId], [Quantity], [Price], [Discount]) VALUES (1019, 1016, 1004, 2, 289000.0000, 0.1)
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderID], [ProductId], [Quantity], [Price], [Discount]) VALUES (1020, 1017, 1007, 2, 340000.0000, 0.05)
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderID], [ProductId], [Quantity], [Price], [Discount]) VALUES (1021, 1018, 1018, 1, 420000.0000, 0.05)
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderID], [ProductId], [Quantity], [Price], [Discount]) VALUES (1022, 1018, 1013, 1, 420000.0000, 0.1)
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderID], [ProductId], [Quantity], [Price], [Discount]) VALUES (1023, 1019, 1018, 2, 420000.0000, 0.05)
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderID], [ProductId], [Quantity], [Price], [Discount]) VALUES (1024, 1019, 1007, 1, 340000.0000, 0.05)
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderID], [ProductId], [Quantity], [Price], [Discount]) VALUES (1025, 1020, 1004, 1, 289000.0000, 0.1)
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderID], [ProductId], [Quantity], [Price], [Discount]) VALUES (1026, 1020, 1005, 10, 350000.0000, 0.1)
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([OrderId], [AccountId], [OrderDate], [TotalAmount]) VALUES (1, 1, CAST(N'2023-07-22T17:48:15.687' AS DateTime), 0.0000)
INSERT [dbo].[Orders] ([OrderId], [AccountId], [OrderDate], [TotalAmount]) VALUES (2, 5, CAST(N'2023-07-23T00:51:31.350' AS DateTime), 123.0000)
INSERT [dbo].[Orders] ([OrderId], [AccountId], [OrderDate], [TotalAmount]) VALUES (3, 1, CAST(N'2023-07-23T01:00:41.893' AS DateTime), 2.0000)
INSERT [dbo].[Orders] ([OrderId], [AccountId], [OrderDate], [TotalAmount]) VALUES (4, 1, CAST(N'2023-07-23T01:02:50.100' AS DateTime), 123.0000)
INSERT [dbo].[Orders] ([OrderId], [AccountId], [OrderDate], [TotalAmount]) VALUES (5, 5, CAST(N'2023-07-23T01:07:20.970' AS DateTime), 0.0000)
INSERT [dbo].[Orders] ([OrderId], [AccountId], [OrderDate], [TotalAmount]) VALUES (6, 1, CAST(N'2023-07-23T15:16:44.627' AS DateTime), 1270000.0000)
INSERT [dbo].[Orders] ([OrderId], [AccountId], [OrderDate], [TotalAmount]) VALUES (7, 1, CAST(N'2023-07-23T15:22:25.747' AS DateTime), 630000.0000)
INSERT [dbo].[Orders] ([OrderId], [AccountId], [OrderDate], [TotalAmount]) VALUES (1002, 1, CAST(N'2023-07-23T20:20:40.663' AS DateTime), 1200000.0000)
INSERT [dbo].[Orders] ([OrderId], [AccountId], [OrderDate], [TotalAmount]) VALUES (1003, 1, CAST(N'2023-07-23T20:21:34.877' AS DateTime), 1200000.0000)
INSERT [dbo].[Orders] ([OrderId], [AccountId], [OrderDate], [TotalAmount]) VALUES (1004, 1, CAST(N'2023-07-23T20:26:47.943' AS DateTime), 2040000.0000)
INSERT [dbo].[Orders] ([OrderId], [AccountId], [OrderDate], [TotalAmount]) VALUES (1005, 2, CAST(N'2023-07-23T22:20:57.107' AS DateTime), 315000.0000)
INSERT [dbo].[Orders] ([OrderId], [AccountId], [OrderDate], [TotalAmount]) VALUES (1006, 2, CAST(N'2023-07-23T22:23:00.640' AS DateTime), 430000.0000)
INSERT [dbo].[Orders] ([OrderId], [AccountId], [OrderDate], [TotalAmount]) VALUES (1007, 2, CAST(N'2023-07-23T22:23:55.550' AS DateTime), 840000.0000)
INSERT [dbo].[Orders] ([OrderId], [AccountId], [OrderDate], [TotalAmount]) VALUES (1008, 2, CAST(N'2023-07-23T23:51:29.357' AS DateTime), 1045000.0000)
INSERT [dbo].[Orders] ([OrderId], [AccountId], [OrderDate], [TotalAmount]) VALUES (1009, 2, CAST(N'2023-07-23T23:53:52.553' AS DateTime), 289000.0000)
INSERT [dbo].[Orders] ([OrderId], [AccountId], [OrderDate], [TotalAmount]) VALUES (1010, 2, CAST(N'2023-07-23T23:56:58.057' AS DateTime), 0.0000)
INSERT [dbo].[Orders] ([OrderId], [AccountId], [OrderDate], [TotalAmount]) VALUES (1011, 2, CAST(N'2023-07-23T23:57:13.677' AS DateTime), 289000.0000)
INSERT [dbo].[Orders] ([OrderId], [AccountId], [OrderDate], [TotalAmount]) VALUES (1012, 2, CAST(N'2023-07-23T23:59:14.890' AS DateTime), 289000.0000)
INSERT [dbo].[Orders] ([OrderId], [AccountId], [OrderDate], [TotalAmount]) VALUES (1013, 2, CAST(N'2023-07-24T00:11:14.453' AS DateTime), 289000.0000)
INSERT [dbo].[Orders] ([OrderId], [AccountId], [OrderDate], [TotalAmount]) VALUES (1014, 2, CAST(N'2023-07-24T00:22:02.267' AS DateTime), 289000.0000)
INSERT [dbo].[Orders] ([OrderId], [AccountId], [OrderDate], [TotalAmount]) VALUES (1015, 2, CAST(N'2023-07-24T00:25:02.390' AS DateTime), 630000.0000)
INSERT [dbo].[Orders] ([OrderId], [AccountId], [OrderDate], [TotalAmount]) VALUES (1016, 2, CAST(N'2023-07-24T00:27:03.523' AS DateTime), 578000.0000)
INSERT [dbo].[Orders] ([OrderId], [AccountId], [OrderDate], [TotalAmount]) VALUES (1017, 1002, CAST(N'2023-07-24T00:37:02.903' AS DateTime), 680000.0000)
INSERT [dbo].[Orders] ([OrderId], [AccountId], [OrderDate], [TotalAmount]) VALUES (1018, 1004, CAST(N'2023-07-24T00:44:42.383' AS DateTime), 777000.0000)
INSERT [dbo].[Orders] ([OrderId], [AccountId], [OrderDate], [TotalAmount]) VALUES (1019, 1002, CAST(N'2023-07-24T07:52:45.913' AS DateTime), 1121000.0000)
INSERT [dbo].[Orders] ([OrderId], [AccountId], [OrderDate], [TotalAmount]) VALUES (1020, 1005, CAST(N'2023-07-24T09:44:26.690' AS DateTime), 3410100.0000)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProductId], [ProductName], [ProductImage], [ProductDescription], [CategoryId], [Price], [Discount], [Quantity], [Active]) VALUES (1004, N'Mô hình xe Ducati 1199 Panigale', N'9bc15c9d3fd52f21c153098f875d00f0.jpg', N'Sở hữu động cơ công suất cao nhất của DUCATI ,mẫu "PANIGALE 1199" là siêu mô tô đậm chất Ý, kết hợp hoàn hảo giữa sức mạnh và độ an toàn.Thật tuyệt vời khi ta sở hữu 1 chiếc mô hình được thiết kế đầy tinh tế và sống động để trưng bày trên bàn làm việc, tặng bàn bè người thân trong những dịp quan trọng hoặc thỏa mãn niềm đam mê sưu tầm. Mang cả thế giới xe đến ngôi nhà của bạn!', 1, 289000.0000, 0.1, 996, 0)
INSERT [dbo].[Products] ([ProductId], [ProductName], [ProductImage], [ProductDescription], [CategoryId], [Price], [Discount], [Quantity], [Active]) VALUES (1005, N'Mô hình xe Honda Cbr 1000RR', N'92100adf1582105ea4989ec896dfff86.jpg', N'Sẽ chỉ có 130 chiếc CBR1000RR HRC Fireblade phiên bản giới hạn được bán tại Australia. Ngoài màu sơn đặc trưng thì mẫu superbike của Honda còn sở hữu những công nghệ được thừa kế từ đường đua MotoGP.  Phuộc trước loại Big Piston Fork của Showa, phuộc sau Unit-Prolink. Xe có công nghệ giảm chấn tay lái điện tử HESD (Honda Electric Steering Damper). Khung xe và la-zăng làm từ nhôm nhẹ, cho CBR1000RR khả năng thể hiện trên đường phố như ở đường đua.  CBR1000RR HRC sử dụng động cơ 999 phân khối 4 xi-lanh thẳng hàng, làm mát bằng dung dịch, phun xăng điện tử kép cho công suất cực đại 178 mã lực tại vòng tua máy 12.000 vòng/phút.', 1, 350000.0000, 0.1, 989, 1)
INSERT [dbo].[Products] ([ProductId], [ProductName], [ProductImage], [ProductDescription], [CategoryId], [Price], [Discount], [Quantity], [Active]) VALUES (1006, N'Mô hình xe mô tô Yamaha YZF-R1', N'ebca57eee23a283329c1bddae0827e29.jpg', N'Yamaha R1 2021 mới nằm trong dòng xe PKL thể thao R-series chủ chốt của Yamaha với kiểu dáng thuần Sport hoàn toàn. Trải qua 3 thế hệ kể từ lần đầu ra mắt vào năm 1998, xe moto Yamaha R1 2021 đã trở thành một trong những mẫu superbike 1.000 cc thành công nhất của nền công nghiệp môtô Nhật Bản và luôn có sự thay đổi mạnh mẽ từ động cơ 4 xy-lanh 20 van, 150 mã lực lên động cơ 16 van, 200 mã lực như hiện nay giúp đem lại tiếng vang cho Yamaha ở những giải đua danh tiếng như Suzuka 8h hay MotoAmerica Championship.', 1, 280000.0000, 0.05, 999, 1)
INSERT [dbo].[Products] ([ProductId], [ProductName], [ProductImage], [ProductDescription], [CategoryId], [Price], [Discount], [Quantity], [Active]) VALUES (1007, N'Mô hình xe Bmw s1000rr', N'2660cfd480fe99ae08e3c21a3b81d7d6.jpg', N'S1000RR là mẫu sport-bike danh tiếng và là niềm kiêu hãnh của người Đức nói chung và thương hiệu BMW nói riêng. Sau bao năm “oanh tạc” thị trường các châu lục không chỉ bằng động cơ mạnh mẽ mà còn là triết lí thiết kế “lé” khó phai.', 1, 340000.0000, 0.05, 997, 1)
INSERT [dbo].[Products] ([ProductId], [ProductName], [ProductImage], [ProductDescription], [CategoryId], [Price], [Discount], [Quantity], [Active]) VALUES (1008, N'Mô hình xe Kawasaki Ninja H2', N'4821a2cd8e5852d0ac756769880b495e.jpg', N'Kawasaki Ninja H2R được biết đến là mẫu siêu mô tô đang nắm giữ kỷ lục nhanh nhất thế giới từ năm 2016 cho tới nay mà vẫn chưa có một siêu mô tô nào có thể phá vỡ. "Ma vương tốc độ" H2R chỉ mất 26 giây để đạt vận tốc từ 0-400 km/h trên một cây cầu ở Thổ Nhĩ Kỳ. Ngay cả những chiếc siêu xe ô tô nổi tiếng thế giới mang trong mình khối động cơ cực khủng như Lamborghini Aventador hay Ferrari 458 Italia cũng chưa thể đạt đến con số này nếu không được độ lại, điều này khiến nhiều người phải choáng váng.', 1, 430000.0000, 0.15, 1000, 1)
INSERT [dbo].[Products] ([ProductId], [ProductName], [ProductImage], [ProductDescription], [CategoryId], [Price], [Discount], [Quantity], [Active]) VALUES (1009, N'Mô hình xe Vespa', N'42a4e619c4c732eaab60cc7e55780c0c.jpg', N'VESPA là thương hiệu của dòng sản phẩm xe gắn máy yên thấp bánh nhỏ (scooter) của hãng PIAGGIO, Ý. Dòng xe này ra đời từ sau Chiến tranh thế giới thứ hai và ngày nay nó vẫn tiếp tục được sản xuất cũng như cải tiến.', 1, 200000.0000, 0.05, 1000, 1)
INSERT [dbo].[Products] ([ProductId], [ProductName], [ProductImage], [ProductDescription], [CategoryId], [Price], [Discount], [Quantity], [Active]) VALUES (1010, N'Mô hình xe Kawasaki Ninja ZX-10R', N'00ccf43428ef87d558da79c08ed01270.jpg', N'Kawasaki Ninja ZX-10R 2022 phiên bản cao nhất cho tới thời điểm hiện tại với hàng loại tính năng cùng trang bị cao cấp hiện đại bao gồm chống bó cứng phanh KIBS, kiểm soát tăng tốc Kawasaki Launch Control (KLCS), phanh động cơ KEBC, kiểm soát chống trượt (S-KTRC), cần chuyển số nhanh (KQS) giúp nó tự tin bước vào cuộc chơi Superbike thương mại sở hữu sức mạnh vượt ngưỡng 200 mã lực.', 1, 370000.0000, 0, 1000, 1)
INSERT [dbo].[Products] ([ProductId], [ProductName], [ProductImage], [ProductDescription], [CategoryId], [Price], [Discount], [Quantity], [Active]) VALUES (1011, N'Mô hình xe Harley Davidson', N'd4c79842c3f1364acfd6fe7678b385aa.jpg', N'Các mẫu xe Custom Vehicle Operation (CVO) đại diện cho tinh hoa trong phong cách và thiết kế của Harley-Davidson. Chúng được sản xuất với số lượng hạn chế và dựa trên chuyên môn và tay nghề đã mang thương hiệu. Mỗi mẫu CVO được trang bị sức mạnh củ động cơ Milwaukee-Eight 117, lớp hoàn thiện nổi bật, các tính năng tiên tiến, linh kiện độc quyền, và sự tỉ mỉ đến từng chi tiết hớp hồn bất cứ ai.  ', 1, 410000.0000, 0.08, 1000, 1)
INSERT [dbo].[Products] ([ProductId], [ProductName], [ProductImage], [ProductDescription], [CategoryId], [Price], [Discount], [Quantity], [Active]) VALUES (1012, N'Mô hình xe Suzuki Hayabusa 1300cc', N'ff54e9a921d6ba53014867d12254501b.jpg', N'Có thể bạn chưa biết: Cái tên Hayabusa được lấy cảm hứng từ chim Peregrine Falcon. Đây là một loài chim được mệnh danh nhanh nhất thế giới. Quả thật, không quá khó hiểu khi Hayabusa được vinh danh là “Best Used Bikes” do Cycle Word – tạp chí xe mô tô uy tín của Mỹ bình chọn. Sau 22 năm, Suzuki đã cho ra ba thế hệ của mẫu siêu mô tô Hayabusa như bạn thấy hiện nay.', 1, 315000.0000, 0.1, 1000, 1)
INSERT [dbo].[Products] ([ProductId], [ProductName], [ProductImage], [ProductDescription], [CategoryId], [Price], [Discount], [Quantity], [Active]) VALUES (1013, N'Mô hình xe Lamborghini Aventador', N'789a927ec2adaa8fcf1f4c81602701ab.jpg', N'HÃNG SẢN XUẤT: Mini GT TỈ LỆ: 1:64 ( kích thước nhỏ hơn xe thật 64 lần ). KÍCH THƯỚC HỘP: Dài 10 cm x Rộng 5 cm x Cao 5 cm. KÍCH THƯỚC XE: Dài 8 cm x Rộng 4 cm x Cao 2 cm. BAO BÌ: Hộp giấy cứng đựng xe SƠN: Xe được phủ lớp sơn tĩnh điện cho nước sơn sáng, bóng, mỏng và bền, được sơn phủ nhiều lớp. CHẤT LIỆU: Xe được đúc từ kim loại, bánh xe cao su.  TƯƠNG TÁC: Xe không mở được , xe có thể quay bánh được', 2, 420000.0000, 0.1, 999, 1)
INSERT [dbo].[Products] ([ProductId], [ProductName], [ProductImage], [ProductDescription], [CategoryId], [Price], [Discount], [Quantity], [Active]) VALUES (1014, N'Mô hình xe Lamborghini Terzo Milennio Green', N'5c16d853736c4040732ad954a178962f.jpg', N'Lamborghini Terzo Millennio là mẫu siêu xe hybrid, mở ra kỷ nguyên mới của ngành chế tạo ôtô.  Mẫu concept mới mang nét thiết kế về công nghệ tương lai, đồng thời duy trì vẻ đẹp thị giác, thể hiện hơi thở mới, cảm xúc mãnh liệt trong mọi khía cạnh. Lamborghini Terzo Millennio dành cho những người đam mê xe thể thao trong tương lai.', 2, 460000.0000, 0.2, 1000, 1)
INSERT [dbo].[Products] ([ProductId], [ProductName], [ProductImage], [ProductDescription], [CategoryId], [Price], [Discount], [Quantity], [Active]) VALUES (1015, N'Mô hình xe Lamborghini Huracan ', N'ecde7db705f5860ce2906c0a854a5bd6.jpg', N'HÃNG SẢN XUẤT: Mini GT TỈ LỆ: 1:64 ( kích thước nhỏ hơn xe thật 64 lần ). KÍCH THƯỚC HỘP: Dài 10 cm x Rộng 5 cm x Cao 5 cm. KÍCH THƯỚC XE: Dài 8 cm x Rộng 4 cm x Cao 2 cm. BAO BÌ: Hộp giấy cứng đựng xe SƠN: Xe được phủ lớp sơn tĩnh điện cho nước sơn sáng, bóng, mỏng và bền, được sơn phủ nhiều lớp. CHẤT LIỆU: Xe được đúc từ kim loại, bánh xe cao su.  TƯƠNG TÁC: Xe không mở được , xe có thể quay bánh được', 2, 450000.0000, 0.1, 1000, 1)
INSERT [dbo].[Products] ([ProductId], [ProductName], [ProductImage], [ProductDescription], [CategoryId], [Price], [Discount], [Quantity], [Active]) VALUES (1016, N'Mô hình xe McLaren Artura Flux Green', N'9fea304a4b0ec2cdb6a49f5175507ccc.jpg', N'HÃNG SẢN XUẤT: Mini GT TỈ LỆ: 1:64 ( kích thước nhỏ hơn xe thật 64 lần ). KÍCH THƯỚC HỘP: Dài 10 cm x Rộng 5 cm x Cao 5 cm. KÍCH THƯỚC XE: Dài 8 cm x Rộng 4 cm x Cao 2 cm. BAO BÌ: Hộp giấy cứng đựng xe SƠN: Xe được phủ lớp sơn tĩnh điện cho nước sơn sáng, bóng, mỏng và bền, được sơn phủ nhiều lớp. CHẤT LIỆU: Xe được đúc từ kim loại, bánh xe cao su.  TƯƠNG TÁC: Xe không mở được , xe có thể quay bánh được', 2, 380000.0000, 0.08, 1000, 1)
INSERT [dbo].[Products] ([ProductId], [ProductName], [ProductImage], [ProductDescription], [CategoryId], [Price], [Discount], [Quantity], [Active]) VALUES (1017, N'Mô hình xe Lexus LX600', N'0fd08a30366f91e058d9ef52ed613874.jpg', N'Lexus LX là dòng xe SUV hạng sang cỡ lớn (full-size luxury SUV) được sản xuất bởi thương hiệu Lexus, trực thuộc tập đoàn xe hơi Toyota Nhật Bản. Ra đời lần đầu từ năm 1995, đến nay Lexus LX đang ở thế hệ thứ 3 ', 2, 365000.0000, 0.1, 1000, 1)
INSERT [dbo].[Products] ([ProductId], [ProductName], [ProductImage], [ProductDescription], [CategoryId], [Price], [Discount], [Quantity], [Active]) VALUES (1018, N'Mô hình xe Ford Raptor Ranger', N'946672be458f935db731b3e791b69ecb.jpg', N'Ranger Raptor là chiếc bán tải đầu tiên mang thiết kế nguyên gốc từ nhà máy của Ford có khả năng chạy off-road tốc độ cao. Đó là siêu bán tải. Sự phối hợp giữa động cơ 2.0L Bi-Turbo và hộp số tự động 10 cấp chính là một cuộc cách mạng về hệ thống truyền động, nâng khả năng offroad lên một tầm cao mới>', 2, 420000.0000, 0.05, 997, 1)
INSERT [dbo].[Products] ([ProductId], [ProductName], [ProductImage], [ProductDescription], [CategoryId], [Price], [Discount], [Quantity], [Active]) VALUES (1019, N'Mô hình xe Ferrari Sf90 Stradale', N'be8a343076003b2e5f39895c2dcb141f.jpg', N'Có thể coi Ferrari SF90 Stradale là bom tấn của hãng xe Italy. Siêu xe plug-in hybrid này mạnh và nhanh hơn LaFerrari. Được phát triển trên nền tảng xe đua F1, SF90 Stradale là siêu xe plug-in hybrid đầu tiên của Ferrari sử dụng công nghệ đẩy kết hợp 3 môtơ điện và động cơ V8 cực mạnh. Và nay đã có mô hình của mẫu này với nhiều tính năng đặc biệt của dòng mô hình này ', 2, 850000.0000, 0.2, 1000, 1)
INSERT [dbo].[Products] ([ProductId], [ProductName], [ProductImage], [ProductDescription], [CategoryId], [Price], [Discount], [Quantity], [Active]) VALUES (1020, N'Mô hình xe Range Rover Land Rover', N'be3f70459e6d13b37dbbfea35060c11b.jpg', N'Land Rover Range Rover là một chiếc xe có động cơ 4x4 được sản xuất bởi Land Rover, một thương hiệu và thương hiệu con của Jaguar Land Rover. Dòng Range Rover được ra mắt vào năm 1970 bởi British Leyland và hiện đang ở thế hệ thứ năm.  Các mẫu xe khác đã được ra mắt dưới tên Range Rover, bao gồm Range Rover Sport, Range Rover Evoque và Range Rover Velar.', 2, 680000.0000, 0.1, 1000, 1)
INSERT [dbo].[Products] ([ProductId], [ProductName], [ProductImage], [ProductDescription], [CategoryId], [Price], [Discount], [Quantity], [Active]) VALUES (1021, N'Mô hình xe BMW M4 GT3', N'75cb0647934f9be6c49634ee72a3bcc1.jpg', N'Với BMW M4 GT3, dòng sản phẩm BMW M Motorsport đã có một nhân vật mới kể từ đầu mùa giải 2022. Chiếc xe GT3 mới kế nhiệm BMW M6 GT3 và mang đến cho các đội BMW M Motorsport và các tay đua trên toàn thế giới cơ hội thách đấu để giành chiến thắng và danh hiệu trong một mẫu GT3 dựa trên thế hệ BMW M4 mới nhất. Những cải tiến lớn nhất so với BMW M6 GT3 nằm ở ba lĩnh vực: khả năng lái, hiệu quả chi phí và vận hành. ', 2, 930000.0000, 0.2, 1000, 1)
INSERT [dbo].[Products] ([ProductId], [ProductName], [ProductImage], [ProductDescription], [CategoryId], [Price], [Discount], [Quantity], [Active]) VALUES (1022, N'Mô hình xe Porsche 911 Turbo S Racing', N'c101224ad4f35e8b877bcb913a172dcb.jpg', N'HÃNG SẢN XUẤT: Mini GT TỈ LỆ: 1:64 ( kích thước nhỏ hơn xe thật 64 lần ). KÍCH THƯỚC HỘP: Dài 10 cm x Rộng 5 cm x Cao 5 cm. KÍCH THƯỚC XE: Dài 8 cm x Rộng 4 cm x Cao 2 cm. BAO BÌ: Hộp giấy cứng đựng xe SƠN: Xe được phủ lớp sơn tĩnh điện cho nước sơn sáng, bóng, mỏng và bền, được sơn phủ nhiều lớp. CHẤT LIỆU: Xe được đúc từ kim loại, bánh xe cao su.  TƯƠNG TÁC: Xe không mở được , xe có thể quay bánh được', 2, 580000.0000, 0.1, 1000, 1)
INSERT [dbo].[Products] ([ProductId], [ProductName], [ProductImage], [ProductDescription], [CategoryId], [Price], [Discount], [Quantity], [Active]) VALUES (1023, N'Mô hình máy bay Vietnam Airlines Dreamliner Boeing', N'787709c41d841174b961c32d0d23f727.jpg', N'Máy bay có thiết kế được mô phỏng lại như thật với những đường nét chi tiết, được sơn tỉ mỉ, tinh tế rất phù hợp để trưng bày ở phòng khách, phòng làm việc, showroom, bàn làm việc..', 3, 960000.0000, 0.2, 1000, 1)
INSERT [dbo].[Products] ([ProductId], [ProductName], [ProductImage], [ProductDescription], [CategoryId], [Price], [Discount], [Quantity], [Active]) VALUES (1024, N'Mô hình máy bay Việt Nam Bamboo Airways Airbus', N'9a68e6958e428e45d2c059f142a050ba.jpg', N'Máy bay có thiết kế được mô phỏng lại như thật với những đường nét chi tiết, được sơn tỉ mỉ, tinh tế rất phù hợp để trưng bày ở phòng khách, phòng làm việc, showroom, bàn làm việc...', 3, 920000.0000, 0.15, 1000, 1)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([RoleId], [RoleName]) VALUES (1, N'Admin')
INSERT [dbo].[Roles] ([RoleId], [RoleName]) VALUES (2, N'Customer')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
ALTER TABLE [dbo].[Accounts]  WITH CHECK ADD FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([RoleId])
GO
ALTER TABLE [dbo].[Carts]  WITH CHECK ADD FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
GO
ALTER TABLE [dbo].[Carts]  WITH CHECK ADD FOREIGN KEY([AccountId])
REFERENCES [dbo].[Accounts] ([AccountId])
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderId])
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([AccountId])
REFERENCES [dbo].[Accounts] ([AccountId])
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([CategoryId])
GO
