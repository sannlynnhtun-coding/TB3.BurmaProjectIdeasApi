USE [MovieTicketOnlineBookingSystemApi]
GO
/****** Object:  Table [dbo].[Tbl_Booking]    Script Date: 12/14/2025 1:00:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Booking](
	[BookingId] [int] IDENTITY(1,1) NOT NULL,
	[ShowId] [int] NOT NULL,
	[BookingDate] [datetime] NULL,
	[CustomerName] [nvarchar](100) NULL,
	[TotalAmount] [decimal](18, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[BookingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_BookingDetail]    Script Date: 12/14/2025 1:00:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_BookingDetail](
	[BookingDetailId] [int] IDENTITY(1,1) NOT NULL,
	[BookingId] [int] NOT NULL,
	[SeatId] [int] NOT NULL,
	[Price] [decimal](18, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[BookingDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_CinemaList]    Script Date: 12/14/2025 1:00:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_CinemaList](
	[CinemaId] [int] IDENTITY(1,1) NOT NULL,
	[CinemaName] [nvarchar](100) NOT NULL,
	[CinemaLocation] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[CinemaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_CinemaRoom]    Script Date: 12/14/2025 1:00:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_CinemaRoom](
	[RoomId] [int] IDENTITY(1,1) NOT NULL,
	[CinemaId] [int] NOT NULL,
	[RoomNumber] [int] NULL,
	[RoomName] [nvarchar](50) NULL,
	[SeatingCapacity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[RoomId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_MovieList]    Script Date: 12/14/2025 1:00:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_MovieList](
	[MovieId] [int] IDENTITY(1,1) NOT NULL,
	[MovieTitle] [nvarchar](200) NOT NULL,
	[ReleaseDate] [datetime] NULL,
	[Duration] [nvarchar](50) NULL,
	[MoviePhoto] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[MovieId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_MovieSchedule]    Script Date: 12/14/2025 1:00:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_MovieSchedule](
	[ShowId] [int] IDENTITY(1,1) NOT NULL,
	[ShowDateId] [int] NOT NULL,
	[ShowDateTime] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ShowId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_RoomSeat]    Script Date: 12/14/2025 1:00:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_RoomSeat](
	[SeatId] [int] IDENTITY(1,1) NOT NULL,
	[RoomId] [int] NOT NULL,
	[SeatNo] [int] NULL,
	[RowName] [nvarchar](10) NULL,
	[SeatType] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[SeatId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_SeatPrice]    Script Date: 12/14/2025 1:00:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_SeatPrice](
	[SeatPriceId] [int] IDENTITY(1,1) NOT NULL,
	[RoomId] [int] NOT NULL,
	[RowName] [nvarchar](10) NULL,
	[SeatPrice] [decimal](18, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[SeatPriceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_ShowDate]    Script Date: 12/14/2025 1:00:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_ShowDate](
	[ShowDateId] [int] IDENTITY(1,1) NOT NULL,
	[CinemaId] [int] NOT NULL,
	[RoomId] [int] NOT NULL,
	[MovieId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ShowDateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Tbl_Booking] ON 
GO
INSERT [dbo].[Tbl_Booking] ([BookingId], [ShowId], [BookingDate], [CustomerName], [TotalAmount]) VALUES (1, 1, CAST(N'2025-12-11T00:50:37.930' AS DateTime), N'Alice Williams', CAST(24.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Booking] ([BookingId], [ShowId], [BookingDate], [CustomerName], [TotalAmount]) VALUES (2, 2, CAST(N'2025-12-11T00:50:37.930' AS DateTime), N'Charlie Brown', CAST(16.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Booking] ([BookingId], [ShowId], [BookingDate], [CustomerName], [TotalAmount]) VALUES (3, 3, CAST(N'2025-12-12T00:50:37.930' AS DateTime), N'Bob Johnson', CAST(24.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Booking] ([BookingId], [ShowId], [BookingDate], [CustomerName], [TotalAmount]) VALUES (4, 4, CAST(N'2025-12-10T00:50:37.930' AS DateTime), N'Jane Smith', CAST(32.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Booking] ([BookingId], [ShowId], [BookingDate], [CustomerName], [TotalAmount]) VALUES (5, 5, CAST(N'2025-12-12T00:50:37.930' AS DateTime), N'John Doe', CAST(24.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Booking] ([BookingId], [ShowId], [BookingDate], [CustomerName], [TotalAmount]) VALUES (6, 6, CAST(N'2025-12-12T00:50:37.930' AS DateTime), N'Jane Smith', CAST(24.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Booking] ([BookingId], [ShowId], [BookingDate], [CustomerName], [TotalAmount]) VALUES (7, 7, CAST(N'2025-12-12T00:50:37.930' AS DateTime), N'Jane Smith', CAST(24.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Booking] ([BookingId], [ShowId], [BookingDate], [CustomerName], [TotalAmount]) VALUES (8, 8, CAST(N'2025-12-13T00:50:37.930' AS DateTime), N'Jane Smith', CAST(32.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Booking] ([BookingId], [ShowId], [BookingDate], [CustomerName], [TotalAmount]) VALUES (9, 9, CAST(N'2025-12-12T00:50:37.930' AS DateTime), N'John Doe', CAST(16.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Booking] ([BookingId], [ShowId], [BookingDate], [CustomerName], [TotalAmount]) VALUES (10, 10, CAST(N'2025-12-11T00:50:37.930' AS DateTime), N'Bob Johnson', CAST(24.00 AS Decimal(18, 2)))
GO
SET IDENTITY_INSERT [dbo].[Tbl_Booking] OFF
GO
SET IDENTITY_INSERT [dbo].[Tbl_BookingDetail] ON 
GO
INSERT [dbo].[Tbl_BookingDetail] ([BookingDetailId], [BookingId], [SeatId], [Price]) VALUES (1, 1, 1, CAST(8.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_BookingDetail] ([BookingDetailId], [BookingId], [SeatId], [Price]) VALUES (2, 1, 2, CAST(8.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_BookingDetail] ([BookingDetailId], [BookingId], [SeatId], [Price]) VALUES (3, 1, 3, CAST(8.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_BookingDetail] ([BookingDetailId], [BookingId], [SeatId], [Price]) VALUES (4, 2, 1, CAST(8.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_BookingDetail] ([BookingDetailId], [BookingId], [SeatId], [Price]) VALUES (5, 2, 2, CAST(8.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_BookingDetail] ([BookingDetailId], [BookingId], [SeatId], [Price]) VALUES (6, 3, 1, CAST(8.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_BookingDetail] ([BookingDetailId], [BookingId], [SeatId], [Price]) VALUES (7, 3, 2, CAST(8.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_BookingDetail] ([BookingDetailId], [BookingId], [SeatId], [Price]) VALUES (8, 3, 3, CAST(8.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_BookingDetail] ([BookingDetailId], [BookingId], [SeatId], [Price]) VALUES (9, 4, 1, CAST(8.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_BookingDetail] ([BookingDetailId], [BookingId], [SeatId], [Price]) VALUES (10, 4, 2, CAST(8.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_BookingDetail] ([BookingDetailId], [BookingId], [SeatId], [Price]) VALUES (11, 4, 3, CAST(8.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_BookingDetail] ([BookingDetailId], [BookingId], [SeatId], [Price]) VALUES (12, 4, 4, CAST(8.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_BookingDetail] ([BookingDetailId], [BookingId], [SeatId], [Price]) VALUES (13, 5, 1, CAST(8.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_BookingDetail] ([BookingDetailId], [BookingId], [SeatId], [Price]) VALUES (14, 5, 2, CAST(8.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_BookingDetail] ([BookingDetailId], [BookingId], [SeatId], [Price]) VALUES (15, 5, 3, CAST(8.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_BookingDetail] ([BookingDetailId], [BookingId], [SeatId], [Price]) VALUES (16, 6, 1, CAST(8.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_BookingDetail] ([BookingDetailId], [BookingId], [SeatId], [Price]) VALUES (17, 6, 2, CAST(8.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_BookingDetail] ([BookingDetailId], [BookingId], [SeatId], [Price]) VALUES (18, 6, 3, CAST(8.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_BookingDetail] ([BookingDetailId], [BookingId], [SeatId], [Price]) VALUES (19, 7, 1, CAST(8.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_BookingDetail] ([BookingDetailId], [BookingId], [SeatId], [Price]) VALUES (20, 7, 2, CAST(8.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_BookingDetail] ([BookingDetailId], [BookingId], [SeatId], [Price]) VALUES (21, 7, 3, CAST(8.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_BookingDetail] ([BookingDetailId], [BookingId], [SeatId], [Price]) VALUES (22, 8, 1, CAST(8.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_BookingDetail] ([BookingDetailId], [BookingId], [SeatId], [Price]) VALUES (23, 8, 2, CAST(8.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_BookingDetail] ([BookingDetailId], [BookingId], [SeatId], [Price]) VALUES (24, 8, 3, CAST(8.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_BookingDetail] ([BookingDetailId], [BookingId], [SeatId], [Price]) VALUES (25, 8, 4, CAST(8.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_BookingDetail] ([BookingDetailId], [BookingId], [SeatId], [Price]) VALUES (26, 9, 1, CAST(8.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_BookingDetail] ([BookingDetailId], [BookingId], [SeatId], [Price]) VALUES (27, 9, 2, CAST(8.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_BookingDetail] ([BookingDetailId], [BookingId], [SeatId], [Price]) VALUES (28, 10, 1, CAST(8.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_BookingDetail] ([BookingDetailId], [BookingId], [SeatId], [Price]) VALUES (29, 10, 2, CAST(8.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_BookingDetail] ([BookingDetailId], [BookingId], [SeatId], [Price]) VALUES (30, 10, 3, CAST(8.00 AS Decimal(18, 2)))
GO
SET IDENTITY_INSERT [dbo].[Tbl_BookingDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[Tbl_CinemaList] ON 
GO
INSERT [dbo].[Tbl_CinemaList] ([CinemaId], [CinemaName], [CinemaLocation]) VALUES (1, N'AMC Times Square', N'New York, NY')
GO
INSERT [dbo].[Tbl_CinemaList] ([CinemaId], [CinemaName], [CinemaLocation]) VALUES (2, N'Regal Cinemas Hollywood', N'Los Angeles, CA')
GO
INSERT [dbo].[Tbl_CinemaList] ([CinemaId], [CinemaName], [CinemaLocation]) VALUES (3, N'Cinemark Century', N'San Francisco, CA')
GO
INSERT [dbo].[Tbl_CinemaList] ([CinemaId], [CinemaName], [CinemaLocation]) VALUES (4, N'Cineplex Odeon', N'Chicago, IL')
GO
INSERT [dbo].[Tbl_CinemaList] ([CinemaId], [CinemaName], [CinemaLocation]) VALUES (5, N'AMC Empire 25', N'New York, NY')
GO
SET IDENTITY_INSERT [dbo].[Tbl_CinemaList] OFF
GO
SET IDENTITY_INSERT [dbo].[Tbl_CinemaRoom] ON 
GO
INSERT [dbo].[Tbl_CinemaRoom] ([RoomId], [CinemaId], [RoomNumber], [RoomName], [SeatingCapacity]) VALUES (1, 1, 1, N'Theater 1', 150)
GO
INSERT [dbo].[Tbl_CinemaRoom] ([RoomId], [CinemaId], [RoomNumber], [RoomName], [SeatingCapacity]) VALUES (2, 1, 2, N'Theater 2', 200)
GO
INSERT [dbo].[Tbl_CinemaRoom] ([RoomId], [CinemaId], [RoomNumber], [RoomName], [SeatingCapacity]) VALUES (3, 1, 3, N'Theater 3', 180)
GO
INSERT [dbo].[Tbl_CinemaRoom] ([RoomId], [CinemaId], [RoomNumber], [RoomName], [SeatingCapacity]) VALUES (4, 2, 1, N'Theater 1', 150)
GO
INSERT [dbo].[Tbl_CinemaRoom] ([RoomId], [CinemaId], [RoomNumber], [RoomName], [SeatingCapacity]) VALUES (5, 2, 2, N'Theater 2', 200)
GO
INSERT [dbo].[Tbl_CinemaRoom] ([RoomId], [CinemaId], [RoomNumber], [RoomName], [SeatingCapacity]) VALUES (6, 2, 3, N'Theater 3', 180)
GO
INSERT [dbo].[Tbl_CinemaRoom] ([RoomId], [CinemaId], [RoomNumber], [RoomName], [SeatingCapacity]) VALUES (7, 3, 1, N'Theater 1', 150)
GO
INSERT [dbo].[Tbl_CinemaRoom] ([RoomId], [CinemaId], [RoomNumber], [RoomName], [SeatingCapacity]) VALUES (8, 3, 2, N'Theater 2', 200)
GO
INSERT [dbo].[Tbl_CinemaRoom] ([RoomId], [CinemaId], [RoomNumber], [RoomName], [SeatingCapacity]) VALUES (9, 3, 3, N'Theater 3', 180)
GO
INSERT [dbo].[Tbl_CinemaRoom] ([RoomId], [CinemaId], [RoomNumber], [RoomName], [SeatingCapacity]) VALUES (10, 4, 1, N'Theater 1', 150)
GO
INSERT [dbo].[Tbl_CinemaRoom] ([RoomId], [CinemaId], [RoomNumber], [RoomName], [SeatingCapacity]) VALUES (11, 4, 2, N'Theater 2', 200)
GO
INSERT [dbo].[Tbl_CinemaRoom] ([RoomId], [CinemaId], [RoomNumber], [RoomName], [SeatingCapacity]) VALUES (12, 4, 3, N'Theater 3', 180)
GO
INSERT [dbo].[Tbl_CinemaRoom] ([RoomId], [CinemaId], [RoomNumber], [RoomName], [SeatingCapacity]) VALUES (13, 5, 1, N'Theater 1', 150)
GO
INSERT [dbo].[Tbl_CinemaRoom] ([RoomId], [CinemaId], [RoomNumber], [RoomName], [SeatingCapacity]) VALUES (14, 5, 2, N'Theater 2', 200)
GO
INSERT [dbo].[Tbl_CinemaRoom] ([RoomId], [CinemaId], [RoomNumber], [RoomName], [SeatingCapacity]) VALUES (15, 5, 3, N'Theater 3', 180)
GO
SET IDENTITY_INSERT [dbo].[Tbl_CinemaRoom] OFF
GO
SET IDENTITY_INSERT [dbo].[Tbl_MovieList] ON 
GO
INSERT [dbo].[Tbl_MovieList] ([MovieId], [MovieTitle], [ReleaseDate], [Duration], [MoviePhoto]) VALUES (1, N'The Dark Knight', CAST(N'2008-07-18T00:00:00.000' AS DateTime), N'152 min', N'https://example.com/dark-knight.jpg')
GO
INSERT [dbo].[Tbl_MovieList] ([MovieId], [MovieTitle], [ReleaseDate], [Duration], [MoviePhoto]) VALUES (2, N'Inception', CAST(N'2010-07-16T00:00:00.000' AS DateTime), N'148 min', N'https://example.com/inception.jpg')
GO
INSERT [dbo].[Tbl_MovieList] ([MovieId], [MovieTitle], [ReleaseDate], [Duration], [MoviePhoto]) VALUES (3, N'Interstellar', CAST(N'2014-11-07T00:00:00.000' AS DateTime), N'169 min', N'https://example.com/interstellar.jpg')
GO
INSERT [dbo].[Tbl_MovieList] ([MovieId], [MovieTitle], [ReleaseDate], [Duration], [MoviePhoto]) VALUES (4, N'The Matrix', CAST(N'1999-03-31T00:00:00.000' AS DateTime), N'136 min', N'https://example.com/matrix.jpg')
GO
INSERT [dbo].[Tbl_MovieList] ([MovieId], [MovieTitle], [ReleaseDate], [Duration], [MoviePhoto]) VALUES (5, N'Pulp Fiction', CAST(N'1994-10-14T00:00:00.000' AS DateTime), N'154 min', N'https://example.com/pulp-fiction.jpg')
GO
INSERT [dbo].[Tbl_MovieList] ([MovieId], [MovieTitle], [ReleaseDate], [Duration], [MoviePhoto]) VALUES (6, N'The Shawshank Redemption', CAST(N'1994-09-23T00:00:00.000' AS DateTime), N'142 min', N'https://example.com/shawshank.jpg')
GO
INSERT [dbo].[Tbl_MovieList] ([MovieId], [MovieTitle], [ReleaseDate], [Duration], [MoviePhoto]) VALUES (7, N'Forrest Gump', CAST(N'1994-07-06T00:00:00.000' AS DateTime), N'142 min', N'https://example.com/forrest-gump.jpg')
GO
INSERT [dbo].[Tbl_MovieList] ([MovieId], [MovieTitle], [ReleaseDate], [Duration], [MoviePhoto]) VALUES (8, N'The Godfather', CAST(N'1972-03-24T00:00:00.000' AS DateTime), N'175 min', N'https://example.com/godfather.jpg')
GO
SET IDENTITY_INSERT [dbo].[Tbl_MovieList] OFF
GO
SET IDENTITY_INSERT [dbo].[Tbl_MovieSchedule] ON 
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (1, 1, CAST(N'2025-12-14T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (2, 1, CAST(N'2025-12-14T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (3, 1, CAST(N'2025-12-14T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (4, 1, CAST(N'2025-12-15T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (5, 1, CAST(N'2025-12-15T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (6, 1, CAST(N'2025-12-15T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (7, 1, CAST(N'2025-12-16T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (8, 1, CAST(N'2025-12-16T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (9, 1, CAST(N'2025-12-16T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (10, 1, CAST(N'2025-12-17T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (11, 1, CAST(N'2025-12-17T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (12, 1, CAST(N'2025-12-17T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (13, 1, CAST(N'2025-12-18T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (14, 1, CAST(N'2025-12-18T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (15, 1, CAST(N'2025-12-18T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (16, 1, CAST(N'2025-12-19T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (17, 1, CAST(N'2025-12-19T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (18, 1, CAST(N'2025-12-19T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (19, 1, CAST(N'2025-12-20T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (20, 1, CAST(N'2025-12-20T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (21, 1, CAST(N'2025-12-20T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (22, 2, CAST(N'2025-12-14T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (23, 2, CAST(N'2025-12-14T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (24, 2, CAST(N'2025-12-14T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (25, 2, CAST(N'2025-12-15T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (26, 2, CAST(N'2025-12-15T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (27, 2, CAST(N'2025-12-15T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (28, 2, CAST(N'2025-12-16T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (29, 2, CAST(N'2025-12-16T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (30, 2, CAST(N'2025-12-16T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (31, 2, CAST(N'2025-12-17T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (32, 2, CAST(N'2025-12-17T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (33, 2, CAST(N'2025-12-17T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (34, 2, CAST(N'2025-12-18T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (35, 2, CAST(N'2025-12-18T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (36, 2, CAST(N'2025-12-18T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (37, 2, CAST(N'2025-12-19T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (38, 2, CAST(N'2025-12-19T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (39, 2, CAST(N'2025-12-19T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (40, 2, CAST(N'2025-12-20T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (41, 2, CAST(N'2025-12-20T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (42, 2, CAST(N'2025-12-20T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (43, 3, CAST(N'2025-12-14T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (44, 3, CAST(N'2025-12-14T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (45, 3, CAST(N'2025-12-14T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (46, 3, CAST(N'2025-12-15T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (47, 3, CAST(N'2025-12-15T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (48, 3, CAST(N'2025-12-15T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (49, 3, CAST(N'2025-12-16T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (50, 3, CAST(N'2025-12-16T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (51, 3, CAST(N'2025-12-16T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (52, 3, CAST(N'2025-12-17T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (53, 3, CAST(N'2025-12-17T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (54, 3, CAST(N'2025-12-17T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (55, 3, CAST(N'2025-12-18T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (56, 3, CAST(N'2025-12-18T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (57, 3, CAST(N'2025-12-18T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (58, 3, CAST(N'2025-12-19T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (59, 3, CAST(N'2025-12-19T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (60, 3, CAST(N'2025-12-19T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (61, 3, CAST(N'2025-12-20T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (62, 3, CAST(N'2025-12-20T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (63, 3, CAST(N'2025-12-20T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (64, 4, CAST(N'2025-12-14T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (65, 4, CAST(N'2025-12-14T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (66, 4, CAST(N'2025-12-14T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (67, 4, CAST(N'2025-12-15T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (68, 4, CAST(N'2025-12-15T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (69, 4, CAST(N'2025-12-15T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (70, 4, CAST(N'2025-12-16T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (71, 4, CAST(N'2025-12-16T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (72, 4, CAST(N'2025-12-16T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (73, 4, CAST(N'2025-12-17T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (74, 4, CAST(N'2025-12-17T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (75, 4, CAST(N'2025-12-17T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (76, 4, CAST(N'2025-12-18T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (77, 4, CAST(N'2025-12-18T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (78, 4, CAST(N'2025-12-18T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (79, 4, CAST(N'2025-12-19T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (80, 4, CAST(N'2025-12-19T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (81, 4, CAST(N'2025-12-19T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (82, 4, CAST(N'2025-12-20T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (83, 4, CAST(N'2025-12-20T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (84, 4, CAST(N'2025-12-20T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (85, 5, CAST(N'2025-12-14T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (86, 5, CAST(N'2025-12-14T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (87, 5, CAST(N'2025-12-14T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (88, 5, CAST(N'2025-12-15T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (89, 5, CAST(N'2025-12-15T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (90, 5, CAST(N'2025-12-15T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (91, 5, CAST(N'2025-12-16T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (92, 5, CAST(N'2025-12-16T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (93, 5, CAST(N'2025-12-16T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (94, 5, CAST(N'2025-12-17T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (95, 5, CAST(N'2025-12-17T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (96, 5, CAST(N'2025-12-17T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (97, 5, CAST(N'2025-12-18T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (98, 5, CAST(N'2025-12-18T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (99, 5, CAST(N'2025-12-18T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (100, 5, CAST(N'2025-12-19T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (101, 5, CAST(N'2025-12-19T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (102, 5, CAST(N'2025-12-19T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (103, 5, CAST(N'2025-12-20T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (104, 5, CAST(N'2025-12-20T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (105, 5, CAST(N'2025-12-20T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (106, 6, CAST(N'2025-12-14T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (107, 6, CAST(N'2025-12-14T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (108, 6, CAST(N'2025-12-14T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (109, 6, CAST(N'2025-12-15T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (110, 6, CAST(N'2025-12-15T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (111, 6, CAST(N'2025-12-15T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (112, 6, CAST(N'2025-12-16T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (113, 6, CAST(N'2025-12-16T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (114, 6, CAST(N'2025-12-16T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (115, 6, CAST(N'2025-12-17T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (116, 6, CAST(N'2025-12-17T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (117, 6, CAST(N'2025-12-17T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (118, 6, CAST(N'2025-12-18T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (119, 6, CAST(N'2025-12-18T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (120, 6, CAST(N'2025-12-18T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (121, 6, CAST(N'2025-12-19T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (122, 6, CAST(N'2025-12-19T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (123, 6, CAST(N'2025-12-19T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (124, 6, CAST(N'2025-12-20T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (125, 6, CAST(N'2025-12-20T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (126, 6, CAST(N'2025-12-20T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (127, 7, CAST(N'2025-12-14T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (128, 7, CAST(N'2025-12-14T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (129, 7, CAST(N'2025-12-14T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (130, 7, CAST(N'2025-12-15T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (131, 7, CAST(N'2025-12-15T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (132, 7, CAST(N'2025-12-15T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (133, 7, CAST(N'2025-12-16T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (134, 7, CAST(N'2025-12-16T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (135, 7, CAST(N'2025-12-16T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (136, 7, CAST(N'2025-12-17T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (137, 7, CAST(N'2025-12-17T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (138, 7, CAST(N'2025-12-17T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (139, 7, CAST(N'2025-12-18T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (140, 7, CAST(N'2025-12-18T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (141, 7, CAST(N'2025-12-18T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (142, 7, CAST(N'2025-12-19T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (143, 7, CAST(N'2025-12-19T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (144, 7, CAST(N'2025-12-19T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (145, 7, CAST(N'2025-12-20T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (146, 7, CAST(N'2025-12-20T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (147, 7, CAST(N'2025-12-20T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (148, 8, CAST(N'2025-12-14T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (149, 8, CAST(N'2025-12-14T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (150, 8, CAST(N'2025-12-14T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (151, 8, CAST(N'2025-12-15T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (152, 8, CAST(N'2025-12-15T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (153, 8, CAST(N'2025-12-15T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (154, 8, CAST(N'2025-12-16T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (155, 8, CAST(N'2025-12-16T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (156, 8, CAST(N'2025-12-16T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (157, 8, CAST(N'2025-12-17T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (158, 8, CAST(N'2025-12-17T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (159, 8, CAST(N'2025-12-17T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (160, 8, CAST(N'2025-12-18T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (161, 8, CAST(N'2025-12-18T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (162, 8, CAST(N'2025-12-18T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (163, 8, CAST(N'2025-12-19T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (164, 8, CAST(N'2025-12-19T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (165, 8, CAST(N'2025-12-19T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (166, 8, CAST(N'2025-12-20T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (167, 8, CAST(N'2025-12-20T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (168, 8, CAST(N'2025-12-20T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (169, 9, CAST(N'2025-12-14T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (170, 9, CAST(N'2025-12-14T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (171, 9, CAST(N'2025-12-14T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (172, 9, CAST(N'2025-12-15T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (173, 9, CAST(N'2025-12-15T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (174, 9, CAST(N'2025-12-15T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (175, 9, CAST(N'2025-12-16T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (176, 9, CAST(N'2025-12-16T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (177, 9, CAST(N'2025-12-16T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (178, 9, CAST(N'2025-12-17T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (179, 9, CAST(N'2025-12-17T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (180, 9, CAST(N'2025-12-17T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (181, 9, CAST(N'2025-12-18T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (182, 9, CAST(N'2025-12-18T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (183, 9, CAST(N'2025-12-18T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (184, 9, CAST(N'2025-12-19T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (185, 9, CAST(N'2025-12-19T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (186, 9, CAST(N'2025-12-19T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (187, 9, CAST(N'2025-12-20T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (188, 9, CAST(N'2025-12-20T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (189, 9, CAST(N'2025-12-20T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (190, 10, CAST(N'2025-12-14T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (191, 10, CAST(N'2025-12-14T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (192, 10, CAST(N'2025-12-14T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (193, 10, CAST(N'2025-12-15T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (194, 10, CAST(N'2025-12-15T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (195, 10, CAST(N'2025-12-15T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (196, 10, CAST(N'2025-12-16T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (197, 10, CAST(N'2025-12-16T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (198, 10, CAST(N'2025-12-16T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (199, 10, CAST(N'2025-12-17T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (200, 10, CAST(N'2025-12-17T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (201, 10, CAST(N'2025-12-17T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (202, 10, CAST(N'2025-12-18T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (203, 10, CAST(N'2025-12-18T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (204, 10, CAST(N'2025-12-18T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (205, 10, CAST(N'2025-12-19T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (206, 10, CAST(N'2025-12-19T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (207, 10, CAST(N'2025-12-19T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (208, 10, CAST(N'2025-12-20T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (209, 10, CAST(N'2025-12-20T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (210, 10, CAST(N'2025-12-20T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (211, 11, CAST(N'2025-12-14T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (212, 11, CAST(N'2025-12-14T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (213, 11, CAST(N'2025-12-14T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (214, 11, CAST(N'2025-12-15T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (215, 11, CAST(N'2025-12-15T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (216, 11, CAST(N'2025-12-15T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (217, 11, CAST(N'2025-12-16T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (218, 11, CAST(N'2025-12-16T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (219, 11, CAST(N'2025-12-16T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (220, 11, CAST(N'2025-12-17T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (221, 11, CAST(N'2025-12-17T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (222, 11, CAST(N'2025-12-17T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (223, 11, CAST(N'2025-12-18T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (224, 11, CAST(N'2025-12-18T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (225, 11, CAST(N'2025-12-18T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (226, 11, CAST(N'2025-12-19T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (227, 11, CAST(N'2025-12-19T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (228, 11, CAST(N'2025-12-19T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (229, 11, CAST(N'2025-12-20T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (230, 11, CAST(N'2025-12-20T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (231, 11, CAST(N'2025-12-20T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (232, 12, CAST(N'2025-12-14T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (233, 12, CAST(N'2025-12-14T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (234, 12, CAST(N'2025-12-14T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (235, 12, CAST(N'2025-12-15T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (236, 12, CAST(N'2025-12-15T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (237, 12, CAST(N'2025-12-15T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (238, 12, CAST(N'2025-12-16T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (239, 12, CAST(N'2025-12-16T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (240, 12, CAST(N'2025-12-16T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (241, 12, CAST(N'2025-12-17T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (242, 12, CAST(N'2025-12-17T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (243, 12, CAST(N'2025-12-17T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (244, 12, CAST(N'2025-12-18T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (245, 12, CAST(N'2025-12-18T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (246, 12, CAST(N'2025-12-18T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (247, 12, CAST(N'2025-12-19T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (248, 12, CAST(N'2025-12-19T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (249, 12, CAST(N'2025-12-19T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (250, 12, CAST(N'2025-12-20T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (251, 12, CAST(N'2025-12-20T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (252, 12, CAST(N'2025-12-20T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (253, 13, CAST(N'2025-12-14T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (254, 13, CAST(N'2025-12-14T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (255, 13, CAST(N'2025-12-14T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (256, 13, CAST(N'2025-12-15T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (257, 13, CAST(N'2025-12-15T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (258, 13, CAST(N'2025-12-15T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (259, 13, CAST(N'2025-12-16T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (260, 13, CAST(N'2025-12-16T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (261, 13, CAST(N'2025-12-16T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (262, 13, CAST(N'2025-12-17T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (263, 13, CAST(N'2025-12-17T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (264, 13, CAST(N'2025-12-17T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (265, 13, CAST(N'2025-12-18T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (266, 13, CAST(N'2025-12-18T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (267, 13, CAST(N'2025-12-18T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (268, 13, CAST(N'2025-12-19T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (269, 13, CAST(N'2025-12-19T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (270, 13, CAST(N'2025-12-19T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (271, 13, CAST(N'2025-12-20T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (272, 13, CAST(N'2025-12-20T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (273, 13, CAST(N'2025-12-20T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (274, 14, CAST(N'2025-12-14T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (275, 14, CAST(N'2025-12-14T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (276, 14, CAST(N'2025-12-14T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (277, 14, CAST(N'2025-12-15T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (278, 14, CAST(N'2025-12-15T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (279, 14, CAST(N'2025-12-15T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (280, 14, CAST(N'2025-12-16T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (281, 14, CAST(N'2025-12-16T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (282, 14, CAST(N'2025-12-16T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (283, 14, CAST(N'2025-12-17T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (284, 14, CAST(N'2025-12-17T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (285, 14, CAST(N'2025-12-17T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (286, 14, CAST(N'2025-12-18T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (287, 14, CAST(N'2025-12-18T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (288, 14, CAST(N'2025-12-18T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (289, 14, CAST(N'2025-12-19T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (290, 14, CAST(N'2025-12-19T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (291, 14, CAST(N'2025-12-19T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (292, 14, CAST(N'2025-12-20T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (293, 14, CAST(N'2025-12-20T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (294, 14, CAST(N'2025-12-20T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (295, 15, CAST(N'2025-12-14T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (296, 15, CAST(N'2025-12-14T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (297, 15, CAST(N'2025-12-14T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (298, 15, CAST(N'2025-12-15T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (299, 15, CAST(N'2025-12-15T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (300, 15, CAST(N'2025-12-15T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (301, 15, CAST(N'2025-12-16T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (302, 15, CAST(N'2025-12-16T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (303, 15, CAST(N'2025-12-16T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (304, 15, CAST(N'2025-12-17T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (305, 15, CAST(N'2025-12-17T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (306, 15, CAST(N'2025-12-17T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (307, 15, CAST(N'2025-12-18T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (308, 15, CAST(N'2025-12-18T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (309, 15, CAST(N'2025-12-18T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (310, 15, CAST(N'2025-12-19T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (311, 15, CAST(N'2025-12-19T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (312, 15, CAST(N'2025-12-19T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (313, 15, CAST(N'2025-12-20T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (314, 15, CAST(N'2025-12-20T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (315, 15, CAST(N'2025-12-20T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (316, 16, CAST(N'2025-12-14T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (317, 16, CAST(N'2025-12-14T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (318, 16, CAST(N'2025-12-14T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (319, 16, CAST(N'2025-12-15T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (320, 16, CAST(N'2025-12-15T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (321, 16, CAST(N'2025-12-15T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (322, 16, CAST(N'2025-12-16T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (323, 16, CAST(N'2025-12-16T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (324, 16, CAST(N'2025-12-16T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (325, 16, CAST(N'2025-12-17T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (326, 16, CAST(N'2025-12-17T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (327, 16, CAST(N'2025-12-17T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (328, 16, CAST(N'2025-12-18T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (329, 16, CAST(N'2025-12-18T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (330, 16, CAST(N'2025-12-18T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (331, 16, CAST(N'2025-12-19T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (332, 16, CAST(N'2025-12-19T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (333, 16, CAST(N'2025-12-19T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (334, 16, CAST(N'2025-12-20T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (335, 16, CAST(N'2025-12-20T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (336, 16, CAST(N'2025-12-20T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (337, 17, CAST(N'2025-12-14T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (338, 17, CAST(N'2025-12-14T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (339, 17, CAST(N'2025-12-14T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (340, 17, CAST(N'2025-12-15T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (341, 17, CAST(N'2025-12-15T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (342, 17, CAST(N'2025-12-15T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (343, 17, CAST(N'2025-12-16T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (344, 17, CAST(N'2025-12-16T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (345, 17, CAST(N'2025-12-16T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (346, 17, CAST(N'2025-12-17T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (347, 17, CAST(N'2025-12-17T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (348, 17, CAST(N'2025-12-17T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (349, 17, CAST(N'2025-12-18T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (350, 17, CAST(N'2025-12-18T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (351, 17, CAST(N'2025-12-18T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (352, 17, CAST(N'2025-12-19T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (353, 17, CAST(N'2025-12-19T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (354, 17, CAST(N'2025-12-19T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (355, 17, CAST(N'2025-12-20T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (356, 17, CAST(N'2025-12-20T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (357, 17, CAST(N'2025-12-20T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (358, 18, CAST(N'2025-12-14T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (359, 18, CAST(N'2025-12-14T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (360, 18, CAST(N'2025-12-14T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (361, 18, CAST(N'2025-12-15T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (362, 18, CAST(N'2025-12-15T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (363, 18, CAST(N'2025-12-15T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (364, 18, CAST(N'2025-12-16T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (365, 18, CAST(N'2025-12-16T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (366, 18, CAST(N'2025-12-16T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (367, 18, CAST(N'2025-12-17T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (368, 18, CAST(N'2025-12-17T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (369, 18, CAST(N'2025-12-17T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (370, 18, CAST(N'2025-12-18T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (371, 18, CAST(N'2025-12-18T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (372, 18, CAST(N'2025-12-18T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (373, 18, CAST(N'2025-12-19T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (374, 18, CAST(N'2025-12-19T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (375, 18, CAST(N'2025-12-19T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (376, 18, CAST(N'2025-12-20T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (377, 18, CAST(N'2025-12-20T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (378, 18, CAST(N'2025-12-20T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (379, 19, CAST(N'2025-12-14T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (380, 19, CAST(N'2025-12-14T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (381, 19, CAST(N'2025-12-14T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (382, 19, CAST(N'2025-12-15T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (383, 19, CAST(N'2025-12-15T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (384, 19, CAST(N'2025-12-15T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (385, 19, CAST(N'2025-12-16T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (386, 19, CAST(N'2025-12-16T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (387, 19, CAST(N'2025-12-16T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (388, 19, CAST(N'2025-12-17T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (389, 19, CAST(N'2025-12-17T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (390, 19, CAST(N'2025-12-17T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (391, 19, CAST(N'2025-12-18T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (392, 19, CAST(N'2025-12-18T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (393, 19, CAST(N'2025-12-18T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (394, 19, CAST(N'2025-12-19T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (395, 19, CAST(N'2025-12-19T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (396, 19, CAST(N'2025-12-19T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (397, 19, CAST(N'2025-12-20T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (398, 19, CAST(N'2025-12-20T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (399, 19, CAST(N'2025-12-20T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (400, 20, CAST(N'2025-12-14T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (401, 20, CAST(N'2025-12-14T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (402, 20, CAST(N'2025-12-14T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (403, 20, CAST(N'2025-12-15T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (404, 20, CAST(N'2025-12-15T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (405, 20, CAST(N'2025-12-15T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (406, 20, CAST(N'2025-12-16T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (407, 20, CAST(N'2025-12-16T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (408, 20, CAST(N'2025-12-16T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (409, 20, CAST(N'2025-12-17T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (410, 20, CAST(N'2025-12-17T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (411, 20, CAST(N'2025-12-17T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (412, 20, CAST(N'2025-12-18T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (413, 20, CAST(N'2025-12-18T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (414, 20, CAST(N'2025-12-18T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (415, 20, CAST(N'2025-12-19T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (416, 20, CAST(N'2025-12-19T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (417, 20, CAST(N'2025-12-19T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (418, 20, CAST(N'2025-12-20T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (419, 20, CAST(N'2025-12-20T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (420, 20, CAST(N'2025-12-20T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (421, 21, CAST(N'2025-12-14T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (422, 21, CAST(N'2025-12-14T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (423, 21, CAST(N'2025-12-14T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (424, 21, CAST(N'2025-12-15T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (425, 21, CAST(N'2025-12-15T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (426, 21, CAST(N'2025-12-15T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (427, 21, CAST(N'2025-12-16T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (428, 21, CAST(N'2025-12-16T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (429, 21, CAST(N'2025-12-16T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (430, 21, CAST(N'2025-12-17T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (431, 21, CAST(N'2025-12-17T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (432, 21, CAST(N'2025-12-17T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (433, 21, CAST(N'2025-12-18T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (434, 21, CAST(N'2025-12-18T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (435, 21, CAST(N'2025-12-18T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (436, 21, CAST(N'2025-12-19T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (437, 21, CAST(N'2025-12-19T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (438, 21, CAST(N'2025-12-19T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (439, 21, CAST(N'2025-12-20T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (440, 21, CAST(N'2025-12-20T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (441, 21, CAST(N'2025-12-20T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (442, 22, CAST(N'2025-12-14T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (443, 22, CAST(N'2025-12-14T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (444, 22, CAST(N'2025-12-14T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (445, 22, CAST(N'2025-12-15T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (446, 22, CAST(N'2025-12-15T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (447, 22, CAST(N'2025-12-15T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (448, 22, CAST(N'2025-12-16T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (449, 22, CAST(N'2025-12-16T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (450, 22, CAST(N'2025-12-16T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (451, 22, CAST(N'2025-12-17T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (452, 22, CAST(N'2025-12-17T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (453, 22, CAST(N'2025-12-17T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (454, 22, CAST(N'2025-12-18T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (455, 22, CAST(N'2025-12-18T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (456, 22, CAST(N'2025-12-18T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (457, 22, CAST(N'2025-12-19T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (458, 22, CAST(N'2025-12-19T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (459, 22, CAST(N'2025-12-19T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (460, 22, CAST(N'2025-12-20T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (461, 22, CAST(N'2025-12-20T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (462, 22, CAST(N'2025-12-20T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (463, 23, CAST(N'2025-12-14T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (464, 23, CAST(N'2025-12-14T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (465, 23, CAST(N'2025-12-14T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (466, 23, CAST(N'2025-12-15T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (467, 23, CAST(N'2025-12-15T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (468, 23, CAST(N'2025-12-15T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (469, 23, CAST(N'2025-12-16T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (470, 23, CAST(N'2025-12-16T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (471, 23, CAST(N'2025-12-16T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (472, 23, CAST(N'2025-12-17T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (473, 23, CAST(N'2025-12-17T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (474, 23, CAST(N'2025-12-17T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (475, 23, CAST(N'2025-12-18T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (476, 23, CAST(N'2025-12-18T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (477, 23, CAST(N'2025-12-18T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (478, 23, CAST(N'2025-12-19T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (479, 23, CAST(N'2025-12-19T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (480, 23, CAST(N'2025-12-19T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (481, 23, CAST(N'2025-12-20T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (482, 23, CAST(N'2025-12-20T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (483, 23, CAST(N'2025-12-20T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (484, 24, CAST(N'2025-12-14T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (485, 24, CAST(N'2025-12-14T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (486, 24, CAST(N'2025-12-14T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (487, 24, CAST(N'2025-12-15T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (488, 24, CAST(N'2025-12-15T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (489, 24, CAST(N'2025-12-15T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (490, 24, CAST(N'2025-12-16T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (491, 24, CAST(N'2025-12-16T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (492, 24, CAST(N'2025-12-16T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (493, 24, CAST(N'2025-12-17T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (494, 24, CAST(N'2025-12-17T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (495, 24, CAST(N'2025-12-17T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (496, 24, CAST(N'2025-12-18T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (497, 24, CAST(N'2025-12-18T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (498, 24, CAST(N'2025-12-18T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (499, 24, CAST(N'2025-12-19T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (500, 24, CAST(N'2025-12-19T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (501, 24, CAST(N'2025-12-19T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (502, 24, CAST(N'2025-12-20T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (503, 24, CAST(N'2025-12-20T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (504, 24, CAST(N'2025-12-20T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (505, 25, CAST(N'2025-12-14T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (506, 25, CAST(N'2025-12-14T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (507, 25, CAST(N'2025-12-14T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (508, 25, CAST(N'2025-12-15T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (509, 25, CAST(N'2025-12-15T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (510, 25, CAST(N'2025-12-15T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (511, 25, CAST(N'2025-12-16T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (512, 25, CAST(N'2025-12-16T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (513, 25, CAST(N'2025-12-16T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (514, 25, CAST(N'2025-12-17T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (515, 25, CAST(N'2025-12-17T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (516, 25, CAST(N'2025-12-17T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (517, 25, CAST(N'2025-12-18T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (518, 25, CAST(N'2025-12-18T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (519, 25, CAST(N'2025-12-18T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (520, 25, CAST(N'2025-12-19T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (521, 25, CAST(N'2025-12-19T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (522, 25, CAST(N'2025-12-19T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (523, 25, CAST(N'2025-12-20T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (524, 25, CAST(N'2025-12-20T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (525, 25, CAST(N'2025-12-20T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (526, 26, CAST(N'2025-12-14T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (527, 26, CAST(N'2025-12-14T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (528, 26, CAST(N'2025-12-14T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (529, 26, CAST(N'2025-12-15T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (530, 26, CAST(N'2025-12-15T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (531, 26, CAST(N'2025-12-15T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (532, 26, CAST(N'2025-12-16T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (533, 26, CAST(N'2025-12-16T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (534, 26, CAST(N'2025-12-16T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (535, 26, CAST(N'2025-12-17T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (536, 26, CAST(N'2025-12-17T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (537, 26, CAST(N'2025-12-17T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (538, 26, CAST(N'2025-12-18T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (539, 26, CAST(N'2025-12-18T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (540, 26, CAST(N'2025-12-18T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (541, 26, CAST(N'2025-12-19T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (542, 26, CAST(N'2025-12-19T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (543, 26, CAST(N'2025-12-19T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (544, 26, CAST(N'2025-12-20T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (545, 26, CAST(N'2025-12-20T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (546, 26, CAST(N'2025-12-20T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (547, 27, CAST(N'2025-12-14T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (548, 27, CAST(N'2025-12-14T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (549, 27, CAST(N'2025-12-14T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (550, 27, CAST(N'2025-12-15T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (551, 27, CAST(N'2025-12-15T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (552, 27, CAST(N'2025-12-15T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (553, 27, CAST(N'2025-12-16T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (554, 27, CAST(N'2025-12-16T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (555, 27, CAST(N'2025-12-16T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (556, 27, CAST(N'2025-12-17T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (557, 27, CAST(N'2025-12-17T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (558, 27, CAST(N'2025-12-17T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (559, 27, CAST(N'2025-12-18T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (560, 27, CAST(N'2025-12-18T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (561, 27, CAST(N'2025-12-18T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (562, 27, CAST(N'2025-12-19T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (563, 27, CAST(N'2025-12-19T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (564, 27, CAST(N'2025-12-19T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (565, 27, CAST(N'2025-12-20T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (566, 27, CAST(N'2025-12-20T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (567, 27, CAST(N'2025-12-20T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (568, 28, CAST(N'2025-12-14T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (569, 28, CAST(N'2025-12-14T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (570, 28, CAST(N'2025-12-14T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (571, 28, CAST(N'2025-12-15T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (572, 28, CAST(N'2025-12-15T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (573, 28, CAST(N'2025-12-15T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (574, 28, CAST(N'2025-12-16T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (575, 28, CAST(N'2025-12-16T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (576, 28, CAST(N'2025-12-16T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (577, 28, CAST(N'2025-12-17T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (578, 28, CAST(N'2025-12-17T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (579, 28, CAST(N'2025-12-17T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (580, 28, CAST(N'2025-12-18T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (581, 28, CAST(N'2025-12-18T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (582, 28, CAST(N'2025-12-18T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (583, 28, CAST(N'2025-12-19T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (584, 28, CAST(N'2025-12-19T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (585, 28, CAST(N'2025-12-19T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (586, 28, CAST(N'2025-12-20T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (587, 28, CAST(N'2025-12-20T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (588, 28, CAST(N'2025-12-20T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (589, 29, CAST(N'2025-12-14T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (590, 29, CAST(N'2025-12-14T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (591, 29, CAST(N'2025-12-14T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (592, 29, CAST(N'2025-12-15T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (593, 29, CAST(N'2025-12-15T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (594, 29, CAST(N'2025-12-15T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (595, 29, CAST(N'2025-12-16T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (596, 29, CAST(N'2025-12-16T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (597, 29, CAST(N'2025-12-16T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (598, 29, CAST(N'2025-12-17T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (599, 29, CAST(N'2025-12-17T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (600, 29, CAST(N'2025-12-17T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (601, 29, CAST(N'2025-12-18T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (602, 29, CAST(N'2025-12-18T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (603, 29, CAST(N'2025-12-18T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (604, 29, CAST(N'2025-12-19T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (605, 29, CAST(N'2025-12-19T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (606, 29, CAST(N'2025-12-19T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (607, 29, CAST(N'2025-12-20T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (608, 29, CAST(N'2025-12-20T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (609, 29, CAST(N'2025-12-20T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (610, 30, CAST(N'2025-12-14T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (611, 30, CAST(N'2025-12-14T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (612, 30, CAST(N'2025-12-14T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (613, 30, CAST(N'2025-12-15T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (614, 30, CAST(N'2025-12-15T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (615, 30, CAST(N'2025-12-15T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (616, 30, CAST(N'2025-12-16T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (617, 30, CAST(N'2025-12-16T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (618, 30, CAST(N'2025-12-16T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (619, 30, CAST(N'2025-12-17T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (620, 30, CAST(N'2025-12-17T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (621, 30, CAST(N'2025-12-17T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (622, 30, CAST(N'2025-12-18T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (623, 30, CAST(N'2025-12-18T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (624, 30, CAST(N'2025-12-18T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (625, 30, CAST(N'2025-12-19T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (626, 30, CAST(N'2025-12-19T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (627, 30, CAST(N'2025-12-19T16:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (628, 30, CAST(N'2025-12-20T10:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (629, 30, CAST(N'2025-12-20T13:00:00.000' AS DateTime))
GO
INSERT [dbo].[Tbl_MovieSchedule] ([ShowId], [ShowDateId], [ShowDateTime]) VALUES (630, 30, CAST(N'2025-12-20T16:00:00.000' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Tbl_MovieSchedule] OFF
GO
SET IDENTITY_INSERT [dbo].[Tbl_RoomSeat] ON 
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1, 1, 1, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2, 1, 2, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (3, 1, 3, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (4, 1, 4, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (5, 1, 5, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (6, 1, 6, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (7, 1, 7, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (8, 1, 8, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (9, 1, 9, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (10, 1, 10, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (11, 1, 11, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (12, 1, 12, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (13, 1, 13, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (14, 1, 14, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (15, 1, 15, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (16, 1, 1, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (17, 1, 2, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (18, 1, 3, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (19, 1, 4, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (20, 1, 5, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (21, 1, 6, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (22, 1, 7, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (23, 1, 8, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (24, 1, 9, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (25, 1, 10, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (26, 1, 11, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (27, 1, 12, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (28, 1, 13, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (29, 1, 14, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (30, 1, 15, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (31, 1, 1, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (32, 1, 2, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (33, 1, 3, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (34, 1, 4, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (35, 1, 5, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (36, 1, 6, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (37, 1, 7, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (38, 1, 8, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (39, 1, 9, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (40, 1, 10, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (41, 1, 11, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (42, 1, 12, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (43, 1, 13, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (44, 1, 14, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (45, 1, 15, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (46, 1, 1, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (47, 1, 2, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (48, 1, 3, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (49, 1, 4, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (50, 1, 5, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (51, 1, 6, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (52, 1, 7, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (53, 1, 8, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (54, 1, 9, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (55, 1, 10, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (56, 1, 11, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (57, 1, 12, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (58, 1, 13, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (59, 1, 14, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (60, 1, 15, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (61, 1, 1, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (62, 1, 2, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (63, 1, 3, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (64, 1, 4, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (65, 1, 5, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (66, 1, 6, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (67, 1, 7, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (68, 1, 8, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (69, 1, 9, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (70, 1, 10, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (71, 1, 11, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (72, 1, 12, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (73, 1, 13, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (74, 1, 14, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (75, 1, 15, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (76, 1, 1, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (77, 1, 2, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (78, 1, 3, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (79, 1, 4, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (80, 1, 5, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (81, 1, 6, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (82, 1, 7, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (83, 1, 8, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (84, 1, 9, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (85, 1, 10, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (86, 1, 11, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (87, 1, 12, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (88, 1, 13, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (89, 1, 14, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (90, 1, 15, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (91, 1, 1, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (92, 1, 2, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (93, 1, 3, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (94, 1, 4, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (95, 1, 5, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (96, 1, 6, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (97, 1, 7, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (98, 1, 8, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (99, 1, 9, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (100, 1, 10, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (101, 1, 11, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (102, 1, 12, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (103, 1, 13, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (104, 1, 14, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (105, 1, 15, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (106, 1, 1, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (107, 1, 2, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (108, 1, 3, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (109, 1, 4, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (110, 1, 5, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (111, 1, 6, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (112, 1, 7, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (113, 1, 8, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (114, 1, 9, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (115, 1, 10, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (116, 1, 11, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (117, 1, 12, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (118, 1, 13, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (119, 1, 14, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (120, 1, 15, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (121, 1, 1, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (122, 1, 2, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (123, 1, 3, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (124, 1, 4, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (125, 1, 5, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (126, 1, 6, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (127, 1, 7, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (128, 1, 8, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (129, 1, 9, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (130, 1, 10, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (131, 1, 11, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (132, 1, 12, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (133, 1, 13, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (134, 1, 14, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (135, 1, 15, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (136, 1, 1, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (137, 1, 2, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (138, 1, 3, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (139, 1, 4, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (140, 1, 5, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (141, 1, 6, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (142, 1, 7, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (143, 1, 8, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (144, 1, 9, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (145, 1, 10, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (146, 1, 11, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (147, 1, 12, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (148, 1, 13, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (149, 1, 14, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (150, 1, 15, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (151, 2, 1, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (152, 2, 2, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (153, 2, 3, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (154, 2, 4, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (155, 2, 5, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (156, 2, 6, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (157, 2, 7, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (158, 2, 8, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (159, 2, 9, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (160, 2, 10, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (161, 2, 11, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (162, 2, 12, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (163, 2, 13, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (164, 2, 14, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (165, 2, 15, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (166, 2, 16, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (167, 2, 17, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (168, 2, 18, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (169, 2, 19, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (170, 2, 20, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (171, 2, 1, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (172, 2, 2, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (173, 2, 3, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (174, 2, 4, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (175, 2, 5, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (176, 2, 6, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (177, 2, 7, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (178, 2, 8, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (179, 2, 9, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (180, 2, 10, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (181, 2, 11, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (182, 2, 12, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (183, 2, 13, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (184, 2, 14, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (185, 2, 15, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (186, 2, 16, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (187, 2, 17, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (188, 2, 18, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (189, 2, 19, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (190, 2, 20, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (191, 2, 1, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (192, 2, 2, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (193, 2, 3, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (194, 2, 4, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (195, 2, 5, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (196, 2, 6, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (197, 2, 7, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (198, 2, 8, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (199, 2, 9, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (200, 2, 10, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (201, 2, 11, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (202, 2, 12, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (203, 2, 13, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (204, 2, 14, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (205, 2, 15, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (206, 2, 16, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (207, 2, 17, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (208, 2, 18, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (209, 2, 19, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (210, 2, 20, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (211, 2, 1, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (212, 2, 2, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (213, 2, 3, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (214, 2, 4, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (215, 2, 5, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (216, 2, 6, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (217, 2, 7, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (218, 2, 8, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (219, 2, 9, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (220, 2, 10, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (221, 2, 11, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (222, 2, 12, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (223, 2, 13, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (224, 2, 14, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (225, 2, 15, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (226, 2, 16, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (227, 2, 17, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (228, 2, 18, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (229, 2, 19, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (230, 2, 20, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (231, 2, 1, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (232, 2, 2, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (233, 2, 3, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (234, 2, 4, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (235, 2, 5, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (236, 2, 6, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (237, 2, 7, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (238, 2, 8, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (239, 2, 9, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (240, 2, 10, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (241, 2, 11, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (242, 2, 12, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (243, 2, 13, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (244, 2, 14, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (245, 2, 15, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (246, 2, 16, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (247, 2, 17, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (248, 2, 18, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (249, 2, 19, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (250, 2, 20, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (251, 2, 1, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (252, 2, 2, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (253, 2, 3, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (254, 2, 4, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (255, 2, 5, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (256, 2, 6, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (257, 2, 7, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (258, 2, 8, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (259, 2, 9, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (260, 2, 10, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (261, 2, 11, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (262, 2, 12, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (263, 2, 13, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (264, 2, 14, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (265, 2, 15, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (266, 2, 16, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (267, 2, 17, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (268, 2, 18, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (269, 2, 19, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (270, 2, 20, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (271, 2, 1, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (272, 2, 2, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (273, 2, 3, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (274, 2, 4, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (275, 2, 5, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (276, 2, 6, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (277, 2, 7, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (278, 2, 8, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (279, 2, 9, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (280, 2, 10, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (281, 2, 11, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (282, 2, 12, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (283, 2, 13, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (284, 2, 14, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (285, 2, 15, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (286, 2, 16, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (287, 2, 17, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (288, 2, 18, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (289, 2, 19, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (290, 2, 20, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (291, 2, 1, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (292, 2, 2, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (293, 2, 3, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (294, 2, 4, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (295, 2, 5, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (296, 2, 6, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (297, 2, 7, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (298, 2, 8, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (299, 2, 9, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (300, 2, 10, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (301, 2, 11, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (302, 2, 12, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (303, 2, 13, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (304, 2, 14, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (305, 2, 15, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (306, 2, 16, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (307, 2, 17, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (308, 2, 18, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (309, 2, 19, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (310, 2, 20, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (311, 2, 1, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (312, 2, 2, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (313, 2, 3, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (314, 2, 4, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (315, 2, 5, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (316, 2, 6, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (317, 2, 7, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (318, 2, 8, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (319, 2, 9, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (320, 2, 10, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (321, 2, 11, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (322, 2, 12, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (323, 2, 13, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (324, 2, 14, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (325, 2, 15, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (326, 2, 16, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (327, 2, 17, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (328, 2, 18, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (329, 2, 19, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (330, 2, 20, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (331, 2, 1, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (332, 2, 2, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (333, 2, 3, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (334, 2, 4, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (335, 2, 5, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (336, 2, 6, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (337, 2, 7, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (338, 2, 8, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (339, 2, 9, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (340, 2, 10, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (341, 2, 11, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (342, 2, 12, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (343, 2, 13, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (344, 2, 14, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (345, 2, 15, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (346, 2, 16, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (347, 2, 17, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (348, 2, 18, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (349, 2, 19, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (350, 2, 20, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (351, 3, 1, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (352, 3, 2, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (353, 3, 3, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (354, 3, 4, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (355, 3, 5, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (356, 3, 6, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (357, 3, 7, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (358, 3, 8, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (359, 3, 9, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (360, 3, 10, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (361, 3, 11, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (362, 3, 12, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (363, 3, 13, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (364, 3, 14, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (365, 3, 15, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (366, 3, 16, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (367, 3, 17, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (368, 3, 18, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (369, 3, 1, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (370, 3, 2, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (371, 3, 3, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (372, 3, 4, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (373, 3, 5, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (374, 3, 6, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (375, 3, 7, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (376, 3, 8, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (377, 3, 9, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (378, 3, 10, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (379, 3, 11, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (380, 3, 12, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (381, 3, 13, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (382, 3, 14, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (383, 3, 15, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (384, 3, 16, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (385, 3, 17, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (386, 3, 18, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (387, 3, 1, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (388, 3, 2, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (389, 3, 3, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (390, 3, 4, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (391, 3, 5, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (392, 3, 6, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (393, 3, 7, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (394, 3, 8, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (395, 3, 9, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (396, 3, 10, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (397, 3, 11, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (398, 3, 12, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (399, 3, 13, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (400, 3, 14, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (401, 3, 15, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (402, 3, 16, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (403, 3, 17, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (404, 3, 18, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (405, 3, 1, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (406, 3, 2, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (407, 3, 3, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (408, 3, 4, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (409, 3, 5, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (410, 3, 6, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (411, 3, 7, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (412, 3, 8, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (413, 3, 9, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (414, 3, 10, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (415, 3, 11, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (416, 3, 12, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (417, 3, 13, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (418, 3, 14, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (419, 3, 15, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (420, 3, 16, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (421, 3, 17, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (422, 3, 18, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (423, 3, 1, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (424, 3, 2, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (425, 3, 3, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (426, 3, 4, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (427, 3, 5, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (428, 3, 6, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (429, 3, 7, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (430, 3, 8, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (431, 3, 9, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (432, 3, 10, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (433, 3, 11, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (434, 3, 12, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (435, 3, 13, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (436, 3, 14, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (437, 3, 15, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (438, 3, 16, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (439, 3, 17, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (440, 3, 18, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (441, 3, 1, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (442, 3, 2, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (443, 3, 3, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (444, 3, 4, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (445, 3, 5, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (446, 3, 6, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (447, 3, 7, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (448, 3, 8, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (449, 3, 9, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (450, 3, 10, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (451, 3, 11, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (452, 3, 12, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (453, 3, 13, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (454, 3, 14, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (455, 3, 15, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (456, 3, 16, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (457, 3, 17, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (458, 3, 18, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (459, 3, 1, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (460, 3, 2, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (461, 3, 3, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (462, 3, 4, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (463, 3, 5, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (464, 3, 6, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (465, 3, 7, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (466, 3, 8, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (467, 3, 9, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (468, 3, 10, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (469, 3, 11, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (470, 3, 12, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (471, 3, 13, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (472, 3, 14, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (473, 3, 15, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (474, 3, 16, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (475, 3, 17, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (476, 3, 18, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (477, 3, 1, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (478, 3, 2, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (479, 3, 3, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (480, 3, 4, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (481, 3, 5, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (482, 3, 6, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (483, 3, 7, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (484, 3, 8, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (485, 3, 9, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (486, 3, 10, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (487, 3, 11, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (488, 3, 12, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (489, 3, 13, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (490, 3, 14, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (491, 3, 15, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (492, 3, 16, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (493, 3, 17, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (494, 3, 18, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (495, 3, 1, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (496, 3, 2, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (497, 3, 3, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (498, 3, 4, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (499, 3, 5, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (500, 3, 6, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (501, 3, 7, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (502, 3, 8, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (503, 3, 9, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (504, 3, 10, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (505, 3, 11, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (506, 3, 12, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (507, 3, 13, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (508, 3, 14, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (509, 3, 15, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (510, 3, 16, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (511, 3, 17, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (512, 3, 18, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (513, 3, 1, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (514, 3, 2, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (515, 3, 3, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (516, 3, 4, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (517, 3, 5, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (518, 3, 6, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (519, 3, 7, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (520, 3, 8, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (521, 3, 9, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (522, 3, 10, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (523, 3, 11, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (524, 3, 12, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (525, 3, 13, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (526, 3, 14, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (527, 3, 15, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (528, 3, 16, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (529, 3, 17, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (530, 3, 18, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (531, 4, 1, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (532, 4, 2, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (533, 4, 3, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (534, 4, 4, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (535, 4, 5, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (536, 4, 6, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (537, 4, 7, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (538, 4, 8, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (539, 4, 9, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (540, 4, 10, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (541, 4, 11, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (542, 4, 12, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (543, 4, 13, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (544, 4, 14, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (545, 4, 15, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (546, 4, 1, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (547, 4, 2, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (548, 4, 3, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (549, 4, 4, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (550, 4, 5, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (551, 4, 6, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (552, 4, 7, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (553, 4, 8, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (554, 4, 9, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (555, 4, 10, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (556, 4, 11, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (557, 4, 12, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (558, 4, 13, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (559, 4, 14, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (560, 4, 15, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (561, 4, 1, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (562, 4, 2, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (563, 4, 3, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (564, 4, 4, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (565, 4, 5, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (566, 4, 6, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (567, 4, 7, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (568, 4, 8, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (569, 4, 9, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (570, 4, 10, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (571, 4, 11, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (572, 4, 12, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (573, 4, 13, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (574, 4, 14, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (575, 4, 15, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (576, 4, 1, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (577, 4, 2, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (578, 4, 3, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (579, 4, 4, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (580, 4, 5, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (581, 4, 6, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (582, 4, 7, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (583, 4, 8, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (584, 4, 9, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (585, 4, 10, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (586, 4, 11, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (587, 4, 12, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (588, 4, 13, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (589, 4, 14, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (590, 4, 15, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (591, 4, 1, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (592, 4, 2, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (593, 4, 3, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (594, 4, 4, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (595, 4, 5, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (596, 4, 6, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (597, 4, 7, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (598, 4, 8, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (599, 4, 9, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (600, 4, 10, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (601, 4, 11, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (602, 4, 12, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (603, 4, 13, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (604, 4, 14, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (605, 4, 15, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (606, 4, 1, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (607, 4, 2, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (608, 4, 3, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (609, 4, 4, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (610, 4, 5, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (611, 4, 6, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (612, 4, 7, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (613, 4, 8, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (614, 4, 9, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (615, 4, 10, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (616, 4, 11, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (617, 4, 12, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (618, 4, 13, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (619, 4, 14, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (620, 4, 15, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (621, 4, 1, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (622, 4, 2, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (623, 4, 3, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (624, 4, 4, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (625, 4, 5, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (626, 4, 6, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (627, 4, 7, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (628, 4, 8, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (629, 4, 9, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (630, 4, 10, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (631, 4, 11, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (632, 4, 12, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (633, 4, 13, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (634, 4, 14, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (635, 4, 15, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (636, 4, 1, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (637, 4, 2, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (638, 4, 3, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (639, 4, 4, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (640, 4, 5, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (641, 4, 6, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (642, 4, 7, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (643, 4, 8, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (644, 4, 9, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (645, 4, 10, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (646, 4, 11, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (647, 4, 12, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (648, 4, 13, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (649, 4, 14, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (650, 4, 15, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (651, 4, 1, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (652, 4, 2, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (653, 4, 3, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (654, 4, 4, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (655, 4, 5, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (656, 4, 6, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (657, 4, 7, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (658, 4, 8, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (659, 4, 9, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (660, 4, 10, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (661, 4, 11, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (662, 4, 12, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (663, 4, 13, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (664, 4, 14, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (665, 4, 15, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (666, 4, 1, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (667, 4, 2, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (668, 4, 3, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (669, 4, 4, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (670, 4, 5, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (671, 4, 6, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (672, 4, 7, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (673, 4, 8, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (674, 4, 9, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (675, 4, 10, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (676, 4, 11, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (677, 4, 12, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (678, 4, 13, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (679, 4, 14, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (680, 4, 15, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (681, 5, 1, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (682, 5, 2, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (683, 5, 3, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (684, 5, 4, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (685, 5, 5, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (686, 5, 6, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (687, 5, 7, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (688, 5, 8, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (689, 5, 9, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (690, 5, 10, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (691, 5, 11, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (692, 5, 12, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (693, 5, 13, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (694, 5, 14, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (695, 5, 15, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (696, 5, 16, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (697, 5, 17, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (698, 5, 18, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (699, 5, 19, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (700, 5, 20, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (701, 5, 1, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (702, 5, 2, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (703, 5, 3, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (704, 5, 4, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (705, 5, 5, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (706, 5, 6, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (707, 5, 7, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (708, 5, 8, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (709, 5, 9, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (710, 5, 10, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (711, 5, 11, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (712, 5, 12, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (713, 5, 13, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (714, 5, 14, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (715, 5, 15, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (716, 5, 16, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (717, 5, 17, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (718, 5, 18, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (719, 5, 19, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (720, 5, 20, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (721, 5, 1, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (722, 5, 2, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (723, 5, 3, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (724, 5, 4, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (725, 5, 5, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (726, 5, 6, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (727, 5, 7, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (728, 5, 8, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (729, 5, 9, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (730, 5, 10, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (731, 5, 11, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (732, 5, 12, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (733, 5, 13, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (734, 5, 14, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (735, 5, 15, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (736, 5, 16, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (737, 5, 17, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (738, 5, 18, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (739, 5, 19, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (740, 5, 20, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (741, 5, 1, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (742, 5, 2, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (743, 5, 3, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (744, 5, 4, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (745, 5, 5, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (746, 5, 6, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (747, 5, 7, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (748, 5, 8, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (749, 5, 9, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (750, 5, 10, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (751, 5, 11, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (752, 5, 12, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (753, 5, 13, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (754, 5, 14, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (755, 5, 15, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (756, 5, 16, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (757, 5, 17, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (758, 5, 18, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (759, 5, 19, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (760, 5, 20, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (761, 5, 1, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (762, 5, 2, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (763, 5, 3, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (764, 5, 4, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (765, 5, 5, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (766, 5, 6, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (767, 5, 7, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (768, 5, 8, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (769, 5, 9, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (770, 5, 10, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (771, 5, 11, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (772, 5, 12, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (773, 5, 13, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (774, 5, 14, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (775, 5, 15, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (776, 5, 16, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (777, 5, 17, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (778, 5, 18, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (779, 5, 19, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (780, 5, 20, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (781, 5, 1, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (782, 5, 2, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (783, 5, 3, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (784, 5, 4, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (785, 5, 5, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (786, 5, 6, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (787, 5, 7, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (788, 5, 8, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (789, 5, 9, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (790, 5, 10, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (791, 5, 11, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (792, 5, 12, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (793, 5, 13, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (794, 5, 14, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (795, 5, 15, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (796, 5, 16, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (797, 5, 17, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (798, 5, 18, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (799, 5, 19, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (800, 5, 20, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (801, 5, 1, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (802, 5, 2, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (803, 5, 3, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (804, 5, 4, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (805, 5, 5, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (806, 5, 6, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (807, 5, 7, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (808, 5, 8, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (809, 5, 9, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (810, 5, 10, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (811, 5, 11, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (812, 5, 12, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (813, 5, 13, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (814, 5, 14, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (815, 5, 15, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (816, 5, 16, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (817, 5, 17, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (818, 5, 18, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (819, 5, 19, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (820, 5, 20, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (821, 5, 1, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (822, 5, 2, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (823, 5, 3, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (824, 5, 4, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (825, 5, 5, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (826, 5, 6, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (827, 5, 7, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (828, 5, 8, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (829, 5, 9, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (830, 5, 10, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (831, 5, 11, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (832, 5, 12, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (833, 5, 13, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (834, 5, 14, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (835, 5, 15, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (836, 5, 16, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (837, 5, 17, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (838, 5, 18, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (839, 5, 19, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (840, 5, 20, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (841, 5, 1, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (842, 5, 2, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (843, 5, 3, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (844, 5, 4, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (845, 5, 5, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (846, 5, 6, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (847, 5, 7, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (848, 5, 8, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (849, 5, 9, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (850, 5, 10, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (851, 5, 11, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (852, 5, 12, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (853, 5, 13, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (854, 5, 14, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (855, 5, 15, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (856, 5, 16, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (857, 5, 17, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (858, 5, 18, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (859, 5, 19, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (860, 5, 20, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (861, 5, 1, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (862, 5, 2, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (863, 5, 3, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (864, 5, 4, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (865, 5, 5, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (866, 5, 6, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (867, 5, 7, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (868, 5, 8, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (869, 5, 9, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (870, 5, 10, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (871, 5, 11, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (872, 5, 12, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (873, 5, 13, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (874, 5, 14, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (875, 5, 15, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (876, 5, 16, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (877, 5, 17, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (878, 5, 18, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (879, 5, 19, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (880, 5, 20, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (881, 6, 1, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (882, 6, 2, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (883, 6, 3, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (884, 6, 4, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (885, 6, 5, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (886, 6, 6, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (887, 6, 7, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (888, 6, 8, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (889, 6, 9, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (890, 6, 10, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (891, 6, 11, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (892, 6, 12, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (893, 6, 13, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (894, 6, 14, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (895, 6, 15, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (896, 6, 16, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (897, 6, 17, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (898, 6, 18, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (899, 6, 1, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (900, 6, 2, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (901, 6, 3, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (902, 6, 4, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (903, 6, 5, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (904, 6, 6, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (905, 6, 7, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (906, 6, 8, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (907, 6, 9, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (908, 6, 10, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (909, 6, 11, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (910, 6, 12, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (911, 6, 13, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (912, 6, 14, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (913, 6, 15, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (914, 6, 16, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (915, 6, 17, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (916, 6, 18, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (917, 6, 1, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (918, 6, 2, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (919, 6, 3, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (920, 6, 4, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (921, 6, 5, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (922, 6, 6, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (923, 6, 7, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (924, 6, 8, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (925, 6, 9, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (926, 6, 10, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (927, 6, 11, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (928, 6, 12, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (929, 6, 13, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (930, 6, 14, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (931, 6, 15, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (932, 6, 16, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (933, 6, 17, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (934, 6, 18, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (935, 6, 1, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (936, 6, 2, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (937, 6, 3, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (938, 6, 4, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (939, 6, 5, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (940, 6, 6, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (941, 6, 7, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (942, 6, 8, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (943, 6, 9, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (944, 6, 10, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (945, 6, 11, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (946, 6, 12, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (947, 6, 13, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (948, 6, 14, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (949, 6, 15, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (950, 6, 16, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (951, 6, 17, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (952, 6, 18, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (953, 6, 1, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (954, 6, 2, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (955, 6, 3, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (956, 6, 4, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (957, 6, 5, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (958, 6, 6, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (959, 6, 7, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (960, 6, 8, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (961, 6, 9, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (962, 6, 10, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (963, 6, 11, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (964, 6, 12, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (965, 6, 13, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (966, 6, 14, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (967, 6, 15, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (968, 6, 16, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (969, 6, 17, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (970, 6, 18, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (971, 6, 1, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (972, 6, 2, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (973, 6, 3, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (974, 6, 4, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (975, 6, 5, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (976, 6, 6, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (977, 6, 7, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (978, 6, 8, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (979, 6, 9, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (980, 6, 10, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (981, 6, 11, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (982, 6, 12, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (983, 6, 13, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (984, 6, 14, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (985, 6, 15, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (986, 6, 16, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (987, 6, 17, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (988, 6, 18, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (989, 6, 1, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (990, 6, 2, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (991, 6, 3, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (992, 6, 4, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (993, 6, 5, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (994, 6, 6, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (995, 6, 7, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (996, 6, 8, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (997, 6, 9, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (998, 6, 10, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (999, 6, 11, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1000, 6, 12, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1001, 6, 13, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1002, 6, 14, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1003, 6, 15, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1004, 6, 16, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1005, 6, 17, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1006, 6, 18, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1007, 6, 1, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1008, 6, 2, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1009, 6, 3, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1010, 6, 4, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1011, 6, 5, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1012, 6, 6, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1013, 6, 7, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1014, 6, 8, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1015, 6, 9, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1016, 6, 10, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1017, 6, 11, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1018, 6, 12, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1019, 6, 13, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1020, 6, 14, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1021, 6, 15, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1022, 6, 16, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1023, 6, 17, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1024, 6, 18, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1025, 6, 1, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1026, 6, 2, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1027, 6, 3, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1028, 6, 4, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1029, 6, 5, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1030, 6, 6, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1031, 6, 7, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1032, 6, 8, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1033, 6, 9, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1034, 6, 10, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1035, 6, 11, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1036, 6, 12, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1037, 6, 13, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1038, 6, 14, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1039, 6, 15, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1040, 6, 16, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1041, 6, 17, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1042, 6, 18, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1043, 6, 1, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1044, 6, 2, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1045, 6, 3, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1046, 6, 4, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1047, 6, 5, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1048, 6, 6, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1049, 6, 7, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1050, 6, 8, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1051, 6, 9, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1052, 6, 10, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1053, 6, 11, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1054, 6, 12, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1055, 6, 13, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1056, 6, 14, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1057, 6, 15, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1058, 6, 16, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1059, 6, 17, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1060, 6, 18, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1061, 7, 1, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1062, 7, 2, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1063, 7, 3, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1064, 7, 4, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1065, 7, 5, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1066, 7, 6, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1067, 7, 7, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1068, 7, 8, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1069, 7, 9, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1070, 7, 10, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1071, 7, 11, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1072, 7, 12, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1073, 7, 13, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1074, 7, 14, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1075, 7, 15, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1076, 7, 1, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1077, 7, 2, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1078, 7, 3, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1079, 7, 4, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1080, 7, 5, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1081, 7, 6, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1082, 7, 7, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1083, 7, 8, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1084, 7, 9, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1085, 7, 10, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1086, 7, 11, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1087, 7, 12, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1088, 7, 13, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1089, 7, 14, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1090, 7, 15, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1091, 7, 1, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1092, 7, 2, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1093, 7, 3, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1094, 7, 4, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1095, 7, 5, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1096, 7, 6, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1097, 7, 7, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1098, 7, 8, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1099, 7, 9, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1100, 7, 10, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1101, 7, 11, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1102, 7, 12, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1103, 7, 13, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1104, 7, 14, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1105, 7, 15, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1106, 7, 1, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1107, 7, 2, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1108, 7, 3, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1109, 7, 4, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1110, 7, 5, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1111, 7, 6, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1112, 7, 7, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1113, 7, 8, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1114, 7, 9, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1115, 7, 10, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1116, 7, 11, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1117, 7, 12, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1118, 7, 13, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1119, 7, 14, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1120, 7, 15, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1121, 7, 1, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1122, 7, 2, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1123, 7, 3, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1124, 7, 4, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1125, 7, 5, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1126, 7, 6, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1127, 7, 7, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1128, 7, 8, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1129, 7, 9, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1130, 7, 10, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1131, 7, 11, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1132, 7, 12, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1133, 7, 13, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1134, 7, 14, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1135, 7, 15, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1136, 7, 1, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1137, 7, 2, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1138, 7, 3, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1139, 7, 4, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1140, 7, 5, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1141, 7, 6, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1142, 7, 7, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1143, 7, 8, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1144, 7, 9, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1145, 7, 10, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1146, 7, 11, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1147, 7, 12, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1148, 7, 13, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1149, 7, 14, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1150, 7, 15, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1151, 7, 1, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1152, 7, 2, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1153, 7, 3, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1154, 7, 4, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1155, 7, 5, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1156, 7, 6, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1157, 7, 7, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1158, 7, 8, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1159, 7, 9, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1160, 7, 10, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1161, 7, 11, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1162, 7, 12, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1163, 7, 13, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1164, 7, 14, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1165, 7, 15, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1166, 7, 1, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1167, 7, 2, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1168, 7, 3, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1169, 7, 4, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1170, 7, 5, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1171, 7, 6, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1172, 7, 7, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1173, 7, 8, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1174, 7, 9, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1175, 7, 10, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1176, 7, 11, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1177, 7, 12, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1178, 7, 13, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1179, 7, 14, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1180, 7, 15, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1181, 7, 1, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1182, 7, 2, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1183, 7, 3, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1184, 7, 4, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1185, 7, 5, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1186, 7, 6, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1187, 7, 7, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1188, 7, 8, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1189, 7, 9, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1190, 7, 10, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1191, 7, 11, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1192, 7, 12, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1193, 7, 13, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1194, 7, 14, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1195, 7, 15, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1196, 7, 1, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1197, 7, 2, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1198, 7, 3, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1199, 7, 4, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1200, 7, 5, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1201, 7, 6, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1202, 7, 7, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1203, 7, 8, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1204, 7, 9, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1205, 7, 10, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1206, 7, 11, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1207, 7, 12, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1208, 7, 13, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1209, 7, 14, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1210, 7, 15, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1211, 8, 1, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1212, 8, 2, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1213, 8, 3, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1214, 8, 4, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1215, 8, 5, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1216, 8, 6, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1217, 8, 7, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1218, 8, 8, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1219, 8, 9, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1220, 8, 10, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1221, 8, 11, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1222, 8, 12, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1223, 8, 13, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1224, 8, 14, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1225, 8, 15, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1226, 8, 16, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1227, 8, 17, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1228, 8, 18, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1229, 8, 19, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1230, 8, 20, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1231, 8, 1, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1232, 8, 2, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1233, 8, 3, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1234, 8, 4, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1235, 8, 5, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1236, 8, 6, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1237, 8, 7, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1238, 8, 8, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1239, 8, 9, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1240, 8, 10, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1241, 8, 11, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1242, 8, 12, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1243, 8, 13, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1244, 8, 14, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1245, 8, 15, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1246, 8, 16, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1247, 8, 17, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1248, 8, 18, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1249, 8, 19, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1250, 8, 20, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1251, 8, 1, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1252, 8, 2, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1253, 8, 3, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1254, 8, 4, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1255, 8, 5, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1256, 8, 6, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1257, 8, 7, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1258, 8, 8, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1259, 8, 9, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1260, 8, 10, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1261, 8, 11, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1262, 8, 12, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1263, 8, 13, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1264, 8, 14, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1265, 8, 15, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1266, 8, 16, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1267, 8, 17, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1268, 8, 18, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1269, 8, 19, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1270, 8, 20, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1271, 8, 1, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1272, 8, 2, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1273, 8, 3, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1274, 8, 4, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1275, 8, 5, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1276, 8, 6, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1277, 8, 7, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1278, 8, 8, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1279, 8, 9, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1280, 8, 10, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1281, 8, 11, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1282, 8, 12, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1283, 8, 13, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1284, 8, 14, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1285, 8, 15, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1286, 8, 16, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1287, 8, 17, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1288, 8, 18, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1289, 8, 19, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1290, 8, 20, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1291, 8, 1, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1292, 8, 2, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1293, 8, 3, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1294, 8, 4, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1295, 8, 5, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1296, 8, 6, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1297, 8, 7, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1298, 8, 8, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1299, 8, 9, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1300, 8, 10, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1301, 8, 11, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1302, 8, 12, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1303, 8, 13, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1304, 8, 14, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1305, 8, 15, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1306, 8, 16, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1307, 8, 17, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1308, 8, 18, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1309, 8, 19, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1310, 8, 20, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1311, 8, 1, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1312, 8, 2, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1313, 8, 3, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1314, 8, 4, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1315, 8, 5, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1316, 8, 6, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1317, 8, 7, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1318, 8, 8, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1319, 8, 9, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1320, 8, 10, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1321, 8, 11, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1322, 8, 12, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1323, 8, 13, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1324, 8, 14, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1325, 8, 15, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1326, 8, 16, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1327, 8, 17, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1328, 8, 18, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1329, 8, 19, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1330, 8, 20, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1331, 8, 1, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1332, 8, 2, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1333, 8, 3, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1334, 8, 4, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1335, 8, 5, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1336, 8, 6, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1337, 8, 7, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1338, 8, 8, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1339, 8, 9, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1340, 8, 10, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1341, 8, 11, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1342, 8, 12, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1343, 8, 13, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1344, 8, 14, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1345, 8, 15, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1346, 8, 16, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1347, 8, 17, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1348, 8, 18, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1349, 8, 19, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1350, 8, 20, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1351, 8, 1, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1352, 8, 2, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1353, 8, 3, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1354, 8, 4, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1355, 8, 5, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1356, 8, 6, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1357, 8, 7, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1358, 8, 8, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1359, 8, 9, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1360, 8, 10, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1361, 8, 11, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1362, 8, 12, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1363, 8, 13, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1364, 8, 14, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1365, 8, 15, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1366, 8, 16, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1367, 8, 17, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1368, 8, 18, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1369, 8, 19, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1370, 8, 20, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1371, 8, 1, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1372, 8, 2, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1373, 8, 3, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1374, 8, 4, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1375, 8, 5, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1376, 8, 6, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1377, 8, 7, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1378, 8, 8, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1379, 8, 9, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1380, 8, 10, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1381, 8, 11, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1382, 8, 12, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1383, 8, 13, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1384, 8, 14, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1385, 8, 15, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1386, 8, 16, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1387, 8, 17, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1388, 8, 18, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1389, 8, 19, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1390, 8, 20, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1391, 8, 1, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1392, 8, 2, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1393, 8, 3, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1394, 8, 4, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1395, 8, 5, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1396, 8, 6, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1397, 8, 7, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1398, 8, 8, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1399, 8, 9, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1400, 8, 10, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1401, 8, 11, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1402, 8, 12, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1403, 8, 13, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1404, 8, 14, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1405, 8, 15, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1406, 8, 16, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1407, 8, 17, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1408, 8, 18, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1409, 8, 19, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1410, 8, 20, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1411, 9, 1, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1412, 9, 2, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1413, 9, 3, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1414, 9, 4, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1415, 9, 5, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1416, 9, 6, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1417, 9, 7, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1418, 9, 8, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1419, 9, 9, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1420, 9, 10, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1421, 9, 11, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1422, 9, 12, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1423, 9, 13, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1424, 9, 14, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1425, 9, 15, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1426, 9, 16, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1427, 9, 17, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1428, 9, 18, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1429, 9, 1, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1430, 9, 2, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1431, 9, 3, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1432, 9, 4, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1433, 9, 5, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1434, 9, 6, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1435, 9, 7, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1436, 9, 8, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1437, 9, 9, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1438, 9, 10, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1439, 9, 11, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1440, 9, 12, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1441, 9, 13, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1442, 9, 14, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1443, 9, 15, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1444, 9, 16, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1445, 9, 17, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1446, 9, 18, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1447, 9, 1, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1448, 9, 2, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1449, 9, 3, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1450, 9, 4, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1451, 9, 5, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1452, 9, 6, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1453, 9, 7, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1454, 9, 8, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1455, 9, 9, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1456, 9, 10, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1457, 9, 11, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1458, 9, 12, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1459, 9, 13, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1460, 9, 14, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1461, 9, 15, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1462, 9, 16, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1463, 9, 17, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1464, 9, 18, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1465, 9, 1, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1466, 9, 2, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1467, 9, 3, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1468, 9, 4, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1469, 9, 5, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1470, 9, 6, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1471, 9, 7, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1472, 9, 8, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1473, 9, 9, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1474, 9, 10, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1475, 9, 11, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1476, 9, 12, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1477, 9, 13, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1478, 9, 14, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1479, 9, 15, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1480, 9, 16, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1481, 9, 17, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1482, 9, 18, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1483, 9, 1, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1484, 9, 2, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1485, 9, 3, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1486, 9, 4, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1487, 9, 5, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1488, 9, 6, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1489, 9, 7, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1490, 9, 8, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1491, 9, 9, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1492, 9, 10, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1493, 9, 11, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1494, 9, 12, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1495, 9, 13, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1496, 9, 14, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1497, 9, 15, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1498, 9, 16, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1499, 9, 17, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1500, 9, 18, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1501, 9, 1, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1502, 9, 2, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1503, 9, 3, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1504, 9, 4, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1505, 9, 5, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1506, 9, 6, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1507, 9, 7, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1508, 9, 8, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1509, 9, 9, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1510, 9, 10, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1511, 9, 11, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1512, 9, 12, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1513, 9, 13, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1514, 9, 14, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1515, 9, 15, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1516, 9, 16, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1517, 9, 17, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1518, 9, 18, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1519, 9, 1, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1520, 9, 2, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1521, 9, 3, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1522, 9, 4, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1523, 9, 5, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1524, 9, 6, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1525, 9, 7, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1526, 9, 8, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1527, 9, 9, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1528, 9, 10, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1529, 9, 11, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1530, 9, 12, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1531, 9, 13, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1532, 9, 14, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1533, 9, 15, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1534, 9, 16, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1535, 9, 17, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1536, 9, 18, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1537, 9, 1, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1538, 9, 2, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1539, 9, 3, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1540, 9, 4, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1541, 9, 5, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1542, 9, 6, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1543, 9, 7, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1544, 9, 8, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1545, 9, 9, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1546, 9, 10, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1547, 9, 11, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1548, 9, 12, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1549, 9, 13, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1550, 9, 14, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1551, 9, 15, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1552, 9, 16, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1553, 9, 17, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1554, 9, 18, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1555, 9, 1, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1556, 9, 2, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1557, 9, 3, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1558, 9, 4, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1559, 9, 5, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1560, 9, 6, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1561, 9, 7, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1562, 9, 8, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1563, 9, 9, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1564, 9, 10, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1565, 9, 11, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1566, 9, 12, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1567, 9, 13, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1568, 9, 14, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1569, 9, 15, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1570, 9, 16, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1571, 9, 17, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1572, 9, 18, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1573, 9, 1, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1574, 9, 2, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1575, 9, 3, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1576, 9, 4, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1577, 9, 5, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1578, 9, 6, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1579, 9, 7, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1580, 9, 8, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1581, 9, 9, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1582, 9, 10, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1583, 9, 11, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1584, 9, 12, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1585, 9, 13, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1586, 9, 14, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1587, 9, 15, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1588, 9, 16, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1589, 9, 17, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1590, 9, 18, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1591, 10, 1, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1592, 10, 2, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1593, 10, 3, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1594, 10, 4, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1595, 10, 5, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1596, 10, 6, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1597, 10, 7, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1598, 10, 8, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1599, 10, 9, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1600, 10, 10, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1601, 10, 11, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1602, 10, 12, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1603, 10, 13, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1604, 10, 14, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1605, 10, 15, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1606, 10, 1, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1607, 10, 2, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1608, 10, 3, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1609, 10, 4, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1610, 10, 5, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1611, 10, 6, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1612, 10, 7, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1613, 10, 8, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1614, 10, 9, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1615, 10, 10, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1616, 10, 11, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1617, 10, 12, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1618, 10, 13, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1619, 10, 14, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1620, 10, 15, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1621, 10, 1, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1622, 10, 2, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1623, 10, 3, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1624, 10, 4, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1625, 10, 5, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1626, 10, 6, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1627, 10, 7, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1628, 10, 8, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1629, 10, 9, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1630, 10, 10, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1631, 10, 11, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1632, 10, 12, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1633, 10, 13, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1634, 10, 14, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1635, 10, 15, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1636, 10, 1, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1637, 10, 2, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1638, 10, 3, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1639, 10, 4, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1640, 10, 5, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1641, 10, 6, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1642, 10, 7, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1643, 10, 8, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1644, 10, 9, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1645, 10, 10, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1646, 10, 11, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1647, 10, 12, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1648, 10, 13, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1649, 10, 14, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1650, 10, 15, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1651, 10, 1, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1652, 10, 2, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1653, 10, 3, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1654, 10, 4, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1655, 10, 5, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1656, 10, 6, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1657, 10, 7, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1658, 10, 8, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1659, 10, 9, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1660, 10, 10, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1661, 10, 11, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1662, 10, 12, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1663, 10, 13, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1664, 10, 14, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1665, 10, 15, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1666, 10, 1, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1667, 10, 2, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1668, 10, 3, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1669, 10, 4, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1670, 10, 5, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1671, 10, 6, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1672, 10, 7, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1673, 10, 8, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1674, 10, 9, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1675, 10, 10, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1676, 10, 11, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1677, 10, 12, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1678, 10, 13, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1679, 10, 14, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1680, 10, 15, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1681, 10, 1, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1682, 10, 2, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1683, 10, 3, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1684, 10, 4, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1685, 10, 5, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1686, 10, 6, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1687, 10, 7, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1688, 10, 8, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1689, 10, 9, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1690, 10, 10, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1691, 10, 11, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1692, 10, 12, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1693, 10, 13, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1694, 10, 14, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1695, 10, 15, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1696, 10, 1, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1697, 10, 2, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1698, 10, 3, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1699, 10, 4, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1700, 10, 5, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1701, 10, 6, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1702, 10, 7, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1703, 10, 8, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1704, 10, 9, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1705, 10, 10, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1706, 10, 11, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1707, 10, 12, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1708, 10, 13, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1709, 10, 14, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1710, 10, 15, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1711, 10, 1, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1712, 10, 2, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1713, 10, 3, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1714, 10, 4, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1715, 10, 5, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1716, 10, 6, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1717, 10, 7, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1718, 10, 8, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1719, 10, 9, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1720, 10, 10, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1721, 10, 11, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1722, 10, 12, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1723, 10, 13, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1724, 10, 14, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1725, 10, 15, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1726, 10, 1, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1727, 10, 2, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1728, 10, 3, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1729, 10, 4, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1730, 10, 5, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1731, 10, 6, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1732, 10, 7, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1733, 10, 8, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1734, 10, 9, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1735, 10, 10, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1736, 10, 11, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1737, 10, 12, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1738, 10, 13, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1739, 10, 14, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1740, 10, 15, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1741, 11, 1, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1742, 11, 2, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1743, 11, 3, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1744, 11, 4, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1745, 11, 5, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1746, 11, 6, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1747, 11, 7, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1748, 11, 8, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1749, 11, 9, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1750, 11, 10, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1751, 11, 11, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1752, 11, 12, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1753, 11, 13, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1754, 11, 14, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1755, 11, 15, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1756, 11, 16, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1757, 11, 17, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1758, 11, 18, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1759, 11, 19, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1760, 11, 20, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1761, 11, 1, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1762, 11, 2, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1763, 11, 3, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1764, 11, 4, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1765, 11, 5, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1766, 11, 6, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1767, 11, 7, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1768, 11, 8, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1769, 11, 9, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1770, 11, 10, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1771, 11, 11, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1772, 11, 12, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1773, 11, 13, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1774, 11, 14, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1775, 11, 15, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1776, 11, 16, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1777, 11, 17, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1778, 11, 18, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1779, 11, 19, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1780, 11, 20, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1781, 11, 1, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1782, 11, 2, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1783, 11, 3, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1784, 11, 4, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1785, 11, 5, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1786, 11, 6, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1787, 11, 7, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1788, 11, 8, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1789, 11, 9, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1790, 11, 10, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1791, 11, 11, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1792, 11, 12, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1793, 11, 13, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1794, 11, 14, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1795, 11, 15, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1796, 11, 16, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1797, 11, 17, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1798, 11, 18, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1799, 11, 19, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1800, 11, 20, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1801, 11, 1, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1802, 11, 2, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1803, 11, 3, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1804, 11, 4, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1805, 11, 5, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1806, 11, 6, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1807, 11, 7, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1808, 11, 8, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1809, 11, 9, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1810, 11, 10, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1811, 11, 11, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1812, 11, 12, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1813, 11, 13, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1814, 11, 14, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1815, 11, 15, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1816, 11, 16, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1817, 11, 17, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1818, 11, 18, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1819, 11, 19, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1820, 11, 20, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1821, 11, 1, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1822, 11, 2, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1823, 11, 3, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1824, 11, 4, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1825, 11, 5, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1826, 11, 6, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1827, 11, 7, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1828, 11, 8, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1829, 11, 9, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1830, 11, 10, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1831, 11, 11, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1832, 11, 12, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1833, 11, 13, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1834, 11, 14, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1835, 11, 15, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1836, 11, 16, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1837, 11, 17, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1838, 11, 18, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1839, 11, 19, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1840, 11, 20, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1841, 11, 1, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1842, 11, 2, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1843, 11, 3, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1844, 11, 4, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1845, 11, 5, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1846, 11, 6, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1847, 11, 7, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1848, 11, 8, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1849, 11, 9, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1850, 11, 10, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1851, 11, 11, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1852, 11, 12, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1853, 11, 13, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1854, 11, 14, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1855, 11, 15, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1856, 11, 16, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1857, 11, 17, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1858, 11, 18, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1859, 11, 19, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1860, 11, 20, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1861, 11, 1, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1862, 11, 2, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1863, 11, 3, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1864, 11, 4, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1865, 11, 5, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1866, 11, 6, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1867, 11, 7, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1868, 11, 8, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1869, 11, 9, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1870, 11, 10, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1871, 11, 11, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1872, 11, 12, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1873, 11, 13, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1874, 11, 14, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1875, 11, 15, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1876, 11, 16, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1877, 11, 17, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1878, 11, 18, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1879, 11, 19, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1880, 11, 20, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1881, 11, 1, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1882, 11, 2, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1883, 11, 3, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1884, 11, 4, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1885, 11, 5, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1886, 11, 6, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1887, 11, 7, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1888, 11, 8, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1889, 11, 9, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1890, 11, 10, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1891, 11, 11, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1892, 11, 12, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1893, 11, 13, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1894, 11, 14, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1895, 11, 15, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1896, 11, 16, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1897, 11, 17, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1898, 11, 18, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1899, 11, 19, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1900, 11, 20, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1901, 11, 1, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1902, 11, 2, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1903, 11, 3, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1904, 11, 4, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1905, 11, 5, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1906, 11, 6, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1907, 11, 7, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1908, 11, 8, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1909, 11, 9, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1910, 11, 10, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1911, 11, 11, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1912, 11, 12, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1913, 11, 13, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1914, 11, 14, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1915, 11, 15, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1916, 11, 16, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1917, 11, 17, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1918, 11, 18, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1919, 11, 19, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1920, 11, 20, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1921, 11, 1, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1922, 11, 2, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1923, 11, 3, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1924, 11, 4, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1925, 11, 5, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1926, 11, 6, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1927, 11, 7, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1928, 11, 8, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1929, 11, 9, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1930, 11, 10, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1931, 11, 11, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1932, 11, 12, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1933, 11, 13, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1934, 11, 14, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1935, 11, 15, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1936, 11, 16, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1937, 11, 17, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1938, 11, 18, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1939, 11, 19, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1940, 11, 20, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1941, 12, 1, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1942, 12, 2, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1943, 12, 3, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1944, 12, 4, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1945, 12, 5, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1946, 12, 6, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1947, 12, 7, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1948, 12, 8, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1949, 12, 9, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1950, 12, 10, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1951, 12, 11, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1952, 12, 12, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1953, 12, 13, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1954, 12, 14, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1955, 12, 15, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1956, 12, 16, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1957, 12, 17, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1958, 12, 18, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1959, 12, 1, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1960, 12, 2, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1961, 12, 3, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1962, 12, 4, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1963, 12, 5, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1964, 12, 6, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1965, 12, 7, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1966, 12, 8, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1967, 12, 9, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1968, 12, 10, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1969, 12, 11, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1970, 12, 12, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1971, 12, 13, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1972, 12, 14, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1973, 12, 15, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1974, 12, 16, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1975, 12, 17, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1976, 12, 18, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1977, 12, 1, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1978, 12, 2, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1979, 12, 3, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1980, 12, 4, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1981, 12, 5, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1982, 12, 6, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1983, 12, 7, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1984, 12, 8, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1985, 12, 9, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1986, 12, 10, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1987, 12, 11, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1988, 12, 12, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1989, 12, 13, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1990, 12, 14, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1991, 12, 15, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1992, 12, 16, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1993, 12, 17, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1994, 12, 18, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1995, 12, 1, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1996, 12, 2, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1997, 12, 3, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1998, 12, 4, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (1999, 12, 5, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2000, 12, 6, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2001, 12, 7, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2002, 12, 8, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2003, 12, 9, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2004, 12, 10, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2005, 12, 11, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2006, 12, 12, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2007, 12, 13, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2008, 12, 14, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2009, 12, 15, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2010, 12, 16, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2011, 12, 17, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2012, 12, 18, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2013, 12, 1, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2014, 12, 2, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2015, 12, 3, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2016, 12, 4, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2017, 12, 5, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2018, 12, 6, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2019, 12, 7, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2020, 12, 8, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2021, 12, 9, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2022, 12, 10, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2023, 12, 11, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2024, 12, 12, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2025, 12, 13, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2026, 12, 14, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2027, 12, 15, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2028, 12, 16, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2029, 12, 17, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2030, 12, 18, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2031, 12, 1, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2032, 12, 2, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2033, 12, 3, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2034, 12, 4, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2035, 12, 5, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2036, 12, 6, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2037, 12, 7, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2038, 12, 8, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2039, 12, 9, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2040, 12, 10, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2041, 12, 11, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2042, 12, 12, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2043, 12, 13, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2044, 12, 14, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2045, 12, 15, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2046, 12, 16, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2047, 12, 17, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2048, 12, 18, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2049, 12, 1, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2050, 12, 2, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2051, 12, 3, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2052, 12, 4, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2053, 12, 5, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2054, 12, 6, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2055, 12, 7, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2056, 12, 8, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2057, 12, 9, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2058, 12, 10, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2059, 12, 11, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2060, 12, 12, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2061, 12, 13, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2062, 12, 14, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2063, 12, 15, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2064, 12, 16, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2065, 12, 17, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2066, 12, 18, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2067, 12, 1, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2068, 12, 2, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2069, 12, 3, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2070, 12, 4, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2071, 12, 5, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2072, 12, 6, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2073, 12, 7, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2074, 12, 8, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2075, 12, 9, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2076, 12, 10, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2077, 12, 11, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2078, 12, 12, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2079, 12, 13, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2080, 12, 14, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2081, 12, 15, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2082, 12, 16, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2083, 12, 17, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2084, 12, 18, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2085, 12, 1, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2086, 12, 2, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2087, 12, 3, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2088, 12, 4, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2089, 12, 5, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2090, 12, 6, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2091, 12, 7, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2092, 12, 8, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2093, 12, 9, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2094, 12, 10, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2095, 12, 11, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2096, 12, 12, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2097, 12, 13, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2098, 12, 14, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2099, 12, 15, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2100, 12, 16, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2101, 12, 17, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2102, 12, 18, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2103, 12, 1, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2104, 12, 2, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2105, 12, 3, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2106, 12, 4, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2107, 12, 5, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2108, 12, 6, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2109, 12, 7, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2110, 12, 8, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2111, 12, 9, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2112, 12, 10, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2113, 12, 11, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2114, 12, 12, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2115, 12, 13, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2116, 12, 14, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2117, 12, 15, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2118, 12, 16, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2119, 12, 17, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2120, 12, 18, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2121, 13, 1, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2122, 13, 2, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2123, 13, 3, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2124, 13, 4, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2125, 13, 5, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2126, 13, 6, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2127, 13, 7, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2128, 13, 8, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2129, 13, 9, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2130, 13, 10, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2131, 13, 11, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2132, 13, 12, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2133, 13, 13, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2134, 13, 14, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2135, 13, 15, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2136, 13, 1, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2137, 13, 2, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2138, 13, 3, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2139, 13, 4, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2140, 13, 5, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2141, 13, 6, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2142, 13, 7, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2143, 13, 8, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2144, 13, 9, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2145, 13, 10, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2146, 13, 11, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2147, 13, 12, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2148, 13, 13, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2149, 13, 14, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2150, 13, 15, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2151, 13, 1, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2152, 13, 2, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2153, 13, 3, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2154, 13, 4, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2155, 13, 5, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2156, 13, 6, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2157, 13, 7, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2158, 13, 8, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2159, 13, 9, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2160, 13, 10, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2161, 13, 11, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2162, 13, 12, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2163, 13, 13, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2164, 13, 14, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2165, 13, 15, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2166, 13, 1, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2167, 13, 2, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2168, 13, 3, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2169, 13, 4, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2170, 13, 5, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2171, 13, 6, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2172, 13, 7, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2173, 13, 8, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2174, 13, 9, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2175, 13, 10, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2176, 13, 11, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2177, 13, 12, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2178, 13, 13, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2179, 13, 14, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2180, 13, 15, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2181, 13, 1, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2182, 13, 2, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2183, 13, 3, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2184, 13, 4, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2185, 13, 5, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2186, 13, 6, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2187, 13, 7, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2188, 13, 8, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2189, 13, 9, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2190, 13, 10, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2191, 13, 11, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2192, 13, 12, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2193, 13, 13, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2194, 13, 14, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2195, 13, 15, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2196, 13, 1, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2197, 13, 2, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2198, 13, 3, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2199, 13, 4, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2200, 13, 5, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2201, 13, 6, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2202, 13, 7, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2203, 13, 8, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2204, 13, 9, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2205, 13, 10, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2206, 13, 11, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2207, 13, 12, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2208, 13, 13, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2209, 13, 14, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2210, 13, 15, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2211, 13, 1, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2212, 13, 2, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2213, 13, 3, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2214, 13, 4, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2215, 13, 5, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2216, 13, 6, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2217, 13, 7, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2218, 13, 8, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2219, 13, 9, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2220, 13, 10, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2221, 13, 11, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2222, 13, 12, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2223, 13, 13, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2224, 13, 14, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2225, 13, 15, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2226, 13, 1, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2227, 13, 2, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2228, 13, 3, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2229, 13, 4, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2230, 13, 5, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2231, 13, 6, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2232, 13, 7, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2233, 13, 8, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2234, 13, 9, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2235, 13, 10, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2236, 13, 11, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2237, 13, 12, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2238, 13, 13, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2239, 13, 14, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2240, 13, 15, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2241, 13, 1, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2242, 13, 2, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2243, 13, 3, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2244, 13, 4, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2245, 13, 5, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2246, 13, 6, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2247, 13, 7, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2248, 13, 8, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2249, 13, 9, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2250, 13, 10, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2251, 13, 11, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2252, 13, 12, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2253, 13, 13, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2254, 13, 14, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2255, 13, 15, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2256, 13, 1, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2257, 13, 2, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2258, 13, 3, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2259, 13, 4, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2260, 13, 5, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2261, 13, 6, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2262, 13, 7, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2263, 13, 8, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2264, 13, 9, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2265, 13, 10, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2266, 13, 11, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2267, 13, 12, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2268, 13, 13, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2269, 13, 14, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2270, 13, 15, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2271, 14, 1, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2272, 14, 2, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2273, 14, 3, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2274, 14, 4, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2275, 14, 5, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2276, 14, 6, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2277, 14, 7, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2278, 14, 8, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2279, 14, 9, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2280, 14, 10, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2281, 14, 11, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2282, 14, 12, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2283, 14, 13, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2284, 14, 14, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2285, 14, 15, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2286, 14, 16, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2287, 14, 17, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2288, 14, 18, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2289, 14, 19, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2290, 14, 20, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2291, 14, 1, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2292, 14, 2, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2293, 14, 3, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2294, 14, 4, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2295, 14, 5, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2296, 14, 6, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2297, 14, 7, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2298, 14, 8, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2299, 14, 9, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2300, 14, 10, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2301, 14, 11, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2302, 14, 12, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2303, 14, 13, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2304, 14, 14, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2305, 14, 15, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2306, 14, 16, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2307, 14, 17, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2308, 14, 18, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2309, 14, 19, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2310, 14, 20, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2311, 14, 1, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2312, 14, 2, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2313, 14, 3, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2314, 14, 4, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2315, 14, 5, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2316, 14, 6, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2317, 14, 7, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2318, 14, 8, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2319, 14, 9, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2320, 14, 10, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2321, 14, 11, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2322, 14, 12, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2323, 14, 13, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2324, 14, 14, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2325, 14, 15, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2326, 14, 16, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2327, 14, 17, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2328, 14, 18, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2329, 14, 19, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2330, 14, 20, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2331, 14, 1, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2332, 14, 2, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2333, 14, 3, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2334, 14, 4, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2335, 14, 5, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2336, 14, 6, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2337, 14, 7, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2338, 14, 8, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2339, 14, 9, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2340, 14, 10, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2341, 14, 11, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2342, 14, 12, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2343, 14, 13, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2344, 14, 14, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2345, 14, 15, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2346, 14, 16, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2347, 14, 17, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2348, 14, 18, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2349, 14, 19, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2350, 14, 20, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2351, 14, 1, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2352, 14, 2, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2353, 14, 3, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2354, 14, 4, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2355, 14, 5, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2356, 14, 6, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2357, 14, 7, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2358, 14, 8, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2359, 14, 9, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2360, 14, 10, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2361, 14, 11, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2362, 14, 12, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2363, 14, 13, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2364, 14, 14, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2365, 14, 15, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2366, 14, 16, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2367, 14, 17, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2368, 14, 18, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2369, 14, 19, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2370, 14, 20, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2371, 14, 1, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2372, 14, 2, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2373, 14, 3, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2374, 14, 4, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2375, 14, 5, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2376, 14, 6, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2377, 14, 7, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2378, 14, 8, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2379, 14, 9, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2380, 14, 10, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2381, 14, 11, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2382, 14, 12, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2383, 14, 13, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2384, 14, 14, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2385, 14, 15, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2386, 14, 16, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2387, 14, 17, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2388, 14, 18, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2389, 14, 19, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2390, 14, 20, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2391, 14, 1, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2392, 14, 2, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2393, 14, 3, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2394, 14, 4, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2395, 14, 5, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2396, 14, 6, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2397, 14, 7, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2398, 14, 8, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2399, 14, 9, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2400, 14, 10, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2401, 14, 11, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2402, 14, 12, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2403, 14, 13, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2404, 14, 14, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2405, 14, 15, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2406, 14, 16, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2407, 14, 17, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2408, 14, 18, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2409, 14, 19, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2410, 14, 20, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2411, 14, 1, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2412, 14, 2, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2413, 14, 3, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2414, 14, 4, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2415, 14, 5, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2416, 14, 6, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2417, 14, 7, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2418, 14, 8, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2419, 14, 9, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2420, 14, 10, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2421, 14, 11, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2422, 14, 12, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2423, 14, 13, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2424, 14, 14, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2425, 14, 15, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2426, 14, 16, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2427, 14, 17, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2428, 14, 18, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2429, 14, 19, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2430, 14, 20, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2431, 14, 1, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2432, 14, 2, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2433, 14, 3, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2434, 14, 4, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2435, 14, 5, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2436, 14, 6, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2437, 14, 7, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2438, 14, 8, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2439, 14, 9, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2440, 14, 10, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2441, 14, 11, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2442, 14, 12, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2443, 14, 13, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2444, 14, 14, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2445, 14, 15, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2446, 14, 16, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2447, 14, 17, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2448, 14, 18, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2449, 14, 19, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2450, 14, 20, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2451, 14, 1, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2452, 14, 2, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2453, 14, 3, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2454, 14, 4, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2455, 14, 5, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2456, 14, 6, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2457, 14, 7, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2458, 14, 8, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2459, 14, 9, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2460, 14, 10, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2461, 14, 11, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2462, 14, 12, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2463, 14, 13, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2464, 14, 14, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2465, 14, 15, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2466, 14, 16, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2467, 14, 17, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2468, 14, 18, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2469, 14, 19, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2470, 14, 20, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2471, 15, 1, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2472, 15, 2, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2473, 15, 3, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2474, 15, 4, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2475, 15, 5, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2476, 15, 6, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2477, 15, 7, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2478, 15, 8, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2479, 15, 9, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2480, 15, 10, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2481, 15, 11, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2482, 15, 12, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2483, 15, 13, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2484, 15, 14, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2485, 15, 15, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2486, 15, 16, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2487, 15, 17, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2488, 15, 18, N'A', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2489, 15, 1, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2490, 15, 2, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2491, 15, 3, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2492, 15, 4, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2493, 15, 5, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2494, 15, 6, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2495, 15, 7, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2496, 15, 8, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2497, 15, 9, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2498, 15, 10, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2499, 15, 11, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2500, 15, 12, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2501, 15, 13, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2502, 15, 14, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2503, 15, 15, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2504, 15, 16, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2505, 15, 17, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2506, 15, 18, N'B', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2507, 15, 1, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2508, 15, 2, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2509, 15, 3, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2510, 15, 4, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2511, 15, 5, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2512, 15, 6, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2513, 15, 7, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2514, 15, 8, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2515, 15, 9, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2516, 15, 10, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2517, 15, 11, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2518, 15, 12, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2519, 15, 13, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2520, 15, 14, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2521, 15, 15, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2522, 15, 16, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2523, 15, 17, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2524, 15, 18, N'C', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2525, 15, 1, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2526, 15, 2, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2527, 15, 3, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2528, 15, 4, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2529, 15, 5, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2530, 15, 6, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2531, 15, 7, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2532, 15, 8, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2533, 15, 9, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2534, 15, 10, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2535, 15, 11, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2536, 15, 12, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2537, 15, 13, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2538, 15, 14, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2539, 15, 15, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2540, 15, 16, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2541, 15, 17, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2542, 15, 18, N'D', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2543, 15, 1, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2544, 15, 2, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2545, 15, 3, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2546, 15, 4, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2547, 15, 5, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2548, 15, 6, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2549, 15, 7, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2550, 15, 8, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2551, 15, 9, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2552, 15, 10, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2553, 15, 11, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2554, 15, 12, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2555, 15, 13, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2556, 15, 14, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2557, 15, 15, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2558, 15, 16, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2559, 15, 17, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2560, 15, 18, N'E', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2561, 15, 1, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2562, 15, 2, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2563, 15, 3, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2564, 15, 4, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2565, 15, 5, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2566, 15, 6, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2567, 15, 7, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2568, 15, 8, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2569, 15, 9, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2570, 15, 10, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2571, 15, 11, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2572, 15, 12, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2573, 15, 13, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2574, 15, 14, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2575, 15, 15, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2576, 15, 16, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2577, 15, 17, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2578, 15, 18, N'F', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2579, 15, 1, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2580, 15, 2, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2581, 15, 3, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2582, 15, 4, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2583, 15, 5, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2584, 15, 6, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2585, 15, 7, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2586, 15, 8, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2587, 15, 9, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2588, 15, 10, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2589, 15, 11, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2590, 15, 12, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2591, 15, 13, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2592, 15, 14, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2593, 15, 15, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2594, 15, 16, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2595, 15, 17, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2596, 15, 18, N'G', N'Standard')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2597, 15, 1, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2598, 15, 2, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2599, 15, 3, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2600, 15, 4, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2601, 15, 5, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2602, 15, 6, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2603, 15, 7, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2604, 15, 8, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2605, 15, 9, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2606, 15, 10, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2607, 15, 11, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2608, 15, 12, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2609, 15, 13, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2610, 15, 14, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2611, 15, 15, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2612, 15, 16, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2613, 15, 17, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2614, 15, 18, N'H', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2615, 15, 1, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2616, 15, 2, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2617, 15, 3, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2618, 15, 4, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2619, 15, 5, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2620, 15, 6, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2621, 15, 7, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2622, 15, 8, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2623, 15, 9, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2624, 15, 10, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2625, 15, 11, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2626, 15, 12, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2627, 15, 13, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2628, 15, 14, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2629, 15, 15, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2630, 15, 16, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2631, 15, 17, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2632, 15, 18, N'I', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2633, 15, 1, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2634, 15, 2, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2635, 15, 3, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2636, 15, 4, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2637, 15, 5, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2638, 15, 6, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2639, 15, 7, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2640, 15, 8, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2641, 15, 9, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2642, 15, 10, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2643, 15, 11, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2644, 15, 12, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2645, 15, 13, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2646, 15, 14, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2647, 15, 15, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2648, 15, 16, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2649, 15, 17, N'J', N'Premium')
GO
INSERT [dbo].[Tbl_RoomSeat] ([SeatId], [RoomId], [SeatNo], [RowName], [SeatType]) VALUES (2650, 15, 18, N'J', N'Premium')
GO
SET IDENTITY_INSERT [dbo].[Tbl_RoomSeat] OFF
GO
SET IDENTITY_INSERT [dbo].[Tbl_SeatPrice] ON 
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (1, 1, N'A', CAST(8.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (2, 1, N'B', CAST(8.50 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (3, 1, N'C', CAST(9.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (4, 1, N'D', CAST(9.50 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (5, 1, N'E', CAST(10.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (6, 1, N'F', CAST(10.50 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (7, 1, N'G', CAST(11.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (8, 1, N'H', CAST(11.50 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (9, 1, N'I', CAST(12.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (10, 1, N'J', CAST(15.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (11, 2, N'A', CAST(8.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (12, 2, N'B', CAST(8.50 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (13, 2, N'C', CAST(9.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (14, 2, N'D', CAST(9.50 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (15, 2, N'E', CAST(10.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (16, 2, N'F', CAST(10.50 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (17, 2, N'G', CAST(11.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (18, 2, N'H', CAST(11.50 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (19, 2, N'I', CAST(12.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (20, 2, N'J', CAST(15.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (21, 3, N'A', CAST(8.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (22, 3, N'B', CAST(8.50 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (23, 3, N'C', CAST(9.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (24, 3, N'D', CAST(9.50 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (25, 3, N'E', CAST(10.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (26, 3, N'F', CAST(10.50 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (27, 3, N'G', CAST(11.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (28, 3, N'H', CAST(11.50 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (29, 3, N'I', CAST(12.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (30, 3, N'J', CAST(15.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (31, 4, N'A', CAST(8.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (32, 4, N'B', CAST(8.50 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (33, 4, N'C', CAST(9.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (34, 4, N'D', CAST(9.50 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (35, 4, N'E', CAST(10.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (36, 4, N'F', CAST(10.50 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (37, 4, N'G', CAST(11.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (38, 4, N'H', CAST(11.50 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (39, 4, N'I', CAST(12.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (40, 4, N'J', CAST(15.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (41, 5, N'A', CAST(8.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (42, 5, N'B', CAST(8.50 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (43, 5, N'C', CAST(9.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (44, 5, N'D', CAST(9.50 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (45, 5, N'E', CAST(10.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (46, 5, N'F', CAST(10.50 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (47, 5, N'G', CAST(11.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (48, 5, N'H', CAST(11.50 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (49, 5, N'I', CAST(12.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (50, 5, N'J', CAST(15.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (51, 6, N'A', CAST(8.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (52, 6, N'B', CAST(8.50 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (53, 6, N'C', CAST(9.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (54, 6, N'D', CAST(9.50 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (55, 6, N'E', CAST(10.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (56, 6, N'F', CAST(10.50 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (57, 6, N'G', CAST(11.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (58, 6, N'H', CAST(11.50 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (59, 6, N'I', CAST(12.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (60, 6, N'J', CAST(15.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (61, 7, N'A', CAST(8.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (62, 7, N'B', CAST(8.50 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (63, 7, N'C', CAST(9.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (64, 7, N'D', CAST(9.50 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (65, 7, N'E', CAST(10.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (66, 7, N'F', CAST(10.50 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (67, 7, N'G', CAST(11.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (68, 7, N'H', CAST(11.50 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (69, 7, N'I', CAST(12.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (70, 7, N'J', CAST(15.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (71, 8, N'A', CAST(8.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (72, 8, N'B', CAST(8.50 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (73, 8, N'C', CAST(9.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (74, 8, N'D', CAST(9.50 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (75, 8, N'E', CAST(10.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (76, 8, N'F', CAST(10.50 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (77, 8, N'G', CAST(11.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (78, 8, N'H', CAST(11.50 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (79, 8, N'I', CAST(12.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (80, 8, N'J', CAST(15.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (81, 9, N'A', CAST(8.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (82, 9, N'B', CAST(8.50 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (83, 9, N'C', CAST(9.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (84, 9, N'D', CAST(9.50 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (85, 9, N'E', CAST(10.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (86, 9, N'F', CAST(10.50 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (87, 9, N'G', CAST(11.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (88, 9, N'H', CAST(11.50 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (89, 9, N'I', CAST(12.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (90, 9, N'J', CAST(15.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (91, 10, N'A', CAST(8.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (92, 10, N'B', CAST(8.50 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (93, 10, N'C', CAST(9.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (94, 10, N'D', CAST(9.50 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (95, 10, N'E', CAST(10.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (96, 10, N'F', CAST(10.50 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (97, 10, N'G', CAST(11.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (98, 10, N'H', CAST(11.50 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (99, 10, N'I', CAST(12.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (100, 10, N'J', CAST(15.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (101, 11, N'A', CAST(8.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (102, 11, N'B', CAST(8.50 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (103, 11, N'C', CAST(9.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (104, 11, N'D', CAST(9.50 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (105, 11, N'E', CAST(10.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (106, 11, N'F', CAST(10.50 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (107, 11, N'G', CAST(11.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (108, 11, N'H', CAST(11.50 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (109, 11, N'I', CAST(12.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (110, 11, N'J', CAST(15.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (111, 12, N'A', CAST(8.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (112, 12, N'B', CAST(8.50 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (113, 12, N'C', CAST(9.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (114, 12, N'D', CAST(9.50 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (115, 12, N'E', CAST(10.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (116, 12, N'F', CAST(10.50 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (117, 12, N'G', CAST(11.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (118, 12, N'H', CAST(11.50 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (119, 12, N'I', CAST(12.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (120, 12, N'J', CAST(15.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (121, 13, N'A', CAST(8.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (122, 13, N'B', CAST(8.50 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (123, 13, N'C', CAST(9.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (124, 13, N'D', CAST(9.50 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (125, 13, N'E', CAST(10.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (126, 13, N'F', CAST(10.50 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (127, 13, N'G', CAST(11.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (128, 13, N'H', CAST(11.50 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (129, 13, N'I', CAST(12.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (130, 13, N'J', CAST(15.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (131, 14, N'A', CAST(8.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (132, 14, N'B', CAST(8.50 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (133, 14, N'C', CAST(9.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (134, 14, N'D', CAST(9.50 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (135, 14, N'E', CAST(10.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (136, 14, N'F', CAST(10.50 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (137, 14, N'G', CAST(11.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (138, 14, N'H', CAST(11.50 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (139, 14, N'I', CAST(12.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (140, 14, N'J', CAST(15.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (141, 15, N'A', CAST(8.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (142, 15, N'B', CAST(8.50 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (143, 15, N'C', CAST(9.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (144, 15, N'D', CAST(9.50 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (145, 15, N'E', CAST(10.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (146, 15, N'F', CAST(10.50 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (147, 15, N'G', CAST(11.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (148, 15, N'H', CAST(11.50 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (149, 15, N'I', CAST(12.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_SeatPrice] ([SeatPriceId], [RoomId], [RowName], [SeatPrice]) VALUES (150, 15, N'J', CAST(15.00 AS Decimal(18, 2)))
GO
SET IDENTITY_INSERT [dbo].[Tbl_SeatPrice] OFF
GO
SET IDENTITY_INSERT [dbo].[Tbl_ShowDate] ON 
GO
INSERT [dbo].[Tbl_ShowDate] ([ShowDateId], [CinemaId], [RoomId], [MovieId]) VALUES (1, 1, 1, 1)
GO
INSERT [dbo].[Tbl_ShowDate] ([ShowDateId], [CinemaId], [RoomId], [MovieId]) VALUES (2, 1, 2, 1)
GO
INSERT [dbo].[Tbl_ShowDate] ([ShowDateId], [CinemaId], [RoomId], [MovieId]) VALUES (3, 2, 4, 1)
GO
INSERT [dbo].[Tbl_ShowDate] ([ShowDateId], [CinemaId], [RoomId], [MovieId]) VALUES (4, 2, 5, 1)
GO
INSERT [dbo].[Tbl_ShowDate] ([ShowDateId], [CinemaId], [RoomId], [MovieId]) VALUES (5, 3, 7, 1)
GO
INSERT [dbo].[Tbl_ShowDate] ([ShowDateId], [CinemaId], [RoomId], [MovieId]) VALUES (6, 3, 8, 1)
GO
INSERT [dbo].[Tbl_ShowDate] ([ShowDateId], [CinemaId], [RoomId], [MovieId]) VALUES (7, 1, 1, 2)
GO
INSERT [dbo].[Tbl_ShowDate] ([ShowDateId], [CinemaId], [RoomId], [MovieId]) VALUES (8, 1, 2, 2)
GO
INSERT [dbo].[Tbl_ShowDate] ([ShowDateId], [CinemaId], [RoomId], [MovieId]) VALUES (9, 2, 4, 2)
GO
INSERT [dbo].[Tbl_ShowDate] ([ShowDateId], [CinemaId], [RoomId], [MovieId]) VALUES (10, 2, 5, 2)
GO
INSERT [dbo].[Tbl_ShowDate] ([ShowDateId], [CinemaId], [RoomId], [MovieId]) VALUES (11, 3, 7, 2)
GO
INSERT [dbo].[Tbl_ShowDate] ([ShowDateId], [CinemaId], [RoomId], [MovieId]) VALUES (12, 3, 8, 2)
GO
INSERT [dbo].[Tbl_ShowDate] ([ShowDateId], [CinemaId], [RoomId], [MovieId]) VALUES (13, 1, 1, 3)
GO
INSERT [dbo].[Tbl_ShowDate] ([ShowDateId], [CinemaId], [RoomId], [MovieId]) VALUES (14, 1, 2, 3)
GO
INSERT [dbo].[Tbl_ShowDate] ([ShowDateId], [CinemaId], [RoomId], [MovieId]) VALUES (15, 2, 4, 3)
GO
INSERT [dbo].[Tbl_ShowDate] ([ShowDateId], [CinemaId], [RoomId], [MovieId]) VALUES (16, 2, 5, 3)
GO
INSERT [dbo].[Tbl_ShowDate] ([ShowDateId], [CinemaId], [RoomId], [MovieId]) VALUES (17, 3, 7, 3)
GO
INSERT [dbo].[Tbl_ShowDate] ([ShowDateId], [CinemaId], [RoomId], [MovieId]) VALUES (18, 3, 8, 3)
GO
INSERT [dbo].[Tbl_ShowDate] ([ShowDateId], [CinemaId], [RoomId], [MovieId]) VALUES (19, 1, 1, 4)
GO
INSERT [dbo].[Tbl_ShowDate] ([ShowDateId], [CinemaId], [RoomId], [MovieId]) VALUES (20, 1, 2, 4)
GO
INSERT [dbo].[Tbl_ShowDate] ([ShowDateId], [CinemaId], [RoomId], [MovieId]) VALUES (21, 2, 4, 4)
GO
INSERT [dbo].[Tbl_ShowDate] ([ShowDateId], [CinemaId], [RoomId], [MovieId]) VALUES (22, 2, 5, 4)
GO
INSERT [dbo].[Tbl_ShowDate] ([ShowDateId], [CinemaId], [RoomId], [MovieId]) VALUES (23, 3, 7, 4)
GO
INSERT [dbo].[Tbl_ShowDate] ([ShowDateId], [CinemaId], [RoomId], [MovieId]) VALUES (24, 3, 8, 4)
GO
INSERT [dbo].[Tbl_ShowDate] ([ShowDateId], [CinemaId], [RoomId], [MovieId]) VALUES (25, 1, 1, 5)
GO
INSERT [dbo].[Tbl_ShowDate] ([ShowDateId], [CinemaId], [RoomId], [MovieId]) VALUES (26, 1, 2, 5)
GO
INSERT [dbo].[Tbl_ShowDate] ([ShowDateId], [CinemaId], [RoomId], [MovieId]) VALUES (27, 2, 4, 5)
GO
INSERT [dbo].[Tbl_ShowDate] ([ShowDateId], [CinemaId], [RoomId], [MovieId]) VALUES (28, 2, 5, 5)
GO
INSERT [dbo].[Tbl_ShowDate] ([ShowDateId], [CinemaId], [RoomId], [MovieId]) VALUES (29, 3, 7, 5)
GO
INSERT [dbo].[Tbl_ShowDate] ([ShowDateId], [CinemaId], [RoomId], [MovieId]) VALUES (30, 3, 8, 5)
GO
SET IDENTITY_INSERT [dbo].[Tbl_ShowDate] OFF
GO
ALTER TABLE [dbo].[Tbl_Booking] ADD  DEFAULT (getdate()) FOR [BookingDate]
GO
ALTER TABLE [dbo].[Tbl_Booking]  WITH CHECK ADD FOREIGN KEY([ShowId])
REFERENCES [dbo].[Tbl_MovieSchedule] ([ShowId])
GO
ALTER TABLE [dbo].[Tbl_BookingDetail]  WITH CHECK ADD FOREIGN KEY([BookingId])
REFERENCES [dbo].[Tbl_Booking] ([BookingId])
GO
ALTER TABLE [dbo].[Tbl_BookingDetail]  WITH CHECK ADD FOREIGN KEY([SeatId])
REFERENCES [dbo].[Tbl_RoomSeat] ([SeatId])
GO
ALTER TABLE [dbo].[Tbl_CinemaRoom]  WITH CHECK ADD FOREIGN KEY([CinemaId])
REFERENCES [dbo].[Tbl_CinemaList] ([CinemaId])
GO
ALTER TABLE [dbo].[Tbl_MovieSchedule]  WITH CHECK ADD FOREIGN KEY([ShowDateId])
REFERENCES [dbo].[Tbl_ShowDate] ([ShowDateId])
GO
ALTER TABLE [dbo].[Tbl_RoomSeat]  WITH CHECK ADD FOREIGN KEY([RoomId])
REFERENCES [dbo].[Tbl_CinemaRoom] ([RoomId])
GO
ALTER TABLE [dbo].[Tbl_SeatPrice]  WITH CHECK ADD FOREIGN KEY([RoomId])
REFERENCES [dbo].[Tbl_CinemaRoom] ([RoomId])
GO
ALTER TABLE [dbo].[Tbl_ShowDate]  WITH CHECK ADD FOREIGN KEY([CinemaId])
REFERENCES [dbo].[Tbl_CinemaList] ([CinemaId])
GO
ALTER TABLE [dbo].[Tbl_ShowDate]  WITH CHECK ADD FOREIGN KEY([MovieId])
REFERENCES [dbo].[Tbl_MovieList] ([MovieId])
GO
ALTER TABLE [dbo].[Tbl_ShowDate]  WITH CHECK ADD FOREIGN KEY([RoomId])
REFERENCES [dbo].[Tbl_CinemaRoom] ([RoomId])
GO
USE [master]
GO
ALTER DATABASE [MovieTicketOnlineBookingSystemApi] SET  READ_WRITE 
GO