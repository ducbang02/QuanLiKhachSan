Create database QKLS

USE [QLKS1]
GO
/****** Object:  UserDefinedFunction [dbo].[ConvertString]    Script Date: 5/8/2021 10:40:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[ConvertString] ( @strInput NVARCHAR(4000) ) RETURNS NVARCHAR(4000) AS BEGIN IF @strInput IS NULL RETURN @strInput IF @strInput = '' RETURN @strInput DECLARE @RT NVARCHAR(4000) DECLARE @SIGN_CHARS NCHAR(136) DECLARE @UNSIGN_CHARS NCHAR (136) SET @SIGN_CHARS = N'ăâđêôơưàảãạáằẳẵặắầẩẫậấèẻẽẹéềểễệế ìỉĩịíòỏõọóồổỗộốờởỡợớùủũụúừửữựứỳỷỹỵý ĂÂĐÊÔƠƯÀẢÃẠÁẰẲẴẶẮẦẨẪẬẤÈẺẼẸÉỀỂỄỆẾÌỈĨỊÍ ÒỎÕỌÓỒỔỖỘỐỜỞỠỢỚÙỦŨỤÚỪỬỮỰỨỲỶỸỴÝ' +NCHAR(272)+ NCHAR(208) SET @UNSIGN_CHARS = N'aadeoouaaaaaaaaaaaaaaaeeeeeeeeee iiiiiooooooooooooooouuuuuuuuuuyyyyy AADEOOUAAAAAAAAAAAAAAAEEEEEEEEEEIIIII OOOOOOOOOOOOOOOUUUUUUUUUUYYYYYDD' DECLARE @COUNTER int DECLARE @COUNTER1 int SET @COUNTER = 1 WHILE (@COUNTER <=LEN(@strInput)) BEGIN SET @COUNTER1 = 1 WHILE (@COUNTER1 <=LEN(@SIGN_CHARS)+1) BEGIN IF UNICODE(SUBSTRING(@SIGN_CHARS, @COUNTER1,1)) = UNICODE(SUBSTRING(@strInput,@COUNTER ,1) ) BEGIN IF @COUNTER=1 SET @strInput = SUBSTRING(@UNSIGN_CHARS, @COUNTER1,1) + SUBSTRING(@strInput, @COUNTER+1,LEN(@strInput)-1) ELSE SET @strInput = SUBSTRING(@strInput, 1, @COUNTER-1) +SUBSTRING(@UNSIGN_CHARS, @COUNTER1,1) + SUBSTRING(@strInput, @COUNTER+1,LEN(@strInput)- @COUNTER) BREAK END SET @COUNTER1 = @COUNTER1 +1 END SET @COUNTER = @COUNTER +1 END SET @strInput = replace(@strInput,' ','-') RETURN @strInput END
GO
/****** Object:  Table [dbo].[ACCESS]    Script Date: 5/8/2021 10:40:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ACCESS](
	[IDStaffType] [char](10) NOT NULL,
	[IDJob] [char](10) NOT NULL,
 CONSTRAINT [PK_Access] PRIMARY KEY CLUSTERED 
(
	[IDStaffType] ASC,
	[IDJob] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Aud_ACCESS]    Script Date: 5/8/2021 10:40:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Aud_ACCESS](
	[IDStaffType] [char](10) NOT NULL,
	[IDJob] [char](10) NOT NULL,
	[ThaoTac] [char](10) NULL,
	[NgayThayDoi] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Aud_Bill]    Script Date: 5/8/2021 10:40:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Aud_Bill](
	[ID] [char](10) NOT NULL,
	[IDReceiveRoom] [char](10) NOT NULL,
	[StaffSetUp] [nvarchar](100) NOT NULL,
	[DateOfCreate] [smalldatetime] NULL,
	[RoomPrice] [int] NOT NULL,
	[ServicePrice] [int] NOT NULL,
	[TotalPrice] [int] NOT NULL,
	[Discount] [int] NOT NULL,
	[IDStatusBill] [int] NOT NULL,
	[Surcharge] [int] NOT NULL,
	[ThaoTac] [char](10) NULL,
	[NgayThayDoi] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Aud_BillDetails]    Script Date: 5/8/2021 10:40:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Aud_BillDetails](
	[IDBill] [char](10) NOT NULL,
	[IDService] [char](10) NOT NULL,
	[Count] [int] NOT NULL,
	[TotalPrice] [int] NOT NULL,
	[ThaoTac] [char](10) NULL,
	[NgayThayDoi] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Aud_BookRoom]    Script Date: 5/8/2021 10:40:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Aud_BookRoom](
	[ID] [char](10) NOT NULL,
	[IDCustomer] [char](10) NOT NULL,
	[IDRoomType] [char](10) NOT NULL,
	[DateBookRoom] [smalldatetime] NOT NULL,
	[DateCheckIn] [date] NOT NULL,
	[DateCheckOut] [date] NOT NULL,
	[ThaoTac] [char](10) NULL,
	[NgayThayDoi] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Aud_Customer]    Script Date: 5/8/2021 10:40:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Aud_Customer](
	[ID] [char](10) NOT NULL,
	[IDCard] [nvarchar](100) NOT NULL,
	[IDCustomerType] [char](10) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[DateOfBirth] [date] NOT NULL,
	[Address] [nvarchar](200) NOT NULL,
	[PhoneNumber] [int] NOT NULL,
	[Sex] [nvarchar](100) NOT NULL,
	[Nationality] [nvarchar](100) NOT NULL,
	[ThaoTac] [char](10) NULL,
	[NgayThayDoi] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Aud_CustomerType]    Script Date: 5/8/2021 10:40:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Aud_CustomerType](
	[ID] [char](10) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[ThaoTac] [char](10) NULL,
	[NgayThayDoi] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Aud_JOB]    Script Date: 5/8/2021 10:40:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Aud_JOB](
	[ID] [char](10) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[NameForm] [nvarchar](100) NOT NULL,
	[ThaoTac] [char](10) NULL,
	[NgayThayDoi] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Aud_Parameter]    Script Date: 5/8/2021 10:40:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Aud_Parameter](
	[Name] [nvarchar](100) NOT NULL,
	[Value] [float] NULL,
	[Describe] [nvarchar](200) NULL,
	[DateModify] [smalldatetime] NULL,
	[ThaoTac] [char](10) NULL,
	[NgayThayDoi] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Aud_ReceiveRoom]    Script Date: 5/8/2021 10:40:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Aud_ReceiveRoom](
	[ID] [char](10) NOT NULL,
	[IDBookRoom] [char](10) NOT NULL,
	[IDRoom] [char](10) NOT NULL,
	[ThaoTac] [char](10) NULL,
	[NgayThayDoi] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Aud_ReceiveRoomDetails]    Script Date: 5/8/2021 10:40:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Aud_ReceiveRoomDetails](
	[IDReceiveRoom] [char](10) NOT NULL,
	[IDCustomerOther] [char](10) NOT NULL,
	[ThaoTac] [char](10) NULL,
	[NgayThayDoi] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Aud_REPORT]    Script Date: 5/8/2021 10:40:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Aud_REPORT](
	[idRoomType] [char](10) NOT NULL,
	[value] [int] NOT NULL,
	[rate] [float] NOT NULL,
	[Month] [int] NOT NULL,
	[Year] [int] NOT NULL,
	[ThaoTac] [char](10) NULL,
	[NgayThayDoi] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Aud_Room]    Script Date: 5/8/2021 10:40:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Aud_Room](
	[ID] [char](10) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[IDRoomType] [char](10) NOT NULL,
	[IDStatusRoom] [int] NOT NULL,
	[ThaoTac] [char](10) NULL,
	[NgayThayDoi] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Aud_RoomType]    Script Date: 5/8/2021 10:40:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Aud_RoomType](
	[ID] [char](10) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Price] [int] NOT NULL,
	[LimitPerson] [int] NOT NULL,
	[ThaoTac] [char](10) NULL,
	[NgayThayDoi] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Aud_Service]    Script Date: 5/8/2021 10:40:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Aud_Service](
	[ID] [char](10) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[IDServiceType] [char](10) NOT NULL,
	[Price] [int] NOT NULL,
	[ThaoTac] [char](10) NULL,
	[NgayThayDoi] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Aud_ServiceType]    Script Date: 5/8/2021 10:40:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Aud_ServiceType](
	[ID] [char](10) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[ThaoTac] [char](10) NULL,
	[NgayThayDoi] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Aud_Staff]    Script Date: 5/8/2021 10:40:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Aud_Staff](
	[UserName] [nvarchar](100) NOT NULL,
	[DisplayName] [nvarchar](100) NOT NULL,
	[PassWord] [nvarchar](100) NOT NULL,
	[IDStaffType] [char](10) NOT NULL,
	[IDCard] [nvarchar](100) NOT NULL,
	[DateOfBirth] [date] NOT NULL,
	[Sex] [nvarchar](100) NOT NULL,
	[Address] [nvarchar](200) NOT NULL,
	[PhoneNumber] [int] NOT NULL,
	[StartDay] [date] NOT NULL,
	[ThaoTac] [char](10) NULL,
	[NgayThayDoi] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Aud_StaffType]    Script Date: 5/8/2021 10:40:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Aud_StaffType](
	[ID] [char](10) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[ThaoTac] [char](10) NULL,
	[NgayThayDoi] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Aud_StatusBill]    Script Date: 5/8/2021 10:40:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Aud_StatusBill](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[ThaoTac] [char](10) NULL,
	[NgayThayDoi] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Aud_StatusRoom]    Script Date: 5/8/2021 10:40:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Aud_StatusRoom](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[ThaoTac] [char](10) NULL,
	[NgayThayDoi] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bill]    Script Date: 5/8/2021 10:40:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bill](
	[ID] [char](10) NOT NULL,
	[IDReceiveRoom] [char](10) NOT NULL,
	[StaffSetUp] [nvarchar](100) NOT NULL,
	[DateOfCreate] [smalldatetime] NULL,
	[RoomPrice] [int] NOT NULL,
	[ServicePrice] [int] NOT NULL,
	[TotalPrice] [int] NOT NULL,
	[Discount] [int] NOT NULL,
	[IDStatusBill] [int] NOT NULL,
	[Surcharge] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BillDetails]    Script Date: 5/8/2021 10:40:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BillDetails](
	[IDBill] [char](10) NOT NULL,
	[IDService] [char](10) NOT NULL,
	[Count] [int] NOT NULL,
	[TotalPrice] [int] NOT NULL,
 CONSTRAINT [PK_BillInfo] PRIMARY KEY CLUSTERED 
(
	[IDService] ASC,
	[IDBill] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BookRoom]    Script Date: 5/8/2021 10:40:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookRoom](
	[ID] [char](10) NOT NULL,
	[IDCustomer] [char](10) NOT NULL,
	[IDRoomType] [char](10) NOT NULL,
	[DateBookRoom] [smalldatetime] NOT NULL,
	[DateCheckIn] [date] NOT NULL,
	[DateCheckOut] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 5/8/2021 10:40:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[ID] [char](10) NOT NULL,
	[IDCard] [nvarchar](100) NOT NULL,
	[IDCustomerType] [char](10) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[DateOfBirth] [date] NOT NULL,
	[Address] [nvarchar](200) NOT NULL,
	[PhoneNumber] [int] NOT NULL,
	[Sex] [nvarchar](100) NOT NULL,
	[Nationality] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerType]    Script Date: 5/8/2021 10:40:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerType](
	[ID] [char](10) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JOB]    Script Date: 5/8/2021 10:40:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JOB](
	[ID] [char](10) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[NameForm] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Parameter]    Script Date: 5/8/2021 10:40:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Parameter](
	[Name] [nvarchar](100) NOT NULL,
	[Value] [float] NULL,
	[Describe] [nvarchar](200) NULL,
	[DateModify] [smalldatetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReceiveRoom]    Script Date: 5/8/2021 10:40:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReceiveRoom](
	[ID] [char](10) NOT NULL,
	[IDBookRoom] [char](10) NOT NULL,
	[IDRoom] [char](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReceiveRoomDetails]    Script Date: 5/8/2021 10:40:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReceiveRoomDetails](
	[IDReceiveRoom] [char](10) NOT NULL,
	[IDCustomerOther] [char](10) NOT NULL,
 CONSTRAINT [PK_ReceiveRoomDetails] PRIMARY KEY CLUSTERED 
(
	[IDReceiveRoom] ASC,
	[IDCustomerOther] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[REPORT]    Script Date: 5/8/2021 10:40:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[REPORT](
	[idRoomType] [char](10) NOT NULL,
	[value] [int] NOT NULL,
	[rate] [float] NOT NULL,
	[Month] [int] NOT NULL,
	[Year] [int] NOT NULL,
 CONSTRAINT [PK_Report] PRIMARY KEY CLUSTERED 
(
	[idRoomType] ASC,
	[Month] ASC,
	[Year] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Room]    Script Date: 5/8/2021 10:40:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room](
	[ID] [char](10) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[IDRoomType] [char](10) NOT NULL,
	[IDStatusRoom] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoomType]    Script Date: 5/8/2021 10:40:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoomType](
	[ID] [char](10) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Price] [int] NOT NULL,
	[LimitPerson] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Service]    Script Date: 5/8/2021 10:40:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service](
	[ID] [char](10) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[IDServiceType] [char](10) NOT NULL,
	[Price] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServiceType]    Script Date: 5/8/2021 10:40:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServiceType](
	[ID] [char](10) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Staff]    Script Date: 5/8/2021 10:40:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staff](
	[UserName] [nvarchar](100) NOT NULL,
	[DisplayName] [nvarchar](100) NOT NULL,
	[PassWord] [nvarchar](100) NOT NULL,
	[IDStaffType] [char](10) NOT NULL,
	[IDCard] [nvarchar](100) NOT NULL,
	[DateOfBirth] [date] NOT NULL,
	[Sex] [nvarchar](100) NOT NULL,
	[Address] [nvarchar](200) NOT NULL,
	[PhoneNumber] [int] NOT NULL,
	[StartDay] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StaffType]    Script Date: 5/8/2021 10:40:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StaffType](
	[ID] [char](10) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StatusBill]    Script Date: 5/8/2021 10:40:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StatusBill](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StatusRoom]    Script Date: 5/8/2021 10:40:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StatusRoom](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[ACCESS] ([IDStaffType], [IDJob]) VALUES (N'CD001     ', N'CV001     ')
INSERT [dbo].[ACCESS] ([IDStaffType], [IDJob]) VALUES (N'CD001     ', N'CV002     ')
INSERT [dbo].[ACCESS] ([IDStaffType], [IDJob]) VALUES (N'CD001     ', N'CV003     ')
INSERT [dbo].[ACCESS] ([IDStaffType], [IDJob]) VALUES (N'CD001     ', N'CV004     ')
INSERT [dbo].[ACCESS] ([IDStaffType], [IDJob]) VALUES (N'CD001     ', N'CV005     ')
INSERT [dbo].[ACCESS] ([IDStaffType], [IDJob]) VALUES (N'CD001     ', N'CV006     ')
INSERT [dbo].[ACCESS] ([IDStaffType], [IDJob]) VALUES (N'CD001     ', N'CV007     ')
INSERT [dbo].[ACCESS] ([IDStaffType], [IDJob]) VALUES (N'CD001     ', N'CV008     ')
INSERT [dbo].[ACCESS] ([IDStaffType], [IDJob]) VALUES (N'CD001     ', N'CV009     ')
INSERT [dbo].[ACCESS] ([IDStaffType], [IDJob]) VALUES (N'CD001     ', N'CV010     ')
INSERT [dbo].[ACCESS] ([IDStaffType], [IDJob]) VALUES (N'CD002     ', N'CV002     ')
INSERT [dbo].[ACCESS] ([IDStaffType], [IDJob]) VALUES (N'CD002     ', N'CV003     ')
INSERT [dbo].[ACCESS] ([IDStaffType], [IDJob]) VALUES (N'CD002     ', N'CV006     ')
GO
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD010     ', N'PN014     ', N'admin', CAST(N'2021-04-17T13:41:00' AS SmallDateTime), 0, 0, 0, 0, 1, 0, N'I         ', CAST(N'2021-04-17T13:41:29.207' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD010     ', N'PN014     ', N'admin', CAST(N'2021-04-17T13:41:00' AS SmallDateTime), 0, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-17T13:42:45.167' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD010     ', N'PN014     ', N'admin', CAST(N'2021-04-17T13:41:00' AS SmallDateTime), 28000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-17T13:43:15.117' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD010     ', N'PN014     ', N'admin', CAST(N'2021-04-17T13:41:00' AS SmallDateTime), 28000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-17T13:43:15.130' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD010     ', N'PN014     ', N'admin', CAST(N'2021-04-17T13:41:00' AS SmallDateTime), 28000000, 3000000, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-17T13:43:15.140' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD006     ', N'PN006     ', N'admin', CAST(N'2018-06-24T18:42:00' AS SmallDateTime), 5000000, 0, 0, 0, 1, 2500000, N'U         ', CAST(N'2021-04-17T13:44:33.760' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD005     ', N'PN005     ', N'admin', CAST(N'2018-06-24T18:42:00' AS SmallDateTime), 40000000, 0, 0, 0, 1, 20000000, N'U         ', CAST(N'2021-04-17T13:53:32.233' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD011     ', N'PN015     ', N'admin', CAST(N'2021-04-17T13:54:00' AS SmallDateTime), 0, 0, 0, 0, 1, 0, N'I         ', CAST(N'2021-04-17T13:54:16.230' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD001     ', N'PN001     ', N'admin', CAST(N'2018-06-24T18:34:00' AS SmallDateTime), 5000000, 0, 7500000, 0, 2, 2500000, N'U         ', CAST(N'2021-04-17T14:10:18.813' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD002     ', N'PN002     ', N'admin', CAST(N'2018-06-24T18:34:00' AS SmallDateTime), 40000000, 0, 60000000, 10, 2, 20000000, N'U         ', CAST(N'2021-04-17T14:10:36.830' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD003     ', N'PN003     ', N'admin', CAST(N'2018-06-24T18:17:00' AS SmallDateTime), 4000000, 0, 0, 0, 1, 2000000, N'U         ', CAST(N'2021-04-17T14:10:41.060' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD004     ', N'PN004     ', N'admin', CAST(N'2018-06-24T18:45:00' AS SmallDateTime), 4000000, 1500000, 7500000, 1, 2, 2000000, N'U         ', CAST(N'2021-04-17T14:10:45.273' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD005     ', N'PN005     ', N'admin', CAST(N'2018-06-24T18:42:00' AS SmallDateTime), 40000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-17T14:10:49.577' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD006     ', N'PN006     ', N'admin', CAST(N'2018-06-24T18:42:00' AS SmallDateTime), 2000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-17T14:11:01.647' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD007     ', N'PN007     ', N'admin', CAST(N'2018-06-25T01:56:00' AS SmallDateTime), 4000000, 3000000, 10000000, 2, 2, 3000000, N'U         ', CAST(N'2021-04-17T14:11:06.773' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD008     ', N'PN008     ', N'admin', CAST(N'2018-06-25T02:29:00' AS SmallDateTime), 8000000, 125000, 8125000, 5, 2, 0, N'U         ', CAST(N'2021-04-17T14:11:11.160' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD009     ', N'PN009     ', N'admin', CAST(N'2021-04-13T23:00:00' AS SmallDateTime), 160000000, 2600000, 162600000, 0, 2, 0, N'U         ', CAST(N'2021-04-17T14:13:37.883' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD013     ', N'PN013     ', N'admin', CAST(N'2021-04-17T13:55:00' AS SmallDateTime), 20000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-17T21:53:04.643' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD013     ', N'PN013     ', N'admin', CAST(N'2021-04-17T13:55:00' AS SmallDateTime), 20000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-17T21:53:40.537' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD013     ', N'PN013     ', N'admin', CAST(N'2021-04-17T13:55:00' AS SmallDateTime), 20000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-17T21:53:40.637' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD013     ', N'PN013     ', N'admin', CAST(N'2021-04-17T13:55:00' AS SmallDateTime), 20000000, 9600000, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-17T21:53:40.647' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD015     ', N'PN013     ', N'admin', CAST(N'2021-04-17T21:54:00' AS SmallDateTime), 0, 0, 0, 0, 1, 0, N'I         ', CAST(N'2021-04-17T21:54:09.297' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD015     ', N'PN013     ', N'admin', CAST(N'2021-04-17T21:54:00' AS SmallDateTime), 0, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-17T21:54:09.300' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD015     ', N'PN013     ', N'admin', CAST(N'2021-04-17T21:54:00' AS SmallDateTime), 20000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-17T21:54:29.717' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD015     ', N'PN013     ', N'admin', CAST(N'2021-04-17T21:54:00' AS SmallDateTime), 20000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-17T21:54:29.723' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD015     ', N'PN013     ', N'admin', CAST(N'2021-04-17T21:54:00' AS SmallDateTime), 20000000, 3300000, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-17T21:54:29.727' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD005     ', N'PN005     ', N'admin', CAST(N'2021-03-21T18:42:00' AS SmallDateTime), 40000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-17T21:55:35.330' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD006     ', N'PN006     ', N'admin', CAST(N'2021-04-17T18:42:00' AS SmallDateTime), 2000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-17T22:05:45.447' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD006     ', N'PN006     ', N'admin', CAST(N'2021-04-17T18:42:00' AS SmallDateTime), 2000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-17T22:11:42.100' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD016     ', N'PN018     ', N'admin', CAST(N'2021-04-17T22:23:00' AS SmallDateTime), 0, 0, 0, 0, 1, 0, N'I         ', CAST(N'2021-04-17T22:22:37.817' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD016     ', N'PN018     ', N'admin', CAST(N'2021-04-17T22:23:00' AS SmallDateTime), 0, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-17T22:22:37.877' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD016     ', N'PN018     ', N'admin', CAST(N'2021-04-17T22:23:00' AS SmallDateTime), 14000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-17T22:23:17.693' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD016     ', N'PN018     ', N'admin', CAST(N'2021-04-17T22:23:00' AS SmallDateTime), 14000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-17T22:23:17.703' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD016     ', N'PN018     ', N'admin', CAST(N'2021-04-17T22:23:00' AS SmallDateTime), 14000000, 3950000, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-17T22:23:17.710' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD006     ', N'PN006     ', N'admin', CAST(N'2021-04-17T18:42:00' AS SmallDateTime), 2000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-17T22:23:28.460' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD006     ', N'PN006     ', N'admin', CAST(N'2021-04-17T18:42:00' AS SmallDateTime), 2000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-17T22:26:34.933' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD006     ', N'PN006     ', N'admin', CAST(N'2021-04-17T12:00:00' AS SmallDateTime), 2000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-17T22:26:52.120' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD006     ', N'PN006     ', N'admin', CAST(N'2021-04-17T12:00:00' AS SmallDateTime), 2000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-17T22:27:36.417' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD006     ', N'PN006     ', N'admin', CAST(N'2021-03-21T12:00:00' AS SmallDateTime), 2000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-17T22:27:57.500' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD017     ', N'PN020     ', N'admin', CAST(N'2021-04-18T09:31:00' AS SmallDateTime), 0, 0, 0, 0, 1, 0, N'I         ', CAST(N'2021-04-18T09:31:25.827' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD017     ', N'PN020     ', N'admin', CAST(N'2021-04-18T09:31:00' AS SmallDateTime), 0, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-18T09:31:25.927' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD012     ', N'PN012     ', N'admin', CAST(N'2021-04-17T13:54:00' AS SmallDateTime), 98000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-18T09:31:29.227' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD018     ', N'PN019     ', N'admin', CAST(N'2021-04-18T09:32:00' AS SmallDateTime), 0, 0, 0, 0, 1, 0, N'I         ', CAST(N'2021-04-18T09:31:31.510' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD018     ', N'PN019     ', N'admin', CAST(N'2021-04-18T09:32:00' AS SmallDateTime), 0, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-18T09:31:31.510' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD011     ', N'PN015     ', N'admin', CAST(N'2021-04-17T13:54:00' AS SmallDateTime), 28000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-18T09:31:32.443' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD006     ', N'PN006     ', N'admin', CAST(N'2021-03-21T12:00:00' AS SmallDateTime), 2000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-18T09:31:34.013' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD011     ', N'PN015     ', N'admin', CAST(N'2021-04-17T13:54:00' AS SmallDateTime), 70000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-19T22:06:50.447' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD022     ', N'PN015     ', N'admin', CAST(N'2021-04-19T22:08:00' AS SmallDateTime), 70000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-19T22:08:09.307' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD022     ', N'PN015     ', N'admin', CAST(N'2021-04-19T22:08:00' AS SmallDateTime), 70000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-19T22:08:09.310' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD022     ', N'PN015     ', N'admin', CAST(N'2021-04-19T22:08:00' AS SmallDateTime), 70000000, 2400000, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-19T22:08:09.310' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD012     ', N'PN012     ', N'admin', CAST(N'2021-04-17T13:54:00' AS SmallDateTime), 91000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-19T22:08:24.530' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD017     ', N'PN020     ', N'admin', CAST(N'2021-04-18T09:31:00' AS SmallDateTime), 2000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-19T22:08:58.603' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD012     ', N'PN012     ', N'admin', CAST(N'2021-04-17T13:54:00' AS SmallDateTime), 91000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-19T22:09:38.473' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD018     ', N'PN019     ', N'admin', CAST(N'2021-04-18T09:32:00' AS SmallDateTime), 5000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-19T22:09:39.080' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD017     ', N'PN020     ', N'admin', CAST(N'2021-04-18T09:31:00' AS SmallDateTime), 2000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-19T22:35:37.900' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD017     ', N'PN020     ', N'admin', CAST(N'2021-04-18T09:31:00' AS SmallDateTime), 2000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-19T22:35:38.560' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD012     ', N'PN012     ', N'admin', CAST(N'2021-04-17T13:54:00' AS SmallDateTime), 91000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-19T22:35:39.720' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD018     ', N'PN019     ', N'admin', CAST(N'2021-04-18T09:32:00' AS SmallDateTime), 5000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-19T22:35:40.950' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD026     ', N'PN024     ', N'admin', CAST(N'2021-04-21T18:34:00' AS SmallDateTime), 0, 0, 0, 0, 1, 0, N'I         ', CAST(N'2021-04-21T18:33:54.067' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD026     ', N'PN024     ', N'admin', CAST(N'2021-04-21T18:34:00' AS SmallDateTime), 0, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-21T18:33:54.153' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD018     ', N'PN019     ', N'admin', CAST(N'2021-04-18T09:32:00' AS SmallDateTime), 5000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-21T18:34:11.480' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD012     ', N'PN012     ', N'admin', CAST(N'2021-04-17T13:54:00' AS SmallDateTime), 91000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-21T18:34:12.657' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD027     ', N'PN025     ', N'admin', CAST(N'2021-04-21T18:34:00' AS SmallDateTime), 0, 0, 0, 0, 1, 0, N'I         ', CAST(N'2021-04-21T18:34:14.053' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD027     ', N'PN025     ', N'admin', CAST(N'2021-04-21T18:34:00' AS SmallDateTime), 0, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-21T18:34:14.057' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD026     ', N'PN024     ', N'admin', CAST(N'2021-04-21T18:34:00' AS SmallDateTime), 70000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-23T18:25:22.147' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD018     ', N'PN019     ', N'admin', CAST(N'2021-04-18T09:32:00' AS SmallDateTime), 5000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-23T18:25:23.430' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD028     ', N'PN026     ', N'admin', CAST(N'2021-04-23T18:34:00' AS SmallDateTime), 0, 0, 0, 0, 1, 0, N'I         ', CAST(N'2021-04-23T18:33:47.043' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD028     ', N'PN026     ', N'admin', CAST(N'2021-04-23T18:34:00' AS SmallDateTime), 0, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-23T18:33:47.080' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD028     ', N'PN026     ', N'admin', CAST(N'2021-04-23T18:34:00' AS SmallDateTime), 4000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-23T18:34:08.410' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD028     ', N'PN026     ', N'admin', CAST(N'2021-04-23T18:34:00' AS SmallDateTime), 4000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-23T18:34:08.450' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD028     ', N'PN026     ', N'admin', CAST(N'2021-04-23T18:34:00' AS SmallDateTime), 4000000, 2900000, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-23T18:34:08.460' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD027     ', N'PN025     ', N'admin', CAST(N'2021-04-21T18:34:00' AS SmallDateTime), 28000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-23T18:35:42.573' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD012     ', N'PN012     ', N'admin', CAST(N'2021-04-17T13:54:00' AS SmallDateTime), 91000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-23T18:35:45.070' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD008     ', N'PN008     ', N'admin', CAST(N'2021-04-24T19:48:00' AS SmallDateTime), 16000000, 200000, 16200000, 0, 2, 0, N'U         ', CAST(N'2021-04-24T19:48:40.377' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD009     ', N'PN009     ', N'admin', CAST(N'2021-04-17T23:00:00' AS SmallDateTime), 160000000, 2600000, 162600000, 0, 2, 0, N'U         ', CAST(N'2021-04-24T19:48:42.277' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD009     ', N'PN009     ', N'admin', CAST(N'2021-04-17T23:00:00' AS SmallDateTime), 160000000, 2600000, 162600000, 0, 1, 0, N'U         ', CAST(N'2021-04-24T19:48:56.743' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD011     ', N'PN015     ', N'admin', CAST(N'2021-04-17T13:54:00' AS SmallDateTime), 0, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-17T13:54:16.237' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD012     ', N'PN012     ', N'admin', CAST(N'2021-04-17T13:54:00' AS SmallDateTime), 0, 0, 0, 0, 1, 0, N'I         ', CAST(N'2021-04-17T13:54:26.793' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD012     ', N'PN012     ', N'admin', CAST(N'2021-04-17T13:54:00' AS SmallDateTime), 0, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-17T13:54:26.850' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD012     ', N'PN012     ', N'admin', CAST(N'2021-04-17T13:54:00' AS SmallDateTime), 98000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-17T13:54:35.193' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD012     ', N'PN012     ', N'admin', CAST(N'2021-04-17T13:54:00' AS SmallDateTime), 98000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-17T13:54:37.003' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD012     ', N'PN012     ', N'admin', CAST(N'2021-04-17T13:54:00' AS SmallDateTime), 98000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-17T13:54:37.990' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD013     ', N'PN013     ', N'admin', CAST(N'2021-04-17T13:55:00' AS SmallDateTime), 0, 0, 0, 0, 1, 0, N'I         ', CAST(N'2021-04-17T13:54:40.700' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD013     ', N'PN013     ', N'admin', CAST(N'2021-04-17T13:55:00' AS SmallDateTime), 0, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-17T13:54:40.707' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD013     ', N'PN013     ', N'admin', CAST(N'2021-04-17T13:55:00' AS SmallDateTime), 20000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-17T13:54:42.963' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD014     ', N'PN017     ', N'admin', CAST(N'2021-04-17T13:55:00' AS SmallDateTime), 0, 0, 0, 0, 1, 0, N'I         ', CAST(N'2021-04-17T13:54:45.563' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD014     ', N'PN017     ', N'admin', CAST(N'2021-04-17T13:55:00' AS SmallDateTime), 0, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-17T13:54:45.567' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD014     ', N'PN017     ', N'admin', CAST(N'2021-04-17T13:55:00' AS SmallDateTime), 7000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-17T13:54:47.910' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD006     ', N'PN006     ', N'admin', CAST(N'2018-06-24T18:42:00' AS SmallDateTime), 2000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-17T13:54:49.220' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD014     ', N'PN017     ', N'admin', CAST(N'2021-04-17T13:55:00' AS SmallDateTime), 7000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-17T13:55:37.733' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD014     ', N'PN017     ', N'admin', CAST(N'2021-04-17T13:55:00' AS SmallDateTime), 7000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-17T13:56:01.200' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD014     ', N'PN017     ', N'admin', CAST(N'2021-04-17T13:55:00' AS SmallDateTime), 7000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-17T13:56:01.210' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD014     ', N'PN017     ', N'admin', CAST(N'2021-04-17T13:55:00' AS SmallDateTime), 7000000, 1100000, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-17T13:56:01.217' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD005     ', N'PN005     ', N'admin', CAST(N'2018-06-24T18:42:00' AS SmallDateTime), 40000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-17T13:56:23.510' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD005     ', N'PN005     ', N'admin', CAST(N'2021-03-21T18:42:00' AS SmallDateTime), 40000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-18T09:34:43.760' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD019     ', N'PN016     ', N'admin', CAST(N'2021-04-18T09:40:00' AS SmallDateTime), 0, 0, 0, 0, 1, 0, N'I         ', CAST(N'2021-04-18T09:39:44.343' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD019     ', N'PN016     ', N'admin', CAST(N'2021-04-18T09:40:00' AS SmallDateTime), 0, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-18T09:39:44.487' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD005     ', N'PN005     ', N'admin', CAST(N'2021-03-21T18:42:00' AS SmallDateTime), 40000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-18T09:39:48.437' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD019     ', N'PN016     ', N'admin', CAST(N'2021-04-18T09:40:00' AS SmallDateTime), 130000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-18T09:40:17.867' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD006     ', N'PN006     ', N'admin', CAST(N'2021-03-21T12:00:00' AS SmallDateTime), 2000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-18T09:40:20.430' AS DateTime))
GO
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD019     ', N'PN016     ', N'admin', CAST(N'2021-04-18T09:40:00' AS SmallDateTime), 130000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-18T09:42:31.190' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD019     ', N'PN016     ', N'admin', CAST(N'2021-04-18T09:40:00' AS SmallDateTime), 130000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-18T09:43:04.370' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD019     ', N'PN016     ', N'admin', CAST(N'2021-04-18T09:40:00' AS SmallDateTime), 130000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-18T09:43:04.383' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD019     ', N'PN016     ', N'admin', CAST(N'2021-04-18T09:40:00' AS SmallDateTime), 130000000, 4350000, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-18T09:43:04.393' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD005     ', N'PN005     ', N'admin', CAST(N'2021-03-21T18:42:00' AS SmallDateTime), 200000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-18T09:43:11.260' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD006     ', N'PN006     ', N'admin', CAST(N'2021-03-21T12:00:00' AS SmallDateTime), 11000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-18T09:43:12.603' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD006     ', N'PN006     ', N'admin', CAST(N'2021-03-21T12:00:00' AS SmallDateTime), 8000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-18T09:43:35.580' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD006     ', N'PN006     ', N'admin', CAST(N'2021-03-21T12:00:00' AS SmallDateTime), 8000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-18T09:43:35.590' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD006     ', N'PN006     ', N'admin', CAST(N'2021-03-21T12:00:00' AS SmallDateTime), 8000000, 4850000, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-18T09:43:35.597' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD005     ', N'PN005     ', N'admin', CAST(N'2021-03-21T18:42:00' AS SmallDateTime), 130000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-18T09:43:41.303' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD020     ', N'PN011     ', N'admin', CAST(N'2021-04-18T09:44:00' AS SmallDateTime), 0, 0, 0, 0, 1, 0, N'I         ', CAST(N'2021-04-18T09:43:47.523' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD020     ', N'PN011     ', N'admin', CAST(N'2021-04-18T09:44:00' AS SmallDateTime), 0, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-18T09:43:47.527' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD005     ', N'PN005     ', N'admin', CAST(N'2021-03-21T18:42:00' AS SmallDateTime), 130000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-18T09:43:49.767' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD005     ', N'PN005     ', N'admin', CAST(N'2021-03-21T18:42:00' AS SmallDateTime), 130000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-18T09:44:04.050' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD005     ', N'PN005     ', N'admin', CAST(N'2021-03-21T18:42:00' AS SmallDateTime), 130000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-18T09:44:04.053' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD005     ', N'PN005     ', N'admin', CAST(N'2021-03-21T18:42:00' AS SmallDateTime), 130000000, 2900000, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-18T09:44:04.053' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD021     ', N'PN010     ', N'admin', CAST(N'2021-04-18T09:44:00' AS SmallDateTime), 0, 0, 0, 0, 1, 0, N'I         ', CAST(N'2021-04-18T09:44:14.380' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD021     ', N'PN010     ', N'admin', CAST(N'2021-04-18T09:44:00' AS SmallDateTime), 0, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-18T09:44:14.387' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD021     ', N'PN010     ', N'admin', CAST(N'2021-04-18T09:44:00' AS SmallDateTime), 350000000, 0, 0, 0, 1, 175000000, N'U         ', CAST(N'2021-04-18T09:44:38.400' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD021     ', N'PN010     ', N'admin', CAST(N'2021-04-18T09:44:00' AS SmallDateTime), 350000000, 0, 0, 0, 1, 175000000, N'U         ', CAST(N'2021-04-18T09:44:38.410' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD021     ', N'PN010     ', N'admin', CAST(N'2021-04-18T09:44:00' AS SmallDateTime), 350000000, 1150000, 0, 0, 1, 175000000, N'U         ', CAST(N'2021-04-18T09:44:38.420' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD018     ', N'PN019     ', N'admin', CAST(N'2021-04-18T09:32:00' AS SmallDateTime), 5000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-18T09:44:46.780' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD012     ', N'PN012     ', N'admin', CAST(N'2021-04-17T13:54:00' AS SmallDateTime), 91000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-18T09:44:47.843' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD017     ', N'PN020     ', N'admin', CAST(N'2021-04-18T09:31:00' AS SmallDateTime), 2000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-18T09:44:48.623' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD018     ', N'PN019     ', N'admin', CAST(N'2021-04-18T09:32:00' AS SmallDateTime), 5000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-18T09:44:49.480' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD012     ', N'PN012     ', N'admin', CAST(N'2021-04-17T13:54:00' AS SmallDateTime), 91000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-18T09:45:03.167' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD017     ', N'PN020     ', N'admin', CAST(N'2021-04-18T09:31:00' AS SmallDateTime), 2000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-18T09:45:05.800' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD011     ', N'PN015     ', N'admin', CAST(N'2021-04-17T13:54:00' AS SmallDateTime), 70000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-18T09:45:07.747' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD018     ', N'PN019     ', N'admin', CAST(N'2021-04-18T09:32:00' AS SmallDateTime), 5000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-18T09:45:09.147' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD012     ', N'PN012     ', N'admin', CAST(N'2021-04-17T13:54:00' AS SmallDateTime), 91000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-24T19:30:30.620' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD026     ', N'PN024     ', N'admin', CAST(N'2021-04-21T18:34:00' AS SmallDateTime), 70000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-24T19:30:32.383' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD027     ', N'PN025     ', N'admin', CAST(N'2021-04-21T18:34:00' AS SmallDateTime), 28000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-24T19:30:33.467' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD018     ', N'PN019     ', N'admin', CAST(N'2021-04-18T09:32:00' AS SmallDateTime), 5000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-24T19:30:34.340' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD005     ', N'PN005     ', N'admin', CAST(N'2018-06-24T18:42:00' AS SmallDateTime), 40000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-17T14:02:57.990' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD005     ', N'PN005     ', N'admin', CAST(N'2021-03-21T18:42:00' AS SmallDateTime), 40000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-17T14:28:03.413' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD011     ', N'PN015     ', N'admin', CAST(N'2021-04-17T13:54:00' AS SmallDateTime), 70000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-19T22:07:26.970' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD011     ', N'PN015     ', N'admin', CAST(N'2021-04-17T13:54:00' AS SmallDateTime), 70000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-19T22:07:27.110' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD011     ', N'PN015     ', N'admin', CAST(N'2021-04-17T13:54:00' AS SmallDateTime), 70000000, 8700000, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-19T22:07:27.153' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD022     ', N'PN015     ', N'admin', CAST(N'2021-04-19T22:08:00' AS SmallDateTime), 0, 0, 0, 0, 1, 0, N'I         ', CAST(N'2021-04-19T22:07:50.980' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD022     ', N'PN015     ', N'admin', CAST(N'2021-04-19T22:08:00' AS SmallDateTime), 0, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-19T22:07:50.983' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD012     ', N'PN012     ', N'admin', CAST(N'2021-04-17T13:54:00' AS SmallDateTime), 91000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-19T22:17:46.287' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD018     ', N'PN019     ', N'admin', CAST(N'2021-04-18T09:32:00' AS SmallDateTime), 5000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-19T22:17:47.963' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD023     ', N'PN022     ', N'admin', CAST(N'2021-04-19T22:18:00' AS SmallDateTime), 0, 0, 0, 0, 1, 0, N'I         ', CAST(N'2021-04-19T22:17:49.007' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD023     ', N'PN022     ', N'admin', CAST(N'2021-04-19T22:18:00' AS SmallDateTime), 0, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-19T22:17:49.073' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD023     ', N'PN022     ', N'admin', CAST(N'2021-04-19T22:18:00' AS SmallDateTime), 36000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-19T22:18:03.387' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD023     ', N'PN022     ', N'admin', CAST(N'2021-04-19T22:18:00' AS SmallDateTime), 36000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-19T22:18:03.393' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD023     ', N'PN022     ', N'admin', CAST(N'2021-04-19T22:18:00' AS SmallDateTime), 36000000, 1700000, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-19T22:18:03.407' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD020     ', N'PN011     ', N'admin', CAST(N'2021-04-18T09:44:00' AS SmallDateTime), 64000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-19T22:18:09.080' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD020     ', N'PN011     ', N'admin', CAST(N'2021-04-18T09:44:00' AS SmallDateTime), 64000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-19T22:18:26.620' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD020     ', N'PN011     ', N'admin', CAST(N'2021-04-18T09:44:00' AS SmallDateTime), 64000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-19T22:18:26.627' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD020     ', N'PN011     ', N'admin', CAST(N'2021-04-18T09:44:00' AS SmallDateTime), 64000000, 2700000, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-19T22:18:26.640' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD024     ', N'PN021     ', N'admin', CAST(N'2021-04-19T22:19:00' AS SmallDateTime), 0, 0, 0, 0, 1, 0, N'I         ', CAST(N'2021-04-19T22:18:32.713' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD024     ', N'PN021     ', N'admin', CAST(N'2021-04-19T22:19:00' AS SmallDateTime), 0, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-19T22:18:32.810' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD024     ', N'PN021     ', N'admin', CAST(N'2021-04-19T22:19:00' AS SmallDateTime), 9000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-19T22:18:46.627' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD024     ', N'PN021     ', N'admin', CAST(N'2021-04-19T22:19:00' AS SmallDateTime), 9000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-19T22:18:46.630' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD024     ', N'PN021     ', N'admin', CAST(N'2021-04-19T22:19:00' AS SmallDateTime), 9000000, 2400000, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-19T22:18:46.630' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD018     ', N'PN019     ', N'admin', CAST(N'2021-04-18T09:32:00' AS SmallDateTime), 5000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-19T22:18:51.383' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD025     ', N'PN023     ', N'admin', CAST(N'2021-04-19T22:19:00' AS SmallDateTime), 0, 0, 0, 0, 1, 0, N'I         ', CAST(N'2021-04-19T22:18:52.397' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD025     ', N'PN023     ', N'admin', CAST(N'2021-04-19T22:19:00' AS SmallDateTime), 0, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-19T22:18:52.400' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD025     ', N'PN023     ', N'admin', CAST(N'2021-04-19T22:19:00' AS SmallDateTime), 36000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-19T22:19:09.473' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD025     ', N'PN023     ', N'admin', CAST(N'2021-04-19T22:19:00' AS SmallDateTime), 36000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-19T22:19:09.480' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD025     ', N'PN023     ', N'admin', CAST(N'2021-04-19T22:19:00' AS SmallDateTime), 36000000, 4550000, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-19T22:19:09.490' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD012     ', N'PN012     ', N'admin', CAST(N'2021-04-17T13:54:00' AS SmallDateTime), 91000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-19T22:19:15.930' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD018     ', N'PN019     ', N'admin', CAST(N'2021-04-18T09:32:00' AS SmallDateTime), 5000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-19T22:19:16.570' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD017     ', N'PN020     ', N'admin', CAST(N'2021-04-18T09:31:00' AS SmallDateTime), 2000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-19T22:19:17.387' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD012     ', N'PN012     ', N'admin', CAST(N'2021-04-17T13:54:00' AS SmallDateTime), 91000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-23T18:35:47.667' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD026     ', N'PN024     ', N'admin', CAST(N'2021-04-21T18:34:00' AS SmallDateTime), 70000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-23T18:35:49.867' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD012     ', N'PN012     ', N'admin', CAST(N'2021-04-17T13:54:00' AS SmallDateTime), 91000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-23T18:35:51.277' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD018     ', N'PN019     ', N'admin', CAST(N'2021-04-18T09:32:00' AS SmallDateTime), 5000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-23T18:35:57.990' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD008     ', N'PN008     ', N'admin', CAST(N'2021-03-21T02:29:00' AS SmallDateTime), 8000000, 125000, 8125000, 5, 2, 0, N'U         ', CAST(N'2021-04-24T19:45:28.923' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD008     ', N'PN008     ', N'admin', CAST(N'2021-03-21T02:29:00' AS SmallDateTime), 8000000, 125000, 8125000, 5, 1, 0, N'U         ', CAST(N'2021-04-24T19:45:49.670' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD026     ', N'PN024     ', N'admin', CAST(N'2021-04-21T18:34:00' AS SmallDateTime), 70000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-24T19:45:51.817' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD008     ', N'PN008     ', N'admin', CAST(N'2021-03-21T02:29:00' AS SmallDateTime), 16000000, 125000, 8125000, 5, 1, 0, N'U         ', CAST(N'2021-04-24T19:45:52.660' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD012     ', N'PN012     ', N'admin', CAST(N'2021-04-17T13:54:00' AS SmallDateTime), 91000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-24T19:45:53.380' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD027     ', N'PN025     ', N'admin', CAST(N'2021-04-21T18:34:00' AS SmallDateTime), 28000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-24T19:45:54.353' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD008     ', N'PN008     ', N'admin', CAST(N'2021-03-21T02:29:00' AS SmallDateTime), 16000000, 125000, 8125000, 5, 1, 0, N'U         ', CAST(N'2021-04-24T19:45:55.547' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD027     ', N'PN025     ', N'admin', CAST(N'2021-04-21T18:34:00' AS SmallDateTime), 28000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-24T19:45:56.570' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD027     ', N'PN025     ', N'admin', CAST(N'2021-04-21T18:34:00' AS SmallDateTime), 28000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-24T19:46:00.550' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD027     ', N'PN025     ', N'admin', CAST(N'2021-04-21T18:34:00' AS SmallDateTime), 28000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-24T19:46:00.560' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD027     ', N'PN025     ', N'admin', CAST(N'2021-04-21T18:34:00' AS SmallDateTime), 28000000, 4450000, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-24T19:46:00.663' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD029     ', N'PN025     ', N'admin', CAST(N'2021-04-24T19:46:00' AS SmallDateTime), 0, 0, 0, 0, 1, 0, N'I         ', CAST(N'2021-04-24T19:46:14.403' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD029     ', N'PN025     ', N'admin', CAST(N'2021-04-24T19:46:00' AS SmallDateTime), 0, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-24T19:46:14.450' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD012     ', N'PN012     ', N'admin', CAST(N'2021-04-17T13:54:00' AS SmallDateTime), 91000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-24T19:46:21.540' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD029     ', N'PN025     ', N'admin', CAST(N'2021-04-24T19:46:00' AS SmallDateTime), 28000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-24T19:46:22.553' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD029     ', N'PN025     ', N'admin', CAST(N'2021-04-24T19:46:00' AS SmallDateTime), 28000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-24T19:46:33.493' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD029     ', N'PN025     ', N'admin', CAST(N'2021-04-24T19:46:00' AS SmallDateTime), 28000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-24T19:46:33.500' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD029     ', N'PN025     ', N'admin', CAST(N'2021-04-24T19:46:00' AS SmallDateTime), 28000000, 250000, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-24T19:46:33.513' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD026     ', N'PN024     ', N'admin', CAST(N'2021-04-21T18:34:00' AS SmallDateTime), 70000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-24T19:46:44.710' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD008     ', N'PN008     ', N'admin', CAST(N'2021-03-21T02:29:00' AS SmallDateTime), 16000000, 125000, 8125000, 5, 1, 0, N'U         ', CAST(N'2021-04-24T19:46:49.200' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD012     ', N'PN012     ', N'admin', CAST(N'2021-04-17T13:54:00' AS SmallDateTime), 91000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-24T19:46:55.060' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD008     ', N'PN008     ', N'admin', CAST(N'2021-03-21T02:29:00' AS SmallDateTime), 16000000, 125000, 8125000, 5, 1, 0, N'U         ', CAST(N'2021-04-24T19:47:01.380' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD026     ', N'PN024     ', N'admin', CAST(N'2021-04-21T18:34:00' AS SmallDateTime), 70000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-24T19:47:02.197' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD008     ', N'PN008     ', N'admin', CAST(N'2021-03-21T02:29:00' AS SmallDateTime), 16000000, 125000, 8125000, 5, 1, 0, N'U         ', CAST(N'2021-04-24T19:47:03.713' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD012     ', N'PN012     ', N'admin', CAST(N'2021-04-17T13:54:00' AS SmallDateTime), 91000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-24T19:47:04.690' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD008     ', N'PN008     ', N'admin', CAST(N'2021-03-21T02:29:00' AS SmallDateTime), 16000000, 125000, 8125000, 5, 1, 0, N'U         ', CAST(N'2021-04-24T19:47:05.647' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD026     ', N'PN024     ', N'admin', CAST(N'2021-04-21T18:34:00' AS SmallDateTime), 70000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-24T19:47:06.247' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD026     ', N'PN024     ', N'admin', CAST(N'2021-04-21T18:34:00' AS SmallDateTime), 70000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-24T19:47:11.397' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD026     ', N'PN024     ', N'admin', CAST(N'2021-04-21T18:34:00' AS SmallDateTime), 70000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-24T19:47:11.400' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD026     ', N'PN024     ', N'admin', CAST(N'2021-04-21T18:34:00' AS SmallDateTime), 70000000, 1725000, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-24T19:47:11.403' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD030     ', N'PN024     ', N'admin', CAST(N'2021-04-24T19:47:00' AS SmallDateTime), 0, 0, 0, 0, 1, 0, N'I         ', CAST(N'2021-04-24T19:47:18.007' AS DateTime))
GO
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD030     ', N'PN024     ', N'admin', CAST(N'2021-04-24T19:47:00' AS SmallDateTime), 0, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-24T19:47:18.043' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD030     ', N'PN024     ', N'admin', CAST(N'2021-04-24T19:47:00' AS SmallDateTime), 70000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-24T19:47:23.587' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD030     ', N'PN024     ', N'admin', CAST(N'2021-04-24T19:47:00' AS SmallDateTime), 70000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-24T19:47:23.590' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD030     ', N'PN024     ', N'admin', CAST(N'2021-04-24T19:47:00' AS SmallDateTime), 70000000, 50000, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-24T19:47:23.600' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD008     ', N'PN008     ', N'admin', CAST(N'2021-03-21T02:29:00' AS SmallDateTime), 16000000, 125000, 8125000, 5, 1, 0, N'U         ', CAST(N'2021-04-24T19:47:28.377' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD008     ', N'PN008     ', N'admin', CAST(N'2021-03-21T02:29:00' AS SmallDateTime), 16000000, 125000, 8125000, 5, 1, 0, N'U         ', CAST(N'2021-04-24T19:47:41.757' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD008     ', N'PN008     ', N'admin', CAST(N'2021-03-21T02:29:00' AS SmallDateTime), 16000000, 125000, 8125000, 5, 1, 0, N'U         ', CAST(N'2021-04-24T19:47:41.760' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD008     ', N'PN008     ', N'admin', CAST(N'2021-03-21T02:29:00' AS SmallDateTime), 16000000, 200000, 8125000, 5, 1, 0, N'U         ', CAST(N'2021-04-24T19:47:41.760' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD018     ', N'PN019     ', N'admin', CAST(N'2021-04-18T09:32:00' AS SmallDateTime), 5000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-24T19:47:48.350' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD018     ', N'PN019     ', N'admin', CAST(N'2021-04-18T09:32:00' AS SmallDateTime), 5000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-24T19:48:10.587' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD008     ', N'PN008     ', N'admin', CAST(N'2021-04-24T19:48:00' AS SmallDateTime), 16000000, 200000, 16200000, 0, 1, 0, N'U         ', CAST(N'2021-04-24T19:49:17.353' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD008     ', N'PN008     ', N'admin', CAST(N'2021-04-24T19:48:00' AS SmallDateTime), 16000000, 200000, 16200000, 0, 1, 0, N'U         ', CAST(N'2021-04-24T19:49:24.740' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD008     ', N'PN008     ', N'admin', CAST(N'2021-04-24T19:48:00' AS SmallDateTime), 16000000, 200000, 16200000, 0, 1, 0, N'U         ', CAST(N'2021-04-24T19:49:24.743' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD008     ', N'PN008     ', N'admin', CAST(N'2021-04-24T19:48:00' AS SmallDateTime), 16000000, 200000, 16200000, 0, 1, 0, N'U         ', CAST(N'2021-04-24T19:49:24.750' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD018     ', N'PN019     ', N'admin', CAST(N'2021-04-18T09:32:00' AS SmallDateTime), 5000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-24T19:49:30.640' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD012     ', N'PN012     ', N'admin', CAST(N'2021-04-17T13:54:00' AS SmallDateTime), 91000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-24T19:49:53.100' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD018     ', N'PN019     ', N'admin', CAST(N'2021-04-18T09:32:00' AS SmallDateTime), 5000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-24T19:49:54.170' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD012     ', N'PN012     ', N'admin', CAST(N'2021-04-17T13:54:00' AS SmallDateTime), 91000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-24T20:48:33.487' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD018     ', N'PN019     ', N'admin', CAST(N'2021-04-18T09:32:00' AS SmallDateTime), 5000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-24T20:48:36.417' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD012     ', N'PN012     ', N'admin', CAST(N'2021-04-17T13:54:00' AS SmallDateTime), 91000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-24T21:05:39.730' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD031     ', N'PN029     ', N'admin', CAST(N'2021-04-24T21:09:00' AS SmallDateTime), 0, 0, 0, 0, 1, 0, N'I         ', CAST(N'2021-04-24T21:09:20.563' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD031     ', N'PN029     ', N'admin', CAST(N'2021-04-24T21:09:00' AS SmallDateTime), 0, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-24T21:09:20.660' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD012     ', N'PN012     ', N'admin', CAST(N'2021-04-17T13:54:00' AS SmallDateTime), 91000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-24T21:09:22.290' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD032     ', N'PN028     ', N'admin', CAST(N'2021-04-24T21:09:00' AS SmallDateTime), 0, 0, 0, 0, 1, 0, N'I         ', CAST(N'2021-04-24T21:09:23.637' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD032     ', N'PN028     ', N'admin', CAST(N'2021-04-24T21:09:00' AS SmallDateTime), 0, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-24T21:09:23.643' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD018     ', N'PN019     ', N'admin', CAST(N'2021-04-18T09:32:00' AS SmallDateTime), 5000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-24T21:09:25.320' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD033     ', N'PN027     ', N'admin', CAST(N'2021-04-24T21:10:00' AS SmallDateTime), 0, 0, 0, 0, 1, 0, N'I         ', CAST(N'2021-04-24T21:09:42.470' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD033     ', N'PN027     ', N'admin', CAST(N'2021-04-24T21:10:00' AS SmallDateTime), 0, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-24T21:09:42.477' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD012     ', N'PN012     ', N'admin', CAST(N'2021-04-17T13:54:00' AS SmallDateTime), 91000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-24T21:09:45.040' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD031     ', N'PN029     ', N'admin', CAST(N'2021-04-24T21:09:00' AS SmallDateTime), 4000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-24T21:09:45.790' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD012     ', N'PN012     ', N'admin', CAST(N'2021-04-17T13:54:00' AS SmallDateTime), 91000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-24T21:09:47.060' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD018     ', N'PN019     ', N'admin', CAST(N'2021-04-18T09:32:00' AS SmallDateTime), 5000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-24T21:09:47.553' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD033     ', N'PN027     ', N'admin', CAST(N'2021-04-24T21:10:00' AS SmallDateTime), 10000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-24T21:11:09.400' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD033     ', N'PN027     ', N'admin', CAST(N'2021-04-24T21:10:00' AS SmallDateTime), 10000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-24T21:11:28.880' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD033     ', N'PN027     ', N'admin', CAST(N'2021-04-24T21:10:00' AS SmallDateTime), 10000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-24T21:11:28.887' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD033     ', N'PN027     ', N'admin', CAST(N'2021-04-24T21:10:00' AS SmallDateTime), 10000000, 400000, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-24T21:11:28.900' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD031     ', N'PN029     ', N'admin', CAST(N'2021-04-24T21:09:00' AS SmallDateTime), 4000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-24T21:11:58.210' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD031     ', N'PN029     ', N'admin', CAST(N'2021-04-24T21:09:00' AS SmallDateTime), 4000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-24T21:12:28.770' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD031     ', N'PN029     ', N'admin', CAST(N'2021-04-24T21:09:00' AS SmallDateTime), 4000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-24T21:12:28.773' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD031     ', N'PN029     ', N'admin', CAST(N'2021-04-24T21:09:00' AS SmallDateTime), 4000000, 2900000, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-24T21:12:28.787' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD034     ', N'PN029     ', N'admin', CAST(N'2021-04-24T21:13:00' AS SmallDateTime), 0, 0, 0, 0, 1, 0, N'I         ', CAST(N'2021-04-24T21:12:35.373' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD034     ', N'PN029     ', N'admin', CAST(N'2021-04-24T21:13:00' AS SmallDateTime), 0, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-24T21:12:35.377' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD034     ', N'PN029     ', N'admin', CAST(N'2021-04-24T21:13:00' AS SmallDateTime), 4000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-24T21:12:59.993' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD034     ', N'PN029     ', N'admin', CAST(N'2021-04-24T21:13:00' AS SmallDateTime), 4000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-24T21:13:00.000' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD034     ', N'PN029     ', N'admin', CAST(N'2021-04-24T21:13:00' AS SmallDateTime), 4000000, 1100000, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-24T21:13:00.000' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD012     ', N'PN012     ', N'admin', CAST(N'2021-04-17T13:54:00' AS SmallDateTime), 91000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-24T21:13:10.280' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD012     ', N'PN012     ', N'admin', CAST(N'2021-04-17T13:54:00' AS SmallDateTime), 91000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-24T21:13:13.713' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD012     ', N'PN012     ', N'admin', CAST(N'2021-04-17T13:54:00' AS SmallDateTime), 91000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-24T21:13:13.727' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD012     ', N'PN012     ', N'admin', CAST(N'2021-04-17T13:54:00' AS SmallDateTime), 91000000, 6100000, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-24T21:13:13.747' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD035     ', N'PN012     ', N'admin', CAST(N'2021-04-24T21:13:00' AS SmallDateTime), 0, 0, 0, 0, 1, 0, N'I         ', CAST(N'2021-04-24T21:13:19.727' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD035     ', N'PN012     ', N'admin', CAST(N'2021-04-24T21:13:00' AS SmallDateTime), 0, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-24T21:13:19.770' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD035     ', N'PN012     ', N'admin', CAST(N'2021-04-24T21:13:00' AS SmallDateTime), 91000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-24T21:13:28.023' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD035     ', N'PN012     ', N'admin', CAST(N'2021-04-24T21:13:00' AS SmallDateTime), 91000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-24T21:13:28.030' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD035     ', N'PN012     ', N'admin', CAST(N'2021-04-24T21:13:00' AS SmallDateTime), 91000000, 275000, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-24T21:13:28.043' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD032     ', N'PN028     ', N'admin', CAST(N'2021-04-24T21:09:00' AS SmallDateTime), 20000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-24T21:13:34.440' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD036     ', N'PN032     ', N'admin', CAST(N'2021-04-24T21:20:00' AS SmallDateTime), 0, 0, 0, 0, 1, 0, N'I         ', CAST(N'2021-04-24T21:19:46.480' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD036     ', N'PN032     ', N'admin', CAST(N'2021-04-24T21:20:00' AS SmallDateTime), 0, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-24T21:19:46.530' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD032     ', N'PN028     ', N'admin', CAST(N'2021-04-24T21:09:00' AS SmallDateTime), 20000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-24T21:19:47.540' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD018     ', N'PN019     ', N'admin', CAST(N'2021-04-18T09:32:00' AS SmallDateTime), 5000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-24T20:28:23.083' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD012     ', N'PN012     ', N'admin', CAST(N'2021-04-17T13:54:00' AS SmallDateTime), 91000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-24T20:30:43.840' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD018     ', N'PN019     ', N'admin', CAST(N'2021-04-18T09:32:00' AS SmallDateTime), 5000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-24T20:30:46.773' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD038     ', N'PN031     ', N'admin', CAST(N'2021-04-24T21:20:00' AS SmallDateTime), 12000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-24T21:30:13.980' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD038     ', N'PN031     ', N'admin', CAST(N'2021-04-24T21:20:00' AS SmallDateTime), 12000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-24T21:30:27.957' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD038     ', N'PN031     ', N'admin', CAST(N'2021-04-24T21:20:00' AS SmallDateTime), 12000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-24T21:30:27.963' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD038     ', N'PN031     ', N'admin', CAST(N'2021-04-24T21:20:00' AS SmallDateTime), 12000000, 450000, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-24T21:30:27.977' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD039     ', N'PN033     ', N'admin', CAST(N'2021-04-24T21:20:00' AS SmallDateTime), 28000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-25T08:34:52.113' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD043     ', N'PN036     ', N'admin', CAST(N'2021-04-25T08:35:00' AS SmallDateTime), 0, 0, 0, 0, 1, 0, N'I         ', CAST(N'2021-04-25T08:34:58.403' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD043     ', N'PN036     ', N'admin', CAST(N'2021-04-25T08:35:00' AS SmallDateTime), 0, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-25T08:34:58.437' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD043     ', N'PN036     ', N'admin', CAST(N'2021-04-25T08:35:00' AS SmallDateTime), 10000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-25T08:35:48.947' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD043     ', N'PN036     ', N'admin', CAST(N'2021-04-25T08:35:00' AS SmallDateTime), 10000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-25T08:35:48.957' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD043     ', N'PN036     ', N'admin', CAST(N'2021-04-25T08:35:00' AS SmallDateTime), 10000000, 1700000, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-25T08:35:48.980' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD037     ', N'PN030     ', N'admin', CAST(N'2021-04-24T21:20:00' AS SmallDateTime), 0, 0, 0, 0, 1, 0, N'I         ', CAST(N'2021-04-24T21:19:48.430' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD037     ', N'PN030     ', N'admin', CAST(N'2021-04-24T21:20:00' AS SmallDateTime), 0, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-24T21:19:48.480' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD038     ', N'PN031     ', N'admin', CAST(N'2021-04-24T21:20:00' AS SmallDateTime), 0, 0, 0, 0, 1, 0, N'I         ', CAST(N'2021-04-24T21:19:49.117' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD038     ', N'PN031     ', N'admin', CAST(N'2021-04-24T21:20:00' AS SmallDateTime), 0, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-24T21:19:49.153' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD039     ', N'PN033     ', N'admin', CAST(N'2021-04-24T21:20:00' AS SmallDateTime), 0, 0, 0, 0, 1, 0, N'I         ', CAST(N'2021-04-24T21:19:50.763' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD039     ', N'PN033     ', N'admin', CAST(N'2021-04-24T21:20:00' AS SmallDateTime), 0, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-24T21:19:50.810' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD036     ', N'PN032     ', N'admin', CAST(N'2021-04-24T21:20:00' AS SmallDateTime), 3000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-24T21:19:52.510' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD032     ', N'PN028     ', N'admin', CAST(N'2021-04-24T21:09:00' AS SmallDateTime), 20000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-24T21:19:52.980' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD036     ', N'PN032     ', N'admin', CAST(N'2021-04-24T21:20:00' AS SmallDateTime), 3000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-24T21:19:58.607' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD038     ', N'PN031     ', N'admin', CAST(N'2021-04-24T21:20:00' AS SmallDateTime), 12000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-24T21:19:59.300' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD037     ', N'PN030     ', N'admin', CAST(N'2021-04-24T21:20:00' AS SmallDateTime), 12000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-24T21:19:59.917' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD039     ', N'PN033     ', N'admin', CAST(N'2021-04-24T21:20:00' AS SmallDateTime), 28000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-24T21:20:00.510' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD038     ', N'PN031     ', N'admin', CAST(N'2021-04-24T21:20:00' AS SmallDateTime), 12000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-24T21:26:17.753' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD037     ', N'PN030     ', N'admin', CAST(N'2021-04-24T21:20:00' AS SmallDateTime), 12000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-24T21:26:18.290' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD018     ', N'PN019     ', N'admin', CAST(N'2021-04-18T09:32:00' AS SmallDateTime), 5000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-24T21:26:18.847' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD038     ', N'PN031     ', N'admin', CAST(N'2021-04-24T21:20:00' AS SmallDateTime), 12000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-24T21:26:35.317' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD037     ', N'PN030     ', N'admin', CAST(N'2021-04-24T21:20:00' AS SmallDateTime), 12000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-24T21:26:36.497' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD032     ', N'PN028     ', N'admin', CAST(N'2021-04-24T21:09:00' AS SmallDateTime), 20000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-24T21:26:37.893' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD036     ', N'PN032     ', N'admin', CAST(N'2021-04-24T21:20:00' AS SmallDateTime), 3000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-24T21:26:39.577' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD040     ', N'PN034     ', N'admin', CAST(N'2021-04-24T21:27:00' AS SmallDateTime), 0, 0, 0, 0, 1, 0, N'I         ', CAST(N'2021-04-24T21:26:40.613' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD040     ', N'PN034     ', N'admin', CAST(N'2021-04-24T21:27:00' AS SmallDateTime), 0, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-24T21:26:40.617' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD039     ', N'PN033     ', N'admin', CAST(N'2021-04-24T21:20:00' AS SmallDateTime), 28000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-24T21:26:41.993' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD032     ', N'PN028     ', N'admin', CAST(N'2021-04-24T21:09:00' AS SmallDateTime), 20000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-25T07:22:18.453' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD032     ', N'PN028     ', N'admin', CAST(N'2021-04-24T21:09:00' AS SmallDateTime), 20000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-25T07:22:28.437' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD032     ', N'PN028     ', N'admin', CAST(N'2021-04-24T21:09:00' AS SmallDateTime), 20000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-25T07:22:28.540' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD032     ', N'PN028     ', N'admin', CAST(N'2021-04-24T21:09:00' AS SmallDateTime), 20000000, 2700000, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-25T07:22:28.580' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD041     ', N'PN028     ', N'admin', CAST(N'2021-04-25T07:23:00' AS SmallDateTime), 0, 0, 0, 0, 1, 0, N'I         ', CAST(N'2021-04-25T07:22:33.710' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD041     ', N'PN028     ', N'admin', CAST(N'2021-04-25T07:23:00' AS SmallDateTime), 0, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-25T07:22:33.750' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD041     ', N'PN028     ', N'admin', CAST(N'2021-04-25T07:23:00' AS SmallDateTime), 20000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-25T07:22:39.833' AS DateTime))
GO
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD041     ', N'PN028     ', N'admin', CAST(N'2021-04-25T07:23:00' AS SmallDateTime), 20000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-25T07:22:39.840' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD041     ', N'PN028     ', N'admin', CAST(N'2021-04-25T07:23:00' AS SmallDateTime), 20000000, 500000, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-25T07:22:39.867' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD037     ', N'PN030     ', N'admin', CAST(N'2021-04-24T21:20:00' AS SmallDateTime), 12000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-25T07:22:48.020' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD039     ', N'PN033     ', N'admin', CAST(N'2021-04-24T21:20:00' AS SmallDateTime), 28000000, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-25T07:22:49.187' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD042     ', N'PN031     ', N'admin', CAST(N'2021-04-25T07:23:00' AS SmallDateTime), 0, 0, 0, 0, 1, 0, N'I         ', CAST(N'2021-04-25T07:22:50.070' AS DateTime))
INSERT [dbo].[Aud_Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge], [ThaoTac], [NgayThayDoi]) VALUES (N'HD042     ', N'PN031     ', N'admin', CAST(N'2021-04-25T07:23:00' AS SmallDateTime), 0, 0, 0, 0, 1, 0, N'U         ', CAST(N'2021-04-25T07:22:50.073' AS DateTime))
GO
INSERT [dbo].[Aud_BillDetails] ([IDBill], [IDService], [Count], [TotalPrice], [ThaoTac], [NgayThayDoi]) VALUES (N'HD010     ', N'DV012     ', 2, 400000, N'I         ', CAST(N'2021-04-17T13:42:53.127' AS DateTime))
INSERT [dbo].[Aud_BillDetails] ([IDBill], [IDService], [Count], [TotalPrice], [ThaoTac], [NgayThayDoi]) VALUES (N'HD010     ', N'DV004     ', 2, 2000000, N'I         ', CAST(N'2021-04-17T13:43:01.400' AS DateTime))
INSERT [dbo].[Aud_BillDetails] ([IDBill], [IDService], [Count], [TotalPrice], [ThaoTac], [NgayThayDoi]) VALUES (N'HD010     ', N'DV022     ', 2, 600000, N'I         ', CAST(N'2021-04-17T13:43:11.053' AS DateTime))
INSERT [dbo].[Aud_BillDetails] ([IDBill], [IDService], [Count], [TotalPrice], [ThaoTac], [NgayThayDoi]) VALUES (N'HD014     ', N'DV001     ', 1, 1000000, N'I         ', CAST(N'2021-04-17T13:55:42.927' AS DateTime))
INSERT [dbo].[Aud_BillDetails] ([IDBill], [IDService], [Count], [TotalPrice], [ThaoTac], [NgayThayDoi]) VALUES (N'HD014     ', N'DV014     ', 2, 100000, N'I         ', CAST(N'2021-04-17T13:55:51.910' AS DateTime))
INSERT [dbo].[Aud_BillDetails] ([IDBill], [IDService], [Count], [TotalPrice], [ThaoTac], [NgayThayDoi]) VALUES (N'HD013     ', N'DV013     ', 4, 8000000, N'I         ', CAST(N'2021-04-17T21:53:14.453' AS DateTime))
INSERT [dbo].[Aud_BillDetails] ([IDBill], [IDService], [Count], [TotalPrice], [ThaoTac], [NgayThayDoi]) VALUES (N'HD013     ', N'DV010     ', 2, 1000000, N'I         ', CAST(N'2021-04-17T21:53:21.973' AS DateTime))
INSERT [dbo].[Aud_BillDetails] ([IDBill], [IDService], [Count], [TotalPrice], [ThaoTac], [NgayThayDoi]) VALUES (N'HD013     ', N'DV016     ', 2, 300000, N'I         ', CAST(N'2021-04-17T21:53:29.897' AS DateTime))
INSERT [dbo].[Aud_BillDetails] ([IDBill], [IDService], [Count], [TotalPrice], [ThaoTac], [NgayThayDoi]) VALUES (N'HD013     ', N'DV026     ', 3, 300000, N'I         ', CAST(N'2021-04-17T21:53:37.483' AS DateTime))
INSERT [dbo].[Aud_BillDetails] ([IDBill], [IDService], [Count], [TotalPrice], [ThaoTac], [NgayThayDoi]) VALUES (N'HD015     ', N'DV026     ', 3, 300000, N'I         ', CAST(N'2021-04-17T21:54:13.443' AS DateTime))
INSERT [dbo].[Aud_BillDetails] ([IDBill], [IDService], [Count], [TotalPrice], [ThaoTac], [NgayThayDoi]) VALUES (N'HD015     ', N'DV027     ', 2, 2000000, N'I         ', CAST(N'2021-04-17T21:54:19.880' AS DateTime))
INSERT [dbo].[Aud_BillDetails] ([IDBill], [IDService], [Count], [TotalPrice], [ThaoTac], [NgayThayDoi]) VALUES (N'HD015     ', N'DV007     ', 2, 1000000, N'I         ', CAST(N'2021-04-17T21:54:26.883' AS DateTime))
INSERT [dbo].[Aud_BillDetails] ([IDBill], [IDService], [Count], [TotalPrice], [ThaoTac], [NgayThayDoi]) VALUES (N'CT006     ', N'DV001     ', 2, 600000, N'U         ', CAST(N'2021-04-17T22:04:33.900' AS DateTime))
INSERT [dbo].[Aud_BillDetails] ([IDBill], [IDService], [Count], [TotalPrice], [ThaoTac], [NgayThayDoi]) VALUES (N'CT001     ', N'DV001     ', 1, 1000000, N'U         ', CAST(N'2021-04-17T22:04:39.387' AS DateTime))
INSERT [dbo].[Aud_BillDetails] ([IDBill], [IDService], [Count], [TotalPrice], [ThaoTac], [NgayThayDoi]) VALUES (N'HD016     ', N'DV015     ', 3, 1500000, N'I         ', CAST(N'2021-04-17T22:22:43.950' AS DateTime))
INSERT [dbo].[Aud_BillDetails] ([IDBill], [IDService], [Count], [TotalPrice], [ThaoTac], [NgayThayDoi]) VALUES (N'HD016     ', N'DV018     ', 1, 50000, N'I         ', CAST(N'2021-04-17T22:22:46.930' AS DateTime))
INSERT [dbo].[Aud_BillDetails] ([IDBill], [IDService], [Count], [TotalPrice], [ThaoTac], [NgayThayDoi]) VALUES (N'HD016     ', N'DV026     ', 1, 100000, N'I         ', CAST(N'2021-04-17T22:22:49.840' AS DateTime))
INSERT [dbo].[Aud_BillDetails] ([IDBill], [IDService], [Count], [TotalPrice], [ThaoTac], [NgayThayDoi]) VALUES (N'HD016     ', N'DV029     ', 2, 400000, N'I         ', CAST(N'2021-04-17T22:22:53.547' AS DateTime))
INSERT [dbo].[Aud_BillDetails] ([IDBill], [IDService], [Count], [TotalPrice], [ThaoTac], [NgayThayDoi]) VALUES (N'HD016     ', N'DV006     ', 2, 400000, N'I         ', CAST(N'2021-04-17T22:22:59.330' AS DateTime))
INSERT [dbo].[Aud_BillDetails] ([IDBill], [IDService], [Count], [TotalPrice], [ThaoTac], [NgayThayDoi]) VALUES (N'HD016     ', N'DV007     ', 1, 500000, N'I         ', CAST(N'2021-04-17T22:23:04.840' AS DateTime))
INSERT [dbo].[Aud_BillDetails] ([IDBill], [IDService], [Count], [TotalPrice], [ThaoTac], [NgayThayDoi]) VALUES (N'HD016     ', N'DV024     ', 2, 1000000, N'I         ', CAST(N'2021-04-17T22:23:15.050' AS DateTime))
INSERT [dbo].[Aud_BillDetails] ([IDBill], [IDService], [Count], [TotalPrice], [ThaoTac], [NgayThayDoi]) VALUES (N'HD019     ', N'DV003     ', 2, 400000, N'I         ', CAST(N'2021-04-18T09:42:34.093' AS DateTime))
INSERT [dbo].[Aud_BillDetails] ([IDBill], [IDService], [Count], [TotalPrice], [ThaoTac], [NgayThayDoi]) VALUES (N'HD019     ', N'DV013     ', 1, 2000000, N'I         ', CAST(N'2021-04-18T09:42:36.740' AS DateTime))
INSERT [dbo].[Aud_BillDetails] ([IDBill], [IDService], [Count], [TotalPrice], [ThaoTac], [NgayThayDoi]) VALUES (N'HD019     ', N'DV015     ', 2, 1000000, N'I         ', CAST(N'2021-04-18T09:42:41.220' AS DateTime))
INSERT [dbo].[Aud_BillDetails] ([IDBill], [IDService], [Count], [TotalPrice], [ThaoTac], [NgayThayDoi]) VALUES (N'HD019     ', N'DV018     ', 2, 100000, N'I         ', CAST(N'2021-04-18T09:42:45.133' AS DateTime))
INSERT [dbo].[Aud_BillDetails] ([IDBill], [IDService], [Count], [TotalPrice], [ThaoTac], [NgayThayDoi]) VALUES (N'HD019     ', N'DV002     ', 2, 200000, N'I         ', CAST(N'2021-04-18T09:42:53.187' AS DateTime))
INSERT [dbo].[Aud_BillDetails] ([IDBill], [IDService], [Count], [TotalPrice], [ThaoTac], [NgayThayDoi]) VALUES (N'HD019     ', N'DV010     ', 1, 500000, N'I         ', CAST(N'2021-04-18T09:42:56.280' AS DateTime))
INSERT [dbo].[Aud_BillDetails] ([IDBill], [IDService], [Count], [TotalPrice], [ThaoTac], [NgayThayDoi]) VALUES (N'HD019     ', N'DV005     ', 1, 150000, N'I         ', CAST(N'2021-04-18T09:43:00.923' AS DateTime))
INSERT [dbo].[Aud_BillDetails] ([IDBill], [IDService], [Count], [TotalPrice], [ThaoTac], [NgayThayDoi]) VALUES (N'HD006     ', N'DV005     ', 3, 450000, N'I         ', CAST(N'2021-04-18T09:43:21.403' AS DateTime))
INSERT [dbo].[Aud_BillDetails] ([IDBill], [IDService], [Count], [TotalPrice], [ThaoTac], [NgayThayDoi]) VALUES (N'HD006     ', N'DV007     ', 1, 500000, N'I         ', CAST(N'2021-04-18T09:43:24.147' AS DateTime))
INSERT [dbo].[Aud_BillDetails] ([IDBill], [IDService], [Count], [TotalPrice], [ThaoTac], [NgayThayDoi]) VALUES (N'HD006     ', N'DV022     ', 1, 300000, N'I         ', CAST(N'2021-04-18T09:43:28.263' AS DateTime))
INSERT [dbo].[Aud_BillDetails] ([IDBill], [IDService], [Count], [TotalPrice], [ThaoTac], [NgayThayDoi]) VALUES (N'HD006     ', N'DV020     ', 1, 500000, N'I         ', CAST(N'2021-04-18T09:43:30.393' AS DateTime))
INSERT [dbo].[Aud_BillDetails] ([IDBill], [IDService], [Count], [TotalPrice], [ThaoTac], [NgayThayDoi]) VALUES (N'HD006     ', N'DV024     ', 1, 500000, N'I         ', CAST(N'2021-04-18T09:43:32.477' AS DateTime))
INSERT [dbo].[Aud_BillDetails] ([IDBill], [IDService], [Count], [TotalPrice], [ThaoTac], [NgayThayDoi]) VALUES (N'HD005     ', N'DV024     ', 1, 500000, N'I         ', CAST(N'2021-04-18T09:43:51.863' AS DateTime))
INSERT [dbo].[Aud_BillDetails] ([IDBill], [IDService], [Count], [TotalPrice], [ThaoTac], [NgayThayDoi]) VALUES (N'HD005     ', N'DV025     ', 1, 400000, N'I         ', CAST(N'2021-04-18T09:43:55.240' AS DateTime))
INSERT [dbo].[Aud_BillDetails] ([IDBill], [IDService], [Count], [TotalPrice], [ThaoTac], [NgayThayDoi]) VALUES (N'HD021     ', N'DV025     ', 2, 800000, N'I         ', CAST(N'2021-04-18T09:44:18.100' AS DateTime))
INSERT [dbo].[Aud_BillDetails] ([IDBill], [IDService], [Count], [TotalPrice], [ThaoTac], [NgayThayDoi]) VALUES (N'HD021     ', N'DV022     ', 1, 300000, N'I         ', CAST(N'2021-04-18T09:44:21.723' AS DateTime))
INSERT [dbo].[Aud_BillDetails] ([IDBill], [IDService], [Count], [TotalPrice], [ThaoTac], [NgayThayDoi]) VALUES (N'HD021     ', N'DV014     ', 1, 50000, N'I         ', CAST(N'2021-04-18T09:44:33.710' AS DateTime))
INSERT [dbo].[Aud_BillDetails] ([IDBill], [IDService], [Count], [TotalPrice], [ThaoTac], [NgayThayDoi]) VALUES (N'HD018     ', N'DV014     ', 2, 100000, N'I         ', CAST(N'2021-04-18T09:44:52.637' AS DateTime))
INSERT [dbo].[Aud_BillDetails] ([IDBill], [IDService], [Count], [TotalPrice], [ThaoTac], [NgayThayDoi]) VALUES (N'HD011     ', N'DV001     ', 2, 2400000, N'I         ', CAST(N'2021-04-19T22:06:53.713' AS DateTime))
INSERT [dbo].[Aud_BillDetails] ([IDBill], [IDService], [Count], [TotalPrice], [ThaoTac], [NgayThayDoi]) VALUES (N'HD011     ', N'DV013     ', 2, 4000000, N'I         ', CAST(N'2021-04-19T22:06:57.323' AS DateTime))
INSERT [dbo].[Aud_BillDetails] ([IDBill], [IDService], [Count], [TotalPrice], [ThaoTac], [NgayThayDoi]) VALUES (N'HD022     ', N'DV023     ', 1, 300000, N'I         ', CAST(N'2021-04-19T22:08:01.693' AS DateTime))
INSERT [dbo].[Aud_BillDetails] ([IDBill], [IDService], [Count], [TotalPrice], [ThaoTac], [NgayThayDoi]) VALUES (N'HD022     ', N'DV002     ', 1, 100000, N'I         ', CAST(N'2021-04-19T22:08:05.447' AS DateTime))
INSERT [dbo].[Aud_BillDetails] ([IDBill], [IDService], [Count], [TotalPrice], [ThaoTac], [NgayThayDoi]) VALUES (N'HD012     ', N'DV002     ', 2, 200000, N'I         ', CAST(N'2021-04-19T22:08:27.627' AS DateTime))
INSERT [dbo].[Aud_BillDetails] ([IDBill], [IDService], [Count], [TotalPrice], [ThaoTac], [NgayThayDoi]) VALUES (N'HD012     ', N'DV019     ', 2, 3600000, N'I         ', CAST(N'2021-04-19T22:08:34.180' AS DateTime))
INSERT [dbo].[Aud_BillDetails] ([IDBill], [IDService], [Count], [TotalPrice], [ThaoTac], [NgayThayDoi]) VALUES (N'HD012     ', N'DV002     ', 2, 200000, N'U         ', CAST(N'2021-04-19T22:08:37.907' AS DateTime))
INSERT [dbo].[Aud_BillDetails] ([IDBill], [IDService], [Count], [TotalPrice], [ThaoTac], [NgayThayDoi]) VALUES (N'HD012     ', N'DV009     ', 1, 1000000, N'I         ', CAST(N'2021-04-19T22:08:42.373' AS DateTime))
INSERT [dbo].[Aud_BillDetails] ([IDBill], [IDService], [Count], [TotalPrice], [ThaoTac], [NgayThayDoi]) VALUES (N'HD012     ', N'DV009     ', 1, 1000000, N'U         ', CAST(N'2021-04-19T22:08:42.860' AS DateTime))
INSERT [dbo].[Aud_BillDetails] ([IDBill], [IDService], [Count], [TotalPrice], [ThaoTac], [NgayThayDoi]) VALUES (N'HD012     ', N'DV016     ', 1, 150000, N'I         ', CAST(N'2021-04-19T22:08:48.733' AS DateTime))
INSERT [dbo].[Aud_BillDetails] ([IDBill], [IDService], [Count], [TotalPrice], [ThaoTac], [NgayThayDoi]) VALUES (N'HD012     ', N'DV014     ', 1, 50000, N'I         ', CAST(N'2021-04-19T22:08:53.617' AS DateTime))
INSERT [dbo].[Aud_BillDetails] ([IDBill], [IDService], [Count], [TotalPrice], [ThaoTac], [NgayThayDoi]) VALUES (N'HD017     ', N'DV014     ', 1, 50000, N'I         ', CAST(N'2021-04-19T22:08:59.917' AS DateTime))
INSERT [dbo].[Aud_BillDetails] ([IDBill], [IDService], [Count], [TotalPrice], [ThaoTac], [NgayThayDoi]) VALUES (N'HD017     ', N'DV017     ', 1, 75000, N'I         ', CAST(N'2021-04-19T22:09:02.553' AS DateTime))
INSERT [dbo].[Aud_BillDetails] ([IDBill], [IDService], [Count], [TotalPrice], [ThaoTac], [NgayThayDoi]) VALUES (N'HD017     ', N'DV026     ', 1, 100000, N'I         ', CAST(N'2021-04-19T22:09:05.003' AS DateTime))
INSERT [dbo].[Aud_BillDetails] ([IDBill], [IDService], [Count], [TotalPrice], [ThaoTac], [NgayThayDoi]) VALUES (N'HD017     ', N'DV028     ', 1, 1000000, N'I         ', CAST(N'2021-04-19T22:09:07.363' AS DateTime))
INSERT [dbo].[Aud_BillDetails] ([IDBill], [IDService], [Count], [TotalPrice], [ThaoTac], [NgayThayDoi]) VALUES (N'HD017     ', N'DV011     ', 1, 500000, N'I         ', CAST(N'2021-04-19T22:09:11.780' AS DateTime))
INSERT [dbo].[Aud_BillDetails] ([IDBill], [IDService], [Count], [TotalPrice], [ThaoTac], [NgayThayDoi]) VALUES (N'HD017     ', N'DV022     ', 1, 300000, N'I         ', CAST(N'2021-04-19T22:09:17.233' AS DateTime))
INSERT [dbo].[Aud_BillDetails] ([IDBill], [IDService], [Count], [TotalPrice], [ThaoTac], [NgayThayDoi]) VALUES (N'HD017     ', N'DV024     ', 2, 1000000, N'I         ', CAST(N'2021-04-19T22:09:29.333' AS DateTime))
INSERT [dbo].[Aud_BillDetails] ([IDBill], [IDService], [Count], [TotalPrice], [ThaoTac], [NgayThayDoi]) VALUES (N'HD018     ', N'DV024     ', 1, 500000, N'I         ', CAST(N'2021-04-19T22:09:40.443' AS DateTime))
INSERT [dbo].[Aud_BillDetails] ([IDBill], [IDService], [Count], [TotalPrice], [ThaoTac], [NgayThayDoi]) VALUES (N'HD018     ', N'DV020     ', 1, 500000, N'I         ', CAST(N'2021-04-19T22:09:43.797' AS DateTime))
INSERT [dbo].[Aud_BillDetails] ([IDBill], [IDService], [Count], [TotalPrice], [ThaoTac], [NgayThayDoi]) VALUES (N'HD018     ', N'DV013     ', 1, 2000000, N'I         ', CAST(N'2021-04-19T22:09:48.690' AS DateTime))
INSERT [dbo].[Aud_BillDetails] ([IDBill], [IDService], [Count], [TotalPrice], [ThaoTac], [NgayThayDoi]) VALUES (N'HD018     ', N'DV015     ', 1, 500000, N'I         ', CAST(N'2021-04-19T22:09:51.613' AS DateTime))
INSERT [dbo].[Aud_BillDetails] ([IDBill], [IDService], [Count], [TotalPrice], [ThaoTac], [NgayThayDoi]) VALUES (N'HD018     ', N'DV018     ', 1, 50000, N'I         ', CAST(N'2021-04-19T22:09:54.460' AS DateTime))
INSERT [dbo].[Aud_BillDetails] ([IDBill], [IDService], [Count], [TotalPrice], [ThaoTac], [NgayThayDoi]) VALUES (N'HD026     ', N'DV003     ', 1, 200000, N'I         ', CAST(N'2021-04-21T18:33:56.087' AS DateTime))
INSERT [dbo].[Aud_BillDetails] ([IDBill], [IDService], [Count], [TotalPrice], [ThaoTac], [NgayThayDoi]) VALUES (N'HD026     ', N'DV012     ', 1, 200000, N'I         ', CAST(N'2021-04-21T18:33:59.920' AS DateTime))
INSERT [dbo].[Aud_BillDetails] ([IDBill], [IDService], [Count], [TotalPrice], [ThaoTac], [NgayThayDoi]) VALUES (N'HD026     ', N'DV017     ', 1, 75000, N'I         ', CAST(N'2021-04-21T18:34:03.590' AS DateTime))
INSERT [dbo].[Aud_BillDetails] ([IDBill], [IDService], [Count], [TotalPrice], [ThaoTac], [NgayThayDoi]) VALUES (N'HD026     ', N'DV021     ', 1, 1200000, N'I         ', CAST(N'2021-04-21T18:34:08.143' AS DateTime))
INSERT [dbo].[Aud_BillDetails] ([IDBill], [IDService], [Count], [TotalPrice], [ThaoTac], [NgayThayDoi]) VALUES (N'HD027     ', N'DV021     ', 1, 1200000, N'I         ', CAST(N'2021-04-21T18:34:16.883' AS DateTime))
INSERT [dbo].[Aud_BillDetails] ([IDBill], [IDService], [Count], [TotalPrice], [ThaoTac], [NgayThayDoi]) VALUES (N'HD027     ', N'DV014     ', 1, 50000, N'I         ', CAST(N'2021-04-21T18:34:21.803' AS DateTime))
INSERT [dbo].[Aud_BillDetails] ([IDBill], [IDService], [Count], [TotalPrice], [ThaoTac], [NgayThayDoi]) VALUES (N'HD027     ', N'DV028     ', 1, 1000000, N'I         ', CAST(N'2021-04-21T18:34:25.847' AS DateTime))
INSERT [dbo].[Aud_BillDetails] ([IDBill], [IDService], [Count], [TotalPrice], [ThaoTac], [NgayThayDoi]) VALUES (N'HD027     ', N'DV029     ', 1, 200000, N'I         ', CAST(N'2021-04-21T18:34:30.280' AS DateTime))
INSERT [dbo].[Aud_BillDetails] ([IDBill], [IDService], [Count], [TotalPrice], [ThaoTac], [NgayThayDoi]) VALUES (N'HD027     ', N'DV013     ', 1, 2000000, N'I         ', CAST(N'2021-04-21T18:34:33.883' AS DateTime))
INSERT [dbo].[Aud_BillDetails] ([IDBill], [IDService], [Count], [TotalPrice], [ThaoTac], [NgayThayDoi]) VALUES (N'HD028     ', N'DV003     ', 2, 400000, N'I         ', CAST(N'2021-04-23T18:33:50.230' AS DateTime))
INSERT [dbo].[Aud_BillDetails] ([IDBill], [IDService], [Count], [TotalPrice], [ThaoTac], [NgayThayDoi]) VALUES (N'HD028     ', N'DV015     ', 1, 500000, N'I         ', CAST(N'2021-04-23T18:33:53.950' AS DateTime))
INSERT [dbo].[Aud_BillDetails] ([IDBill], [IDService], [Count], [TotalPrice], [ThaoTac], [NgayThayDoi]) VALUES (N'HD028     ', N'DV027     ', 1, 1000000, N'I         ', CAST(N'2021-04-23T18:33:57.810' AS DateTime))
INSERT [dbo].[Aud_BillDetails] ([IDBill], [IDService], [Count], [TotalPrice], [ThaoTac], [NgayThayDoi]) VALUES (N'HD028     ', N'DV028     ', 1, 1000000, N'I         ', CAST(N'2021-04-23T18:34:03.197' AS DateTime))
INSERT [dbo].[Aud_BillDetails] ([IDBill], [IDService], [Count], [TotalPrice], [ThaoTac], [NgayThayDoi]) VALUES (N'CT002     ', N'DV002     ', 1, 1000000, N'U         ', CAST(N'2021-04-17T22:04:45.010' AS DateTime))
INSERT [dbo].[Aud_BillDetails] ([IDBill], [IDService], [Count], [TotalPrice], [ThaoTac], [NgayThayDoi]) VALUES (N'CT007     ', N'DV002     ', 1, 75000, N'U         ', CAST(N'2021-04-17T22:04:49.743' AS DateTime))
INSERT [dbo].[Aud_BillDetails] ([IDBill], [IDService], [Count], [TotalPrice], [ThaoTac], [NgayThayDoi]) VALUES (N'CT003     ', N'DV003     ', 1, 100000, N'U         ', CAST(N'2021-04-17T22:04:58.243' AS DateTime))
INSERT [dbo].[Aud_BillDetails] ([IDBill], [IDService], [Count], [TotalPrice], [ThaoTac], [NgayThayDoi]) VALUES (N'CT005     ', N'DV003     ', 2, 2000000, N'U         ', CAST(N'2021-04-17T22:05:02.793' AS DateTime))
INSERT [dbo].[Aud_BillDetails] ([IDBill], [IDService], [Count], [TotalPrice], [ThaoTac], [NgayThayDoi]) VALUES (N'CT008     ', N'DV003     ', 1, 50000, N'U         ', CAST(N'2021-04-17T22:05:07.933' AS DateTime))
INSERT [dbo].[Aud_BillDetails] ([IDBill], [IDService], [Count], [TotalPrice], [ThaoTac], [NgayThayDoi]) VALUES (N'CT003     ', N'DV004     ', 1, 200000, N'U         ', CAST(N'2021-04-17T22:05:13.770' AS DateTime))
INSERT [dbo].[Aud_BillDetails] ([IDBill], [IDService], [Count], [TotalPrice], [ThaoTac], [NgayThayDoi]) VALUES (N'CT004     ', N'DV005     ', 1, 200000, N'U         ', CAST(N'2021-04-17T22:05:18.157' AS DateTime))
INSERT [dbo].[Aud_BillDetails] ([IDBill], [IDService], [Count], [TotalPrice], [ThaoTac], [NgayThayDoi]) VALUES (N'CT006     ', N'DV006     ', 1, 2000000, N'U         ', CAST(N'2021-04-17T22:05:28.893' AS DateTime))
INSERT [dbo].[Aud_BillDetails] ([IDBill], [IDService], [Count], [TotalPrice], [ThaoTac], [NgayThayDoi]) VALUES (N'HD011     ', N'DV015     ', 2, 1000000, N'I         ', CAST(N'2021-04-19T22:07:01.037' AS DateTime))
INSERT [dbo].[Aud_BillDetails] ([IDBill], [IDService], [Count], [TotalPrice], [ThaoTac], [NgayThayDoi]) VALUES (N'HD011     ', N'DV026     ', 2, 200000, N'I         ', CAST(N'2021-04-19T22:07:04.700' AS DateTime))
INSERT [dbo].[Aud_BillDetails] ([IDBill], [IDService], [Count], [TotalPrice], [ThaoTac], [NgayThayDoi]) VALUES (N'HD011     ', N'DV002     ', 1, 100000, N'I         ', CAST(N'2021-04-19T22:07:12.600' AS DateTime))
INSERT [dbo].[Aud_BillDetails] ([IDBill], [IDService], [Count], [TotalPrice], [ThaoTac], [NgayThayDoi]) VALUES (N'HD011     ', N'DV006     ', 1, 200000, N'I         ', CAST(N'2021-04-19T22:07:17.553' AS DateTime))
INSERT [dbo].[Aud_BillDetails] ([IDBill], [IDService], [Count], [TotalPrice], [ThaoTac], [NgayThayDoi]) VALUES (N'HD011     ', N'DV025     ', 2, 800000, N'I         ', CAST(N'2021-04-19T22:07:23.620' AS DateTime))
INSERT [dbo].[Aud_BillDetails] ([IDBill], [IDService], [Count], [TotalPrice], [ThaoTac], [NgayThayDoi]) VALUES (N'HD022     ', N'DV025     ', 1, 400000, N'I         ', CAST(N'2021-04-19T22:07:53.547' AS DateTime))
INSERT [dbo].[Aud_BillDetails] ([IDBill], [IDService], [Count], [TotalPrice], [ThaoTac], [NgayThayDoi]) VALUES (N'HD022     ', N'DV025     ', 1, 400000, N'U         ', CAST(N'2021-04-19T22:07:55.923' AS DateTime))
INSERT [dbo].[Aud_BillDetails] ([IDBill], [IDService], [Count], [TotalPrice], [ThaoTac], [NgayThayDoi]) VALUES (N'HD022     ', N'DV025     ', 3, 1200000, N'U         ', CAST(N'2021-04-19T22:07:56.377' AS DateTime))
INSERT [dbo].[Aud_BillDetails] ([IDBill], [IDService], [Count], [TotalPrice], [ThaoTac], [NgayThayDoi]) VALUES (N'HD022     ', N'DV025     ', 4, 1600000, N'U         ', CAST(N'2021-04-19T22:07:57.753' AS DateTime))
INSERT [dbo].[Aud_BillDetails] ([IDBill], [IDService], [Count], [TotalPrice], [ThaoTac], [NgayThayDoi]) VALUES (N'HD023     ', N'DV003     ', 3, 600000, N'I         ', CAST(N'2021-04-19T22:17:53.173' AS DateTime))
INSERT [dbo].[Aud_BillDetails] ([IDBill], [IDService], [Count], [TotalPrice], [ThaoTac], [NgayThayDoi]) VALUES (N'HD023     ', N'DV016     ', 1, 150000, N'I         ', CAST(N'2021-04-19T22:17:55.573' AS DateTime))
INSERT [dbo].[Aud_BillDetails] ([IDBill], [IDService], [Count], [TotalPrice], [ThaoTac], [NgayThayDoi]) VALUES (N'HD023     ', N'DV005     ', 1, 150000, N'I         ', CAST(N'2021-04-19T22:17:59.123' AS DateTime))
INSERT [dbo].[Aud_BillDetails] ([IDBill], [IDService], [Count], [TotalPrice], [ThaoTac], [NgayThayDoi]) VALUES (N'HD023     ', N'DV008     ', 1, 800000, N'I         ', CAST(N'2021-04-19T22:18:01.040' AS DateTime))
INSERT [dbo].[Aud_BillDetails] ([IDBill], [IDService], [Count], [TotalPrice], [ThaoTac], [NgayThayDoi]) VALUES (N'HD020     ', N'DV008     ', 2, 1600000, N'I         ', CAST(N'2021-04-19T22:18:11.213' AS DateTime))
INSERT [dbo].[Aud_BillDetails] ([IDBill], [IDService], [Count], [TotalPrice], [ThaoTac], [NgayThayDoi]) VALUES (N'HD020     ', N'DV006     ', 2, 400000, N'I         ', CAST(N'2021-04-19T22:18:17.450' AS DateTime))
INSERT [dbo].[Aud_BillDetails] ([IDBill], [IDService], [Count], [TotalPrice], [ThaoTac], [NgayThayDoi]) VALUES (N'HD020     ', N'DV007     ', 1, 500000, N'I         ', CAST(N'2021-04-19T22:18:20.687' AS DateTime))
INSERT [dbo].[Aud_BillDetails] ([IDBill], [IDService], [Count], [TotalPrice], [ThaoTac], [NgayThayDoi]) VALUES (N'HD020     ', N'DV003     ', 1, 200000, N'I         ', CAST(N'2021-04-19T22:18:23.390' AS DateTime))
GO
INSERT [dbo].[Aud_BillDetails] ([IDBill], [IDService], [Count], [TotalPrice], [ThaoTac], [NgayThayDoi]) VALUES (N'HD024     ', N'DV003     ', 1, 200000, N'I         ', CAST(N'2021-04-19T22:18:36.793' AS DateTime))
INSERT [dbo].[Aud_BillDetails] ([IDBill], [IDService], [Count], [TotalPrice], [ThaoTac], [NgayThayDoi]) VALUES (N'HD024     ', N'DV003     ', 1, 200000, N'U         ', CAST(N'2021-04-19T22:18:40.553' AS DateTime))
INSERT [dbo].[Aud_BillDetails] ([IDBill], [IDService], [Count], [TotalPrice], [ThaoTac], [NgayThayDoi]) VALUES (N'HD024     ', N'DV003     ', 1, 200000, N'U         ', CAST(N'2021-04-19T22:18:41.727' AS DateTime))
INSERT [dbo].[Aud_BillDetails] ([IDBill], [IDService], [Count], [TotalPrice], [ThaoTac], [NgayThayDoi]) VALUES (N'HD024     ', N'DV013     ', 1, 2000000, N'I         ', CAST(N'2021-04-19T22:18:44.700' AS DateTime))
INSERT [dbo].[Aud_BillDetails] ([IDBill], [IDService], [Count], [TotalPrice], [ThaoTac], [NgayThayDoi]) VALUES (N'HD025     ', N'DV013     ', 1, 2000000, N'I         ', CAST(N'2021-04-19T22:18:54.647' AS DateTime))
INSERT [dbo].[Aud_BillDetails] ([IDBill], [IDService], [Count], [TotalPrice], [ThaoTac], [NgayThayDoi]) VALUES (N'HD025     ', N'DV016     ', 1, 150000, N'I         ', CAST(N'2021-04-19T22:18:57.603' AS DateTime))
INSERT [dbo].[Aud_BillDetails] ([IDBill], [IDService], [Count], [TotalPrice], [ThaoTac], [NgayThayDoi]) VALUES (N'HD025     ', N'DV021     ', 1, 1200000, N'I         ', CAST(N'2021-04-19T22:18:59.930' AS DateTime))
INSERT [dbo].[Aud_BillDetails] ([IDBill], [IDService], [Count], [TotalPrice], [ThaoTac], [NgayThayDoi]) VALUES (N'HD025     ', N'DV028     ', 1, 1000000, N'I         ', CAST(N'2021-04-19T22:19:03.083' AS DateTime))
INSERT [dbo].[Aud_BillDetails] ([IDBill], [IDService], [Count], [TotalPrice], [ThaoTac], [NgayThayDoi]) VALUES (N'HD025     ', N'DV029     ', 1, 200000, N'I         ', CAST(N'2021-04-19T22:19:06.840' AS DateTime))
INSERT [dbo].[Aud_BillDetails] ([IDBill], [IDService], [Count], [TotalPrice], [ThaoTac], [NgayThayDoi]) VALUES (N'HD029     ', N'DV003     ', 1, 200000, N'I         ', CAST(N'2021-04-24T19:46:25.460' AS DateTime))
INSERT [dbo].[Aud_BillDetails] ([IDBill], [IDService], [Count], [TotalPrice], [ThaoTac], [NgayThayDoi]) VALUES (N'HD029     ', N'DV014     ', 1, 50000, N'I         ', CAST(N'2021-04-24T19:46:30.520' AS DateTime))
INSERT [dbo].[Aud_BillDetails] ([IDBill], [IDService], [Count], [TotalPrice], [ThaoTac], [NgayThayDoi]) VALUES (N'HD026     ', N'DV014     ', 1, 50000, N'I         ', CAST(N'2021-04-24T19:47:08.413' AS DateTime))
INSERT [dbo].[Aud_BillDetails] ([IDBill], [IDService], [Count], [TotalPrice], [ThaoTac], [NgayThayDoi]) VALUES (N'HD030     ', N'DV014     ', 1, 50000, N'I         ', CAST(N'2021-04-24T19:47:21.250' AS DateTime))
INSERT [dbo].[Aud_BillDetails] ([IDBill], [IDService], [Count], [TotalPrice], [ThaoTac], [NgayThayDoi]) VALUES (N'HD008     ', N'DV016     ', 1, 150000, N'I         ', CAST(N'2021-04-24T19:47:38.750' AS DateTime))
INSERT [dbo].[Aud_BillDetails] ([IDBill], [IDService], [Count], [TotalPrice], [ThaoTac], [NgayThayDoi]) VALUES (N'HD033     ', N'DV003     ', 1, 200000, N'I         ', CAST(N'2021-04-24T21:11:16.603' AS DateTime))
INSERT [dbo].[Aud_BillDetails] ([IDBill], [IDService], [Count], [TotalPrice], [ThaoTac], [NgayThayDoi]) VALUES (N'HD033     ', N'DV012     ', 1, 200000, N'I         ', CAST(N'2021-04-24T21:11:19.603' AS DateTime))
INSERT [dbo].[Aud_BillDetails] ([IDBill], [IDService], [Count], [TotalPrice], [ThaoTac], [NgayThayDoi]) VALUES (N'HD031     ', N'DV011     ', 1, 500000, N'I         ', CAST(N'2021-04-24T21:12:04.780' AS DateTime))
INSERT [dbo].[Aud_BillDetails] ([IDBill], [IDService], [Count], [TotalPrice], [ThaoTac], [NgayThayDoi]) VALUES (N'HD031     ', N'DV001     ', 1, 1200000, N'I         ', CAST(N'2021-04-24T21:12:08.373' AS DateTime))
INSERT [dbo].[Aud_BillDetails] ([IDBill], [IDService], [Count], [TotalPrice], [ThaoTac], [NgayThayDoi]) VALUES (N'HD031     ', N'DV004     ', 1, 1000000, N'I         ', CAST(N'2021-04-24T21:12:14.270' AS DateTime))
INSERT [dbo].[Aud_BillDetails] ([IDBill], [IDService], [Count], [TotalPrice], [ThaoTac], [NgayThayDoi]) VALUES (N'HD031     ', N'DV006     ', 1, 200000, N'I         ', CAST(N'2021-04-24T21:12:25.173' AS DateTime))
INSERT [dbo].[Aud_BillDetails] ([IDBill], [IDService], [Count], [TotalPrice], [ThaoTac], [NgayThayDoi]) VALUES (N'HD034     ', N'DV006     ', 1, 200000, N'I         ', CAST(N'2021-04-24T21:12:41.457' AS DateTime))
INSERT [dbo].[Aud_BillDetails] ([IDBill], [IDService], [Count], [TotalPrice], [ThaoTac], [NgayThayDoi]) VALUES (N'HD034     ', N'DV007     ', 1, 500000, N'I         ', CAST(N'2021-04-24T21:12:50.713' AS DateTime))
INSERT [dbo].[Aud_BillDetails] ([IDBill], [IDService], [Count], [TotalPrice], [ThaoTac], [NgayThayDoi]) VALUES (N'HD034     ', N'DV003     ', 1, 200000, N'I         ', CAST(N'2021-04-24T21:12:53.847' AS DateTime))
INSERT [dbo].[Aud_BillDetails] ([IDBill], [IDService], [Count], [TotalPrice], [ThaoTac], [NgayThayDoi]) VALUES (N'HD034     ', N'DV012     ', 1, 200000, N'I         ', CAST(N'2021-04-24T21:12:55.840' AS DateTime))
INSERT [dbo].[Aud_BillDetails] ([IDBill], [IDService], [Count], [TotalPrice], [ThaoTac], [NgayThayDoi]) VALUES (N'HD035     ', N'DV012     ', 1, 200000, N'I         ', CAST(N'2021-04-24T21:13:23.360' AS DateTime))
INSERT [dbo].[Aud_BillDetails] ([IDBill], [IDService], [Count], [TotalPrice], [ThaoTac], [NgayThayDoi]) VALUES (N'HD035     ', N'DV017     ', 1, 75000, N'I         ', CAST(N'2021-04-24T21:13:25.823' AS DateTime))
INSERT [dbo].[Aud_BillDetails] ([IDBill], [IDService], [Count], [TotalPrice], [ThaoTac], [NgayThayDoi]) VALUES (N'HD032     ', N'DV003     ', 1, 200000, N'I         ', CAST(N'2021-04-25T07:22:20.337' AS DateTime))
INSERT [dbo].[Aud_BillDetails] ([IDBill], [IDService], [Count], [TotalPrice], [ThaoTac], [NgayThayDoi]) VALUES (N'HD032     ', N'DV013     ', 1, 2000000, N'I         ', CAST(N'2021-04-25T07:22:23.120' AS DateTime))
INSERT [dbo].[Aud_BillDetails] ([IDBill], [IDService], [Count], [TotalPrice], [ThaoTac], [NgayThayDoi]) VALUES (N'HD032     ', N'DV015     ', 1, 500000, N'I         ', CAST(N'2021-04-25T07:22:25.983' AS DateTime))
INSERT [dbo].[Aud_BillDetails] ([IDBill], [IDService], [Count], [TotalPrice], [ThaoTac], [NgayThayDoi]) VALUES (N'HD041     ', N'DV015     ', 1, 500000, N'I         ', CAST(N'2021-04-25T07:22:36.280' AS DateTime))
INSERT [dbo].[Aud_BillDetails] ([IDBill], [IDService], [Count], [TotalPrice], [ThaoTac], [NgayThayDoi]) VALUES (N'HD038     ', N'DV003     ', 2, 400000, N'I         ', CAST(N'2021-04-24T21:30:17.437' AS DateTime))
INSERT [dbo].[Aud_BillDetails] ([IDBill], [IDService], [Count], [TotalPrice], [ThaoTac], [NgayThayDoi]) VALUES (N'HD038     ', N'DV014     ', 1, 50000, N'I         ', CAST(N'2021-04-24T21:30:21.540' AS DateTime))
INSERT [dbo].[Aud_BillDetails] ([IDBill], [IDService], [Count], [TotalPrice], [ThaoTac], [NgayThayDoi]) VALUES (N'HD043     ', N'DV015     ', 1, 500000, N'I         ', CAST(N'2021-04-25T08:35:10.477' AS DateTime))
INSERT [dbo].[Aud_BillDetails] ([IDBill], [IDService], [Count], [TotalPrice], [ThaoTac], [NgayThayDoi]) VALUES (N'HD043     ', N'DV001     ', 1, 1200000, N'I         ', CAST(N'2021-04-25T08:35:25.013' AS DateTime))
GO
INSERT [dbo].[Aud_BookRoom] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut], [ThaoTac], [NgayThayDoi]) VALUES (N'DP014     ', N'KH017     ', N'LP003     ', CAST(N'2021-04-16T22:17:00' AS SmallDateTime), CAST(N'2021-04-16' AS Date), CAST(N'2021-04-17' AS Date), N'I         ', CAST(N'2021-04-16T22:16:42.437' AS DateTime))
INSERT [dbo].[Aud_BookRoom] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut], [ThaoTac], [NgayThayDoi]) VALUES (N'DP014     ', N'KH017     ', N'LP003     ', CAST(N'2021-04-16T22:17:00' AS SmallDateTime), CAST(N'2021-04-16' AS Date), CAST(N'2021-04-17' AS Date), N'U         ', CAST(N'2021-04-16T22:17:17.877' AS DateTime))
INSERT [dbo].[Aud_BookRoom] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut], [ThaoTac], [NgayThayDoi]) VALUES (N'DP015     ', N'KH018     ', N'LP002     ', CAST(N'2021-04-16T22:29:00' AS SmallDateTime), CAST(N'2021-04-16' AS Date), CAST(N'2021-04-26' AS Date), N'I         ', CAST(N'2021-04-16T22:28:49.827' AS DateTime))
INSERT [dbo].[Aud_BookRoom] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut], [ThaoTac], [NgayThayDoi]) VALUES (N'DP016     ', N'KH019     ', N'LP004     ', CAST(N'2021-04-16T22:38:00' AS SmallDateTime), CAST(N'2021-04-16' AS Date), CAST(N'2021-04-29' AS Date), N'I         ', CAST(N'2021-04-16T22:37:42.047' AS DateTime))
INSERT [dbo].[Aud_BookRoom] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut], [ThaoTac], [NgayThayDoi]) VALUES (N'DP017     ', N'KH020     ', N'LP002     ', CAST(N'2021-04-16T22:38:00' AS SmallDateTime), CAST(N'2021-04-16' AS Date), CAST(N'2021-04-28' AS Date), N'I         ', CAST(N'2021-04-16T22:38:26.840' AS DateTime))
INSERT [dbo].[Aud_BookRoom] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut], [ThaoTac], [NgayThayDoi]) VALUES (N'DP019     ', N'KH021     ', N'LP003     ', CAST(N'2021-04-17T09:50:00' AS SmallDateTime), CAST(N'2021-04-17' AS Date), CAST(N'2021-04-22' AS Date), N'I         ', CAST(N'2021-04-17T09:50:00.460' AS DateTime))
INSERT [dbo].[Aud_BookRoom] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut], [ThaoTac], [NgayThayDoi]) VALUES (N'DP020     ', N'KH014     ', N'LP002     ', CAST(N'2021-04-17T13:15:00' AS SmallDateTime), CAST(N'2021-04-17' AS Date), CAST(N'2021-04-21' AS Date), N'I         ', CAST(N'2021-04-17T13:14:35.053' AS DateTime))
INSERT [dbo].[Aud_BookRoom] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut], [ThaoTac], [NgayThayDoi]) VALUES (N'DP021     ', N'KH013     ', N'LP004     ', CAST(N'2021-04-17T13:15:00' AS SmallDateTime), CAST(N'2021-04-17' AS Date), CAST(N'2021-04-28' AS Date), N'I         ', CAST(N'2021-04-17T13:14:55.770' AS DateTime))
INSERT [dbo].[Aud_BookRoom] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut], [ThaoTac], [NgayThayDoi]) VALUES (N'DP022     ', N'KH018     ', N'LP001     ', CAST(N'2021-04-17T13:17:00' AS SmallDateTime), CAST(N'2021-04-17' AS Date), CAST(N'2021-04-18' AS Date), N'I         ', CAST(N'2021-04-17T13:17:09.897' AS DateTime))
INSERT [dbo].[Aud_BookRoom] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut], [ThaoTac], [NgayThayDoi]) VALUES (N'DP023     ', N'KH017     ', N'LP001     ', CAST(N'2021-04-17T13:21:00' AS SmallDateTime), CAST(N'2021-04-18' AS Date), CAST(N'2021-04-30' AS Date), N'I         ', CAST(N'2021-04-17T13:21:20.720' AS DateTime))
INSERT [dbo].[Aud_BookRoom] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut], [ThaoTac], [NgayThayDoi]) VALUES (N'DP006     ', N'KH013     ', N'LP003     ', CAST(N'2018-06-25T01:54:00' AS SmallDateTime), CAST(N'2018-06-25' AS Date), CAST(N'2018-06-27' AS Date), N'U         ', CAST(N'2021-04-17T14:07:06.263' AS DateTime))
INSERT [dbo].[Aud_BookRoom] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut], [ThaoTac], [NgayThayDoi]) VALUES (N'DP024     ', N'KH020     ', N'LP001     ', CAST(N'2021-04-17T19:35:00' AS SmallDateTime), CAST(N'2021-04-17' AS Date), CAST(N'2021-04-28' AS Date), N'I         ', CAST(N'2021-04-17T19:35:01.463' AS DateTime))
INSERT [dbo].[Aud_BookRoom] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut], [ThaoTac], [NgayThayDoi]) VALUES (N'DP026     ', N'KH013     ', N'LP004     ', CAST(N'2021-04-18T09:07:00' AS SmallDateTime), CAST(N'2021-04-18' AS Date), CAST(N'2021-04-19' AS Date), N'I         ', CAST(N'2021-04-18T09:06:56.280' AS DateTime))
INSERT [dbo].[Aud_BookRoom] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut], [ThaoTac], [NgayThayDoi]) VALUES (N'DP025     ', N'KH013     ', N'LP001     ', CAST(N'2021-04-17T22:07:00' AS SmallDateTime), CAST(N'2021-04-17' AS Date), CAST(N'2021-04-22' AS Date), N'D         ', CAST(N'2021-04-18T09:11:04.980' AS DateTime))
INSERT [dbo].[Aud_BookRoom] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut], [ThaoTac], [NgayThayDoi]) VALUES (N'DP020     ', N'KH013     ', N'LP004     ', CAST(N'2021-04-18T09:12:00' AS SmallDateTime), CAST(N'2021-04-18' AS Date), CAST(N'2021-04-20' AS Date), N'I         ', CAST(N'2021-04-18T09:11:54.873' AS DateTime))
INSERT [dbo].[Aud_BookRoom] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut], [ThaoTac], [NgayThayDoi]) VALUES (N'DP001     ', N'KH004     ', N'LP001     ', CAST(N'2018-06-24T18:12:00' AS SmallDateTime), CAST(N'2018-06-24' AS Date), CAST(N'2018-06-28' AS Date), N'U         ', CAST(N'2021-04-18T09:36:56.573' AS DateTime))
INSERT [dbo].[Aud_BookRoom] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut], [ThaoTac], [NgayThayDoi]) VALUES (N'DP023     ', N'KH018     ', N'LP003     ', CAST(N'2021-04-19T22:12:00' AS SmallDateTime), CAST(N'2021-04-19' AS Date), CAST(N'2021-04-28' AS Date), N'I         ', CAST(N'2021-04-19T22:11:30.830' AS DateTime))
INSERT [dbo].[Aud_BookRoom] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut], [ThaoTac], [NgayThayDoi]) VALUES (N'DP024     ', N'KH022     ', N'LP003     ', CAST(N'2021-04-19T22:12:00' AS SmallDateTime), CAST(N'2021-04-19' AS Date), CAST(N'2021-04-26' AS Date), N'I         ', CAST(N'2021-04-19T22:12:26.030' AS DateTime))
INSERT [dbo].[Aud_BookRoom] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut], [ThaoTac], [NgayThayDoi]) VALUES (N'DP025     ', N'KH020     ', N'LP004     ', CAST(N'2021-04-19T22:14:00' AS SmallDateTime), CAST(N'2021-04-19' AS Date), CAST(N'2021-04-28' AS Date), N'I         ', CAST(N'2021-04-19T22:13:53.930' AS DateTime))
INSERT [dbo].[Aud_BookRoom] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut], [ThaoTac], [NgayThayDoi]) VALUES (N'DP026     ', N'KH013     ', N'LP001     ', CAST(N'2021-04-21T18:09:00' AS SmallDateTime), CAST(N'2021-04-21' AS Date), CAST(N'2021-04-28' AS Date), N'I         ', CAST(N'2021-04-21T18:09:18.743' AS DateTime))
INSERT [dbo].[Aud_BookRoom] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut], [ThaoTac], [NgayThayDoi]) VALUES (N'DP027     ', N'KH014     ', N'LP002     ', CAST(N'2021-04-21T18:10:00' AS SmallDateTime), CAST(N'2021-04-21' AS Date), CAST(N'2021-04-25' AS Date), N'I         ', CAST(N'2021-04-21T18:09:43.607' AS DateTime))
INSERT [dbo].[Aud_BookRoom] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut], [ThaoTac], [NgayThayDoi]) VALUES (N'DP029     ', N'KH013     ', N'LP003     ', CAST(N'2021-04-23T18:13:00' AS SmallDateTime), CAST(N'2021-04-23' AS Date), CAST(N'2021-04-24' AS Date), N'I         ', CAST(N'2021-04-23T18:13:11.713' AS DateTime))
INSERT [dbo].[Aud_BookRoom] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut], [ThaoTac], [NgayThayDoi]) VALUES (N'DP018     ', N'KH018     ', N'LP004     ', CAST(N'2021-04-16T22:39:00' AS SmallDateTime), CAST(N'2021-04-16' AS Date), CAST(N'2021-04-30' AS Date), N'I         ', CAST(N'2021-04-16T22:39:05.300' AS DateTime))
INSERT [dbo].[Aud_BookRoom] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut], [ThaoTac], [NgayThayDoi]) VALUES (N'DP025     ', N'KH013     ', N'LP001     ', CAST(N'2021-04-17T22:07:00' AS SmallDateTime), CAST(N'2021-04-17' AS Date), CAST(N'2021-04-22' AS Date), N'I         ', CAST(N'2021-04-17T22:06:33.100' AS DateTime))
INSERT [dbo].[Aud_BookRoom] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut], [ThaoTac], [NgayThayDoi]) VALUES (N'DP020     ', N'KH014     ', N'LP002     ', CAST(N'2021-04-17T13:15:00' AS SmallDateTime), CAST(N'2021-04-17' AS Date), CAST(N'2021-04-21' AS Date), N'D         ', CAST(N'2021-04-18T09:09:41.760' AS DateTime))
INSERT [dbo].[Aud_BookRoom] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut], [ThaoTac], [NgayThayDoi]) VALUES (N'DP021     ', N'KH013     ', N'LP004     ', CAST(N'2021-04-17T13:15:00' AS SmallDateTime), CAST(N'2021-04-17' AS Date), CAST(N'2021-04-28' AS Date), N'D         ', CAST(N'2021-04-18T09:09:45.497' AS DateTime))
INSERT [dbo].[Aud_BookRoom] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut], [ThaoTac], [NgayThayDoi]) VALUES (N'DP022     ', N'KH018     ', N'LP001     ', CAST(N'2021-04-17T13:17:00' AS SmallDateTime), CAST(N'2021-04-17' AS Date), CAST(N'2021-04-18' AS Date), N'D         ', CAST(N'2021-04-18T09:10:24.297' AS DateTime))
INSERT [dbo].[Aud_BookRoom] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut], [ThaoTac], [NgayThayDoi]) VALUES (N'DP023     ', N'KH017     ', N'LP001     ', CAST(N'2021-04-17T13:21:00' AS SmallDateTime), CAST(N'2021-04-18' AS Date), CAST(N'2021-04-30' AS Date), N'D         ', CAST(N'2021-04-18T09:10:27.373' AS DateTime))
INSERT [dbo].[Aud_BookRoom] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut], [ThaoTac], [NgayThayDoi]) VALUES (N'DP024     ', N'KH020     ', N'LP001     ', CAST(N'2021-04-17T19:35:00' AS SmallDateTime), CAST(N'2021-04-17' AS Date), CAST(N'2021-04-28' AS Date), N'D         ', CAST(N'2021-04-18T09:10:31.707' AS DateTime))
INSERT [dbo].[Aud_BookRoom] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut], [ThaoTac], [NgayThayDoi]) VALUES (N'DP026     ', N'KH013     ', N'LP004     ', CAST(N'2021-04-18T09:07:00' AS SmallDateTime), CAST(N'2021-04-18' AS Date), CAST(N'2021-04-19' AS Date), N'D         ', CAST(N'2021-04-18T09:10:43.787' AS DateTime))
INSERT [dbo].[Aud_BookRoom] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut], [ThaoTac], [NgayThayDoi]) VALUES (N'DP002     ', N'KH010     ', N'LP001     ', CAST(N'2018-06-24T18:13:00' AS SmallDateTime), CAST(N'2018-06-24' AS Date), CAST(N'2018-06-25' AS Date), N'U         ', CAST(N'2021-04-18T09:37:01.953' AS DateTime))
INSERT [dbo].[Aud_BookRoom] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut], [ThaoTac], [NgayThayDoi]) VALUES (N'DP003     ', N'KH001     ', N'LP001     ', CAST(N'2018-06-24T18:14:00' AS SmallDateTime), CAST(N'2018-06-25' AS Date), CAST(N'2018-06-28' AS Date), N'U         ', CAST(N'2021-04-18T09:37:07.683' AS DateTime))
INSERT [dbo].[Aud_BookRoom] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut], [ThaoTac], [NgayThayDoi]) VALUES (N'DP004     ', N'KH005     ', N'LP004     ', CAST(N'2018-06-24T18:15:00' AS SmallDateTime), CAST(N'2018-06-24' AS Date), CAST(N'2018-06-29' AS Date), N'U         ', CAST(N'2021-04-18T09:37:12.030' AS DateTime))
INSERT [dbo].[Aud_BookRoom] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut], [ThaoTac], [NgayThayDoi]) VALUES (N'DP005     ', N'KH011     ', N'LP004     ', CAST(N'2018-06-24T18:38:00' AS SmallDateTime), CAST(N'2018-06-24' AS Date), CAST(N'2018-06-28' AS Date), N'U         ', CAST(N'2021-04-18T09:37:20.220' AS DateTime))
INSERT [dbo].[Aud_BookRoom] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut], [ThaoTac], [NgayThayDoi]) VALUES (N'DP006     ', N'KH013     ', N'LP004     ', CAST(N'2018-06-25T01:54:00' AS SmallDateTime), CAST(N'2018-06-25' AS Date), CAST(N'2018-06-27' AS Date), N'U         ', CAST(N'2021-04-18T09:37:23.770' AS DateTime))
INSERT [dbo].[Aud_BookRoom] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut], [ThaoTac], [NgayThayDoi]) VALUES (N'DP007     ', N'KH003     ', N'LP003     ', CAST(N'2018-06-25T02:27:00' AS SmallDateTime), CAST(N'2018-06-25' AS Date), CAST(N'2018-06-27' AS Date), N'U         ', CAST(N'2021-04-18T09:37:42.850' AS DateTime))
INSERT [dbo].[Aud_BookRoom] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut], [ThaoTac], [NgayThayDoi]) VALUES (N'DP001     ', N'KH004     ', N'LP001     ', CAST(N'2021-03-21T18:12:00' AS SmallDateTime), CAST(N'2018-06-24' AS Date), CAST(N'2018-06-28' AS Date), N'U         ', CAST(N'2021-04-18T09:37:54.857' AS DateTime))
INSERT [dbo].[Aud_BookRoom] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut], [ThaoTac], [NgayThayDoi]) VALUES (N'DP002     ', N'KH010     ', N'LP001     ', CAST(N'2021-03-21T18:13:00' AS SmallDateTime), CAST(N'2018-06-24' AS Date), CAST(N'2018-06-25' AS Date), N'U         ', CAST(N'2021-04-18T09:38:08.873' AS DateTime))
INSERT [dbo].[Aud_BookRoom] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut], [ThaoTac], [NgayThayDoi]) VALUES (N'DP002     ', N'KH010     ', N'LP001     ', CAST(N'2021-03-21T18:13:00' AS SmallDateTime), CAST(N'2018-06-24' AS Date), CAST(N'2021-03-29' AS Date), N'U         ', CAST(N'2021-04-18T09:38:13.040' AS DateTime))
INSERT [dbo].[Aud_BookRoom] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut], [ThaoTac], [NgayThayDoi]) VALUES (N'DP003     ', N'KH001     ', N'LP001     ', CAST(N'2021-03-21T18:14:00' AS SmallDateTime), CAST(N'2018-06-25' AS Date), CAST(N'2018-06-28' AS Date), N'U         ', CAST(N'2021-04-18T09:38:14.600' AS DateTime))
INSERT [dbo].[Aud_BookRoom] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut], [ThaoTac], [NgayThayDoi]) VALUES (N'DP004     ', N'KH005     ', N'LP004     ', CAST(N'2021-03-21T18:15:00' AS SmallDateTime), CAST(N'2018-06-24' AS Date), CAST(N'2018-06-29' AS Date), N'U         ', CAST(N'2021-04-18T09:38:15.807' AS DateTime))
INSERT [dbo].[Aud_BookRoom] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut], [ThaoTac], [NgayThayDoi]) VALUES (N'DP005     ', N'KH011     ', N'LP004     ', CAST(N'2021-03-21T18:38:00' AS SmallDateTime), CAST(N'2018-06-24' AS Date), CAST(N'2018-06-28' AS Date), N'U         ', CAST(N'2021-04-18T09:38:16.883' AS DateTime))
INSERT [dbo].[Aud_BookRoom] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut], [ThaoTac], [NgayThayDoi]) VALUES (N'DP006     ', N'KH013     ', N'LP004     ', CAST(N'2021-03-21T01:54:00' AS SmallDateTime), CAST(N'2018-06-25' AS Date), CAST(N'2018-06-27' AS Date), N'U         ', CAST(N'2021-04-18T09:38:17.850' AS DateTime))
INSERT [dbo].[Aud_BookRoom] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut], [ThaoTac], [NgayThayDoi]) VALUES (N'DP007     ', N'KH003     ', N'LP003     ', CAST(N'2021-04-04T02:27:00' AS SmallDateTime), CAST(N'2018-06-25' AS Date), CAST(N'2018-06-27' AS Date), N'U         ', CAST(N'2021-04-18T09:38:30.650' AS DateTime))
INSERT [dbo].[Aud_BookRoom] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut], [ThaoTac], [NgayThayDoi]) VALUES (N'DP003     ', N'KH001     ', N'LP001     ', CAST(N'2021-03-21T18:14:00' AS SmallDateTime), CAST(N'2021-03-21' AS Date), CAST(N'2018-06-28' AS Date), N'U         ', CAST(N'2021-04-18T09:38:32.780' AS DateTime))
INSERT [dbo].[Aud_BookRoom] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut], [ThaoTac], [NgayThayDoi]) VALUES (N'DP004     ', N'KH005     ', N'LP004     ', CAST(N'2021-03-21T18:15:00' AS SmallDateTime), CAST(N'2021-03-21' AS Date), CAST(N'2018-06-29' AS Date), N'U         ', CAST(N'2021-04-18T09:38:33.780' AS DateTime))
INSERT [dbo].[Aud_BookRoom] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut], [ThaoTac], [NgayThayDoi]) VALUES (N'DP005     ', N'KH011     ', N'LP004     ', CAST(N'2021-03-21T18:38:00' AS SmallDateTime), CAST(N'2021-03-21' AS Date), CAST(N'2018-06-28' AS Date), N'U         ', CAST(N'2021-04-18T09:38:35.000' AS DateTime))
INSERT [dbo].[Aud_BookRoom] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut], [ThaoTac], [NgayThayDoi]) VALUES (N'DP006     ', N'KH013     ', N'LP004     ', CAST(N'2021-03-21T01:54:00' AS SmallDateTime), CAST(N'2021-03-21' AS Date), CAST(N'2018-06-27' AS Date), N'U         ', CAST(N'2021-04-18T09:38:36.440' AS DateTime))
INSERT [dbo].[Aud_BookRoom] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut], [ThaoTac], [NgayThayDoi]) VALUES (N'DP007     ', N'KH003     ', N'LP003     ', CAST(N'2021-04-04T02:27:00' AS SmallDateTime), CAST(N'2021-04-04' AS Date), CAST(N'2018-06-27' AS Date), N'U         ', CAST(N'2021-04-18T09:38:38.260' AS DateTime))
INSERT [dbo].[Aud_BookRoom] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut], [ThaoTac], [NgayThayDoi]) VALUES (N'DP003     ', N'KH001     ', N'LP001     ', CAST(N'2021-03-21T18:14:00' AS SmallDateTime), CAST(N'2021-03-21' AS Date), CAST(N'2021-03-21' AS Date), N'U         ', CAST(N'2021-04-18T09:38:43.637' AS DateTime))
INSERT [dbo].[Aud_BookRoom] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut], [ThaoTac], [NgayThayDoi]) VALUES (N'DP004     ', N'KH005     ', N'LP004     ', CAST(N'2021-03-21T18:15:00' AS SmallDateTime), CAST(N'2021-03-21' AS Date), CAST(N'2021-03-21' AS Date), N'U         ', CAST(N'2021-04-18T09:38:56.280' AS DateTime))
INSERT [dbo].[Aud_BookRoom] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut], [ThaoTac], [NgayThayDoi]) VALUES (N'DP005     ', N'KH011     ', N'LP004     ', CAST(N'2021-03-21T18:38:00' AS SmallDateTime), CAST(N'2021-03-21' AS Date), CAST(N'2021-03-21' AS Date), N'U         ', CAST(N'2021-04-18T09:39:05.063' AS DateTime))
INSERT [dbo].[Aud_BookRoom] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut], [ThaoTac], [NgayThayDoi]) VALUES (N'DP006     ', N'KH013     ', N'LP004     ', CAST(N'2021-03-21T01:54:00' AS SmallDateTime), CAST(N'2021-03-21' AS Date), CAST(N'2021-03-21' AS Date), N'U         ', CAST(N'2021-04-18T09:39:11.880' AS DateTime))
INSERT [dbo].[Aud_BookRoom] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut], [ThaoTac], [NgayThayDoi]) VALUES (N'DP007     ', N'KH003     ', N'LP003     ', CAST(N'2021-04-04T02:27:00' AS SmallDateTime), CAST(N'2021-04-04' AS Date), CAST(N'2021-03-21' AS Date), N'U         ', CAST(N'2021-04-18T09:39:24.183' AS DateTime))
INSERT [dbo].[Aud_BookRoom] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut], [ThaoTac], [NgayThayDoi]) VALUES (N'DP021     ', N'KH014     ', N'LP003     ', CAST(N'2021-04-19T22:11:00' AS SmallDateTime), CAST(N'2021-04-19' AS Date), CAST(N'2021-04-30' AS Date), N'I         ', CAST(N'2021-04-19T22:10:39.007' AS DateTime))
INSERT [dbo].[Aud_BookRoom] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut], [ThaoTac], [NgayThayDoi]) VALUES (N'DP022     ', N'KH017     ', N'LP002     ', CAST(N'2021-04-19T22:11:00' AS SmallDateTime), CAST(N'2021-04-19' AS Date), CAST(N'2021-04-22' AS Date), N'I         ', CAST(N'2021-04-19T22:11:05.997' AS DateTime))
INSERT [dbo].[Aud_BookRoom] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut], [ThaoTac], [NgayThayDoi]) VALUES (N'DP006     ', N'KH013     ', N'LP004     ', CAST(N'2021-03-21T01:54:00' AS SmallDateTime), CAST(N'2021-03-21' AS Date), CAST(N'2021-04-01' AS Date), N'U         ', CAST(N'2021-04-18T09:41:25.563' AS DateTime))
INSERT [dbo].[Aud_BookRoom] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut], [ThaoTac], [NgayThayDoi]) VALUES (N'DP006     ', N'KH013     ', N'LP004     ', CAST(N'2021-04-10T01:54:00' AS SmallDateTime), CAST(N'2021-04-10' AS Date), CAST(N'2021-04-01' AS Date), N'U         ', CAST(N'2021-04-18T09:41:35.450' AS DateTime))
INSERT [dbo].[Aud_BookRoom] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut], [ThaoTac], [NgayThayDoi]) VALUES (N'DP005     ', N'KH011     ', N'LP004     ', CAST(N'2021-03-21T18:38:00' AS SmallDateTime), CAST(N'2021-03-21' AS Date), CAST(N'2021-04-10' AS Date), N'U         ', CAST(N'2021-04-18T09:42:06.890' AS DateTime))
INSERT [dbo].[Aud_BookRoom] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut], [ThaoTac], [NgayThayDoi]) VALUES (N'DP028     ', N'KH018     ', N'LP003     ', CAST(N'2021-04-21T18:33:00' AS SmallDateTime), CAST(N'2021-04-21' AS Date), CAST(N'2021-04-24' AS Date), N'I         ', CAST(N'2021-04-21T18:32:33.663' AS DateTime))
INSERT [dbo].[Aud_BookRoom] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut], [ThaoTac], [NgayThayDoi]) VALUES (N'DP030     ', N'KH014     ', N'LP001     ', CAST(N'2021-04-23T18:22:00' AS SmallDateTime), CAST(N'2021-04-23' AS Date), CAST(N'2021-04-24' AS Date), N'I         ', CAST(N'2021-04-23T18:21:48.347' AS DateTime))
INSERT [dbo].[Aud_BookRoom] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut], [ThaoTac], [NgayThayDoi]) VALUES (N'DP031     ', N'KH018     ', N'LP001     ', CAST(N'2021-04-24T21:04:00' AS SmallDateTime), CAST(N'2021-04-24' AS Date), CAST(N'2021-04-25' AS Date), N'I         ', CAST(N'2021-04-24T21:03:40.167' AS DateTime))
INSERT [dbo].[Aud_BookRoom] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut], [ThaoTac], [NgayThayDoi]) VALUES (N'DP032     ', N'KH017     ', N'LP001     ', CAST(N'2021-04-24T21:06:00' AS SmallDateTime), CAST(N'2021-04-24' AS Date), CAST(N'2021-04-26' AS Date), N'I         ', CAST(N'2021-04-24T21:06:24.503' AS DateTime))
INSERT [dbo].[Aud_BookRoom] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut], [ThaoTac], [NgayThayDoi]) VALUES (N'DP033     ', N'KH013     ', N'LP001     ', CAST(N'2021-04-24T21:07:00' AS SmallDateTime), CAST(N'2021-04-24' AS Date), CAST(N'2021-04-25' AS Date), N'I         ', CAST(N'2021-04-24T21:06:54.080' AS DateTime))
INSERT [dbo].[Aud_BookRoom] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut], [ThaoTac], [NgayThayDoi]) VALUES (N'DP034     ', N'KH013     ', N'LP003     ', CAST(N'2021-04-24T21:15:00' AS SmallDateTime), CAST(N'2021-04-24' AS Date), CAST(N'2021-04-27' AS Date), N'I         ', CAST(N'2021-04-24T21:14:45.263' AS DateTime))
INSERT [dbo].[Aud_BookRoom] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut], [ThaoTac], [NgayThayDoi]) VALUES (N'DP035     ', N'KH023     ', N'LP004     ', CAST(N'2021-04-24T21:16:00' AS SmallDateTime), CAST(N'2021-04-24' AS Date), CAST(N'2021-04-27' AS Date), N'I         ', CAST(N'2021-04-24T21:16:16.670' AS DateTime))
INSERT [dbo].[Aud_BookRoom] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut], [ThaoTac], [NgayThayDoi]) VALUES (N'DP036     ', N'KH024     ', N'LP003     ', CAST(N'2021-04-24T21:17:00' AS SmallDateTime), CAST(N'2021-04-24' AS Date), CAST(N'2021-04-27' AS Date), N'I         ', CAST(N'2021-04-24T21:17:18.090' AS DateTime))
INSERT [dbo].[Aud_BookRoom] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut], [ThaoTac], [NgayThayDoi]) VALUES (N'DP037     ', N'KH025     ', N'LP002     ', CAST(N'2021-04-24T21:19:00' AS SmallDateTime), CAST(N'2021-04-24' AS Date), CAST(N'2021-04-28' AS Date), N'I         ', CAST(N'2021-04-24T21:18:44.020' AS DateTime))
INSERT [dbo].[Aud_BookRoom] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut], [ThaoTac], [NgayThayDoi]) VALUES (N'DP038     ', N'KH022     ', N'LP001     ', CAST(N'2021-04-24T21:26:00' AS SmallDateTime), CAST(N'2021-04-24' AS Date), CAST(N'2021-04-25' AS Date), N'I         ', CAST(N'2021-04-24T21:25:34.443' AS DateTime))
INSERT [dbo].[Aud_BookRoom] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut], [ThaoTac], [NgayThayDoi]) VALUES (N'DP039     ', N'KH013     ', N'LP001     ', CAST(N'2021-04-25T08:27:00' AS SmallDateTime), CAST(N'2021-04-25' AS Date), CAST(N'2021-04-26' AS Date), N'I         ', CAST(N'2021-04-25T08:27:03.587' AS DateTime))
INSERT [dbo].[Aud_BookRoom] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut], [ThaoTac], [NgayThayDoi]) VALUES (N'DP040     ', N'KH026     ', N'LP001     ', CAST(N'2021-04-25T08:29:00' AS SmallDateTime), CAST(N'2021-04-25' AS Date), CAST(N'2021-04-26' AS Date), N'I         ', CAST(N'2021-04-25T08:28:31.350' AS DateTime))
INSERT [dbo].[Aud_BookRoom] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut], [ThaoTac], [NgayThayDoi]) VALUES (N'DP041     ', N'KH026     ', N'LP001     ', CAST(N'2021-04-25T08:30:00' AS SmallDateTime), CAST(N'2021-04-25' AS Date), CAST(N'2021-04-26' AS Date), N'I         ', CAST(N'2021-04-25T08:29:49.393' AS DateTime))
INSERT [dbo].[Aud_BookRoom] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut], [ThaoTac], [NgayThayDoi]) VALUES (N'DP042     ', N'KH026     ', N'LP001     ', CAST(N'2021-04-25T08:30:00' AS SmallDateTime), CAST(N'2021-04-25' AS Date), CAST(N'2021-04-26' AS Date), N'I         ', CAST(N'2021-04-25T08:30:01.200' AS DateTime))
INSERT [dbo].[Aud_BookRoom] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut], [ThaoTac], [NgayThayDoi]) VALUES (N'DP043     ', N'KH026     ', N'LP004     ', CAST(N'2021-04-25T08:33:00' AS SmallDateTime), CAST(N'2021-04-25' AS Date), CAST(N'2021-05-01' AS Date), N'I         ', CAST(N'2021-04-25T08:33:00.023' AS DateTime))
GO
INSERT [dbo].[Aud_Customer] ([ID], [IDCard], [IDCustomerType], [Name], [DateOfBirth], [Address], [PhoneNumber], [Sex], [Nationality], [ThaoTac], [NgayThayDoi]) VALUES (N'KH017     ', N'191900000', N'LK002     ', N'Lê Thủy', CAST(N'2000-05-30' AS Date), N'87 Nguyễn Huệ', 982981832, N'Nữ', N'Việt Nam', N'I         ', CAST(N'2021-04-16T21:20:35.463' AS DateTime))
INSERT [dbo].[Aud_Customer] ([ID], [IDCard], [IDCustomerType], [Name], [DateOfBirth], [Address], [PhoneNumber], [Sex], [Nationality], [ThaoTac], [NgayThayDoi]) VALUES (N'KH018     ', N'191922222', N'LK004     ', N'Trần Minh Anh', CAST(N'2000-05-30' AS Date), N'66 Nguyễn Trãi', 912873843, N'Nữ', N'Việt Nam', N'I         ', CAST(N'2021-04-16T22:28:49.790' AS DateTime))
INSERT [dbo].[Aud_Customer] ([ID], [IDCard], [IDCustomerType], [Name], [DateOfBirth], [Address], [PhoneNumber], [Sex], [Nationality], [ThaoTac], [NgayThayDoi]) VALUES (N'KH019     ', N'191900011', N'LK001     ', N'Hoàng Thu Hải', CAST(N'2000-05-30' AS Date), N'6 Lý Thái Tổ', 987236232, N'Nữ', N'Việt Nam', N'I         ', CAST(N'2021-04-16T22:37:42.030' AS DateTime))
INSERT [dbo].[Aud_Customer] ([ID], [IDCard], [IDCustomerType], [Name], [DateOfBirth], [Address], [PhoneNumber], [Sex], [Nationality], [ThaoTac], [NgayThayDoi]) VALUES (N'KH020     ', N'191966666', N'LK002     ', N'Trần Tấn Hoàng', CAST(N'2000-05-30' AS Date), N'65 Bà Triệu', 988273232, N'Nam', N'Việt Nam', N'I         ', CAST(N'2021-04-16T22:38:26.830' AS DateTime))
INSERT [dbo].[Aud_Customer] ([ID], [IDCard], [IDCustomerType], [Name], [DateOfBirth], [Address], [PhoneNumber], [Sex], [Nationality], [ThaoTac], [NgayThayDoi]) VALUES (N'KH021     ', N'191966677', N'LK002     ', N'Trần Minh', CAST(N'2000-05-30' AS Date), N'6 Trần Quốc Toản', 988786434, N'Nam', N'Việt Nam', N'I         ', CAST(N'2021-04-17T09:50:00.427' AS DateTime))
INSERT [dbo].[Aud_Customer] ([ID], [IDCard], [IDCustomerType], [Name], [DateOfBirth], [Address], [PhoneNumber], [Sex], [Nationality], [ThaoTac], [NgayThayDoi]) VALUES (N'KH016     ', N'1919191919', N'2         ', N'Hoàng Việt Trinh', CAST(N'1999-10-14' AS Date), N'Đà Nẵng', 777777777, N'Nữ', N'Việt Nam', N'U         ', CAST(N'2021-04-17T13:10:57.043' AS DateTime))
INSERT [dbo].[Aud_Customer] ([ID], [IDCard], [IDCustomerType], [Name], [DateOfBirth], [Address], [PhoneNumber], [Sex], [Nationality], [ThaoTac], [NgayThayDoi]) VALUES (N'KH015     ', N'191911777', N'4         ', N'Trần Diệu Hiền', CAST(N'1998-04-06' AS Date), N'Đà Nẵng', 999999999, N'Nữ', N'Việt Nam', N'U         ', CAST(N'2021-04-17T13:11:03.853' AS DateTime))
INSERT [dbo].[Aud_Customer] ([ID], [IDCard], [IDCustomerType], [Name], [DateOfBirth], [Address], [PhoneNumber], [Sex], [Nationality], [ThaoTac], [NgayThayDoi]) VALUES (N'KH014     ', N'191911111', N'2         ', N'Nguyễn Văn An', CAST(N'1998-04-06' AS Date), N'Đà Nẵng', 888888888, N'Nam', N'Việt Nam', N'U         ', CAST(N'2021-04-17T13:11:08.993' AS DateTime))
INSERT [dbo].[Aud_Customer] ([ID], [IDCard], [IDCustomerType], [Name], [DateOfBirth], [Address], [PhoneNumber], [Sex], [Nationality], [ThaoTac], [NgayThayDoi]) VALUES (N'KH013     ', N'191911727', N'1         ', N'Thanh Hằng', CAST(N'1998-04-06' AS Date), N'Huế', 912472758, N'Nữ', N'Việt Nam', N'U         ', CAST(N'2021-04-17T13:11:14.940' AS DateTime))
INSERT [dbo].[Aud_Customer] ([ID], [IDCard], [IDCustomerType], [Name], [DateOfBirth], [Address], [PhoneNumber], [Sex], [Nationality], [ThaoTac], [NgayThayDoi]) VALUES (N'KH001     ', N'16520147', N'1         ', N'Nguyễn Ngọc Thanh', CAST(N'1998-04-06' AS Date), N'New York', 1648222347, N'Nam', N'Việt Nam', N'U         ', CAST(N'2021-04-17T13:11:22.430' AS DateTime))
INSERT [dbo].[Aud_Customer] ([ID], [IDCard], [IDCustomerType], [Name], [DateOfBirth], [Address], [PhoneNumber], [Sex], [Nationality], [ThaoTac], [NgayThayDoi]) VALUES (N'KH002     ', N'206117926', N'3         ', N'Hoàng Yến', CAST(N'1998-04-06' AS Date), N'Huế', 1648222347, N'Nữ', N'Singapore', N'U         ', CAST(N'2021-04-17T13:11:25.997' AS DateTime))
INSERT [dbo].[Aud_Customer] ([ID], [IDCard], [IDCustomerType], [Name], [DateOfBirth], [Address], [PhoneNumber], [Sex], [Nationality], [ThaoTac], [NgayThayDoi]) VALUES (N'KH003     ', N'123456', N'2         ', N'Mai Thúy Vân', CAST(N'1998-04-06' AS Date), N'Tam Kỳ', 1648222347, N'Nữ', N'Trung Quốc', N'U         ', CAST(N'2021-04-17T13:11:32.093' AS DateTime))
INSERT [dbo].[Aud_Customer] ([ID], [IDCard], [IDCustomerType], [Name], [DateOfBirth], [Address], [PhoneNumber], [Sex], [Nationality], [ThaoTac], [NgayThayDoi]) VALUES (N'KH004     ', N'12782389', N'1         ', N'Trần Ngọc Thủy', CAST(N'1998-04-06' AS Date), N'Đồng Nai', 12782389, N'Nữ', N'Nhật Bản', N'U         ', CAST(N'2021-04-17T13:11:37.207' AS DateTime))
INSERT [dbo].[Aud_Customer] ([ID], [IDCard], [IDCustomerType], [Name], [DateOfBirth], [Address], [PhoneNumber], [Sex], [Nationality], [ThaoTac], [NgayThayDoi]) VALUES (N'KH005     ', N'2563', N'1         ', N'Triết', CAST(N'1998-04-06' AS Date), N'Quảng ngãi', 147852, N'Nữ', N'Việt Nam', N'U         ', CAST(N'2021-04-17T13:11:41.340' AS DateTime))
INSERT [dbo].[Aud_Customer] ([ID], [IDCard], [IDCustomerType], [Name], [DateOfBirth], [Address], [PhoneNumber], [Sex], [Nationality], [ThaoTac], [NgayThayDoi]) VALUES (N'KH006     ', N'123456788', N'1         ', N'Nguyễn Văn Thịnh', CAST(N'1998-07-08' AS Date), N'Tam Kỳ,  Quảng Nam', 123456789, N'Nam', N'Việt Nam', N'U         ', CAST(N'2021-04-17T13:11:45.313' AS DateTime))
INSERT [dbo].[Aud_Customer] ([ID], [IDCard], [IDCustomerType], [Name], [DateOfBirth], [Address], [PhoneNumber], [Sex], [Nationality], [ThaoTac], [NgayThayDoi]) VALUES (N'KH007     ', N'123456787', N'1         ', N'Nguyễn Trần Duy Cương', CAST(N'1998-04-06' AS Date), N'Tam Kỳ', 123456785, N'Nam', N'Hoa Kỳ', N'U         ', CAST(N'2021-04-17T13:11:53.027' AS DateTime))
INSERT [dbo].[Aud_Customer] ([ID], [IDCard], [IDCustomerType], [Name], [DateOfBirth], [Address], [PhoneNumber], [Sex], [Nationality], [ThaoTac], [NgayThayDoi]) VALUES (N'KH008     ', N'27263950', N'4         ', N'Hồ Ngọc Mai', CAST(N'1998-06-06' AS Date), N'Đồng Nai', 966144938, N'Nữ', N'Trung Quốc', N'U         ', CAST(N'2021-04-17T13:11:57.130' AS DateTime))
INSERT [dbo].[Aud_Customer] ([ID], [IDCard], [IDCustomerType], [Name], [DateOfBirth], [Address], [PhoneNumber], [Sex], [Nationality], [ThaoTac], [NgayThayDoi]) VALUES (N'KH009     ', N'145236', N'1         ', N'Lâm Ngọc Lan', CAST(N'1998-04-06' AS Date), N'Thái bình', 1655201124, N'Nữ', N'Việt Nam', N'U         ', CAST(N'2021-04-17T13:12:00.953' AS DateTime))
INSERT [dbo].[Aud_Customer] ([ID], [IDCard], [IDCustomerType], [Name], [DateOfBirth], [Address], [PhoneNumber], [Sex], [Nationality], [ThaoTac], [NgayThayDoi]) VALUES (N'KH010     ', N'96852361', N'3         ', N'Nguyễn Ngọc Dung', CAST(N'1998-04-06' AS Date), N'Đồng nai', 145230, N'Nữ', N'Việt Nam', N'U         ', CAST(N'2021-04-17T13:12:03.990' AS DateTime))
INSERT [dbo].[Aud_Customer] ([ID], [IDCard], [IDCustomerType], [Name], [DateOfBirth], [Address], [PhoneNumber], [Sex], [Nationality], [ThaoTac], [NgayThayDoi]) VALUES (N'KH011     ', N'123458523', N'1         ', N'Nguyễn Văn Anh', CAST(N'1998-04-06' AS Date), N'Hồ Chí Minh', 123452367, N'Nam', N'Việt Nam', N'U         ', CAST(N'2021-04-17T13:12:07.110' AS DateTime))
INSERT [dbo].[Aud_Customer] ([ID], [IDCard], [IDCustomerType], [Name], [DateOfBirth], [Address], [PhoneNumber], [Sex], [Nationality], [ThaoTac], [NgayThayDoi]) VALUES (N'KH012     ', N'963587', N'3         ', N'Nguyễn Duy', CAST(N'1998-04-08' AS Date), N'Hà Nội', 164853564, N'Nam', N'Việt Nam', N'U         ', CAST(N'2021-04-17T13:12:13.353' AS DateTime))
INSERT [dbo].[Aud_Customer] ([ID], [IDCard], [IDCustomerType], [Name], [DateOfBirth], [Address], [PhoneNumber], [Sex], [Nationality], [ThaoTac], [NgayThayDoi]) VALUES (N'KH013     ', N'191911727', N'LK003     ', N'Thanh Hằng', CAST(N'1998-04-06' AS Date), N'Huế', 912472758, N'Nữ', N'Việt Nam', N'U         ', CAST(N'2021-04-17T22:28:59.217' AS DateTime))
INSERT [dbo].[Aud_Customer] ([ID], [IDCard], [IDCustomerType], [Name], [DateOfBirth], [Address], [PhoneNumber], [Sex], [Nationality], [ThaoTac], [NgayThayDoi]) VALUES (N'KH010     ', N'96852361', N'LK003     ', N'Nguyễn Ngọc Dung', CAST(N'1998-04-06' AS Date), N'Đồng nai', 145230, N'Nữ', N'Việt Nam', N'U         ', CAST(N'2021-04-19T22:04:42.550' AS DateTime))
INSERT [dbo].[Aud_Customer] ([ID], [IDCard], [IDCustomerType], [Name], [DateOfBirth], [Address], [PhoneNumber], [Sex], [Nationality], [ThaoTac], [NgayThayDoi]) VALUES (N'KH004     ', N'12782389', N'LK002     ', N'Trần Ngọc Thủy', CAST(N'1998-04-06' AS Date), N'Đồng Nai', 12782389, N'Nữ', N'Nhật Bản', N'U         ', CAST(N'2021-04-19T22:04:59.753' AS DateTime))
INSERT [dbo].[Aud_Customer] ([ID], [IDCard], [IDCustomerType], [Name], [DateOfBirth], [Address], [PhoneNumber], [Sex], [Nationality], [ThaoTac], [NgayThayDoi]) VALUES (N'KH008     ', N'27263950', N'LK004     ', N'Hồ Ngọc Mai', CAST(N'1998-06-06' AS Date), N'Đồng Nai', 966144938, N'Nữ', N'Trung Quốc', N'U         ', CAST(N'2021-04-19T22:05:14.780' AS DateTime))
INSERT [dbo].[Aud_Customer] ([ID], [IDCard], [IDCustomerType], [Name], [DateOfBirth], [Address], [PhoneNumber], [Sex], [Nationality], [ThaoTac], [NgayThayDoi]) VALUES (N'KH022     ', N'191977777', N'LK001     ', N'Hoàng Ánh Tuyết', CAST(N'2000-05-30' AS Date), N'Huế', 98837273, N'Nữ', N'Việt Nam', N'I         ', CAST(N'2021-04-19T22:12:26.017' AS DateTime))
INSERT [dbo].[Aud_Customer] ([ID], [IDCard], [IDCustomerType], [Name], [DateOfBirth], [Address], [PhoneNumber], [Sex], [Nationality], [ThaoTac], [NgayThayDoi]) VALUES (N'KH023     ', N'12121212', N'LK002     ', N'Nguyễn Thúy', CAST(N'2000-05-30' AS Date), N'Huế', 93028390, N'Nữ', N'Việt Nam', N'I         ', CAST(N'2021-04-24T21:16:16.610' AS DateTime))
INSERT [dbo].[Aud_Customer] ([ID], [IDCard], [IDCustomerType], [Name], [DateOfBirth], [Address], [PhoneNumber], [Sex], [Nationality], [ThaoTac], [NgayThayDoi]) VALUES (N'KH024     ', N'13131313', N'LK003     ', N'Trần Ngọc Minh', CAST(N'2000-05-30' AS Date), N'Huế', 988329783, N'Nam', N'Việt Nam', N'I         ', CAST(N'2021-04-24T21:17:18.073' AS DateTime))
INSERT [dbo].[Aud_Customer] ([ID], [IDCard], [IDCustomerType], [Name], [DateOfBirth], [Address], [PhoneNumber], [Sex], [Nationality], [ThaoTac], [NgayThayDoi]) VALUES (N'KH025     ', N'14141414', N'LK004     ', N'Phạm Minh Anh', CAST(N'2000-05-30' AS Date), N'Huế', 929839248, N'Nữ', N'Việt Nam', N'I         ', CAST(N'2021-04-24T21:18:44.010' AS DateTime))
INSERT [dbo].[Aud_Customer] ([ID], [IDCard], [IDCustomerType], [Name], [DateOfBirth], [Address], [PhoneNumber], [Sex], [Nationality], [ThaoTac], [NgayThayDoi]) VALUES (N'KH026     ', N'191984512', N'LK004     ', N'Trần Thái Hòa', CAST(N'2000-05-30' AS Date), N'Huế', 987364732, N'Nam', N'Việt Nam', N'I         ', CAST(N'2021-04-25T08:28:31.337' AS DateTime))
GO
INSERT [dbo].[Aud_CustomerType] ([ID], [Name], [ThaoTac], [NgayThayDoi]) VALUES (N'LK002     ', N'Khách địa phương', N'I         ', CAST(N'2021-04-16T20:37:03.720' AS DateTime))
INSERT [dbo].[Aud_CustomerType] ([ID], [Name], [ThaoTac], [NgayThayDoi]) VALUES (N'LK003     ', N'Khách vãng lai', N'I         ', CAST(N'2021-04-16T20:37:14.550' AS DateTime))
INSERT [dbo].[Aud_CustomerType] ([ID], [Name], [ThaoTac], [NgayThayDoi]) VALUES (N'LK004     ', N'Khách đi qua các tổ chức trung gian', N'I         ', CAST(N'2021-04-16T20:37:32.930' AS DateTime))
INSERT [dbo].[Aud_CustomerType] ([ID], [Name], [ThaoTac], [NgayThayDoi]) VALUES (N'K002      ', N'Khách vãng lai', N'D         ', CAST(N'2021-04-16T20:37:41.293' AS DateTime))
INSERT [dbo].[Aud_CustomerType] ([ID], [Name], [ThaoTac], [NgayThayDoi]) VALUES (N'K003      ', N'Khách địa phương', N'D         ', CAST(N'2021-04-16T20:37:41.313' AS DateTime))
INSERT [dbo].[Aud_CustomerType] ([ID], [Name], [ThaoTac], [NgayThayDoi]) VALUES (N'K004      ', N'Khách đi qua các tổ chức trung gian', N'D         ', CAST(N'2021-04-16T20:37:41.320' AS DateTime))
GO
INSERT [dbo].[Aud_Parameter] ([Name], [Value], [Describe], [DateModify], [ThaoTac], [NgayThayDoi]) VALUES (N'QĐ4', 1.5, N'Khách nước ngoài phụ thu 1.5', CAST(N'2018-06-24T18:29:00' AS SmallDateTime), N'U         ', CAST(N'2021-04-19T22:20:59.340' AS DateTime))
INSERT [dbo].[Aud_Parameter] ([Name], [Value], [Describe], [DateModify], [ThaoTac], [NgayThayDoi]) VALUES (N'QĐ4', 1.6, N'Khách nước ngoài phụ thu 1.5', CAST(N'2021-04-19T22:21:00' AS SmallDateTime), N'U         ', CAST(N'2021-04-19T22:21:09.613' AS DateTime))
GO
INSERT [dbo].[Aud_ReceiveRoom] ([ID], [IDBookRoom], [IDRoom], [ThaoTac], [NgayThayDoi]) VALUES (N'PN010     ', N'DP015     ', N'PH012     ', N'I         ', CAST(N'2021-04-16T22:30:26.570' AS DateTime))
INSERT [dbo].[Aud_ReceiveRoom] ([ID], [IDBookRoom], [IDRoom], [ThaoTac], [NgayThayDoi]) VALUES (N'PN010     ', N'DP015     ', N'PH012     ', N'U         ', CAST(N'2021-04-16T22:31:34.720' AS DateTime))
INSERT [dbo].[Aud_ReceiveRoom] ([ID], [IDBookRoom], [IDRoom], [ThaoTac], [NgayThayDoi]) VALUES (N'PN011     ', N'DP018     ', N'PH006     ', N'I         ', CAST(N'2021-04-16T22:39:18.750' AS DateTime))
INSERT [dbo].[Aud_ReceiveRoom] ([ID], [IDBookRoom], [IDRoom], [ThaoTac], [NgayThayDoi]) VALUES (N'PN012     ', N'DP018     ', N'PH012     ', N'I         ', CAST(N'2021-04-16T22:51:29.470' AS DateTime))
INSERT [dbo].[Aud_ReceiveRoom] ([ID], [IDBookRoom], [IDRoom], [ThaoTac], [NgayThayDoi]) VALUES (N'PN013     ', N'DP019     ', N'PH009     ', N'I         ', CAST(N'2021-04-17T09:50:10.167' AS DateTime))
INSERT [dbo].[Aud_ReceiveRoom] ([ID], [IDBookRoom], [IDRoom], [ThaoTac], [NgayThayDoi]) VALUES (N'PN014     ', N'DP020     ', N'PH013     ', N'I         ', CAST(N'2021-04-17T13:15:06.177' AS DateTime))
INSERT [dbo].[Aud_ReceiveRoom] ([ID], [IDBookRoom], [IDRoom], [ThaoTac], [NgayThayDoi]) VALUES (N'PN015     ', N'DP020     ', N'PH016     ', N'I         ', CAST(N'2021-04-17T13:16:26.383' AS DateTime))
INSERT [dbo].[Aud_ReceiveRoom] ([ID], [IDBookRoom], [IDRoom], [ThaoTac], [NgayThayDoi]) VALUES (N'PN016     ', N'DP022     ', N'PH001     ', N'I         ', CAST(N'2021-04-17T13:17:19.797' AS DateTime))
INSERT [dbo].[Aud_ReceiveRoom] ([ID], [IDBookRoom], [IDRoom], [ThaoTac], [NgayThayDoi]) VALUES (N'PN017     ', N'DP022     ', N'PH018     ', N'I         ', CAST(N'2021-04-17T13:18:49.550' AS DateTime))
INSERT [dbo].[Aud_ReceiveRoom] ([ID], [IDBookRoom], [IDRoom], [ThaoTac], [NgayThayDoi]) VALUES (N'PN018     ', N'DP023     ', N'PH007     ', N'I         ', CAST(N'2021-04-17T19:31:40.887' AS DateTime))
INSERT [dbo].[Aud_ReceiveRoom] ([ID], [IDBookRoom], [IDRoom], [ThaoTac], [NgayThayDoi]) VALUES (N'PN019     ', N'DP023     ', N'PH008     ', N'I         ', CAST(N'2021-04-17T19:32:03.343' AS DateTime))
INSERT [dbo].[Aud_ReceiveRoom] ([ID], [IDBookRoom], [IDRoom], [ThaoTac], [NgayThayDoi]) VALUES (N'PN010     ', N'DP015     ', N'PH005     ', N'U         ', CAST(N'2021-04-17T22:10:02.137' AS DateTime))
INSERT [dbo].[Aud_ReceiveRoom] ([ID], [IDBookRoom], [IDRoom], [ThaoTac], [NgayThayDoi]) VALUES (N'PN011     ', N'DP018     ', N'PH006     ', N'U         ', CAST(N'2021-04-17T22:10:11.470' AS DateTime))
INSERT [dbo].[Aud_ReceiveRoom] ([ID], [IDBookRoom], [IDRoom], [ThaoTac], [NgayThayDoi]) VALUES (N'PN012     ', N'DP018     ', N'PH012     ', N'U         ', CAST(N'2021-04-17T22:10:16.037' AS DateTime))
INSERT [dbo].[Aud_ReceiveRoom] ([ID], [IDBookRoom], [IDRoom], [ThaoTac], [NgayThayDoi]) VALUES (N'PN013     ', N'DP019     ', N'PH009     ', N'U         ', CAST(N'2021-04-17T22:10:20.200' AS DateTime))
INSERT [dbo].[Aud_ReceiveRoom] ([ID], [IDBookRoom], [IDRoom], [ThaoTac], [NgayThayDoi]) VALUES (N'PN014     ', N'DP020     ', N'PH013     ', N'U         ', CAST(N'2021-04-17T22:10:24.570' AS DateTime))
INSERT [dbo].[Aud_ReceiveRoom] ([ID], [IDBookRoom], [IDRoom], [ThaoTac], [NgayThayDoi]) VALUES (N'PN015     ', N'DP020     ', N'PH016     ', N'U         ', CAST(N'2021-04-17T22:10:27.370' AS DateTime))
INSERT [dbo].[Aud_ReceiveRoom] ([ID], [IDBookRoom], [IDRoom], [ThaoTac], [NgayThayDoi]) VALUES (N'PN016     ', N'DP022     ', N'PH001     ', N'U         ', CAST(N'2021-04-17T22:10:33.380' AS DateTime))
INSERT [dbo].[Aud_ReceiveRoom] ([ID], [IDBookRoom], [IDRoom], [ThaoTac], [NgayThayDoi]) VALUES (N'PN017     ', N'DP022     ', N'PH018     ', N'U         ', CAST(N'2021-04-17T22:10:39.240' AS DateTime))
INSERT [dbo].[Aud_ReceiveRoom] ([ID], [IDBookRoom], [IDRoom], [ThaoTac], [NgayThayDoi]) VALUES (N'PN018     ', N'DP023     ', N'PH007     ', N'U         ', CAST(N'2021-04-17T22:10:43.153' AS DateTime))
INSERT [dbo].[Aud_ReceiveRoom] ([ID], [IDBookRoom], [IDRoom], [ThaoTac], [NgayThayDoi]) VALUES (N'PN019     ', N'DP023     ', N'PH008     ', N'U         ', CAST(N'2021-04-17T22:10:50.010' AS DateTime))
INSERT [dbo].[Aud_ReceiveRoom] ([ID], [IDBookRoom], [IDRoom], [ThaoTac], [NgayThayDoi]) VALUES (N'PN019     ', N'DP019     ', N'PH008     ', N'U         ', CAST(N'2021-04-18T09:08:46.857' AS DateTime))
INSERT [dbo].[Aud_ReceiveRoom] ([ID], [IDBookRoom], [IDRoom], [ThaoTac], [NgayThayDoi]) VALUES (N'PN018     ', N'DP018     ', N'PH007     ', N'U         ', CAST(N'2021-04-18T09:08:56.430' AS DateTime))
INSERT [dbo].[Aud_ReceiveRoom] ([ID], [IDBookRoom], [IDRoom], [ThaoTac], [NgayThayDoi]) VALUES (N'PN019     ', N'DP026     ', N'PH008     ', N'U         ', CAST(N'2021-04-18T09:09:00.093' AS DateTime))
INSERT [dbo].[Aud_ReceiveRoom] ([ID], [IDBookRoom], [IDRoom], [ThaoTac], [NgayThayDoi]) VALUES (N'PN018     ', N'DP025     ', N'PH007     ', N'U         ', CAST(N'2021-04-18T09:10:59.933' AS DateTime))
INSERT [dbo].[Aud_ReceiveRoom] ([ID], [IDBookRoom], [IDRoom], [ThaoTac], [NgayThayDoi]) VALUES (N'PN020     ', N'DP020     ', N'PH014     ', N'I         ', CAST(N'2021-04-18T09:30:27.190' AS DateTime))
INSERT [dbo].[Aud_ReceiveRoom] ([ID], [IDBookRoom], [IDRoom], [ThaoTac], [NgayThayDoi]) VALUES (N'PN021     ', N'DP025     ', N'PH006     ', N'I         ', CAST(N'2021-04-19T22:14:04.817' AS DateTime))
INSERT [dbo].[Aud_ReceiveRoom] ([ID], [IDBookRoom], [IDRoom], [ThaoTac], [NgayThayDoi]) VALUES (N'PN022     ', N'DP025     ', N'PH009     ', N'I         ', CAST(N'2021-04-19T22:16:47.910' AS DateTime))
INSERT [dbo].[Aud_ReceiveRoom] ([ID], [IDBookRoom], [IDRoom], [ThaoTac], [NgayThayDoi]) VALUES (N'PN023     ', N'DP025     ', N'PH011     ', N'I         ', CAST(N'2021-04-19T22:17:01.500' AS DateTime))
INSERT [dbo].[Aud_ReceiveRoom] ([ID], [IDBookRoom], [IDRoom], [ThaoTac], [NgayThayDoi]) VALUES (N'PN024     ', N'DP026     ', N'PH001     ', N'I         ', CAST(N'2021-04-21T18:31:54.940' AS DateTime))
INSERT [dbo].[Aud_ReceiveRoom] ([ID], [IDBookRoom], [IDRoom], [ThaoTac], [NgayThayDoi]) VALUES (N'PN025     ', N'DP027     ', N'PH013     ', N'I         ', CAST(N'2021-04-21T18:32:59.113' AS DateTime))
INSERT [dbo].[Aud_ReceiveRoom] ([ID], [IDBookRoom], [IDRoom], [ThaoTac], [NgayThayDoi]) VALUES (N'PN026     ', N'DP029     ', N'PH009     ', N'I         ', CAST(N'2021-04-23T18:24:47.197' AS DateTime))
INSERT [dbo].[Aud_ReceiveRoom] ([ID], [IDBookRoom], [IDRoom], [ThaoTac], [NgayThayDoi]) VALUES (N'PN027     ', N'DP031     ', N'PH001     ', N'I         ', CAST(N'2021-04-24T21:04:36.553' AS DateTime))
INSERT [dbo].[Aud_ReceiveRoom] ([ID], [IDBookRoom], [IDRoom], [ThaoTac], [NgayThayDoi]) VALUES (N'PN028     ', N'DP032     ', N'PH005     ', N'I         ', CAST(N'2021-04-24T21:07:03.353' AS DateTime))
INSERT [dbo].[Aud_ReceiveRoom] ([ID], [IDBookRoom], [IDRoom], [ThaoTac], [NgayThayDoi]) VALUES (N'PN029     ', N'DP033     ', N'PH009     ', N'I         ', CAST(N'2021-04-24T21:07:26.447' AS DateTime))
INSERT [dbo].[Aud_ReceiveRoom] ([ID], [IDBookRoom], [IDRoom], [ThaoTac], [NgayThayDoi]) VALUES (N'PN030     ', N'DP034     ', N'PH009     ', N'I         ', CAST(N'2021-04-24T21:15:22.180' AS DateTime))
INSERT [dbo].[Aud_ReceiveRoom] ([ID], [IDBookRoom], [IDRoom], [ThaoTac], [NgayThayDoi]) VALUES (N'PN031     ', N'DP036     ', N'PH011     ', N'I         ', CAST(N'2021-04-24T21:17:35.397' AS DateTime))
INSERT [dbo].[Aud_ReceiveRoom] ([ID], [IDBookRoom], [IDRoom], [ThaoTac], [NgayThayDoi]) VALUES (N'PN032     ', N'DP035     ', N'PH006     ', N'I         ', CAST(N'2021-04-24T21:17:47.187' AS DateTime))
INSERT [dbo].[Aud_ReceiveRoom] ([ID], [IDBookRoom], [IDRoom], [ThaoTac], [NgayThayDoi]) VALUES (N'PN033     ', N'DP037     ', N'PH012     ', N'I         ', CAST(N'2021-04-24T21:19:25.830' AS DateTime))
INSERT [dbo].[Aud_ReceiveRoom] ([ID], [IDBookRoom], [IDRoom], [ThaoTac], [NgayThayDoi]) VALUES (N'PN034     ', N'DP038     ', N'PH001     ', N'I         ', CAST(N'2021-04-24T21:26:08.820' AS DateTime))
INSERT [dbo].[Aud_ReceiveRoom] ([ID], [IDBookRoom], [IDRoom], [ThaoTac], [NgayThayDoi]) VALUES (N'PN035     ', N'DP039     ', N'PH001     ', N'I         ', CAST(N'2021-04-25T08:27:31.677' AS DateTime))
INSERT [dbo].[Aud_ReceiveRoom] ([ID], [IDBookRoom], [IDRoom], [ThaoTac], [NgayThayDoi]) VALUES (N'PN036     ', N'DP042     ', N'PH005     ', N'I         ', CAST(N'2021-04-25T08:34:31.200' AS DateTime))
GO
INSERT [dbo].[Aud_ReceiveRoomDetails] ([IDReceiveRoom], [IDCustomerOther], [ThaoTac], [NgayThayDoi]) VALUES (N'PN005     ', N'KH005     ', N'I         ', CAST(N'2021-04-17T14:02:17.537' AS DateTime))
INSERT [dbo].[Aud_ReceiveRoomDetails] ([IDReceiveRoom], [IDCustomerOther], [ThaoTac], [NgayThayDoi]) VALUES (N'PN006     ', N'KH006     ', N'I         ', CAST(N'2021-04-17T14:02:27.770' AS DateTime))
INSERT [dbo].[Aud_ReceiveRoomDetails] ([IDReceiveRoom], [IDCustomerOther], [ThaoTac], [NgayThayDoi]) VALUES (N'PN021     ', N'KH013     ', N'I         ', CAST(N'2021-04-19T22:14:43.390' AS DateTime))
GO
INSERT [dbo].[Aud_Room] ([ID], [Name], [IDRoomType], [IDStatusRoom], [ThaoTac], [NgayThayDoi]) VALUES (N'PH003     ', N'Phòng 103', N'LP003     ', 1, N'U         ', CAST(N'2021-04-16T22:20:02.030' AS DateTime))
INSERT [dbo].[Aud_Room] ([ID], [Name], [IDRoomType], [IDStatusRoom], [ThaoTac], [NgayThayDoi]) VALUES (N'PH012     ', N'Phòng 203', N'LP002     ', 1, N'U         ', CAST(N'2021-04-16T22:30:26.580' AS DateTime))
INSERT [dbo].[Aud_Room] ([ID], [Name], [IDRoomType], [IDStatusRoom], [ThaoTac], [NgayThayDoi]) VALUES (N'PH012     ', N'Phòng 203', N'LP002     ', 2, N'U         ', CAST(N'2021-04-16T22:31:34.690' AS DateTime))
INSERT [dbo].[Aud_Room] ([ID], [Name], [IDRoomType], [IDStatusRoom], [ThaoTac], [NgayThayDoi]) VALUES (N'PH005     ', N'Phòng 105', N'LP001     ', 1, N'U         ', CAST(N'2021-04-16T22:31:34.720' AS DateTime))
INSERT [dbo].[Aud_Room] ([ID], [Name], [IDRoomType], [IDStatusRoom], [ThaoTac], [NgayThayDoi]) VALUES (N'PH012     ', N'Phòng 203', N'LP002     ', 1, N'U         ', CAST(N'2021-04-16T22:51:29.473' AS DateTime))
INSERT [dbo].[Aud_Room] ([ID], [Name], [IDRoomType], [IDStatusRoom], [ThaoTac], [NgayThayDoi]) VALUES (N'PH009     ', N'Phòng 109', N'LP003     ', 1, N'U         ', CAST(N'2021-04-17T09:50:10.173' AS DateTime))
INSERT [dbo].[Aud_Room] ([ID], [Name], [IDRoomType], [IDStatusRoom], [ThaoTac], [NgayThayDoi]) VALUES (N'PH013     ', N'Phòng 204', N'LP002     ', 1, N'U         ', CAST(N'2021-04-17T13:15:06.300' AS DateTime))
INSERT [dbo].[Aud_Room] ([ID], [Name], [IDRoomType], [IDStatusRoom], [ThaoTac], [NgayThayDoi]) VALUES (N'PH016     ', N'Phòng 207', N'LP002     ', 1, N'U         ', CAST(N'2021-04-17T13:16:26.387' AS DateTime))
INSERT [dbo].[Aud_Room] ([ID], [Name], [IDRoomType], [IDStatusRoom], [ThaoTac], [NgayThayDoi]) VALUES (N'PH001     ', N'Phòng 101', N'LP001     ', 1, N'U         ', CAST(N'2021-04-17T13:17:19.800' AS DateTime))
INSERT [dbo].[Aud_Room] ([ID], [Name], [IDRoomType], [IDStatusRoom], [ThaoTac], [NgayThayDoi]) VALUES (N'PH018     ', N'Phòng 209', N'LP002     ', 1, N'U         ', CAST(N'2021-04-17T13:18:49.557' AS DateTime))
INSERT [dbo].[Aud_Room] ([ID], [Name], [IDRoomType], [IDStatusRoom], [ThaoTac], [NgayThayDoi]) VALUES (N'PH013     ', N'Phòng 204', N'LP002     ', 2, N'U         ', CAST(N'2021-04-17T13:43:15.143' AS DateTime))
INSERT [dbo].[Aud_Room] ([ID], [Name], [IDRoomType], [IDStatusRoom], [ThaoTac], [NgayThayDoi]) VALUES (N'PH018     ', N'Phòng 209', N'LP002     ', 2, N'U         ', CAST(N'2021-04-17T13:56:01.220' AS DateTime))
INSERT [dbo].[Aud_Room] ([ID], [Name], [IDRoomType], [IDStatusRoom], [ThaoTac], [NgayThayDoi]) VALUES (N'PH007     ', N'Phòng 107', N'LP004     ', 1, N'U         ', CAST(N'2021-04-17T19:31:40.890' AS DateTime))
INSERT [dbo].[Aud_Room] ([ID], [Name], [IDRoomType], [IDStatusRoom], [ThaoTac], [NgayThayDoi]) VALUES (N'PH008     ', N'Phòng 108', N'LP004     ', 1, N'U         ', CAST(N'2021-04-17T19:32:03.347' AS DateTime))
INSERT [dbo].[Aud_Room] ([ID], [Name], [IDRoomType], [IDStatusRoom], [ThaoTac], [NgayThayDoi]) VALUES (N'PH018     ', N'Phòng 209', N'LP002     ', 1, N'U         ', CAST(N'2021-04-17T21:53:40.650' AS DateTime))
INSERT [dbo].[Aud_Room] ([ID], [Name], [IDRoomType], [IDStatusRoom], [ThaoTac], [NgayThayDoi]) VALUES (N'PH009     ', N'Phòng 109', N'LP003     ', 2, N'U         ', CAST(N'2021-04-17T21:54:29.730' AS DateTime))
INSERT [dbo].[Aud_Room] ([ID], [Name], [IDRoomType], [IDStatusRoom], [ThaoTac], [NgayThayDoi]) VALUES (N'PH014     ', N'Phòng 205', N'LP004     ', 1, N'U         ', CAST(N'2021-04-18T09:30:27.223' AS DateTime))
INSERT [dbo].[Aud_Room] ([ID], [Name], [IDRoomType], [IDStatusRoom], [ThaoTac], [NgayThayDoi]) VALUES (N'PH005     ', N'Phòng 105', N'LP001     ', 1, N'U         ', CAST(N'2021-04-19T22:07:27.160' AS DateTime))
INSERT [dbo].[Aud_Room] ([ID], [Name], [IDRoomType], [IDStatusRoom], [ThaoTac], [NgayThayDoi]) VALUES (N'PH016     ', N'Phòng 207', N'LP002     ', 2, N'U         ', CAST(N'2021-04-19T22:08:09.313' AS DateTime))
INSERT [dbo].[Aud_Room] ([ID], [Name], [IDRoomType], [IDStatusRoom], [ThaoTac], [NgayThayDoi]) VALUES (N'PH001     ', N'Phòng 101', N'LP001     ', 1, N'U         ', CAST(N'2021-04-21T18:31:54.987' AS DateTime))
INSERT [dbo].[Aud_Room] ([ID], [Name], [IDRoomType], [IDStatusRoom], [ThaoTac], [NgayThayDoi]) VALUES (N'PH013     ', N'Phòng 204', N'LP002     ', 1, N'U         ', CAST(N'2021-04-21T18:32:59.173' AS DateTime))
INSERT [dbo].[Aud_Room] ([ID], [Name], [IDRoomType], [IDStatusRoom], [ThaoTac], [NgayThayDoi]) VALUES (N'PH009     ', N'Phòng 109', N'LP003     ', 1, N'U         ', CAST(N'2021-04-23T18:24:47.230' AS DateTime))
INSERT [dbo].[Aud_Room] ([ID], [Name], [IDRoomType], [IDStatusRoom], [ThaoTac], [NgayThayDoi]) VALUES (N'PH009     ', N'Phòng 109', N'LP003     ', 2, N'U         ', CAST(N'2021-04-23T18:34:08.463' AS DateTime))
INSERT [dbo].[Aud_Room] ([ID], [Name], [IDRoomType], [IDStatusRoom], [ThaoTac], [NgayThayDoi]) VALUES (N'PH006     ', N'Phòng 106', N'LP004     ', 1, N'U         ', CAST(N'2021-04-16T22:39:18.757' AS DateTime))
INSERT [dbo].[Aud_Room] ([ID], [Name], [IDRoomType], [IDStatusRoom], [ThaoTac], [NgayThayDoi]) VALUES (N'PH001     ', N'Phòng 101', N'LP001     ', 2, N'U         ', CAST(N'2021-04-18T09:43:04.400' AS DateTime))
INSERT [dbo].[Aud_Room] ([ID], [Name], [IDRoomType], [IDStatusRoom], [ThaoTac], [NgayThayDoi]) VALUES (N'PH001     ', N'Phòng 101', N'LP001     ', 1, N'U         ', CAST(N'2021-04-18T09:43:35.603' AS DateTime))
INSERT [dbo].[Aud_Room] ([ID], [Name], [IDRoomType], [IDStatusRoom], [ThaoTac], [NgayThayDoi]) VALUES (N'PH006     ', N'Phòng 106', N'LP004     ', 2, N'U         ', CAST(N'2021-04-18T09:44:04.057' AS DateTime))
INSERT [dbo].[Aud_Room] ([ID], [Name], [IDRoomType], [IDStatusRoom], [ThaoTac], [NgayThayDoi]) VALUES (N'PH005     ', N'Phòng 105', N'LP001     ', 2, N'U         ', CAST(N'2021-04-18T09:44:38.423' AS DateTime))
INSERT [dbo].[Aud_Room] ([ID], [Name], [IDRoomType], [IDStatusRoom], [ThaoTac], [NgayThayDoi]) VALUES (N'PH007     ', N'Phòng 107', N'LP004     ', 2, N'U         ', CAST(N'2021-04-17T22:23:17.717' AS DateTime))
INSERT [dbo].[Aud_Room] ([ID], [Name], [IDRoomType], [IDStatusRoom], [ThaoTac], [NgayThayDoi]) VALUES (N'PH006     ', N'Phòng 106', N'LP004     ', 1, N'U         ', CAST(N'2021-04-19T22:14:04.823' AS DateTime))
INSERT [dbo].[Aud_Room] ([ID], [Name], [IDRoomType], [IDStatusRoom], [ThaoTac], [NgayThayDoi]) VALUES (N'PH009     ', N'Phòng 109', N'LP003     ', 1, N'U         ', CAST(N'2021-04-19T22:16:47.917' AS DateTime))
INSERT [dbo].[Aud_Room] ([ID], [Name], [IDRoomType], [IDStatusRoom], [ThaoTac], [NgayThayDoi]) VALUES (N'PH011     ', N'Phòng 202', N'LP003     ', 1, N'U         ', CAST(N'2021-04-19T22:17:01.507' AS DateTime))
INSERT [dbo].[Aud_Room] ([ID], [Name], [IDRoomType], [IDStatusRoom], [ThaoTac], [NgayThayDoi]) VALUES (N'PH009     ', N'Phòng 109', N'LP003     ', 2, N'U         ', CAST(N'2021-04-19T22:18:03.410' AS DateTime))
INSERT [dbo].[Aud_Room] ([ID], [Name], [IDRoomType], [IDStatusRoom], [ThaoTac], [NgayThayDoi]) VALUES (N'PH009     ', N'Phòng 109', N'LP003     ', 1, N'U         ', CAST(N'2021-04-19T22:18:26.647' AS DateTime))
INSERT [dbo].[Aud_Room] ([ID], [Name], [IDRoomType], [IDStatusRoom], [ThaoTac], [NgayThayDoi]) VALUES (N'PH006     ', N'Phòng 106', N'LP004     ', 2, N'U         ', CAST(N'2021-04-19T22:18:46.633' AS DateTime))
INSERT [dbo].[Aud_Room] ([ID], [Name], [IDRoomType], [IDStatusRoom], [ThaoTac], [NgayThayDoi]) VALUES (N'PH011     ', N'Phòng 202', N'LP003     ', 2, N'U         ', CAST(N'2021-04-19T22:19:09.493' AS DateTime))
INSERT [dbo].[Aud_Room] ([ID], [Name], [IDRoomType], [IDStatusRoom], [ThaoTac], [NgayThayDoi]) VALUES (N'PH009     ', N'Phòng 109', N'LP003     ', 1, N'U         ', CAST(N'2021-04-24T19:46:00.727' AS DateTime))
INSERT [dbo].[Aud_Room] ([ID], [Name], [IDRoomType], [IDStatusRoom], [ThaoTac], [NgayThayDoi]) VALUES (N'PH013     ', N'Phòng 204', N'LP002     ', 2, N'U         ', CAST(N'2021-04-24T19:46:33.517' AS DateTime))
INSERT [dbo].[Aud_Room] ([ID], [Name], [IDRoomType], [IDStatusRoom], [ThaoTac], [NgayThayDoi]) VALUES (N'PH013     ', N'Phòng 204', N'LP002     ', 1, N'U         ', CAST(N'2021-04-24T19:47:11.403' AS DateTime))
INSERT [dbo].[Aud_Room] ([ID], [Name], [IDRoomType], [IDStatusRoom], [ThaoTac], [NgayThayDoi]) VALUES (N'PH001     ', N'Phòng 101', N'LP001     ', 2, N'U         ', CAST(N'2021-04-24T19:47:23.607' AS DateTime))
INSERT [dbo].[Aud_Room] ([ID], [Name], [IDRoomType], [IDStatusRoom], [ThaoTac], [NgayThayDoi]) VALUES (N'PH001     ', N'Phòng 101', N'LP001     ', 1, N'U         ', CAST(N'2021-04-24T19:47:41.807' AS DateTime))
INSERT [dbo].[Aud_Room] ([ID], [Name], [IDRoomType], [IDStatusRoom], [ThaoTac], [NgayThayDoi]) VALUES (N'PH001     ', N'Phòng 101', N'LP001     ', 1, N'U         ', CAST(N'2021-04-24T19:49:24.753' AS DateTime))
INSERT [dbo].[Aud_Room] ([ID], [Name], [IDRoomType], [IDStatusRoom], [ThaoTac], [NgayThayDoi]) VALUES (N'PH001     ', N'Phòng 101', N'LP001     ', 1, N'U         ', CAST(N'2021-04-24T21:04:36.680' AS DateTime))
INSERT [dbo].[Aud_Room] ([ID], [Name], [IDRoomType], [IDStatusRoom], [ThaoTac], [NgayThayDoi]) VALUES (N'PH005     ', N'Phòng 105', N'LP001     ', 1, N'U         ', CAST(N'2021-04-24T21:07:03.360' AS DateTime))
INSERT [dbo].[Aud_Room] ([ID], [Name], [IDRoomType], [IDStatusRoom], [ThaoTac], [NgayThayDoi]) VALUES (N'PH009     ', N'Phòng 109', N'LP003     ', 1, N'U         ', CAST(N'2021-04-24T21:07:26.450' AS DateTime))
INSERT [dbo].[Aud_Room] ([ID], [Name], [IDRoomType], [IDStatusRoom], [ThaoTac], [NgayThayDoi]) VALUES (N'PH001     ', N'Phòng 101', N'LP001     ', 2, N'U         ', CAST(N'2021-04-24T21:11:28.903' AS DateTime))
INSERT [dbo].[Aud_Room] ([ID], [Name], [IDRoomType], [IDStatusRoom], [ThaoTac], [NgayThayDoi]) VALUES (N'PH001     ', N'Phòng 101', N'LP001     ', 1, N'U         ', CAST(N'2021-04-24T21:12:28.790' AS DateTime))
INSERT [dbo].[Aud_Room] ([ID], [Name], [IDRoomType], [IDStatusRoom], [ThaoTac], [NgayThayDoi]) VALUES (N'PH009     ', N'Phòng 109', N'LP003     ', 2, N'U         ', CAST(N'2021-04-24T21:13:00.003' AS DateTime))
INSERT [dbo].[Aud_Room] ([ID], [Name], [IDRoomType], [IDStatusRoom], [ThaoTac], [NgayThayDoi]) VALUES (N'PH009     ', N'Phòng 109', N'LP003     ', 1, N'U         ', CAST(N'2021-04-24T21:13:13.750' AS DateTime))
INSERT [dbo].[Aud_Room] ([ID], [Name], [IDRoomType], [IDStatusRoom], [ThaoTac], [NgayThayDoi]) VALUES (N'PH012     ', N'Phòng 203', N'LP002     ', 2, N'U         ', CAST(N'2021-04-24T21:13:28.047' AS DateTime))
INSERT [dbo].[Aud_Room] ([ID], [Name], [IDRoomType], [IDStatusRoom], [ThaoTac], [NgayThayDoi]) VALUES (N'PH009     ', N'Phòng 109', N'LP003     ', 1, N'U         ', CAST(N'2021-04-24T21:15:22.183' AS DateTime))
INSERT [dbo].[Aud_Room] ([ID], [Name], [IDRoomType], [IDStatusRoom], [ThaoTac], [NgayThayDoi]) VALUES (N'PH011     ', N'Phòng 202', N'LP003     ', 1, N'U         ', CAST(N'2021-04-24T21:17:35.403' AS DateTime))
INSERT [dbo].[Aud_Room] ([ID], [Name], [IDRoomType], [IDStatusRoom], [ThaoTac], [NgayThayDoi]) VALUES (N'PH006     ', N'Phòng 106', N'LP004     ', 1, N'U         ', CAST(N'2021-04-24T21:17:47.190' AS DateTime))
INSERT [dbo].[Aud_Room] ([ID], [Name], [IDRoomType], [IDStatusRoom], [ThaoTac], [NgayThayDoi]) VALUES (N'PH012     ', N'Phòng 203', N'LP002     ', 1, N'U         ', CAST(N'2021-04-24T21:19:25.837' AS DateTime))
INSERT [dbo].[Aud_Room] ([ID], [Name], [IDRoomType], [IDStatusRoom], [ThaoTac], [NgayThayDoi]) VALUES (N'PH001     ', N'Phòng 101', N'LP001     ', 1, N'U         ', CAST(N'2021-04-24T21:26:08.827' AS DateTime))
INSERT [dbo].[Aud_Room] ([ID], [Name], [IDRoomType], [IDStatusRoom], [ThaoTac], [NgayThayDoi]) VALUES (N'PH001     ', N'Phòng 101', N'LP001     ', 1, N'U         ', CAST(N'2021-04-25T07:22:28.617' AS DateTime))
INSERT [dbo].[Aud_Room] ([ID], [Name], [IDRoomType], [IDStatusRoom], [ThaoTac], [NgayThayDoi]) VALUES (N'PH005     ', N'Phòng 105', N'LP001     ', 2, N'U         ', CAST(N'2021-04-25T07:22:39.870' AS DateTime))
INSERT [dbo].[Aud_Room] ([ID], [Name], [IDRoomType], [IDStatusRoom], [ThaoTac], [NgayThayDoi]) VALUES (N'PH001     ', N'Phòng 101', N'LP001     ', 2, N'U         ', CAST(N'2021-04-24T21:30:27.980' AS DateTime))
INSERT [dbo].[Aud_Room] ([ID], [Name], [IDRoomType], [IDStatusRoom], [ThaoTac], [NgayThayDoi]) VALUES (N'PH001     ', N'Phòng 101', N'LP001     ', 1, N'U         ', CAST(N'2021-04-25T08:27:31.763' AS DateTime))
INSERT [dbo].[Aud_Room] ([ID], [Name], [IDRoomType], [IDStatusRoom], [ThaoTac], [NgayThayDoi]) VALUES (N'PH005     ', N'Phòng 105', N'LP001     ', 1, N'U         ', CAST(N'2021-04-25T08:34:31.203' AS DateTime))
INSERT [dbo].[Aud_Room] ([ID], [Name], [IDRoomType], [IDStatusRoom], [ThaoTac], [NgayThayDoi]) VALUES (N'PH005     ', N'Phòng 105', N'LP001     ', 2, N'U         ', CAST(N'2021-04-25T08:35:48.987' AS DateTime))
GO
INSERT [dbo].[Aud_Service] ([ID], [Name], [IDServiceType], [Price], [ThaoTac], [NgayThayDoi]) VALUES (N'DV021     ', N'Chivas 12', N'LV004     ', 1000000, N'U         ', CAST(N'2021-04-16T23:29:12.567' AS DateTime))
INSERT [dbo].[Aud_Service] ([ID], [Name], [IDServiceType], [Price], [ThaoTac], [NgayThayDoi]) VALUES (N'DV001     ', N'Spa', N'LV002     ', 1000000, N'U         ', CAST(N'2021-04-19T21:43:49.920' AS DateTime))
INSERT [dbo].[Aud_Service] ([ID], [Name], [IDServiceType], [Price], [ThaoTac], [NgayThayDoi]) VALUES (N'DV001     ', N'Spa', N'LV001     ', 1200000, N'U         ', CAST(N'2021-04-19T22:10:11.420' AS DateTime))
INSERT [dbo].[Aud_Service] ([ID], [Name], [IDServiceType], [Price], [ThaoTac], [NgayThayDoi]) VALUES (N'DV030     ', N'Trà chanh', N'LV001     ', 50000, N'I         ', CAST(N'2021-04-19T22:49:33.603' AS DateTime))
INSERT [dbo].[Aud_Service] ([ID], [Name], [IDServiceType], [Price], [ThaoTac], [NgayThayDoi]) VALUES (N'DV019     ', N'Chivas 18', N'LV004     ', 1800000, N'U         ', CAST(N'2021-04-23T18:29:47.997' AS DateTime))
GO
INSERT [dbo].[Aud_ServiceType] ([ID], [Name], [ThaoTac], [NgayThayDoi]) VALUES (N'LV005     ', N'Thú vui', N'I         ', CAST(N'2021-04-19T22:42:33.663' AS DateTime))
GO
INSERT [dbo].[Aud_Staff] ([UserName], [DisplayName], [PassWord], [IDStaffType], [IDCard], [DateOfBirth], [Sex], [Address], [PhoneNumber], [StartDay], [ThaoTac], [NgayThayDoi]) VALUES (N'hang', N'Thanh Hang', N'123456', N'CD001     ', N'123', CAST(N'2000-05-30' AS Date), N'Nữ', N'Huế', 912472758, CAST(N'2021-02-02' AS Date), N'U         ', CAST(N'2021-04-16T23:18:55.627' AS DateTime))
INSERT [dbo].[Aud_Staff] ([UserName], [DisplayName], [PassWord], [IDStaffType], [IDCard], [DateOfBirth], [Sex], [Address], [PhoneNumber], [StartDay], [ThaoTac], [NgayThayDoi]) VALUES (N'hang123', N'Hang123', N'e10adc3949ba59abbe56e057f20f883e', N'CD001     ', N'191911789', CAST(N'2000-03-23' AS Date), N'Nữ', N'78 Hồ Đắc Di', 918947342, CAST(N'2019-04-25' AS Date), N'I         ', CAST(N'2021-04-16T23:20:30.610' AS DateTime))
INSERT [dbo].[Aud_Staff] ([UserName], [DisplayName], [PassWord], [IDStaffType], [IDCard], [DateOfBirth], [Sex], [Address], [PhoneNumber], [StartDay], [ThaoTac], [NgayThayDoi]) VALUES (N'hang456', N'hang456', N'e10adc3949ba59abbe56e057f20f883e', N'CD002     ', N'1919121212', CAST(N'2000-05-19' AS Date), N'Nữ', N'990 Hùng Vương', 982838728, CAST(N'2020-07-16' AS Date), N'I         ', CAST(N'2021-04-16T23:21:44.463' AS DateTime))
INSERT [dbo].[Aud_Staff] ([UserName], [DisplayName], [PassWord], [IDStaffType], [IDCard], [DateOfBirth], [Sex], [Address], [PhoneNumber], [StartDay], [ThaoTac], [NgayThayDoi]) VALUES (N'admin', N'Thanh Hằng', N'e10adc3949ba59abbe56e057f20f883e', N'CD001     ', N'123457145', CAST(N'2000-05-30' AS Date), N'Nữ', N'Huế', 147852, CAST(N'2019-12-19' AS Date), N'U         ', CAST(N'2021-04-18T09:55:42.957' AS DateTime))
INSERT [dbo].[Aud_Staff] ([UserName], [DisplayName], [PassWord], [IDStaffType], [IDCard], [DateOfBirth], [Sex], [Address], [PhoneNumber], [StartDay], [ThaoTac], [NgayThayDoi]) VALUES (N'admin', N'Thanh Hằng', N'e10adc3949ba59abbe56e057f20f883e', N'CD001     ', N'123457145', CAST(N'2000-09-15' AS Date), N'Nữ', N'Huế', 147852, CAST(N'2019-05-23' AS Date), N'U         ', CAST(N'2021-04-19T21:48:40.957' AS DateTime))
INSERT [dbo].[Aud_Staff] ([UserName], [DisplayName], [PassWord], [IDStaffType], [IDCard], [DateOfBirth], [Sex], [Address], [PhoneNumber], [StartDay], [ThaoTac], [NgayThayDoi]) VALUES (N'hang@', N'hang@', N'e10adc3949ba59abbe56e057f20f883e', N'CD001     ', N'191930005', CAST(N'2000-06-30' AS Date), N'Nữ', N'Huế', 982873872, CAST(N'2020-01-22' AS Date), N'I         ', CAST(N'2021-04-19T21:56:26.523' AS DateTime))
INSERT [dbo].[Aud_Staff] ([UserName], [DisplayName], [PassWord], [IDStaffType], [IDCard], [DateOfBirth], [Sex], [Address], [PhoneNumber], [StartDay], [ThaoTac], [NgayThayDoi]) VALUES (N'meo', N'meo', N'e10adc3949ba59abbe56e057f20f883e', N'CD001     ', N'2712', CAST(N'1998-06-18' AS Date), N'Nam', N'Đà Nẵng', 123456789, CAST(N'2018-05-16' AS Date), N'U         ', CAST(N'2021-04-23T18:33:06.873' AS DateTime))
INSERT [dbo].[Aud_Staff] ([UserName], [DisplayName], [PassWord], [IDStaffType], [IDCard], [DateOfBirth], [Sex], [Address], [PhoneNumber], [StartDay], [ThaoTac], [NgayThayDoi]) VALUES (N'meo', N'meo', N'e10adc3949ba59abbe56e057f20f883e', N'CD001     ', N'2712', CAST(N'1998-04-06' AS Date), N'Nam', N'Dong Nai', 123456789, CAST(N'2018-05-16' AS Date), N'U         ', CAST(N'2021-04-19T21:57:29.207' AS DateTime))
INSERT [dbo].[Aud_Staff] ([UserName], [DisplayName], [PassWord], [IDStaffType], [IDCard], [DateOfBirth], [Sex], [Address], [PhoneNumber], [StartDay], [ThaoTac], [NgayThayDoi]) VALUES (N'meomeo', N'meomeo', N'e10adc3949ba59abbe56e057f20f883e', N'CD001     ', N'16521169', CAST(N'1990-01-01' AS Date), N'Nam', N'Dong Nai', 123456789, CAST(N'2018-05-16' AS Date), N'U         ', CAST(N'2021-04-19T21:57:42.113' AS DateTime))
INSERT [dbo].[Aud_Staff] ([UserName], [DisplayName], [PassWord], [IDStaffType], [IDCard], [DateOfBirth], [Sex], [Address], [PhoneNumber], [StartDay], [ThaoTac], [NgayThayDoi]) VALUES (N'admin', N'Thanh Hằng', N'e10adc3949ba59abbe56e057f20f883e', N'CD001     ', N'123457145', CAST(N'2000-09-15' AS Date), N'Nữ', N'Huế', 147852, CAST(N'2019-05-23' AS Date), N'U         ', CAST(N'2021-04-24T21:21:08.220' AS DateTime))
GO
INSERT [dbo].[Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge]) VALUES (N'HD001     ', N'PN001     ', N'admin', CAST(N'2021-03-21T18:34:00' AS SmallDateTime), 5000000, 0, 7500000, 0, 2, 2500000)
INSERT [dbo].[Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge]) VALUES (N'HD002     ', N'PN002     ', N'admin', CAST(N'2021-03-21T18:34:00' AS SmallDateTime), 40000000, 0, 60000000, 10, 2, 20000000)
INSERT [dbo].[Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge]) VALUES (N'HD003     ', N'PN003     ', N'admin', CAST(N'2021-03-21T18:17:00' AS SmallDateTime), 4000000, 0, 0, 0, 1, 2000000)
INSERT [dbo].[Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge]) VALUES (N'HD004     ', N'PN004     ', N'admin', CAST(N'2021-03-21T18:45:00' AS SmallDateTime), 4000000, 1500000, 7500000, 1, 2, 2000000)
INSERT [dbo].[Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge]) VALUES (N'HD005     ', N'PN005     ', N'admin', CAST(N'2021-04-18T09:44:00' AS SmallDateTime), 130000000, 2900000, 132900000, 10, 2, 0)
INSERT [dbo].[Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge]) VALUES (N'HD006     ', N'PN006     ', N'admin', CAST(N'2021-04-18T09:44:00' AS SmallDateTime), 8000000, 4850000, 12850000, 0, 2, 0)
INSERT [dbo].[Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge]) VALUES (N'HD007     ', N'PN007     ', N'admin', CAST(N'2021-03-21T01:56:00' AS SmallDateTime), 4000000, 3000000, 10000000, 2, 2, 3000000)
INSERT [dbo].[Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge]) VALUES (N'HD008     ', N'PN008     ', N'admin', CAST(N'2021-04-24T19:49:00' AS SmallDateTime), 16000000, 200000, 16200000, 5, 2, 0)
INSERT [dbo].[Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge]) VALUES (N'HD009     ', N'PN009     ', N'admin', CAST(N'2021-04-17T23:00:00' AS SmallDateTime), 160000000, 2600000, 162600000, 0, 2, 0)
INSERT [dbo].[Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge]) VALUES (N'HD010     ', N'PN014     ', N'admin', CAST(N'2021-04-17T13:43:00' AS SmallDateTime), 28000000, 3000000, 31000000, 0, 2, 0)
INSERT [dbo].[Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge]) VALUES (N'HD011     ', N'PN015     ', N'admin', CAST(N'2021-04-19T22:07:00' AS SmallDateTime), 70000000, 8700000, 78700000, 0, 2, 0)
INSERT [dbo].[Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge]) VALUES (N'HD012     ', N'PN012     ', N'admin', CAST(N'2021-04-24T21:13:00' AS SmallDateTime), 91000000, 6100000, 97100000, 5, 2, 0)
INSERT [dbo].[Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge]) VALUES (N'HD013     ', N'PN013     ', N'admin', CAST(N'2021-04-17T21:54:00' AS SmallDateTime), 20000000, 9600000, 29600000, 0, 2, 0)
INSERT [dbo].[Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge]) VALUES (N'HD014     ', N'PN017     ', N'admin', CAST(N'2021-04-17T13:56:00' AS SmallDateTime), 7000000, 1100000, 8100000, 10, 2, 0)
INSERT [dbo].[Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge]) VALUES (N'HD015     ', N'PN013     ', N'admin', CAST(N'2021-04-17T21:54:00' AS SmallDateTime), 20000000, 3300000, 23300000, 0, 2, 0)
INSERT [dbo].[Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge]) VALUES (N'HD016     ', N'PN018     ', N'admin', CAST(N'2021-04-17T22:23:00' AS SmallDateTime), 14000000, 3950000, 17950000, 0, 2, 0)
INSERT [dbo].[Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge]) VALUES (N'HD017     ', N'PN020     ', N'admin', CAST(N'2021-04-18T09:31:00' AS SmallDateTime), 2000000, 0, 0, 0, 1, 0)
INSERT [dbo].[Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge]) VALUES (N'HD018     ', N'PN019     ', N'admin', CAST(N'2021-04-18T09:32:00' AS SmallDateTime), 5000000, 0, 0, 0, 1, 0)
INSERT [dbo].[Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge]) VALUES (N'HD019     ', N'PN016     ', N'admin', CAST(N'2021-04-18T09:43:00' AS SmallDateTime), 130000000, 4350000, 134350000, 0, 2, 0)
INSERT [dbo].[Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge]) VALUES (N'HD020     ', N'PN011     ', N'admin', CAST(N'2021-04-19T22:18:00' AS SmallDateTime), 64000000, 2700000, 66700000, 0, 2, 0)
INSERT [dbo].[Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge]) VALUES (N'HD021     ', N'PN010     ', N'admin', CAST(N'2021-04-18T09:45:00' AS SmallDateTime), 350000000, 1150000, 526150000, 5, 2, 175000000)
INSERT [dbo].[Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge]) VALUES (N'HD022     ', N'PN015     ', N'admin', CAST(N'2021-04-19T22:08:00' AS SmallDateTime), 70000000, 2400000, 72400000, 0, 2, 0)
INSERT [dbo].[Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge]) VALUES (N'HD023     ', N'PN022     ', N'admin', CAST(N'2021-04-19T22:18:00' AS SmallDateTime), 36000000, 1700000, 37700000, 0, 2, 0)
INSERT [dbo].[Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge]) VALUES (N'HD024     ', N'PN021     ', N'admin', CAST(N'2021-04-19T22:19:00' AS SmallDateTime), 9000000, 2400000, 11400000, 0, 2, 0)
INSERT [dbo].[Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge]) VALUES (N'HD025     ', N'PN023     ', N'admin', CAST(N'2021-04-19T22:19:00' AS SmallDateTime), 36000000, 4550000, 40550000, 0, 2, 0)
INSERT [dbo].[Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge]) VALUES (N'HD026     ', N'PN024     ', N'admin', CAST(N'2021-04-24T19:47:00' AS SmallDateTime), 70000000, 1725000, 71725000, 0, 2, 0)
INSERT [dbo].[Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge]) VALUES (N'HD027     ', N'PN025     ', N'admin', CAST(N'2021-04-24T19:46:00' AS SmallDateTime), 28000000, 4450000, 32450000, 0, 2, 0)
INSERT [dbo].[Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge]) VALUES (N'HD028     ', N'PN026     ', N'admin', CAST(N'2021-04-23T18:34:00' AS SmallDateTime), 4000000, 2900000, 6900000, 0, 2, 0)
INSERT [dbo].[Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge]) VALUES (N'HD029     ', N'PN025     ', N'admin', CAST(N'2021-04-24T19:47:00' AS SmallDateTime), 28000000, 250000, 28250000, 0, 2, 0)
INSERT [dbo].[Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge]) VALUES (N'HD030     ', N'PN024     ', N'admin', CAST(N'2021-04-24T19:47:00' AS SmallDateTime), 70000000, 50000, 70050000, 0, 2, 0)
INSERT [dbo].[Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge]) VALUES (N'HD031     ', N'PN029     ', N'admin', CAST(N'2021-04-24T21:12:00' AS SmallDateTime), 4000000, 2900000, 6900000, 5, 2, 0)
INSERT [dbo].[Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge]) VALUES (N'HD032     ', N'PN028     ', N'admin', CAST(N'2021-04-25T07:22:00' AS SmallDateTime), 20000000, 2700000, 22700000, 0, 2, 0)
INSERT [dbo].[Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge]) VALUES (N'HD033     ', N'PN027     ', N'admin', CAST(N'2021-04-24T21:11:00' AS SmallDateTime), 10000000, 400000, 10400000, 5, 2, 0)
INSERT [dbo].[Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge]) VALUES (N'HD034     ', N'PN029     ', N'admin', CAST(N'2021-04-24T21:13:00' AS SmallDateTime), 4000000, 1100000, 5100000, 5, 2, 0)
INSERT [dbo].[Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge]) VALUES (N'HD035     ', N'PN012     ', N'admin', CAST(N'2021-04-24T21:13:00' AS SmallDateTime), 91000000, 275000, 91275000, 5, 2, 0)
INSERT [dbo].[Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge]) VALUES (N'HD036     ', N'PN032     ', N'admin', CAST(N'2021-04-24T21:20:00' AS SmallDateTime), 3000000, 0, 0, 0, 1, 0)
INSERT [dbo].[Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge]) VALUES (N'HD037     ', N'PN030     ', N'admin', CAST(N'2021-04-24T21:20:00' AS SmallDateTime), 12000000, 0, 0, 0, 1, 0)
INSERT [dbo].[Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge]) VALUES (N'HD038     ', N'PN031     ', N'admin', CAST(N'2021-04-24T21:30:00' AS SmallDateTime), 12000000, 450000, 12450000, 5, 2, 0)
INSERT [dbo].[Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge]) VALUES (N'HD039     ', N'PN033     ', N'admin', CAST(N'2021-04-24T21:20:00' AS SmallDateTime), 28000000, 0, 0, 0, 1, 0)
INSERT [dbo].[Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge]) VALUES (N'HD040     ', N'PN034     ', N'admin', CAST(N'2021-04-24T21:27:00' AS SmallDateTime), 10000000, 0, 0, 0, 1, 0)
INSERT [dbo].[Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge]) VALUES (N'HD041     ', N'PN028     ', N'admin', CAST(N'2021-04-25T07:23:00' AS SmallDateTime), 20000000, 500000, 20500000, 0, 2, 0)
INSERT [dbo].[Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge]) VALUES (N'HD042     ', N'PN031     ', N'admin', CAST(N'2021-04-25T07:23:00' AS SmallDateTime), 12000000, 0, 0, 0, 1, 0)
INSERT [dbo].[Bill] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [TotalPrice], [Discount], [IDStatusBill], [Surcharge]) VALUES (N'HD043     ', N'PN036     ', N'admin', CAST(N'2021-04-25T08:36:00' AS SmallDateTime), 10000000, 1700000, 11700000, 10, 2, 0)
GO
INSERT [dbo].[BillDetails] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (N'HD001     ', N'DV001     ', 1, 1000000)
INSERT [dbo].[BillDetails] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (N'HD006     ', N'DV001     ', 2, 600000)
INSERT [dbo].[BillDetails] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (N'HD011     ', N'DV001     ', 2, 2400000)
INSERT [dbo].[BillDetails] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (N'HD014     ', N'DV001     ', 1, 1000000)
INSERT [dbo].[BillDetails] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (N'HD031     ', N'DV001     ', 1, 1200000)
INSERT [dbo].[BillDetails] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (N'HD043     ', N'DV001     ', 1, 1200000)
INSERT [dbo].[BillDetails] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (N'HD002     ', N'DV002     ', 1, 1000000)
INSERT [dbo].[BillDetails] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (N'HD007     ', N'DV002     ', 1, 75000)
INSERT [dbo].[BillDetails] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (N'HD011     ', N'DV002     ', 1, 100000)
INSERT [dbo].[BillDetails] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (N'HD012     ', N'DV002     ', 3, 300000)
INSERT [dbo].[BillDetails] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (N'HD019     ', N'DV002     ', 2, 200000)
INSERT [dbo].[BillDetails] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (N'HD022     ', N'DV002     ', 1, 100000)
INSERT [dbo].[BillDetails] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (N'HD003     ', N'DV003     ', 1, 100000)
INSERT [dbo].[BillDetails] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (N'HD005     ', N'DV003     ', 2, 2000000)
INSERT [dbo].[BillDetails] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (N'HD008     ', N'DV003     ', 1, 50000)
INSERT [dbo].[BillDetails] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (N'HD019     ', N'DV003     ', 2, 400000)
INSERT [dbo].[BillDetails] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (N'HD020     ', N'DV003     ', 1, 200000)
INSERT [dbo].[BillDetails] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (N'HD023     ', N'DV003     ', 3, 600000)
INSERT [dbo].[BillDetails] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (N'HD024     ', N'DV003     ', 2, 400000)
INSERT [dbo].[BillDetails] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (N'HD026     ', N'DV003     ', 1, 200000)
INSERT [dbo].[BillDetails] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (N'HD028     ', N'DV003     ', 2, 400000)
INSERT [dbo].[BillDetails] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (N'HD029     ', N'DV003     ', 1, 200000)
INSERT [dbo].[BillDetails] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (N'HD032     ', N'DV003     ', 1, 200000)
INSERT [dbo].[BillDetails] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (N'HD033     ', N'DV003     ', 1, 200000)
INSERT [dbo].[BillDetails] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (N'HD034     ', N'DV003     ', 1, 200000)
INSERT [dbo].[BillDetails] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (N'HD038     ', N'DV003     ', 2, 400000)
INSERT [dbo].[BillDetails] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (N'HD003     ', N'DV004     ', 1, 200000)
INSERT [dbo].[BillDetails] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (N'HD010     ', N'DV004     ', 2, 2000000)
INSERT [dbo].[BillDetails] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (N'HD031     ', N'DV004     ', 1, 1000000)
INSERT [dbo].[BillDetails] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (N'HD004     ', N'DV005     ', 1, 200000)
INSERT [dbo].[BillDetails] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (N'HD006     ', N'DV005     ', 3, 450000)
INSERT [dbo].[BillDetails] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (N'HD019     ', N'DV005     ', 1, 150000)
INSERT [dbo].[BillDetails] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (N'HD023     ', N'DV005     ', 1, 150000)
INSERT [dbo].[BillDetails] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (N'HD006     ', N'DV006     ', 1, 2000000)
INSERT [dbo].[BillDetails] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (N'HD011     ', N'DV006     ', 1, 200000)
INSERT [dbo].[BillDetails] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (N'HD016     ', N'DV006     ', 2, 400000)
INSERT [dbo].[BillDetails] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (N'HD020     ', N'DV006     ', 2, 400000)
INSERT [dbo].[BillDetails] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (N'HD031     ', N'DV006     ', 1, 200000)
INSERT [dbo].[BillDetails] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (N'HD034     ', N'DV006     ', 1, 200000)
INSERT [dbo].[BillDetails] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (N'HD006     ', N'DV007     ', 1, 500000)
INSERT [dbo].[BillDetails] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (N'HD015     ', N'DV007     ', 2, 1000000)
INSERT [dbo].[BillDetails] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (N'HD016     ', N'DV007     ', 1, 500000)
INSERT [dbo].[BillDetails] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (N'HD020     ', N'DV007     ', 1, 500000)
INSERT [dbo].[BillDetails] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (N'HD034     ', N'DV007     ', 1, 500000)
INSERT [dbo].[BillDetails] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (N'HD020     ', N'DV008     ', 2, 1600000)
INSERT [dbo].[BillDetails] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (N'HD023     ', N'DV008     ', 1, 800000)
INSERT [dbo].[BillDetails] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (N'HD012     ', N'DV009     ', 2, 2000000)
INSERT [dbo].[BillDetails] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (N'HD013     ', N'DV010     ', 2, 1000000)
INSERT [dbo].[BillDetails] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (N'HD019     ', N'DV010     ', 1, 500000)
INSERT [dbo].[BillDetails] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (N'HD017     ', N'DV011     ', 1, 500000)
INSERT [dbo].[BillDetails] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (N'HD031     ', N'DV011     ', 1, 500000)
INSERT [dbo].[BillDetails] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (N'HD010     ', N'DV012     ', 2, 400000)
INSERT [dbo].[BillDetails] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (N'HD026     ', N'DV012     ', 1, 200000)
INSERT [dbo].[BillDetails] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (N'HD033     ', N'DV012     ', 1, 200000)
INSERT [dbo].[BillDetails] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (N'HD034     ', N'DV012     ', 1, 200000)
INSERT [dbo].[BillDetails] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (N'HD035     ', N'DV012     ', 1, 200000)
INSERT [dbo].[BillDetails] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (N'HD011     ', N'DV013     ', 2, 4000000)
INSERT [dbo].[BillDetails] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (N'HD013     ', N'DV013     ', 4, 8000000)
INSERT [dbo].[BillDetails] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (N'HD018     ', N'DV013     ', 1, 2000000)
INSERT [dbo].[BillDetails] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (N'HD019     ', N'DV013     ', 1, 2000000)
INSERT [dbo].[BillDetails] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (N'HD024     ', N'DV013     ', 1, 2000000)
INSERT [dbo].[BillDetails] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (N'HD025     ', N'DV013     ', 1, 2000000)
INSERT [dbo].[BillDetails] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (N'HD027     ', N'DV013     ', 1, 2000000)
INSERT [dbo].[BillDetails] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (N'HD032     ', N'DV013     ', 1, 2000000)
INSERT [dbo].[BillDetails] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (N'HD012     ', N'DV014     ', 1, 50000)
INSERT [dbo].[BillDetails] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (N'HD014     ', N'DV014     ', 2, 100000)
INSERT [dbo].[BillDetails] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (N'HD017     ', N'DV014     ', 1, 50000)
INSERT [dbo].[BillDetails] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (N'HD018     ', N'DV014     ', 2, 100000)
INSERT [dbo].[BillDetails] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (N'HD021     ', N'DV014     ', 1, 50000)
INSERT [dbo].[BillDetails] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (N'HD026     ', N'DV014     ', 1, 50000)
INSERT [dbo].[BillDetails] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (N'HD027     ', N'DV014     ', 1, 50000)
INSERT [dbo].[BillDetails] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (N'HD029     ', N'DV014     ', 1, 50000)
INSERT [dbo].[BillDetails] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (N'HD030     ', N'DV014     ', 1, 50000)
INSERT [dbo].[BillDetails] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (N'HD038     ', N'DV014     ', 1, 50000)
INSERT [dbo].[BillDetails] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (N'HD011     ', N'DV015     ', 2, 1000000)
INSERT [dbo].[BillDetails] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (N'HD016     ', N'DV015     ', 3, 1500000)
INSERT [dbo].[BillDetails] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (N'HD018     ', N'DV015     ', 1, 500000)
INSERT [dbo].[BillDetails] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (N'HD019     ', N'DV015     ', 2, 1000000)
INSERT [dbo].[BillDetails] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (N'HD028     ', N'DV015     ', 1, 500000)
INSERT [dbo].[BillDetails] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (N'HD032     ', N'DV015     ', 1, 500000)
INSERT [dbo].[BillDetails] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (N'HD041     ', N'DV015     ', 1, 500000)
INSERT [dbo].[BillDetails] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (N'HD043     ', N'DV015     ', 1, 500000)
INSERT [dbo].[BillDetails] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (N'HD008     ', N'DV016     ', 1, 150000)
INSERT [dbo].[BillDetails] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (N'HD012     ', N'DV016     ', 1, 150000)
INSERT [dbo].[BillDetails] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (N'HD013     ', N'DV016     ', 2, 300000)
INSERT [dbo].[BillDetails] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (N'HD023     ', N'DV016     ', 1, 150000)
INSERT [dbo].[BillDetails] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (N'HD025     ', N'DV016     ', 1, 150000)
INSERT [dbo].[BillDetails] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (N'HD017     ', N'DV017     ', 1, 75000)
INSERT [dbo].[BillDetails] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (N'HD026     ', N'DV017     ', 1, 75000)
INSERT [dbo].[BillDetails] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (N'HD035     ', N'DV017     ', 1, 75000)
INSERT [dbo].[BillDetails] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (N'HD016     ', N'DV018     ', 1, 50000)
INSERT [dbo].[BillDetails] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (N'HD018     ', N'DV018     ', 1, 50000)
INSERT [dbo].[BillDetails] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (N'HD019     ', N'DV018     ', 2, 100000)
INSERT [dbo].[BillDetails] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (N'HD012     ', N'DV019     ', 2, 3600000)
INSERT [dbo].[BillDetails] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (N'HD006     ', N'DV020     ', 1, 500000)
INSERT [dbo].[BillDetails] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (N'HD018     ', N'DV020     ', 1, 500000)
INSERT [dbo].[BillDetails] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (N'HD025     ', N'DV021     ', 1, 1200000)
INSERT [dbo].[BillDetails] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (N'HD026     ', N'DV021     ', 1, 1200000)
INSERT [dbo].[BillDetails] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (N'HD027     ', N'DV021     ', 1, 1200000)
INSERT [dbo].[BillDetails] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (N'HD006     ', N'DV022     ', 1, 300000)
GO
INSERT [dbo].[BillDetails] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (N'HD010     ', N'DV022     ', 2, 600000)
INSERT [dbo].[BillDetails] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (N'HD017     ', N'DV022     ', 1, 300000)
INSERT [dbo].[BillDetails] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (N'HD021     ', N'DV022     ', 1, 300000)
INSERT [dbo].[BillDetails] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (N'HD022     ', N'DV023     ', 1, 300000)
INSERT [dbo].[BillDetails] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (N'HD005     ', N'DV024     ', 1, 500000)
INSERT [dbo].[BillDetails] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (N'HD006     ', N'DV024     ', 1, 500000)
INSERT [dbo].[BillDetails] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (N'HD016     ', N'DV024     ', 2, 1000000)
INSERT [dbo].[BillDetails] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (N'HD017     ', N'DV024     ', 2, 1000000)
INSERT [dbo].[BillDetails] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (N'HD018     ', N'DV024     ', 1, 500000)
INSERT [dbo].[BillDetails] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (N'HD005     ', N'DV025     ', 1, 400000)
INSERT [dbo].[BillDetails] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (N'HD011     ', N'DV025     ', 2, 800000)
INSERT [dbo].[BillDetails] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (N'HD021     ', N'DV025     ', 2, 800000)
INSERT [dbo].[BillDetails] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (N'HD022     ', N'DV025     ', 5, 2000000)
INSERT [dbo].[BillDetails] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (N'HD011     ', N'DV026     ', 2, 200000)
INSERT [dbo].[BillDetails] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (N'HD013     ', N'DV026     ', 3, 300000)
INSERT [dbo].[BillDetails] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (N'HD015     ', N'DV026     ', 3, 300000)
INSERT [dbo].[BillDetails] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (N'HD016     ', N'DV026     ', 1, 100000)
INSERT [dbo].[BillDetails] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (N'HD017     ', N'DV026     ', 1, 100000)
INSERT [dbo].[BillDetails] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (N'HD015     ', N'DV027     ', 2, 2000000)
INSERT [dbo].[BillDetails] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (N'HD028     ', N'DV027     ', 1, 1000000)
INSERT [dbo].[BillDetails] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (N'HD017     ', N'DV028     ', 1, 1000000)
INSERT [dbo].[BillDetails] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (N'HD025     ', N'DV028     ', 1, 1000000)
INSERT [dbo].[BillDetails] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (N'HD027     ', N'DV028     ', 1, 1000000)
INSERT [dbo].[BillDetails] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (N'HD028     ', N'DV028     ', 1, 1000000)
INSERT [dbo].[BillDetails] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (N'HD016     ', N'DV029     ', 2, 400000)
INSERT [dbo].[BillDetails] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (N'HD025     ', N'DV029     ', 1, 200000)
INSERT [dbo].[BillDetails] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (N'HD027     ', N'DV029     ', 1, 200000)
GO
INSERT [dbo].[BookRoom] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut]) VALUES (N'DP001     ', N'KH004     ', N'LP001     ', CAST(N'2021-03-21T18:12:00' AS SmallDateTime), CAST(N'2021-03-21' AS Date), CAST(N'2021-03-28' AS Date))
INSERT [dbo].[BookRoom] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut]) VALUES (N'DP002     ', N'KH010     ', N'LP001     ', CAST(N'2021-03-21T18:13:00' AS SmallDateTime), CAST(N'2021-03-21' AS Date), CAST(N'2021-03-29' AS Date))
INSERT [dbo].[BookRoom] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut]) VALUES (N'DP003     ', N'KH001     ', N'LP001     ', CAST(N'2021-03-21T18:14:00' AS SmallDateTime), CAST(N'2021-03-21' AS Date), CAST(N'2021-03-27' AS Date))
INSERT [dbo].[BookRoom] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut]) VALUES (N'DP004     ', N'KH005     ', N'LP004     ', CAST(N'2021-03-21T18:15:00' AS SmallDateTime), CAST(N'2021-03-21' AS Date), CAST(N'2021-03-30' AS Date))
INSERT [dbo].[BookRoom] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut]) VALUES (N'DP005     ', N'KH011     ', N'LP004     ', CAST(N'2021-04-05T18:38:00' AS SmallDateTime), CAST(N'2021-04-05' AS Date), CAST(N'2021-04-18' AS Date))
INSERT [dbo].[BookRoom] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut]) VALUES (N'DP006     ', N'KH013     ', N'LP004     ', CAST(N'2021-04-10T01:54:00' AS SmallDateTime), CAST(N'2021-04-10' AS Date), CAST(N'2021-04-18' AS Date))
INSERT [dbo].[BookRoom] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut]) VALUES (N'DP007     ', N'KH003     ', N'LP003     ', CAST(N'2021-04-04T02:27:00' AS SmallDateTime), CAST(N'2021-04-04' AS Date), CAST(N'2021-04-10' AS Date))
INSERT [dbo].[BookRoom] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut]) VALUES (N'DP008     ', N'KH006     ', N'LP002     ', CAST(N'2021-04-13T22:45:00' AS SmallDateTime), CAST(N'2021-04-13' AS Date), CAST(N'2021-04-29' AS Date))
INSERT [dbo].[BookRoom] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut]) VALUES (N'DP009     ', N'KH007     ', N'LP002     ', CAST(N'2021-04-14T09:32:00' AS SmallDateTime), CAST(N'2021-04-14' AS Date), CAST(N'2021-04-29' AS Date))
INSERT [dbo].[BookRoom] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut]) VALUES (N'DP010     ', N'KH008     ', N'LP004     ', CAST(N'2021-04-14T09:33:00' AS SmallDateTime), CAST(N'2021-04-14' AS Date), CAST(N'2021-05-19' AS Date))
INSERT [dbo].[BookRoom] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut]) VALUES (N'DP011     ', N'KH009     ', N'LP003     ', CAST(N'2021-04-14T09:35:00' AS SmallDateTime), CAST(N'2021-04-14' AS Date), CAST(N'2021-06-17' AS Date))
INSERT [dbo].[BookRoom] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut]) VALUES (N'DP012     ', N'KH010     ', N'LP003     ', CAST(N'2021-04-14T09:36:00' AS SmallDateTime), CAST(N'2021-04-14' AS Date), CAST(N'2021-04-27' AS Date))
INSERT [dbo].[BookRoom] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut]) VALUES (N'DP013     ', N'KH012     ', N'LP003     ', CAST(N'2021-04-14T09:39:00' AS SmallDateTime), CAST(N'2021-04-14' AS Date), CAST(N'2021-05-06' AS Date))
INSERT [dbo].[BookRoom] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut]) VALUES (N'DP014     ', N'KH017     ', N'LP003     ', CAST(N'2021-04-16T22:17:00' AS SmallDateTime), CAST(N'2021-04-16' AS Date), CAST(N'2021-04-21' AS Date))
INSERT [dbo].[BookRoom] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut]) VALUES (N'DP015     ', N'KH018     ', N'LP002     ', CAST(N'2021-04-16T22:29:00' AS SmallDateTime), CAST(N'2021-04-16' AS Date), CAST(N'2021-04-26' AS Date))
INSERT [dbo].[BookRoom] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut]) VALUES (N'DP016     ', N'KH019     ', N'LP004     ', CAST(N'2021-04-16T22:38:00' AS SmallDateTime), CAST(N'2021-04-16' AS Date), CAST(N'2021-04-29' AS Date))
INSERT [dbo].[BookRoom] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut]) VALUES (N'DP017     ', N'KH020     ', N'LP002     ', CAST(N'2021-04-16T22:38:00' AS SmallDateTime), CAST(N'2021-04-16' AS Date), CAST(N'2021-04-28' AS Date))
INSERT [dbo].[BookRoom] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut]) VALUES (N'DP018     ', N'KH018     ', N'LP004     ', CAST(N'2021-04-16T22:39:00' AS SmallDateTime), CAST(N'2021-04-16' AS Date), CAST(N'2021-04-30' AS Date))
INSERT [dbo].[BookRoom] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut]) VALUES (N'DP019     ', N'KH021     ', N'LP003     ', CAST(N'2021-04-17T09:50:00' AS SmallDateTime), CAST(N'2021-04-17' AS Date), CAST(N'2021-04-22' AS Date))
INSERT [dbo].[BookRoom] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut]) VALUES (N'DP020     ', N'KH013     ', N'LP004     ', CAST(N'2021-04-18T09:12:00' AS SmallDateTime), CAST(N'2021-04-18' AS Date), CAST(N'2021-04-20' AS Date))
INSERT [dbo].[BookRoom] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut]) VALUES (N'DP021     ', N'KH014     ', N'LP003     ', CAST(N'2021-04-19T22:11:00' AS SmallDateTime), CAST(N'2021-04-19' AS Date), CAST(N'2021-04-30' AS Date))
INSERT [dbo].[BookRoom] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut]) VALUES (N'DP022     ', N'KH017     ', N'LP002     ', CAST(N'2021-04-19T22:11:00' AS SmallDateTime), CAST(N'2021-04-19' AS Date), CAST(N'2021-04-22' AS Date))
INSERT [dbo].[BookRoom] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut]) VALUES (N'DP023     ', N'KH018     ', N'LP003     ', CAST(N'2021-04-19T22:12:00' AS SmallDateTime), CAST(N'2021-04-19' AS Date), CAST(N'2021-04-28' AS Date))
INSERT [dbo].[BookRoom] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut]) VALUES (N'DP024     ', N'KH022     ', N'LP003     ', CAST(N'2021-04-19T22:12:00' AS SmallDateTime), CAST(N'2021-04-19' AS Date), CAST(N'2021-04-26' AS Date))
INSERT [dbo].[BookRoom] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut]) VALUES (N'DP025     ', N'KH020     ', N'LP004     ', CAST(N'2021-04-19T22:14:00' AS SmallDateTime), CAST(N'2021-04-19' AS Date), CAST(N'2021-04-28' AS Date))
INSERT [dbo].[BookRoom] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut]) VALUES (N'DP026     ', N'KH013     ', N'LP001     ', CAST(N'2021-04-21T18:09:00' AS SmallDateTime), CAST(N'2021-04-21' AS Date), CAST(N'2021-04-28' AS Date))
INSERT [dbo].[BookRoom] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut]) VALUES (N'DP027     ', N'KH014     ', N'LP002     ', CAST(N'2021-04-21T18:10:00' AS SmallDateTime), CAST(N'2021-04-21' AS Date), CAST(N'2021-04-25' AS Date))
INSERT [dbo].[BookRoom] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut]) VALUES (N'DP028     ', N'KH018     ', N'LP003     ', CAST(N'2021-04-21T18:33:00' AS SmallDateTime), CAST(N'2021-04-21' AS Date), CAST(N'2021-04-24' AS Date))
INSERT [dbo].[BookRoom] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut]) VALUES (N'DP029     ', N'KH013     ', N'LP003     ', CAST(N'2021-04-23T18:13:00' AS SmallDateTime), CAST(N'2021-04-23' AS Date), CAST(N'2021-04-24' AS Date))
INSERT [dbo].[BookRoom] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut]) VALUES (N'DP030     ', N'KH014     ', N'LP001     ', CAST(N'2021-04-23T18:22:00' AS SmallDateTime), CAST(N'2021-04-23' AS Date), CAST(N'2021-04-24' AS Date))
INSERT [dbo].[BookRoom] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut]) VALUES (N'DP031     ', N'KH018     ', N'LP001     ', CAST(N'2021-04-24T21:04:00' AS SmallDateTime), CAST(N'2021-04-24' AS Date), CAST(N'2021-04-25' AS Date))
INSERT [dbo].[BookRoom] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut]) VALUES (N'DP032     ', N'KH017     ', N'LP001     ', CAST(N'2021-04-24T21:06:00' AS SmallDateTime), CAST(N'2021-04-24' AS Date), CAST(N'2021-04-26' AS Date))
INSERT [dbo].[BookRoom] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut]) VALUES (N'DP033     ', N'KH013     ', N'LP001     ', CAST(N'2021-04-24T21:07:00' AS SmallDateTime), CAST(N'2021-04-24' AS Date), CAST(N'2021-04-25' AS Date))
INSERT [dbo].[BookRoom] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut]) VALUES (N'DP034     ', N'KH013     ', N'LP003     ', CAST(N'2021-04-24T21:15:00' AS SmallDateTime), CAST(N'2021-04-24' AS Date), CAST(N'2021-04-27' AS Date))
INSERT [dbo].[BookRoom] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut]) VALUES (N'DP035     ', N'KH023     ', N'LP004     ', CAST(N'2021-04-24T21:16:00' AS SmallDateTime), CAST(N'2021-04-24' AS Date), CAST(N'2021-04-27' AS Date))
INSERT [dbo].[BookRoom] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut]) VALUES (N'DP036     ', N'KH024     ', N'LP003     ', CAST(N'2021-04-24T21:17:00' AS SmallDateTime), CAST(N'2021-04-24' AS Date), CAST(N'2021-04-27' AS Date))
INSERT [dbo].[BookRoom] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut]) VALUES (N'DP037     ', N'KH025     ', N'LP002     ', CAST(N'2021-04-24T21:19:00' AS SmallDateTime), CAST(N'2021-04-24' AS Date), CAST(N'2021-04-28' AS Date))
INSERT [dbo].[BookRoom] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut]) VALUES (N'DP038     ', N'KH022     ', N'LP001     ', CAST(N'2021-04-24T21:26:00' AS SmallDateTime), CAST(N'2021-04-24' AS Date), CAST(N'2021-04-25' AS Date))
INSERT [dbo].[BookRoom] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut]) VALUES (N'DP039     ', N'KH013     ', N'LP001     ', CAST(N'2021-04-25T08:27:00' AS SmallDateTime), CAST(N'2021-04-25' AS Date), CAST(N'2021-04-26' AS Date))
INSERT [dbo].[BookRoom] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut]) VALUES (N'DP040     ', N'KH026     ', N'LP001     ', CAST(N'2021-04-25T08:29:00' AS SmallDateTime), CAST(N'2021-04-25' AS Date), CAST(N'2021-04-26' AS Date))
INSERT [dbo].[BookRoom] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut]) VALUES (N'DP041     ', N'KH026     ', N'LP001     ', CAST(N'2021-04-25T08:30:00' AS SmallDateTime), CAST(N'2021-04-25' AS Date), CAST(N'2021-04-26' AS Date))
INSERT [dbo].[BookRoom] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut]) VALUES (N'DP042     ', N'KH026     ', N'LP001     ', CAST(N'2021-04-25T08:30:00' AS SmallDateTime), CAST(N'2021-04-25' AS Date), CAST(N'2021-04-26' AS Date))
INSERT [dbo].[BookRoom] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut]) VALUES (N'DP043     ', N'KH026     ', N'LP004     ', CAST(N'2021-04-25T08:33:00' AS SmallDateTime), CAST(N'2021-04-25' AS Date), CAST(N'2021-05-01' AS Date))
GO
INSERT [dbo].[Customer] ([ID], [IDCard], [IDCustomerType], [Name], [DateOfBirth], [Address], [PhoneNumber], [Sex], [Nationality]) VALUES (N'KH001     ', N'16520147', N'LK002     ', N'Nguyễn Ngọc Thanh', CAST(N'1998-04-06' AS Date), N'New York', 1648222347, N'Nam', N'Việt Nam')
INSERT [dbo].[Customer] ([ID], [IDCard], [IDCustomerType], [Name], [DateOfBirth], [Address], [PhoneNumber], [Sex], [Nationality]) VALUES (N'KH002     ', N'206117926', N'LK003     ', N'Hoàng Yến', CAST(N'1998-04-06' AS Date), N'Huế', 1648222347, N'Nữ', N'Singapore')
INSERT [dbo].[Customer] ([ID], [IDCard], [IDCustomerType], [Name], [DateOfBirth], [Address], [PhoneNumber], [Sex], [Nationality]) VALUES (N'KH003     ', N'123456', N'LK002     ', N'Mai Thúy Vân', CAST(N'1998-04-06' AS Date), N'Tam Kỳ', 1648222347, N'Nữ', N'Trung Quốc')
INSERT [dbo].[Customer] ([ID], [IDCard], [IDCustomerType], [Name], [DateOfBirth], [Address], [PhoneNumber], [Sex], [Nationality]) VALUES (N'KH004     ', N'12782389', N'LK001     ', N'Trần Ngọc Thủy', CAST(N'1998-04-06' AS Date), N'Tokyo', 12782389, N'Nữ', N'Nhật Bản')
INSERT [dbo].[Customer] ([ID], [IDCard], [IDCustomerType], [Name], [DateOfBirth], [Address], [PhoneNumber], [Sex], [Nationality]) VALUES (N'KH005     ', N'2563', N'LK001     ', N'Triết', CAST(N'1998-04-06' AS Date), N'Quảng ngãi', 147852, N'Nữ', N'Việt Nam')
INSERT [dbo].[Customer] ([ID], [IDCard], [IDCustomerType], [Name], [DateOfBirth], [Address], [PhoneNumber], [Sex], [Nationality]) VALUES (N'KH006     ', N'123456788', N'LK001     ', N'Nguyễn Văn Thịnh', CAST(N'1998-07-08' AS Date), N'Tam Kỳ,  Quảng Nam', 123456789, N'Nam', N'Việt Nam')
INSERT [dbo].[Customer] ([ID], [IDCard], [IDCustomerType], [Name], [DateOfBirth], [Address], [PhoneNumber], [Sex], [Nationality]) VALUES (N'KH007     ', N'123456787', N'LK001     ', N'Nguyễn Trần Duy Cương', CAST(N'1998-04-06' AS Date), N'Tam Kỳ', 123456785, N'Nam', N'Hoa Kỳ')
INSERT [dbo].[Customer] ([ID], [IDCard], [IDCustomerType], [Name], [DateOfBirth], [Address], [PhoneNumber], [Sex], [Nationality]) VALUES (N'KH008     ', N'27263950', N'LK001     ', N'Hồ Ngọc Mai', CAST(N'1998-06-06' AS Date), N'Huế', 966144938, N'Nữ', N'Trung Quốc')
INSERT [dbo].[Customer] ([ID], [IDCard], [IDCustomerType], [Name], [DateOfBirth], [Address], [PhoneNumber], [Sex], [Nationality]) VALUES (N'KH009     ', N'145236', N'LK001     ', N'Lâm Ngọc Lan', CAST(N'1998-04-06' AS Date), N'Thái bình', 1655201124, N'Nữ', N'Việt Nam')
INSERT [dbo].[Customer] ([ID], [IDCard], [IDCustomerType], [Name], [DateOfBirth], [Address], [PhoneNumber], [Sex], [Nationality]) VALUES (N'KH010     ', N'96852361', N'LK001     ', N'Nguyễn Ngọc Dung', CAST(N'1998-04-06' AS Date), N'Huế', 145230, N'Nữ', N'Việt Nam')
INSERT [dbo].[Customer] ([ID], [IDCard], [IDCustomerType], [Name], [DateOfBirth], [Address], [PhoneNumber], [Sex], [Nationality]) VALUES (N'KH011     ', N'123458523', N'LK001     ', N'Nguyễn Văn Anh', CAST(N'1998-04-06' AS Date), N'Hồ Chí Minh', 123452367, N'Nam', N'Việt Nam')
INSERT [dbo].[Customer] ([ID], [IDCard], [IDCustomerType], [Name], [DateOfBirth], [Address], [PhoneNumber], [Sex], [Nationality]) VALUES (N'KH012     ', N'963587', N'LK003     ', N'Nguyễn Duy', CAST(N'1998-04-08' AS Date), N'Hà Nội', 164853564, N'Nam', N'Việt Nam')
INSERT [dbo].[Customer] ([ID], [IDCard], [IDCustomerType], [Name], [DateOfBirth], [Address], [PhoneNumber], [Sex], [Nationality]) VALUES (N'KH013     ', N'191911727', N'LK002     ', N'Thanh Hằng', CAST(N'1998-04-06' AS Date), N'Huế', 912472758, N'Nữ', N'Việt Nam')
INSERT [dbo].[Customer] ([ID], [IDCard], [IDCustomerType], [Name], [DateOfBirth], [Address], [PhoneNumber], [Sex], [Nationality]) VALUES (N'KH014     ', N'191911111', N'LK003     ', N'Nguyễn Văn An', CAST(N'1998-04-06' AS Date), N'Đà Nẵng', 888888888, N'Nam', N'Việt Nam')
INSERT [dbo].[Customer] ([ID], [IDCard], [IDCustomerType], [Name], [DateOfBirth], [Address], [PhoneNumber], [Sex], [Nationality]) VALUES (N'KH015     ', N'191911777', N'LK004     ', N'Trần Diệu Hiền', CAST(N'1998-04-06' AS Date), N'Đà Nẵng', 999999999, N'Nữ', N'Việt Nam')
INSERT [dbo].[Customer] ([ID], [IDCard], [IDCustomerType], [Name], [DateOfBirth], [Address], [PhoneNumber], [Sex], [Nationality]) VALUES (N'KH016     ', N'1919191919', N'LK001     ', N'Hoàng Việt Trinh', CAST(N'1999-10-14' AS Date), N'Đà Nẵng', 777777777, N'Nữ', N'Việt Nam')
INSERT [dbo].[Customer] ([ID], [IDCard], [IDCustomerType], [Name], [DateOfBirth], [Address], [PhoneNumber], [Sex], [Nationality]) VALUES (N'KH017     ', N'191900000', N'LK002     ', N'Lê Thủy', CAST(N'2000-05-30' AS Date), N'87 Nguyễn Huệ', 982981832, N'Nữ', N'Việt Nam')
INSERT [dbo].[Customer] ([ID], [IDCard], [IDCustomerType], [Name], [DateOfBirth], [Address], [PhoneNumber], [Sex], [Nationality]) VALUES (N'KH018     ', N'191922222', N'LK004     ', N'Trần Minh Anh', CAST(N'2000-05-30' AS Date), N'66 Nguyễn Trãi', 912873843, N'Nữ', N'Việt Nam')
INSERT [dbo].[Customer] ([ID], [IDCard], [IDCustomerType], [Name], [DateOfBirth], [Address], [PhoneNumber], [Sex], [Nationality]) VALUES (N'KH019     ', N'191900011', N'LK001     ', N'Hoàng Thu Hải', CAST(N'2000-05-30' AS Date), N'6 Lý Thái Tổ', 987236232, N'Nữ', N'Việt Nam')
INSERT [dbo].[Customer] ([ID], [IDCard], [IDCustomerType], [Name], [DateOfBirth], [Address], [PhoneNumber], [Sex], [Nationality]) VALUES (N'KH020     ', N'191966666', N'LK002     ', N'Trần Tấn Hoàng', CAST(N'2000-05-30' AS Date), N'65 Bà Triệu', 988273232, N'Nam', N'Việt Nam')
INSERT [dbo].[Customer] ([ID], [IDCard], [IDCustomerType], [Name], [DateOfBirth], [Address], [PhoneNumber], [Sex], [Nationality]) VALUES (N'KH021     ', N'191966677', N'LK002     ', N'Trần Minh', CAST(N'2000-05-30' AS Date), N'6 Trần Quốc Toản', 988786434, N'Nam', N'Việt Nam')
INSERT [dbo].[Customer] ([ID], [IDCard], [IDCustomerType], [Name], [DateOfBirth], [Address], [PhoneNumber], [Sex], [Nationality]) VALUES (N'KH022     ', N'191977777', N'LK001     ', N'Hoàng Ánh Tuyết', CAST(N'2000-05-30' AS Date), N'Huế', 98837273, N'Nữ', N'Việt Nam')
INSERT [dbo].[Customer] ([ID], [IDCard], [IDCustomerType], [Name], [DateOfBirth], [Address], [PhoneNumber], [Sex], [Nationality]) VALUES (N'KH023     ', N'12121212', N'LK002     ', N'Nguyễn Thúy', CAST(N'2000-05-30' AS Date), N'Huế', 93028390, N'Nữ', N'Việt Nam')
INSERT [dbo].[Customer] ([ID], [IDCard], [IDCustomerType], [Name], [DateOfBirth], [Address], [PhoneNumber], [Sex], [Nationality]) VALUES (N'KH024     ', N'13131313', N'LK003     ', N'Trần Ngọc Minh', CAST(N'2000-05-30' AS Date), N'Huế', 988329783, N'Nam', N'Việt Nam')
INSERT [dbo].[Customer] ([ID], [IDCard], [IDCustomerType], [Name], [DateOfBirth], [Address], [PhoneNumber], [Sex], [Nationality]) VALUES (N'KH025     ', N'14141414', N'LK004     ', N'Phạm Minh Anh', CAST(N'2000-05-30' AS Date), N'Huế', 929839248, N'Nữ', N'Việt Nam')
INSERT [dbo].[Customer] ([ID], [IDCard], [IDCustomerType], [Name], [DateOfBirth], [Address], [PhoneNumber], [Sex], [Nationality]) VALUES (N'KH026     ', N'191984512', N'LK004     ', N'Trần Thái Hòa', CAST(N'2000-05-30' AS Date), N'Huế', 987364732, N'Nam', N'Việt Nam')
GO
INSERT [dbo].[CustomerType] ([ID], [Name]) VALUES (N'LK001     ', N'Khách du lịch')
INSERT [dbo].[CustomerType] ([ID], [Name]) VALUES (N'LK002     ', N'Khách địa phương')
INSERT [dbo].[CustomerType] ([ID], [Name]) VALUES (N'LK003     ', N'Khách vãng lai')
INSERT [dbo].[CustomerType] ([ID], [Name]) VALUES (N'LK004     ', N'Khách đi qua các tổ chức trung gian')
GO
INSERT [dbo].[JOB] ([ID], [Name], [NameForm]) VALUES (N'CV001     ', N'Đặt Phòng', N'fBookRoom')
INSERT [dbo].[JOB] ([ID], [Name], [NameForm]) VALUES (N'CV002     ', N'Nhận Phòng', N'fReceiveRoom')
INSERT [dbo].[JOB] ([ID], [Name], [NameForm]) VALUES (N'CV003     ', N'Sử dụng dịch vụ và Thanh toán', N'fUseService')
INSERT [dbo].[JOB] ([ID], [Name], [NameForm]) VALUES (N'CV004     ', N'Thống kê và doanh thu', N'fReport')
INSERT [dbo].[JOB] ([ID], [Name], [NameForm]) VALUES (N'CV005     ', N'Quản lí phòng', N'fRoom')
INSERT [dbo].[JOB] ([ID], [Name], [NameForm]) VALUES (N'CV006     ', N'Quản lí nhân viên', N'fStaff')
INSERT [dbo].[JOB] ([ID], [Name], [NameForm]) VALUES (N'CV007     ', N'Quản lí khách hàng', N'fCustomer')
INSERT [dbo].[JOB] ([ID], [Name], [NameForm]) VALUES (N'CV008     ', N'Quản lí hoá đơn', N'fBill')
INSERT [dbo].[JOB] ([ID], [Name], [NameForm]) VALUES (N'CV009     ', N'Quản lí dịch vụ', N'fService')
INSERT [dbo].[JOB] ([ID], [Name], [NameForm]) VALUES (N'CV010     ', N'Quy định', N'fParameter')
GO
INSERT [dbo].[Parameter] ([Name], [Value], [Describe], [DateModify]) VALUES (N'QĐ1.1', 9, N'Phòng Suite (SUT) có tối đa 9 người', NULL)
INSERT [dbo].[Parameter] ([Name], [Value], [Describe], [DateModify]) VALUES (N'QĐ1.2', 6, N'Phòng Deluxe (DLX) có tối đa 6 người', NULL)
INSERT [dbo].[Parameter] ([Name], [Value], [Describe], [DateModify]) VALUES (N'QĐ1.3', 4, N'Phòng Superior (SUP) có tối đa 4 người', NULL)
INSERT [dbo].[Parameter] ([Name], [Value], [Describe], [DateModify]) VALUES (N'QĐ1.4', 3, N'Phòng Standard (STD) có tối đa 3 người', NULL)
INSERT [dbo].[Parameter] ([Name], [Value], [Describe], [DateModify]) VALUES (N'QĐ2.1', 6, N'Đơn giá phòng cho 6 khách Phòng Suite (SUT)', CAST(N'2018-06-25T02:02:00' AS SmallDateTime))
INSERT [dbo].[Parameter] ([Name], [Value], [Describe], [DateModify]) VALUES (N'QĐ2.2', 4, N'Đơn giá phòng cho 4 khách Phòng Deluxe (DLX)', NULL)
INSERT [dbo].[Parameter] ([Name], [Value], [Describe], [DateModify]) VALUES (N'QĐ2.3', 3, N'Đơn giá phòng cho 3 khách Phòng Superior (SUP)', NULL)
INSERT [dbo].[Parameter] ([Name], [Value], [Describe], [DateModify]) VALUES (N'QĐ2.4', 2, N'Đơn giá phòng cho 2 khách Phòng Phòng Standard (STD)', NULL)
INSERT [dbo].[Parameter] ([Name], [Value], [Describe], [DateModify]) VALUES (N'QĐ3', 0.25, N'Mỗi khách hàng vượt số lượng tiêu chuẩn phụ thu thêm 0.25', NULL)
INSERT [dbo].[Parameter] ([Name], [Value], [Describe], [DateModify]) VALUES (N'QĐ4', 1.5, N'Khách nước ngoài phụ thu 1.5', CAST(N'2021-04-19T22:21:00' AS SmallDateTime))
GO
INSERT [dbo].[ReceiveRoom] ([ID], [IDBookRoom], [IDRoom]) VALUES (N'PN001     ', N'DP001     ', N'PH001     ')
INSERT [dbo].[ReceiveRoom] ([ID], [IDBookRoom], [IDRoom]) VALUES (N'PN002     ', N'DP002     ', N'PH002     ')
INSERT [dbo].[ReceiveRoom] ([ID], [IDBookRoom], [IDRoom]) VALUES (N'PN003     ', N'DP003     ', N'PH003     ')
INSERT [dbo].[ReceiveRoom] ([ID], [IDBookRoom], [IDRoom]) VALUES (N'PN004     ', N'DP004     ', N'PH004     ')
INSERT [dbo].[ReceiveRoom] ([ID], [IDBookRoom], [IDRoom]) VALUES (N'PN005     ', N'DP005     ', N'PH005     ')
INSERT [dbo].[ReceiveRoom] ([ID], [IDBookRoom], [IDRoom]) VALUES (N'PN006     ', N'DP006     ', N'PH006     ')
INSERT [dbo].[ReceiveRoom] ([ID], [IDBookRoom], [IDRoom]) VALUES (N'PN007     ', N'DP007     ', N'PH007     ')
INSERT [dbo].[ReceiveRoom] ([ID], [IDBookRoom], [IDRoom]) VALUES (N'PN008     ', N'DP008     ', N'PH008     ')
INSERT [dbo].[ReceiveRoom] ([ID], [IDBookRoom], [IDRoom]) VALUES (N'PN009     ', N'DP009     ', N'PH009     ')
INSERT [dbo].[ReceiveRoom] ([ID], [IDBookRoom], [IDRoom]) VALUES (N'PN010     ', N'DP010     ', N'PH005     ')
INSERT [dbo].[ReceiveRoom] ([ID], [IDBookRoom], [IDRoom]) VALUES (N'PN011     ', N'DP011     ', N'PH006     ')
INSERT [dbo].[ReceiveRoom] ([ID], [IDBookRoom], [IDRoom]) VALUES (N'PN012     ', N'DP012     ', N'PH012     ')
INSERT [dbo].[ReceiveRoom] ([ID], [IDBookRoom], [IDRoom]) VALUES (N'PN013     ', N'DP013     ', N'PH009     ')
INSERT [dbo].[ReceiveRoom] ([ID], [IDBookRoom], [IDRoom]) VALUES (N'PN014     ', N'DP014     ', N'PH013     ')
INSERT [dbo].[ReceiveRoom] ([ID], [IDBookRoom], [IDRoom]) VALUES (N'PN015     ', N'DP015     ', N'PH016     ')
INSERT [dbo].[ReceiveRoom] ([ID], [IDBookRoom], [IDRoom]) VALUES (N'PN016     ', N'DP016     ', N'PH001     ')
INSERT [dbo].[ReceiveRoom] ([ID], [IDBookRoom], [IDRoom]) VALUES (N'PN017     ', N'DP017     ', N'PH018     ')
INSERT [dbo].[ReceiveRoom] ([ID], [IDBookRoom], [IDRoom]) VALUES (N'PN018     ', N'DP018     ', N'PH007     ')
INSERT [dbo].[ReceiveRoom] ([ID], [IDBookRoom], [IDRoom]) VALUES (N'PN019     ', N'DP019     ', N'PH008     ')
INSERT [dbo].[ReceiveRoom] ([ID], [IDBookRoom], [IDRoom]) VALUES (N'PN020     ', N'DP020     ', N'PH014     ')
INSERT [dbo].[ReceiveRoom] ([ID], [IDBookRoom], [IDRoom]) VALUES (N'PN021     ', N'DP025     ', N'PH006     ')
INSERT [dbo].[ReceiveRoom] ([ID], [IDBookRoom], [IDRoom]) VALUES (N'PN022     ', N'DP025     ', N'PH009     ')
INSERT [dbo].[ReceiveRoom] ([ID], [IDBookRoom], [IDRoom]) VALUES (N'PN023     ', N'DP025     ', N'PH011     ')
INSERT [dbo].[ReceiveRoom] ([ID], [IDBookRoom], [IDRoom]) VALUES (N'PN024     ', N'DP026     ', N'PH001     ')
INSERT [dbo].[ReceiveRoom] ([ID], [IDBookRoom], [IDRoom]) VALUES (N'PN025     ', N'DP027     ', N'PH013     ')
INSERT [dbo].[ReceiveRoom] ([ID], [IDBookRoom], [IDRoom]) VALUES (N'PN026     ', N'DP029     ', N'PH009     ')
INSERT [dbo].[ReceiveRoom] ([ID], [IDBookRoom], [IDRoom]) VALUES (N'PN027     ', N'DP031     ', N'PH001     ')
INSERT [dbo].[ReceiveRoom] ([ID], [IDBookRoom], [IDRoom]) VALUES (N'PN028     ', N'DP032     ', N'PH005     ')
INSERT [dbo].[ReceiveRoom] ([ID], [IDBookRoom], [IDRoom]) VALUES (N'PN029     ', N'DP033     ', N'PH009     ')
INSERT [dbo].[ReceiveRoom] ([ID], [IDBookRoom], [IDRoom]) VALUES (N'PN030     ', N'DP034     ', N'PH009     ')
INSERT [dbo].[ReceiveRoom] ([ID], [IDBookRoom], [IDRoom]) VALUES (N'PN031     ', N'DP036     ', N'PH011     ')
INSERT [dbo].[ReceiveRoom] ([ID], [IDBookRoom], [IDRoom]) VALUES (N'PN032     ', N'DP035     ', N'PH006     ')
INSERT [dbo].[ReceiveRoom] ([ID], [IDBookRoom], [IDRoom]) VALUES (N'PN033     ', N'DP037     ', N'PH012     ')
INSERT [dbo].[ReceiveRoom] ([ID], [IDBookRoom], [IDRoom]) VALUES (N'PN034     ', N'DP038     ', N'PH001     ')
INSERT [dbo].[ReceiveRoom] ([ID], [IDBookRoom], [IDRoom]) VALUES (N'PN035     ', N'DP039     ', N'PH001     ')
INSERT [dbo].[ReceiveRoom] ([ID], [IDBookRoom], [IDRoom]) VALUES (N'PN036     ', N'DP042     ', N'PH005     ')
GO
INSERT [dbo].[ReceiveRoomDetails] ([IDReceiveRoom], [IDCustomerOther]) VALUES (N'PN001     ', N'KH013     ')
INSERT [dbo].[ReceiveRoomDetails] ([IDReceiveRoom], [IDCustomerOther]) VALUES (N'PN002     ', N'KH012     ')
INSERT [dbo].[ReceiveRoomDetails] ([IDReceiveRoom], [IDCustomerOther]) VALUES (N'PN003     ', N'KH014     ')
INSERT [dbo].[ReceiveRoomDetails] ([IDReceiveRoom], [IDCustomerOther]) VALUES (N'PN004     ', N'KH003     ')
INSERT [dbo].[ReceiveRoomDetails] ([IDReceiveRoom], [IDCustomerOther]) VALUES (N'PN005     ', N'KH005     ')
INSERT [dbo].[ReceiveRoomDetails] ([IDReceiveRoom], [IDCustomerOther]) VALUES (N'PN006     ', N'KH006     ')
INSERT [dbo].[ReceiveRoomDetails] ([IDReceiveRoom], [IDCustomerOther]) VALUES (N'PN021     ', N'KH013     ')
GO
INSERT [dbo].[REPORT] ([idRoomType], [value], [rate], [Month], [Year]) VALUES (N'LP001     ', 60000000, 64.43, 3, 2021)
INSERT [dbo].[REPORT] ([idRoomType], [value], [rate], [Month], [Year]) VALUES (N'LP001     ', 1163075000, 0, 4, 2021)
INSERT [dbo].[REPORT] ([idRoomType], [value], [rate], [Month], [Year]) VALUES (N'LP002     ', 0, 0, 3, 2021)
INSERT [dbo].[REPORT] ([idRoomType], [value], [rate], [Month], [Year]) VALUES (N'LP002     ', 408275000, 0, 4, 2021)
INSERT [dbo].[REPORT] ([idRoomType], [value], [rate], [Month], [Year]) VALUES (N'LP003     ', 8125000, 8.72, 3, 2021)
INSERT [dbo].[REPORT] ([idRoomType], [value], [rate], [Month], [Year]) VALUES (N'LP003     ', 162500000, 0, 4, 2021)
INSERT [dbo].[REPORT] ([idRoomType], [value], [rate], [Month], [Year]) VALUES (N'LP004     ', 25000000, 26.85, 3, 2021)
INSERT [dbo].[REPORT] ([idRoomType], [value], [rate], [Month], [Year]) VALUES (N'LP004     ', 141300000, 0, 4, 2021)
GO
INSERT [dbo].[Room] ([ID], [Name], [IDRoomType], [IDStatusRoom]) VALUES (N'PH001     ', N'Phòng 101', N'LP001     ', 2)
INSERT [dbo].[Room] ([ID], [Name], [IDRoomType], [IDStatusRoom]) VALUES (N'PH002     ', N'Phòng 102', N'LP002     ', 2)
INSERT [dbo].[Room] ([ID], [Name], [IDRoomType], [IDStatusRoom]) VALUES (N'PH003     ', N'Phòng 103', N'LP003     ', 2)
INSERT [dbo].[Room] ([ID], [Name], [IDRoomType], [IDStatusRoom]) VALUES (N'PH004     ', N'Phòng 104', N'LP004     ', 2)
INSERT [dbo].[Room] ([ID], [Name], [IDRoomType], [IDStatusRoom]) VALUES (N'PH005     ', N'Phòng 105', N'LP001     ', 1)
INSERT [dbo].[Room] ([ID], [Name], [IDRoomType], [IDStatusRoom]) VALUES (N'PH006     ', N'Phòng 106', N'LP004     ', 2)
INSERT [dbo].[Room] ([ID], [Name], [IDRoomType], [IDStatusRoom]) VALUES (N'PH007     ', N'Phòng 107', N'LP004     ', 1)
INSERT [dbo].[Room] ([ID], [Name], [IDRoomType], [IDStatusRoom]) VALUES (N'PH008     ', N'Phòng 108', N'LP004     ', 2)
INSERT [dbo].[Room] ([ID], [Name], [IDRoomType], [IDStatusRoom]) VALUES (N'PH009     ', N'Phòng 109', N'LP003     ', 2)
INSERT [dbo].[Room] ([ID], [Name], [IDRoomType], [IDStatusRoom]) VALUES (N'PH010     ', N'Phòng 201', N'LP003     ', 2)
INSERT [dbo].[Room] ([ID], [Name], [IDRoomType], [IDStatusRoom]) VALUES (N'PH011     ', N'Phòng 202', N'LP003     ', 2)
INSERT [dbo].[Room] ([ID], [Name], [IDRoomType], [IDStatusRoom]) VALUES (N'PH012     ', N'Phòng 203', N'LP002     ', 2)
INSERT [dbo].[Room] ([ID], [Name], [IDRoomType], [IDStatusRoom]) VALUES (N'PH013     ', N'Phòng 204', N'LP002     ', 1)
INSERT [dbo].[Room] ([ID], [Name], [IDRoomType], [IDStatusRoom]) VALUES (N'PH014     ', N'Phòng 205', N'LP004     ', 2)
INSERT [dbo].[Room] ([ID], [Name], [IDRoomType], [IDStatusRoom]) VALUES (N'PH015     ', N'Phòng 206', N'LP003     ', 1)
INSERT [dbo].[Room] ([ID], [Name], [IDRoomType], [IDStatusRoom]) VALUES (N'PH016     ', N'Phòng 207', N'LP002     ', 1)
INSERT [dbo].[Room] ([ID], [Name], [IDRoomType], [IDStatusRoom]) VALUES (N'PH017     ', N'Phòng 208', N'LP004     ', 2)
INSERT [dbo].[Room] ([ID], [Name], [IDRoomType], [IDStatusRoom]) VALUES (N'PH018     ', N'Phòng 209', N'LP002     ', 1)
INSERT [dbo].[Room] ([ID], [Name], [IDRoomType], [IDStatusRoom]) VALUES (N'PH019     ', N'Phòng 210', N'LP004     ', 1)
INSERT [dbo].[Room] ([ID], [Name], [IDRoomType], [IDStatusRoom]) VALUES (N'PH020     ', N'Phòng 211', N'LP004     ', 1)
INSERT [dbo].[Room] ([ID], [Name], [IDRoomType], [IDStatusRoom]) VALUES (N'PH021     ', N'Phòng 212', N'LP003     ', 1)
GO
INSERT [dbo].[RoomType] ([ID], [Name], [Price], [LimitPerson]) VALUES (N'LP001     ', N'Phòng Suite (SUT)', 10000000, 6)
INSERT [dbo].[RoomType] ([ID], [Name], [Price], [LimitPerson]) VALUES (N'LP002     ', N'Phòng Deluxe (DLX)', 7000000, 4)
INSERT [dbo].[RoomType] ([ID], [Name], [Price], [LimitPerson]) VALUES (N'LP003     ', N'Phòng Superior (SUP)', 4000000, 3)
INSERT [dbo].[RoomType] ([ID], [Name], [Price], [LimitPerson]) VALUES (N'LP004     ', N'Phòng Standard (STD)', 1000000, 2)
GO
INSERT [dbo].[Service] ([ID], [Name], [IDServiceType], [Price]) VALUES (N'DV001     ', N'Spa', N'LV002     ', 1200000)
INSERT [dbo].[Service] ([ID], [Name], [IDServiceType], [Price]) VALUES (N'DV002     ', N'Fitness', N'LV002     ', 100000)
INSERT [dbo].[Service] ([ID], [Name], [IDServiceType], [Price]) VALUES (N'DV003     ', N'Tam dương trùng phùng với bông cải uyên ương', N'LV001     ', 200000)
INSERT [dbo].[Service] ([ID], [Name], [IDServiceType], [Price]) VALUES (N'DV004     ', N'Karaoke', N'LV002     ', 1000000)
INSERT [dbo].[Service] ([ID], [Name], [IDServiceType], [Price]) VALUES (N'DV005     ', N'Giặt ủi quần áo', N'LV003     ', 150000)
INSERT [dbo].[Service] ([ID], [Name], [IDServiceType], [Price]) VALUES (N'DV006     ', N'Dịch vụ xe đưa đón sân bay', N'LV003     ', 200000)
INSERT [dbo].[Service] ([ID], [Name], [IDServiceType], [Price]) VALUES (N'DV007     ', N'Dịch vụ cho thuê tự lái', N'LV003     ', 500000)
INSERT [dbo].[Service] ([ID], [Name], [IDServiceType], [Price]) VALUES (N'DV008     ', N'Dịch vụ trông trẻ', N'LV003     ', 800000)
INSERT [dbo].[Service] ([ID], [Name], [IDServiceType], [Price]) VALUES (N'DV009     ', N'Bể bơi 4 mùa', N'LV002     ', 1000000)
INSERT [dbo].[Service] ([ID], [Name], [IDServiceType], [Price]) VALUES (N'DV010     ', N'Sân tennis', N'LV002     ', 500000)
INSERT [dbo].[Service] ([ID], [Name], [IDServiceType], [Price]) VALUES (N'DV011     ', N'Mực khoanh chiên vàng & Gỏi bắp bò rau mùi với bánh tráng mè kiểu Thái & Phượng Hoàng tảo biển', N'LV001     ', 500000)
INSERT [dbo].[Service] ([ID], [Name], [IDServiceType], [Price]) VALUES (N'DV012     ', N'Súp nấm hải vị với gà và thịt cua', N'LV001     ', 200000)
INSERT [dbo].[Service] ([ID], [Name], [IDServiceType], [Price]) VALUES (N'DV013     ', N'Heo sữa quay bánh bao nửa con', N'LV001     ', 2000000)
INSERT [dbo].[Service] ([ID], [Name], [IDServiceType], [Price]) VALUES (N'DV014     ', N'Chè bột báng trái cây kiểu Melaka', N'LV001     ', 50000)
INSERT [dbo].[Service] ([ID], [Name], [IDServiceType], [Price]) VALUES (N'DV015     ', N'Gỏi bò Cung đình & Phượng hoàng tảo biển & Sườn heo nướng kiểu Hàn Quốc', N'LV001     ', 500000)
INSERT [dbo].[Service] ([ID], [Name], [IDServiceType], [Price]) VALUES (N'DV016     ', N'Súp kem bắp hải sản kiểu Pháp', N'LV001     ', 150000)
INSERT [dbo].[Service] ([ID], [Name], [IDServiceType], [Price]) VALUES (N'DV017     ', N'Cơm chiên gà cá mặn kiểu Hongkong', N'LV001     ', 75000)
INSERT [dbo].[Service] ([ID], [Name], [IDServiceType], [Price]) VALUES (N'DV018     ', N'Bánh tiramisu socola', N'LV001     ', 50000)
INSERT [dbo].[Service] ([ID], [Name], [IDServiceType], [Price]) VALUES (N'DV019     ', N'Chivas 18', N'LV001     ', 1800000)
INSERT [dbo].[Service] ([ID], [Name], [IDServiceType], [Price]) VALUES (N'DV020     ', N'Vodka 3 Zoka', N'LV004     ', 500000)
INSERT [dbo].[Service] ([ID], [Name], [IDServiceType], [Price]) VALUES (N'DV021     ', N'Chivas 12', N'LV001     ', 1200000)
INSERT [dbo].[Service] ([ID], [Name], [IDServiceType], [Price]) VALUES (N'DV022     ', N'Cocktail Negroni', N'LV004     ', 300000)
INSERT [dbo].[Service] ([ID], [Name], [IDServiceType], [Price]) VALUES (N'DV023     ', N'Cocktail Bellini', N'LV004     ', 300000)
INSERT [dbo].[Service] ([ID], [Name], [IDServiceType], [Price]) VALUES (N'DV024     ', N'Cocktail The Bloody Mary', N'LV004     ', 500000)
INSERT [dbo].[Service] ([ID], [Name], [IDServiceType], [Price]) VALUES (N'DV025     ', N'Cocktail Old Fashioned', N'LV004     ', 400000)
INSERT [dbo].[Service] ([ID], [Name], [IDServiceType], [Price]) VALUES (N'DV026     ', N'Lẩu dê', N'LV001     ', 100000)
INSERT [dbo].[Service] ([ID], [Name], [IDServiceType], [Price]) VALUES (N'DV027     ', N'Vịt quay Bắc Kinh', N'LV001     ', 1000000)
INSERT [dbo].[Service] ([ID], [Name], [IDServiceType], [Price]) VALUES (N'DV028     ', N'Lẩu hải sản', N'LV001     ', 1000000)
INSERT [dbo].[Service] ([ID], [Name], [IDServiceType], [Price]) VALUES (N'DV029     ', N'Cháo vịt', N'LV001     ', 200000)
INSERT [dbo].[Service] ([ID], [Name], [IDServiceType], [Price]) VALUES (N'DV030     ', N'Trà chanh', N'LV001     ', 50000)
GO
INSERT [dbo].[ServiceType] ([ID], [Name]) VALUES (N'LV001     ', N'Ăn uống')
INSERT [dbo].[ServiceType] ([ID], [Name]) VALUES (N'LV002     ', N'Giải trí')
INSERT [dbo].[ServiceType] ([ID], [Name]) VALUES (N'LV003     ', N'Tiện ích')
INSERT [dbo].[ServiceType] ([ID], [Name]) VALUES (N'LV004     ', N'Đồ uống')
INSERT [dbo].[ServiceType] ([ID], [Name]) VALUES (N'LV005     ', N'Thú vui')
GO
INSERT [dbo].[Staff] ([UserName], [DisplayName], [PassWord], [IDStaffType], [IDCard], [DateOfBirth], [Sex], [Address], [PhoneNumber], [StartDay]) VALUES (N'admin', N'Thanh Hằng', N'202cb962ac59075b964b07152d234b70', N'CD001     ', N'123457145', CAST(N'2000-09-15' AS Date), N'Nữ', N'Huế', 147852, CAST(N'2019-05-23' AS Date))
INSERT [dbo].[Staff] ([UserName], [DisplayName], [PassWord], [IDStaffType], [IDCard], [DateOfBirth], [Sex], [Address], [PhoneNumber], [StartDay]) VALUES (N'hang', N'Thanh Hang', N'123456', N'CD001     ', N'123', CAST(N'2000-05-01' AS Date), N'Nữ', N'Huế', 912472758, CAST(N'2018-05-16' AS Date))
INSERT [dbo].[Staff] ([UserName], [DisplayName], [PassWord], [IDStaffType], [IDCard], [DateOfBirth], [Sex], [Address], [PhoneNumber], [StartDay]) VALUES (N'hang@', N'hang@', N'e10adc3949ba59abbe56e057f20f883e', N'CD001     ', N'191930005', CAST(N'2000-06-30' AS Date), N'Nữ', N'Huế', 982873872, CAST(N'2020-01-22' AS Date))
INSERT [dbo].[Staff] ([UserName], [DisplayName], [PassWord], [IDStaffType], [IDCard], [DateOfBirth], [Sex], [Address], [PhoneNumber], [StartDay]) VALUES (N'hang123', N'Hang123', N'e10adc3949ba59abbe56e057f20f883e', N'CD001     ', N'191911789', CAST(N'2000-03-23' AS Date), N'Nữ', N'78 Hồ Đắc Di', 918947342, CAST(N'2019-04-25' AS Date))
INSERT [dbo].[Staff] ([UserName], [DisplayName], [PassWord], [IDStaffType], [IDCard], [DateOfBirth], [Sex], [Address], [PhoneNumber], [StartDay]) VALUES (N'hang456', N'hang456', N'e10adc3949ba59abbe56e057f20f883e', N'CD002     ', N'1919121212', CAST(N'2000-05-19' AS Date), N'Nữ', N'990 Hùng Vương', 982838728, CAST(N'2020-07-16' AS Date))
INSERT [dbo].[Staff] ([UserName], [DisplayName], [PassWord], [IDStaffType], [IDCard], [DateOfBirth], [Sex], [Address], [PhoneNumber], [StartDay]) VALUES (N'meo', N'meo', N'e10adc3949ba59abbe56e057f20f883e', N'CD001     ', N'2712', CAST(N'1997-11-13' AS Date), N'Nam', N'Đà Nẵng', 123456789, CAST(N'2018-05-16' AS Date))
INSERT [dbo].[Staff] ([UserName], [DisplayName], [PassWord], [IDStaffType], [IDCard], [DateOfBirth], [Sex], [Address], [PhoneNumber], [StartDay]) VALUES (N'meomeo', N'meomeo', N'e10adc3949ba59abbe56e057f20f883e', N'CD001     ', N'16521169', CAST(N'1998-06-18' AS Date), N'Nam', N'Huế', 123456789, CAST(N'2018-05-16' AS Date))
INSERT [dbo].[Staff] ([UserName], [DisplayName], [PassWord], [IDStaffType], [IDCard], [DateOfBirth], [Sex], [Address], [PhoneNumber], [StartDay]) VALUES (N'thanhhang', N'ThanhHang', N'e10adc3949ba59abbe56e057f20f883e', N'CD001     ', N'191911729', CAST(N'1998-04-06' AS Date), N'Nữ', N'Huế', 913872323, CAST(N'2021-04-13' AS Date))
GO
INSERT [dbo].[StaffType] ([ID], [Name]) VALUES (N'CD001     ', N'Quản lí')
INSERT [dbo].[StaffType] ([ID], [Name]) VALUES (N'CD002     ', N'Lễ tân')
GO
INSERT [dbo].[StatusBill] ([ID], [Name]) VALUES (1, N'Chưa thanh toán')
INSERT [dbo].[StatusBill] ([ID], [Name]) VALUES (2, N'Đã thanh toán')
GO
INSERT [dbo].[StatusRoom] ([ID], [Name]) VALUES (1, N'Trống')
INSERT [dbo].[StatusRoom] ([ID], [Name]) VALUES (2, N'Có người')
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Customer__43A2A4E30684BC31]    Script Date: 5/8/2021 10:41:03 PM ******/
ALTER TABLE [dbo].[Customer] ADD UNIQUE NONCLUSTERED 
(
	[IDCard] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Paramete__737584F67C95BE43]    Script Date: 5/8/2021 10:41:03 PM ******/
ALTER TABLE [dbo].[Parameter] ADD UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Staff__43A2A4E3160235C8]    Script Date: 5/8/2021 10:41:03 PM ******/
ALTER TABLE [dbo].[Staff] ADD UNIQUE NONCLUSTERED 
(
	[IDCard] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Bill] ADD  DEFAULT (getdate()) FOR [DateOfCreate]
GO
ALTER TABLE [dbo].[Bill] ADD  DEFAULT ((0)) FOR [RoomPrice]
GO
ALTER TABLE [dbo].[Bill] ADD  DEFAULT ((0)) FOR [ServicePrice]
GO
ALTER TABLE [dbo].[Bill] ADD  DEFAULT ((0)) FOR [TotalPrice]
GO
ALTER TABLE [dbo].[Bill] ADD  DEFAULT ((0)) FOR [Discount]
GO
ALTER TABLE [dbo].[Bill] ADD  CONSTRAINT [DF__Bill__IDStatusBi__1DB06A4F]  DEFAULT ((1)) FOR [IDStatusBill]
GO
ALTER TABLE [dbo].[Bill] ADD  DEFAULT ((0)) FOR [Surcharge]
GO
ALTER TABLE [dbo].[BillDetails] ADD  DEFAULT ((0)) FOR [TotalPrice]
GO
ALTER TABLE [dbo].[Customer] ADD  DEFAULT (N'No Name') FOR [Name]
GO
ALTER TABLE [dbo].[CustomerType] ADD  DEFAULT (N'No Name') FOR [Name]
GO
ALTER TABLE [dbo].[Parameter] ADD  DEFAULT (N'No Name') FOR [Name]
GO
ALTER TABLE [dbo].[Parameter] ADD  DEFAULT (getdate()) FOR [DateModify]
GO
ALTER TABLE [dbo].[REPORT] ADD  DEFAULT ((0)) FOR [value]
GO
ALTER TABLE [dbo].[REPORT] ADD  DEFAULT ((0)) FOR [rate]
GO
ALTER TABLE [dbo].[REPORT] ADD  DEFAULT ((1)) FOR [Month]
GO
ALTER TABLE [dbo].[REPORT] ADD  DEFAULT ((1990)) FOR [Year]
GO
ALTER TABLE [dbo].[Room] ADD  DEFAULT (N'No Name') FOR [Name]
GO
ALTER TABLE [dbo].[RoomType] ADD  DEFAULT (N'No Name') FOR [Name]
GO
ALTER TABLE [dbo].[Service] ADD  DEFAULT (N'No Name') FOR [Name]
GO
ALTER TABLE [dbo].[ServiceType] ADD  DEFAULT (N'No Name') FOR [Name]
GO
ALTER TABLE [dbo].[Staff] ADD  DEFAULT (N'No Name') FOR [DisplayName]
GO
ALTER TABLE [dbo].[StaffType] ADD  DEFAULT (N'No Name') FOR [Name]
GO
ALTER TABLE [dbo].[StatusBill] ADD  DEFAULT (N'No Name') FOR [Name]
GO
ALTER TABLE [dbo].[StatusRoom] ADD  DEFAULT (N'No Name') FOR [Name]
GO
ALTER TABLE [dbo].[ACCESS]  WITH CHECK ADD FOREIGN KEY([IDJob])
REFERENCES [dbo].[JOB] ([ID])
GO
ALTER TABLE [dbo].[ACCESS]  WITH CHECK ADD FOREIGN KEY([IDStaffType])
REFERENCES [dbo].[StaffType] ([ID])
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD FOREIGN KEY([IDReceiveRoom])
REFERENCES [dbo].[ReceiveRoom] ([ID])
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD FOREIGN KEY([StaffSetUp])
REFERENCES [dbo].[Staff] ([UserName])
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD  CONSTRAINT [FK_Bill_StatusBill] FOREIGN KEY([IDStatusBill])
REFERENCES [dbo].[StatusBill] ([ID])
GO
ALTER TABLE [dbo].[Bill] CHECK CONSTRAINT [FK_Bill_StatusBill]
GO
ALTER TABLE [dbo].[BillDetails]  WITH CHECK ADD FOREIGN KEY([IDService])
REFERENCES [dbo].[Service] ([ID])
GO
ALTER TABLE [dbo].[BillDetails]  WITH CHECK ADD  CONSTRAINT [FK_BillDetails_Bill] FOREIGN KEY([IDBill])
REFERENCES [dbo].[Bill] ([ID])
GO
ALTER TABLE [dbo].[BillDetails] CHECK CONSTRAINT [FK_BillDetails_Bill]
GO
ALTER TABLE [dbo].[BookRoom]  WITH CHECK ADD FOREIGN KEY([IDCustomer])
REFERENCES [dbo].[Customer] ([ID])
GO
ALTER TABLE [dbo].[BookRoom]  WITH CHECK ADD FOREIGN KEY([IDRoomType])
REFERENCES [dbo].[RoomType] ([ID])
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_CustomerType] FOREIGN KEY([IDCustomerType])
REFERENCES [dbo].[CustomerType] ([ID])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_CustomerType]
GO
ALTER TABLE [dbo].[ReceiveRoom]  WITH CHECK ADD FOREIGN KEY([IDBookRoom])
REFERENCES [dbo].[BookRoom] ([ID])
GO
ALTER TABLE [dbo].[ReceiveRoom]  WITH CHECK ADD FOREIGN KEY([IDRoom])
REFERENCES [dbo].[Room] ([ID])
GO
ALTER TABLE [dbo].[ReceiveRoomDetails]  WITH CHECK ADD FOREIGN KEY([IDCustomerOther])
REFERENCES [dbo].[Customer] ([ID])
GO
ALTER TABLE [dbo].[ReceiveRoomDetails]  WITH CHECK ADD FOREIGN KEY([IDReceiveRoom])
REFERENCES [dbo].[ReceiveRoom] ([ID])
GO
ALTER TABLE [dbo].[REPORT]  WITH CHECK ADD FOREIGN KEY([idRoomType])
REFERENCES [dbo].[RoomType] ([ID])
GO
ALTER TABLE [dbo].[Room]  WITH CHECK ADD FOREIGN KEY([IDRoomType])
REFERENCES [dbo].[RoomType] ([ID])
GO
ALTER TABLE [dbo].[Room]  WITH CHECK ADD  CONSTRAINT [FK_Room_StatusRoom] FOREIGN KEY([IDStatusRoom])
REFERENCES [dbo].[StatusRoom] ([ID])
GO
ALTER TABLE [dbo].[Room] CHECK CONSTRAINT [FK_Room_StatusRoom]
GO
ALTER TABLE [dbo].[Service]  WITH CHECK ADD FOREIGN KEY([IDServiceType])
REFERENCES [dbo].[ServiceType] ([ID])
GO
ALTER TABLE [dbo].[Staff]  WITH CHECK ADD FOREIGN KEY([IDStaffType])
REFERENCES [dbo].[StaffType] ([ID])
GO
/****** Object:  StoredProcedure [dbo].[GetAutomaticID]    Script Date: 5/8/2021 10:41:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GetAutomaticID]
@table NCHAR(50),@nameID CHAR(10)
AS
BEGIN
	DECLARE @SQL NVARCHAR(2000),@Max NCHAR(10)
	SET @SQL ='select TOP 1'+@nameID +' from '+@table+' order by '+@nameID+' DESC '
   execute @Max = sp_executesql @SQL
end
GO
/****** Object:  StoredProcedure [dbo].[GetIDReceiveRoomCurrent]    Script Date: 5/8/2021 10:41:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GetIDReceiveRoomCurrent]
as
begin
	select MAX(id)
	from ReceiveRoom
end
GO
/****** Object:  StoredProcedure [dbo].[InsertReceiveRoom]    Script Date: 5/8/2021 10:41:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[InsertReceiveRoom]
@id char(10), @idBookRoom char(10),@idRoom char(10)
as
begin
	insert into ReceiveRoom(ID,IDBookRoom,IDRoom)
	values(@id,@idBookRoom,@idRoom)
	update Room
	set IDStatusRoom=2
	where ID=@idRoom
end
GO
/****** Object:  StoredProcedure [dbo].[InsertReceiveRoomDetails]    Script Date: 5/8/2021 10:41:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[InsertReceiveRoomDetails]
@idReceiveRoom char(10),@idCustomer char(10)
as
begin
	insert into ReceiveRoomDetails(IDReceiveRoom,IDCustomerOther)
	values(@idReceiveRoom,@idCustomer)
end
GO
/****** Object:  StoredProcedure [dbo].[ShowBookRoomInfo]    Script Date: 5/8/2021 10:41:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[ShowBookRoomInfo]
@idBookRoom char(10)
as
begin
	select B.Name[FullName],B.IDCard[IDCard],C.Name[RoomTypeName],A.DateCheckIn[DateCheckIn],A.DateCheckOut[DateCheckOut],C.LimitPerson[LimitPerson],C.Price[Price]
	from BookRoom A,Customer B,RoomType C
	where A.ID=@idBookRoom and A.IDCustomer=B.ID and A.IDRoomType=C.ID
end
GO
/****** Object:  StoredProcedure [dbo].[USP_ChekcAccess]    Script Date: 5/8/2021 10:41:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[USP_ChekcAccess] 
@username NVARCHAR(100), @formname NVARCHAR(100)
AS
BEGIN
	SELECT UserName FROM dbo.Staff INNER JOIN dbo.StaffType ON StaffType.ID = Staff.IDStaffType 
	INNER JOIN access ON access.Idstafftype = stafftype.ID INNER JOIN job ON job.id = access.idjob
	WHERE UserName = @username AND @formname LIKE NameForm
END
GO
/****** Object:  StoredProcedure [dbo].[USP_DeleteAccess]    Script Date: 5/8/2021 10:41:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_DeleteAccess]
@idJob char(10), @idStaffType char(10)
AS
BEGIN
	DELETE access WHERE @idJob = idjob AND @idStaffType = idStaffType
END
GO
/****** Object:  StoredProcedure [dbo].[USP_DeleteBookRoom]    Script Date: 5/8/2021 10:41:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[USP_DeleteBookRoom]
@id char(10)
as
begin
	delete from BookRoom
	where ID=@id
end
GO
/****** Object:  StoredProcedure [dbo].[USP_DeleteReceiveRoomDetails]    Script Date: 5/8/2021 10:41:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[USP_DeleteReceiveRoomDetails]
@idReceiveRoom char(10),@idCustomer char(10)
as
begin
	delete from ReceiveRoomDetails
	where IDCustomerOther=@idCustomer and IDReceiveRoom=@idReceiveRoom
end
GO
/****** Object:  StoredProcedure [dbo].[USP_DeleteStaffType]    Script Date: 5/8/2021 10:41:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_DeleteStaffType]
@id char(10)
AS
begin
	DECLARE @count int = 0
	SELECT @count = COUNT(*) FROM staff WHERE @id = staff.IDStaffType
	IF(@count = 0)
	begin
		delete access where idstafftype = @id
		DELETE staffType WHERE @id = id
	end
END
GO
/****** Object:  StoredProcedure [dbo].[USP_GetCustomerTypeNameByIdCard]    Script Date: 5/8/2021 10:41:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[USP_GetCustomerTypeNameByIdCard]
@idCard nvarchar(100)
as
begin
	select B.Name
	from Customer A, CustomerType B
	where A.IDCustomerType=B.ID and A.IDCard=@idCard
end
GO
/****** Object:  StoredProcedure [dbo].[USP_GetIdBillFromIdRoom]    Script Date: 5/8/2021 10:41:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[USP_GetIdBillFromIdRoom]
@idRoom char(10)
as
begin
	select B.*
	from ReceiveRoom A,Bill B
	where A.ID=B.IDReceiveRoom and B.IDStatusBill=1 and A.IDRoom=@idRoom
end
GO
/****** Object:  StoredProcedure [dbo].[USP_GetIdBillMax]    Script Date: 5/8/2021 10:41:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[USP_GetIdBillMax]
as
select MAX(id)
from Bill
GO
/****** Object:  StoredProcedure [dbo].[USP_GetIDCustomerFromBookRoom]    Script Date: 5/8/2021 10:41:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[USP_GetIDCustomerFromBookRoom]
@idReceiveRoom char(10)
as
begin
	select B.IDCustomer
	from ReceiveRoom A,BookRoom B
	where A.ID=@idReceiveRoom and A.IDBookRoom=B.ID
end
GO
/****** Object:  StoredProcedure [dbo].[USP_GetIdReceiRoomFromIdRoom]    Script Date: 5/8/2021 10:41:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[USP_GetIdReceiRoomFromIdRoom]--IdRoom đưa vào có trạng thái "Có người"
@idRoom char(10)
as
begin
select *
from ReceiveRoom
where IDRoom=@idRoom
order by ID desc
end
GO
/****** Object:  StoredProcedure [dbo].[USP_GetIDRoomFromReceiveRoom]    Script Date: 5/8/2021 10:41:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[USP_GetIDRoomFromReceiveRoom]
@idReceiveRoom char(10)
as
begin
	select IDRoom
	from ReceiveRoom
	where ID=@idReceiveRoom
end
GO
/****** Object:  StoredProcedure [dbo].[USP_GetMaxPersonByRoomType]    Script Date: 5/8/2021 10:41:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[USP_GetMaxPersonByRoomType]
@idRoomType char(10)
as
begin
	if(@idRoomType='LP001')
	select *
	from Parameter
	where Name=N'QĐ1.1'

	if(@idRoomType='LP002')
	select *
	from Parameter
	where Name=N'QĐ1.2'

	if(@idRoomType='LP003')
	select *
	from Parameter
	where Name=N'QĐ1.3'

	if(@idRoomType='LP004')
	select *
	from Parameter
	where Name=N'QĐ1.4'
end
GO
/****** Object:  StoredProcedure [dbo].[USP_GetNameStaffTypeByUserName]    Script Date: 5/8/2021 10:41:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[USP_GetNameStaffTypeByUserName]
@username nvarchar(100)
as
begin
	select B.*
	from Staff A, StaffType B
	where a.IDStaffType=B.ID and A.UserName=@username
end
GO
/****** Object:  StoredProcedure [dbo].[USP_GetPeoples]    Script Date: 5/8/2021 10:41:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[USP_GetPeoples]
@idBill char(10)
as
begin
	select COUNT(B.IDReceiveRoom)
	from ReceiveRoom A,ReceiveRoomDetails B,Bill C
	where A.ID=C.IDReceiveRoom and A.ID=B.IDReceiveRoom and C.ID=@idBill
end
GO
/****** Object:  StoredProcedure [dbo].[USP_GetRoomTypeByIdBookRoom]    Script Date: 5/8/2021 10:41:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[USP_GetRoomTypeByIdBookRoom]
@idBookRoom char(10)
as
begin
	select B.*
	from BookRoom A, RoomType B
	where A.ID=@idBookRoom and A.IDRoomType=B.ID
end
GO
/****** Object:  StoredProcedure [dbo].[USP_GetRoomTypeByIdRoom]    Script Date: 5/8/2021 10:41:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[USP_GetRoomTypeByIdRoom]
@idRoom char(10)
as
begin
	select B.*
	from Room A,RoomType B
	where A.IDRoomType=B.ID and A.ID=@idRoom
end
GO
/****** Object:  StoredProcedure [dbo].[USP_GetStaffSetUp]    Script Date: 5/8/2021 10:41:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[USP_GetStaffSetUp]
@idBill char(10)
as
begin
	select B.*
	from Bill A, Staff B
	where A.ID=@idBill and A.StaffSetUp=B.UserName
end
GO
/****** Object:  StoredProcedure [dbo].[USP_InsertAccess]    Script Date: 5/8/2021 10:41:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[USP_InsertAccess]
@idJob char(10), @idStaffType char(10)
AS
BEGIN
	INSERT INTO access(idjob, idstafftype) VALUES(@idJob, @idStaffType)
END
GO
/****** Object:  StoredProcedure [dbo].[USP_InsertBill]    Script Date: 5/8/2021 10:41:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[USP_InsertBill]
@id char(10),@idReceiveRoom char(10),@staffSetUp nvarchar(100)
as
begin
	insert into Bill(ID,IDReceiveRoom,StaffSetUp)
	values(@id,@idReceiveRoom,@staffSetUp)
end
GO
/****** Object:  StoredProcedure [dbo].[USP_InsertBillDetails]    Script Date: 5/8/2021 10:41:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[USP_InsertBillDetails]
@idBill char(10),@idService char(10),@count int
as
begin
		declare @totalPrice int,@price int
		select @price=Price
		from Service
		where ID=@idService
		set @totalPrice=@price*@count
		insert into BillDetails(IDBill,IDService,Count,TotalPrice)
		values(@idBill,@idService,@count,@totalPrice)
end
GO
/****** Object:  StoredProcedure [dbo].[USP_InsertBookRoom]    Script Date: 5/8/2021 10:41:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[USP_InsertBookRoom]
@id char(10),@idCustomer char(10),@idRoomType char(10),@datecheckin date,@datecheckout date,@datebookroom smalldatetime
as
begin
	insert into BookRoom (ID,IDCustomer,IDRoomType,DateCheckIn,DateCheckOut,DateBookRoom)
	values(@id,@idCustomer,@idRoomType,@datecheckin,@datecheckout,@datebookroom)
end
GO
/****** Object:  StoredProcedure [dbo].[USP_InsertCustomer]    Script Date: 5/8/2021 10:41:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_InsertCustomer]
 @ID char(10),@customerName NVARCHAR(100), @idCustomerType char(10), @idCard NVARCHAR(100),
@address NVARCHAR(200), @dateOfBirth date, @phoneNumber int,
@sex NVARCHAR(100), @nationality NVARCHAR(100)
AS
BEGIN
DECLARE @count INT =0
SELECT @count = COUNT(*) FROM customer WHERE IDCard = @idCard
IF(@count=0)
INSERT INTO dbo.Customer(ID,IDCard,IDCustomerType, Name, DateOfBirth, Address, PhoneNumber, Sex, Nationality)
	VALUES(@ID,@idCard, @idCustomerType, @customerName, @dateOfBirth, @address, @phoneNumber, @sex, @nationality)
	
end
GO
/****** Object:  StoredProcedure [dbo].[USP_InsertCustomer_]    Script Date: 5/8/2021 10:41:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[USP_InsertCustomer_]
@ID char(10),@idCard nvarchar(100),@name nvarchar(100),@idCustomerType char(10), @dateOfBirth Date,@address nvarchar(200),@phoneNumber int,@sex nvarchar(100),@nationality nvarchar(100)
as
begin
	insert into Customer(ID,IDCard,Name,IDCustomerType,DateOfBirth,Address,PhoneNumber,Sex,Nationality)
	values(@ID,@idCard,@name,@idCustomerType,@dateOfBirth,@address,@phoneNumber,@sex,@nationality)
end
GO
/****** Object:  StoredProcedure [dbo].[USP_InsertReport]    Script Date: 5/8/2021 10:41:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[USP_InsertReport]
@idBill char(10)
AS
BEGIN
	DECLARE @month INT = 0
	DECLARE @year INT = 0
	DECLARE @id char(10) 
	DECLARE @price INT = 0
	SELECT @id = dbo.ROOM.IDRoomType, @month = MONTH(bill.DateOfCreate), @year = YEAR(bill.DateOfCreate), @price = bill.TotalPrice
	FROM bill INNER JOIN dbo.RECEIVEROOM ON RECEIVEROOM.ID = bill.IDReceiveRoom 
		INNER JOIN dbo.ROOM ON ROOM.ID = RECEIVEROOM.IDRoom
	WHERE bill.ID = @idBill

	DECLARE @count INT = 0	
	SELECT @count = COUNT(*) FROM report WHERE month = @month AND year = @year and idRoomType = @id
	IF(@count=0) -- khong ton tai roomtype
    BEGIN
		
		INSERT INTO report(idRoomType, Month, Year) SELECT roomtype.ID, @month, @year FROM roomtype 
	END
    UPDATE dbo.REPORT SET value = value + @price WHERE Year = @year AND Month = @month AND idRoomType = @id
END
GO
/****** Object:  StoredProcedure [dbo].[USP_InsertRoom]    Script Date: 5/8/2021 10:41:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_InsertRoom]
@id char(10),@nameRoom NVARCHAR(100), @idRoomType char(10), @idStatusRoom int
AS
INSERT INTO dbo.Room(ID,Name, IDRoomType, IDStatusRoom)
VALUES(@id,@nameRoom, @idRoomType, @idStatusRoom)
GO
/****** Object:  StoredProcedure [dbo].[USP_InsertService]    Script Date: 5/8/2021 10:41:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_InsertService]
@id char(10),@name NVARCHAR(200), @idServiceType char(10), @price int
AS
BEGIN
	INSERT INTO dbo.Service(ID,Name,IDServiceType,Price)
	VALUES(@id,@name, @idServiceType, @price)
END
GO
/****** Object:  StoredProcedure [dbo].[USP_InsertServiceType]    Script Date: 5/8/2021 10:41:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_InsertServiceType]
@id char(10),@name NVARCHAR(100)
AS
BEGIN
	INSERT INTO dbo.ServiceType(ID, name)
	VALUES(@id,@name)
END
GO
/****** Object:  StoredProcedure [dbo].[USP_InsertStaff]    Script Date: 5/8/2021 10:41:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_InsertStaff]
@user NVARCHAR(100), @name NVARCHAR(100), @pass NVARCHAR(100),
@idStaffType char(10),@idCard NVARCHAR(100), @dateOfBirth DATE, @sex NVARCHAR(100),
@address NVARCHAR(200), @phoneNumber INT, @startDay date
AS
BEGIN
	DECLARE @count INT =0
	SELECT @count = COUNT(*) FROM dbo.Staff WHERE UserName = @user OR IDCard = @idCard
	IF(@count >0) RETURN
	INSERT INTO dbo.Staff(UserName, DisplayName, PassWord, IDStaffType, IDCard, DateOfBirth, Sex, Address, PhoneNumber, StartDay)
	VALUES (@user, @name, @pass, @idStaffType,@idCard, @dateOfBirth, @sex, @address, @phoneNumber, @startDay)
END
GO
/****** Object:  StoredProcedure [dbo].[USP_InsertStaffType]    Script Date: 5/8/2021 10:41:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_InsertStaffType] 
@id char(10),@name NVARCHAR(100)
AS
BEGIN
    INSERT INTO staffType(ID,Name) VALUES(@id,@name)
END
GO
/****** Object:  StoredProcedure [dbo].[USP_IsExistBillDetailsOfRoom]    Script Date: 5/8/2021 10:41:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Proc [dbo].[USP_IsExistBillDetailsOfRoom]--Kq > 0 :TH3, ngược lại TH2. Tuy nhiên, trước khi kt đk này phải chắc chắn tồn tại Bill
@idRoom char(10),@idservice char(10)
as
begin
	select *
	from Bill A,BillDetails B,ReceiveRoom C
	where A.IDStatusBill=1 and A.ID=B.IDBill and C.ID=A.IDReceiveRoom and C.IDRoom=@idRoom and B.IDService=@idservice
end
GO
/****** Object:  StoredProcedure [dbo].[USP_IsExistBillOfRoom]    Script Date: 5/8/2021 10:41:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[USP_IsExistBillOfRoom]--Trả về count > 0: tức là đã tồn tại Bill
@idRoom char(10)
as
begin
	select *
	from Bill A,ReceiveRoom B
	where A.IDStatusBill=1 and A.IDReceiveRoom=B.ID and B.IDRoom=@idRoom
end
GO
/****** Object:  StoredProcedure [dbo].[USP_IsIDBookRoomExists]    Script Date: 5/8/2021 10:41:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[USP_IsIDBookRoomExists]
@idBookRoom char(10),@dateNow date
as
begin
	select *
	from BookRoom 
	where ID=@idBookRoom and DateCheckIn>=@dateNow and ID not in
	(
		select IDBookRoom
		from ReceiveRoom
	)
end
GO
/****** Object:  StoredProcedure [dbo].[USP_IsIdCardExists]    Script Date: 5/8/2021 10:41:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[USP_IsIdCardExists]
@idCard nvarchar(100)
as
begin
select *
from Customer
where IDCard=@idCard
end
GO
/****** Object:  StoredProcedure [dbo].[USP_IsIdCardExistsAcc]    Script Date: 5/8/2021 10:41:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[USP_IsIdCardExistsAcc]
@idCard nvarchar(100)
as
begin
	select *
	from Staff
	where IDCard=@idCard
end
GO
/****** Object:  StoredProcedure [dbo].[USP_LoadBookRoomsByDate]    Script Date: 5/8/2021 10:41:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[USP_LoadBookRoomsByDate]
@date Date
as
begin
	select A.ID[Mã đặt phòng], b.Name[Họ và tên],b.IDCard[CMND],C.Name[Loại phòng],A.DateCheckIn[Ngày nhận],A.DateCheckOut[Ngày trả]
	from BookRoom A,Customer B, RoomType C
	where a.IDRoomType=c.ID and A.IDCustomer=B.ID and A.DateBookRoom>=@date 
	order by A.DateBookRoom desc
end
GO
/****** Object:  StoredProcedure [dbo].[USP_LoadBookRoomsByDateID]    Script Date: 5/8/2021 10:41:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[USP_LoadBookRoomsByDateID]
@date Date, @idbookroom char(10)
as
begin
	select A.ID[Mã đặt phòng], b.Name[Họ và tên],b.IDCard[CMND],C.Name[Loại phòng],A.DateCheckIn[Ngày nhận],A.DateCheckOut[Ngày trả]
	from BookRoom A,Customer B, RoomType C
	where a.IDRoomType=c.ID and A.IDCustomer=B.ID and A.DateBookRoom>=@date and A.ID = @idbookroom
	order by A.DateBookRoom desc
end
GO
/****** Object:  StoredProcedure [dbo].[USP_LoadEmptyRoom]    Script Date: 5/8/2021 10:41:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[USP_LoadEmptyRoom]
@idRoomType char(10)
as
begin
	select *
	from Room
	where IDStatusRoom=1 and IDRoomType=@idRoomType
end
GO
/****** Object:  StoredProcedure [dbo].[USP_LoadFullAccessNow]    Script Date: 5/8/2021 10:41:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_LoadFullAccessNow]
@idStaffType char(10)
AS
BEGIN
	SELECT Job.Name, job.ID FROM job INNER JOIN access ON job.Id = Access.IDJob
	WHERE @idStaffType = dbo.Access.IDStaffType
END
GO
/****** Object:  StoredProcedure [dbo].[USP_LoadFullAccessRest]    Script Date: 5/8/2021 10:41:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[USP_LoadFullAccessRest]
@idStaffType char(10)
AS
BEGIN
	SELECT j.Name, j.Id FROM job j
	WHERE NOT EXISTS 
	(
		SELECT * FROM job INNER JOIN access ON job.Id = access.IdJob
		WHERE j.Id = job.Id AND access.idStaffType = @idStaffType
	)
END
GO
/****** Object:  StoredProcedure [dbo].[USP_LoadFUllBill]    Script Date: 5/8/2021 10:41:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_LoadFUllBill] 
AS
BEGIN
	SELECT bill.id, room.Name AS [roomName], Customer.Name as [customerName], StaffSetUp, DateOfCreate, STATUSBILL.Name, TotalPrice, (cast(Discount as nvarchar(4)) + '%') [Discount], cast(TotalPrice*( (100-Discount)/100.0) as int) [FinalPrice]
    FROM dbo.BILL INNER JOIN dbo.RECEIVEROOM ON RECEIVEROOM.ID = BILL.IDReceiveRoom
					INNER JOIN dbo.STATUSBILL ON STATUSBILL.id = bill.IDStatusBill
					INNER JOIN dbo.ROOM ON ROOM.ID = RECEIVEROOM.IDRoom
					inner join bookroom on bookroom.id = RECEIVEROOM.IDBookRoom
					inner join Customer on Customer.ID = BookRoom.IDCustomer
	ORDER BY DateOfCreate DESC
END
GO
/****** Object:  StoredProcedure [dbo].[USP_LoadFullCustomer]    Script Date: 5/8/2021 10:41:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_LoadFullCustomer]
AS
SELECT CUSTOMER.ID, Customer.Name, IDCard, CustomerType.Name as [NameCustomerType], Sex, DateOfBirth, PhoneNumber, Address, Nationality, IDCustomerType 
FROM dbo.Customer INNER JOIN dbo.CustomerType ON CustomerType.ID = Customer.IDCustomerType
GO
/****** Object:  StoredProcedure [dbo].[USP_LoadFullCustomerType]    Script Date: 5/8/2021 10:41:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--------------------------------------------------------------
--Customer Type
--------------------------------------------------------------

CREATE PROC [dbo].[USP_LoadFullCustomerType]
AS
SELECT * FROM dbo.CustomerType
GO
/****** Object:  StoredProcedure [dbo].[USP_LoadFullParameter]    Script Date: 5/8/2021 10:41:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_LoadFullParameter]
AS
SELECT * FROM dbo.PARAMETER
GO
/****** Object:  StoredProcedure [dbo].[USP_LoadFullReport]    Script Date: 5/8/2021 10:41:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_LoadFullReport]
@month INT, @year int
AS
BEGIN
	SELECT name, value, rate FROM dbo.REPORT INNER JOIN dbo.ROOMTYPE ON ROOMTYPE.ID = REPORT.idRoomType
	WHERE Month = @month AND Year = @year
END
GO
/****** Object:  StoredProcedure [dbo].[USP_LoadFullRoom]    Script Date: 5/8/2021 10:41:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_LoadFullRoom]
AS
SELECT Room.ID, Room.Name,RoomType.Name AS [nameRoomType], Price, LimitPerson,
StatusRoom.Name AS [nameStatusRoom], IDRoomType, IDStatusRoom
FROM dbo.Room INNER JOIN dbo.RoomType 
ON roomtype.id = room.IDRoomType
INNER JOIN dbo.StatusRoom ON statusroom.id = room.IDStatusRoom
GO
/****** Object:  StoredProcedure [dbo].[USP_LoadFullRoomType]    Script Date: 5/8/2021 10:41:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_LoadFullRoomType]
AS
SELECT * FROM dbo.RoomType
GO
/****** Object:  StoredProcedure [dbo].[USP_LoadFullService]    Script Date: 5/8/2021 10:41:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_LoadFullService]
AS
SELECT Service.ID, Service.Name, Price, ServiceType.Name AS [nameServiceType], IDServiceType
FROM dbo.Service INNER JOIN dbo.ServiceType ON ServiceType.ID = Service.IDServiceType
GO
/****** Object:  StoredProcedure [dbo].[USP_LoadFullServiceType]    Script Date: 5/8/2021 10:41:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_LoadFullServiceType]
AS
SELECT * FROM ServiceType
GO
/****** Object:  StoredProcedure [dbo].[USP_LoadFullStaff]    Script Date: 5/8/2021 10:41:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_LoadFullStaff]
AS
BEGIN
	SELECT UserName, DisplayName, Name, IDCard,
			DateOfBirth, Sex, PhoneNumber, StartDay, Address, IDStaffType
    FROM dbo.Staff INNER JOIN dbo.StaffType ON StaffType.ID = Staff.IDStaffType
END
GO
/****** Object:  StoredProcedure [dbo].[USP_LoadFullStaffType]    Script Date: 5/8/2021 10:41:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------------------------------
--Staff type
--------------------------------------------------------------

CREATE PROC [dbo].[USP_LoadFullStaffType]
AS
begin
SELECT * FROM dbo.StaffType
end
GO
/****** Object:  StoredProcedure [dbo].[USP_LoadFullStatusRoom]    Script Date: 5/8/2021 10:41:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--------------------------------------------------------------

--Status Room
--------------------------------------------------------------
CREATE PROC [dbo].[USP_LoadFullStatusRoom]
AS
SELECT * FROM dbo.StatusRoom
GO
/****** Object:  StoredProcedure [dbo].[USP_LoadListFullRoom]    Script Date: 5/8/2021 10:41:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[USP_LoadListFullRoom]
@getToday Date
as
begin
	select distinct A.*
	from Room A,ReceiveRoom B, BookRoom C
	where A.IDStatusRoom=2 and A.ID=B.IDRoom and B.IDBookRoom=C.ID and C.DateCheckOut>=@getToday
	order by A.ID asc
end
GO
/****** Object:  StoredProcedure [dbo].[USP_LoadReceiveRoomsByDate]    Script Date: 5/8/2021 10:41:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[USP_LoadReceiveRoomsByDate]
@date Date
as
begin
	select A.ID[Mã nhận phòng], b.Name[Họ và tên],b.IDCard[CMND],C.Name[Tên phòng],D.DateCheckIn[Ngày nhận],D.DateCheckOut[Ngày trả]
	from ReceiveRoom A,Customer B, Room C,BookRoom D
	where A.IDBookRoom=D.ID and D.IDCustomer=B.ID and A.IDRoom=C.ID and D.DateCheckIn>=@date
	order by A.ID desc
end
GO
/****** Object:  StoredProcedure [dbo].[USP_LoadServiceByServiceType]    Script Date: 5/8/2021 10:41:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[USP_LoadServiceByServiceType]
@idServiceType char(10)
as
begin
	select *
	from Service
	where IDServiceType=@idServiceType
end
GO
/****** Object:  StoredProcedure [dbo].[USP_LoadStaffInforByUserName]    Script Date: 5/8/2021 10:41:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[USP_LoadStaffInforByUserName]
@username nvarchar(100)
as
begin
	select *
	from Staff
	where UserName=@username
end
GO
/****** Object:  StoredProcedure [dbo].[USP_Login]    Script Date: 5/8/2021 10:41:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[USP_Login]
@userName nvarchar(100),@passWord nvarchar(100)
as
Select * from Staff where UserName=@userName and PassWord=@passWord
GO
/****** Object:  StoredProcedure [dbo].[USP_RoomTypeInfo]    Script Date: 5/8/2021 10:41:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[USP_RoomTypeInfo]
@id char(10)
as
begin
select * 
from RoomType
where ID=@id
end
GO
/****** Object:  StoredProcedure [dbo].[USP_SearchBill]    Script Date: 5/8/2021 10:41:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_SearchBill]
@string NVARCHAR(100), @mode int
AS
BEGIN
	SELECT @string = '%' + [dbo].[ConvertString](@string) + '%'
	DECLARE @table TABLE(id char(10))
	IF(@mode = 0)
		INSERT INTO @table SELECT bill.id FROM bill WHERE CAST(id AS NVARCHAR(100)) LIKE @string
	ELSE IF(@mode = 1)
		INSERT INTO @table SELECT bill.id  FROM bill INNER JOIN dbo.ReceiveRoom ON ReceiveRoom.ID = Bill.IDReceiveRoom
		INNER JOIN dbo.BookRoom ON BookRoom.ID = ReceiveRoom.IDBookRoom INNER JOIN dbo.Customer ON Customer.ID = BookRoom.IDCustomer 
		WHERE [dbo].ConvertString(Customer.Name) LIKE @string
	ELSE IF(@mode = 2)
		INSERT INTO @table SELECT bill.id  FROM bill INNER JOIN dbo.ReceiveRoom ON ReceiveRoom.ID = Bill.IDReceiveRoom
		INNER JOIN dbo.BookRoom ON BookRoom.ID = ReceiveRoom.IDBookRoom INNER JOIN dbo.Customer ON Customer.ID = BookRoom.IDCustomer
		WHERE [dbo].ConvertString(Customer.IDCard) LIKE @string
	ELSE IF(@mode = 3)
		INSERT INTO @table SELECT bill.id  FROM bill INNER JOIN dbo.ReceiveRoom ON ReceiveRoom.ID = Bill.IDReceiveRoom
		INNER JOIN dbo.BookRoom ON BookRoom.ID = ReceiveRoom.IDBookRoom INNER JOIN dbo.Customer ON Customer.ID = BookRoom.IDCustomer
		WHERE CAST(dbo.Customer.PhoneNumber AS NVARCHAR(100)) LIKE @string

	SELECT bill.id, room.Name AS [roomName], Customer.Name as [customerName], bill.StaffSetUp, bill.DateOfCreate, STATUSBILL.Name, bill.TotalPrice, (cast(bill.Discount as nvarchar(4)) + '%') [Discount], cast(bill.TotalPrice*( (100-bill.Discount)/100.0) as int) [FinalPrice]
    FROM dbo.BILL INNER JOIN dbo.RECEIVEROOM ON RECEIVEROOM.ID = BILL.IDReceiveRoom 
	INNER JOIN dbo.STATUSBILL ON STATUSBILL.id = bill.IDStatusBill 
	INNER JOIN dbo.ROOM ON ROOM.ID = RECEIVEROOM.IDRoom
	INNER JOIN @table ON bill.id = [@table].id
	inner join bookroom on bookroom.id = RECEIVEROOM.IDBookRoom
	inner join Customer on Customer.ID = BookRoom.IDCustomer
	ORDER BY DateOfCreate DESC
END
GO
/****** Object:  StoredProcedure [dbo].[USP_SearchCustomer]    Script Date: 5/8/2021 10:41:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE PROC [dbo].[USP_SearchCustomer]
	@string NVARCHAR(100), @mode INT
	AS
	BEGIN
		SELECT @string = '%' + [dbo].[ConvertString](@string) + '%'
		DECLARE @table TABLE(id char(10))

		IF(@mode = 0)
			INSERT INTO @table SELECT id FROM [dbo].customer WHERE CAST(id AS NVARCHAR(100)) LIKE @string;
		ELSE IF(@mode = 1)
			INSERT INTO @table SELECT id FROM [dbo].customer WHERE [dbo].[ConvertString](name) LIKE @string;
		ELSE IF(@mode = 2)
			INSERT INTO @table SELECT id FROM [dbo].customer WHERE [dbo].[ConvertString](IDCard) LIKE @string;
		ELSE IF(@mode = 3)
			INSERT INTO @table SELECT id FROM [dbo].customer WHERE CAST(PhoneNumber AS NVARCHAR(100)) LIKE @string;

	    SELECT CUSTOMER.ID, Customer.Name, IDCard, CustomerType.Name as [NameCustomerType], Sex, DateOfBirth, PhoneNumber, Address, Nationality, IDCustomerType
		FROM Customer INNER JOIN @table ON [@table].id = CUSTOMER.ID INNER JOIN dbo.CustomerType ON CustomerType.ID = Customer.IDCustomerType
	END
GO
/****** Object:  StoredProcedure [dbo].[USP_SearchParameter]    Script Date: 5/8/2021 10:41:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--------------------------------------------------------------
--parameter
--------------------------------------------------------------
CREATE PROC [dbo].[USP_SearchParameter]
@string NVARCHAR(200)
AS
BEGIN
	SELECT @string = '%' + [dbo].[convertstring](@string) + '%'
	SELECT * FROM dbo.PARAMETER
	WHERE [dbo].[convertstring](name) like @string
END
GO
/****** Object:  StoredProcedure [dbo].[USP_SearchRoom]    Script Date: 5/8/2021 10:41:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--------------------------------------------------------------

--Room
--------------------------------------------------------------
CREATE PROC [dbo].[USP_SearchRoom]
@string NVARCHAR(100), @ma char(10)
AS
BEGIN
	SELECT @string = '%' + [dbo].[convertString](@string) + '%'
	SELECT Room.ID, Room.Name,RoomType.Name AS [nameRoomType], Price, LimitPerson,
	StatusRoom.Name AS [nameStatusRoom], IDRoomType, IDStatusRoom
	FROM dbo.Room INNER JOIN dbo.RoomType ON roomtype.id = room.IDRoomType INNER JOIN dbo.StatusRoom ON statusroom.id = room.IDStatusRoom
	WHERE dbo.ConvertString(dbo.Room.name) LIKE @string OR dbo.Room.id = @ma
END
GO
/****** Object:  StoredProcedure [dbo].[USP_SearchRoomType]    Script Date: 5/8/2021 10:41:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--------------------------------------------------------------

--Room Type
--------------------------------------------------------------
CREATE PROC [dbo].[USP_SearchRoomType]
@string NVARCHAR(100), @ma char(10)
AS
BEGIN
	SELECT @string = '%' + [dbo].[convertstring](@string) + '%'
	SELECT * FROM dbo.ROOMTYPE
	WHERE [dbo].[convertstring](name) LIKE @string OR id = @ma
end
GO
/****** Object:  StoredProcedure [dbo].[USP_SearchService]    Script Date: 5/8/2021 10:41:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_SearchService]
@string NVARCHAR(100), @int char(10)
AS
BEGIN
		DECLARE @table TABLE
		(
			id char(10)
		)
		SELECT @string = '%' + [dbo].[ConvertString](@string) + '%'
		INSERT INTO @table
			SELECT id FROM dbo.SERVICE WHERE [dbo].[ConvertString](name) like @string OR id = @int
		SELECT Service.ID, Service.Name, Price, ServiceType.Name AS [nameServiceType], IDServiceType
		FROM @table INNER JOIN dbo.SERVICE ON SERVICE.ID = [@table].id INNER JOIN dbo.ServiceType ON ServiceType.ID = Service.IDServiceType
END
GO
/****** Object:  StoredProcedure [dbo].[USP_SearchServiceType]    Script Date: 5/8/2021 10:41:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------

--------------------------------------------------------------

--Service Type
--------------------------------------------------------------
CREATE PROC [dbo].[USP_SearchServiceType]
@string NVARCHAR(100), @int char(10)
AS
BEGIN
	DECLARE @table table( id char(10))
	SELECT @string ='%' + [dbo].[ConvertString](@string) + '%', @int ='%' + [dbo].[ConvertString](@int) + '%'
	INSERT INTO @table SELECT id FROM ServiceType WHERE [dbo].[ConvertString](name) LIKE @string OR id = @int
	SELECT dbo.SERVICETYPE.ID, Name FROM @table INNER JOIN servicetype ON  SERVICETYPE.ID = [@table].id
END
GO
/****** Object:  StoredProcedure [dbo].[USP_SearchStaff]    Script Date: 5/8/2021 10:41:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--------------------------------------------------------------

--Staff 
--------------------------------------------------------------
CREATE PROC [dbo].[USP_SearchStaff]
@string NVARCHAR(100), @int int
AS
BEGIN
	SELECT @string = '%' + [dbo].[ConvertString](@string) + '%'
	DECLARE @table TABLE( username NVARCHAR(100))
	IF(@int < 1)
	begin
		INSERT INTO @table SELECT username FROM staff 
		WHERE username LIKE @string OR [dbo].[ConvertString](DisplayName) LIKE @string
		OR  idcard LIKE @string
	END
	ELSE
    BEGIN
		INSERT INTO @table SELECT username FROM staff 
		WHERE username LIKE @string OR [dbo].[ConvertString](DisplayName) LIKE @string
		OR  idcard LIKE @string OR cast(PhoneNumber AS NVARCHAR(100)) LIKE @string
	END
	SELECT Staff.UserName, DisplayName, Name, IDCard, DateOfBirth, Sex, PhoneNumber, StartDay, Address, IDStaffType
    FROM dbo.Staff INNER JOIN  @table ON [@table].username = STAFF.UserName INNER JOIN dbo.StaffType ON StaffType.ID = Staff.IDStaffType
end
GO
/****** Object:  StoredProcedure [dbo].[USP_ShowBill]    Script Date: 5/8/2021 10:41:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[USP_ShowBill]
@idRoom char(10)
as
begin
	select D.Name [Tên dịch vụ],D.Price[Đơn giá],B.Count[Số lượng],B.TotalPrice[Thành tiền]
	from Bill A, BillDetails B, ReceiveRoom C, Service D
	where A.IDStatusBill=1 and A.ID=b.IDBill and A.IDReceiveRoom=C.ID and C.IDRoom=@idRoom and B.IDService=D.ID
end
GO
/****** Object:  StoredProcedure [dbo].[USP_ShowBillInfo]    Script Date: 5/8/2021 10:41:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[USP_ShowBillInfo]
@idBill char(10)
as
begin
select D.Name[HoTen],D.IDCard[CMND],D.PhoneNumber[SDT],E.Name[LoaiKH],D.Address[DiaChi],D.Nationality[QuocTich],F.Name[TenPhong],G.Name[LoaiPhong],G.Price[DonGia],C.DateCheckIn[NgayDen],C.DateCheckOut[NgayDi],A.RoomPrice[TienPhong],A.ServicePrice[TienDichVu],A.Surcharge[PhuThu],A.TotalPrice[ThanhTien],A.Discount[GiamGia]
from Bill A, ReceiveRoom B,BookRoom C, Customer D,CustomerType E,Room F,RoomType G
where A.IDReceiveRoom=B.ID and B.IDBookRoom=C.ID and C.IDCustomer=D.ID and D.IDCustomerType=E.ID and B.IDRoom=F.ID and F.IDRoomType=G.ID and A.ID=@idBill
end
GO
/****** Object:  StoredProcedure [dbo].[USP_ShowBillPreView]    Script Date: 5/8/2021 10:41:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[USP_ShowBillPreView]
@idBill char(10)
as
begin
	select D.Name [Tên dịch vụ],D.Price[Đơn giá],B.Count[Số lượng],B.TotalPrice[Thành tiền]
	from Bill A, BillDetails B, Service D
	where A.IDStatusBill=2 and A.ID=b.IDBill and A.ID=@idBill and B.IDService=D.ID
end
GO
/****** Object:  StoredProcedure [dbo].[USP_ShowBillRoom]    Script Date: 5/8/2021 10:41:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[USP_ShowBillRoom]--Muốn proc thực thi được thì phải thực thi USP_UpdateBill trước(nếu có thể)
@getToday Date,@idRoom char(10)
as
begin

	select A.Name [Tên phòng],D.Price[Đơn giá] ,C.DateCheckIn [Ngày nhận],C.DateCheckOut[Ngày trả] ,E.RoomPrice[Tiền phòng],E.Surcharge[Phụ thu]
	from Room A,ReceiveRoom B, BookRoom C,RoomType D,Bill E
	where E.IDReceiveRoom=B.ID and IDStatusRoom=2 and A.ID=B.IDRoom and B.IDBookRoom=C.ID and A.IDRoomType=D.ID and C.DateCheckOut>=@getToday and B.IDRoom=@idRoom and E.IDStatusBill=1
end
GO
/****** Object:  StoredProcedure [dbo].[USP_ShowCustomerFromReceiveRoom]    Script Date: 5/8/2021 10:41:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[USP_ShowCustomerFromReceiveRoom]
@idReceiveRoom char(10)
as
begin
	select C.Name[Tên khách hàng],C.IDCard[CMND],C.Address[Địa chỉ],C.PhoneNumber[Số điện thoại],C.Nationality[Quốc tịch]
	from ReceiveRoom A, BookRoom B, Customer C
	where A.ID=@idReceiveRoom and A.IDBookRoom=B.ID and B.IDCustomer=C.ID
	union
	select C.Name[Tên khách hàng],C.IDCard[CMND],C.Address[Địa chỉ],C.PhoneNumber[Số điện thoại],C.Nationality[Quốc tịch]
	from ReceiveRoom A,ReceiveRoomDetails B,Customer C
	where A.ID=@idReceiveRoom and A.ID=B.IDReceiveRoom and B.IDCustomerOther=C.ID
end
GO
/****** Object:  StoredProcedure [dbo].[USP_ShowReceiveRoom]    Script Date: 5/8/2021 10:41:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[USP_ShowReceiveRoom]
@idReceiveRoom char(10)
as
begin
	select A.ID[Mã nhận phòng], C.Name[Tên phòng],B.DateCheckIn[Ngày nhận],B.DateCheckOut[Ngày trả]
	from ReceiveRoom A,BookRoom B,Room C
	where A.IDBookRoom=B.ID and A.IDRoom=C.ID and A.ID=@idReceiveRoom
end
GO
/****** Object:  StoredProcedure [dbo].[USP_UpdateAccount3]    Script Date: 5/8/2021 10:41:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[USP_UpdateAccount3]
@username nvarchar(100),@address nvarchar(100),@phonenumber int
as
begin
	update Staff
	set Address=@address,PhoneNumber=@phonenumber
	where UserName=@username
end
GO
/****** Object:  StoredProcedure [dbo].[USP_UpdateBill_Other]    Script Date: 5/8/2021 10:41:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[USP_UpdateBill_Other]
@idBill char(10),@discount int
as
begin
	declare @totalPrice int=0,@idRoom char(10)
	select @totalPrice=RoomPrice+ServicePrice+ Surcharge
	from Bill
	where ID=@idBill

	update Bill
	set DateOfCreate=GETDATE(), TotalPrice=@totalPrice,Discount=@discount,IDStatusBill=2
	where ID=@idBill

	select @idRoom=B.IDRoom
	from Bill A, ReceiveRoom B
	where A.IDReceiveRoom=B.ID

	update Room
	set IDStatusRoom=1
	where ID=@idRoom
end
GO
/****** Object:  StoredProcedure [dbo].[USP_UpdateBill_RoomPrice]    Script Date: 5/8/2021 10:41:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[USP_UpdateBill_RoomPrice]
@idBill char(10)
as
begin
	declare @idReceiveRoom char(10),@roomPrice int =0,@price int,@days int,@countCustomer int,@limitPerson int,@check1 int,@check2 int,@surcharge int =0

	select @days=DATEDIFF(day,C.DateCheckIn,C.DateCheckOut),@price=D.Price,@limitPerson=D.LimitPerson,@idReceiveRoom=A.IDReceiveRoom
	from Bill A,ReceiveRoom B,BookRoom C,RoomType D,Room E
	where A.ID=@idBill and A.IDReceiveRoom=B.ID and B.IDRoom=E.ID and E.IDRoomType=D.ID and C.ID=B.IDBookRoom

	select @countCustomer=COUNT(B.IDReceiveRoom)
	from ReceiveRoom A,ReceiveRoomDetails B
	where A.ID=@idReceiveRoom and A.ID=B.IDReceiveRoom

	set @roomPrice=@price*@days;

	declare @QD3 float = 0 -- phu thu them
	select @QD3 = value from Parameter where Name = N'QĐ3'

	declare @QD4 float = 0 -- khach nuoc ngoai
	select @QD4 = value from Parameter where Name = N'QĐ4'

	if((@countCustomer+1-@limitPerson)>=0)
	set @surcharge=@roomPrice*@QD3*(@countCustomer+1-@limitPerson)

	select @check1=COUNT(*)
	from ReceiveRoom A,BookRoom B,Customer D
	where A.IDBookRoom=B.ID and B.IDCustomer=D.ID and D.Nationality!=N'Việt Nam' and A.ID=@idReceiveRoom
	select @check2=COUNT(*)
	from ReceiveRoom A,ReceiveRoomDetails C,Customer D
	where A.ID=C.IDReceiveRoom and D.ID=C.IDCustomerOther and D.Nationality!=N'Việt Nam' and A.ID=@idReceiveRoom

	if((@check1+@check2)>0) 
	set @surcharge=@surcharge + @roomPrice*(@QD4 - 1)

	update Bill
	set RoomPrice=@roomPrice, Surcharge=@surcharge
	where id=@idBill
end
GO
/****** Object:  StoredProcedure [dbo].[USP_UpdateBill_ServicePrice]    Script Date: 5/8/2021 10:41:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[USP_UpdateBill_ServicePrice]
@idBill char(10)
as
begin
	declare @totalServicePrice int=0
	select @totalServicePrice=SUM(TotalPrice)
	from BillDetails
	where IDBill=@idBill
	if(@totalServicePrice is null)
	set @totalServicePrice=0
	update Bill 
	set ServicePrice=@totalServicePrice
	where ID=@idBill
end
GO
/****** Object:  StoredProcedure [dbo].[USP_UpdateBillDetails]    Script Date: 5/8/2021 10:41:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[USP_UpdateBillDetails]
@idBill char(10),@idService char(10),@_count int
as
begin
	declare @totalPrice int,@price int,@count int

	select @price=Price
	from Service
	where ID=@idService

	select @count=Count
	from Bill A,BillDetails B
	where A.ID=B.IDBill and A.ID=@idBill and A.IDStatusBill=1 and B.IDService=@idService

	set @count=@count+@_count
	if(@count>0)
	begin
		set @totalPrice=@count*@price
		update BillDetails
		set Count=@count,TotalPrice=@totalPrice
		where IDBill=@idBill and IDService=@idService
	end
	else
	begin
		delete from BillDetails
		where IDBill=@idBill and IDService=@idService
	end
end
GO
/****** Object:  StoredProcedure [dbo].[USP_UpdateBookRoom]    Script Date: 5/8/2021 10:41:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[USP_UpdateBookRoom]
@id char(10),@idRoomType char(10),@dateCheckIn date,@datecheckOut date
as
begin
	update BookRoom
	set IDRoomType=@idRoomType,DateCheckIn=@dateCheckIn,DateCheckOut=@datecheckOut
	where ID=@id
end
GO
/****** Object:  StoredProcedure [dbo].[USP_UpdateCustomer]    Script Date: 5/8/2021 10:41:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_UpdateCustomer]
@id char(10), @customerName NVARCHAR(100), @idCustomerType char(10), @idCardNow NVARCHAR(100), @address NVARCHAR(200),
@dateOfBirth date, @phoneNumber int, @sex NVARCHAR(100), @nationality NVARCHAR(100), @idCardPre NVARCHAR(100)
AS
BEGIN
	IF(@idCardPre != @idCardNow)
	begin
		DECLARE @count INT=0
		SELECT @count=COUNT(*)
		FROM dbo.Customer
		WHERE IDCard = @idCardNow
		IF(@count=0)
		BEGIN
			UPDATE dbo.Customer 
			SET 
			Name =@customerName, IDCustomerType = @idCustomerType, IDCard =@idCardNow,
			Address = @address, DateOfBirth =@dateOfBirth, PhoneNumber =@phoneNumber,
			Nationality = @nationality, Sex = @sex
			WHERE ID = @id
		END
	END
	ELSE
	BEGIN
		UPDATE dbo.Customer 
			SET 
			Name =@customerName, IDCustomerType = @idCustomerType,Address = @address,
			DateOfBirth =@dateOfBirth, PhoneNumber =@phoneNumber,
			Nationality = @nationality, Sex = @sex
			WHERE ID = @id
	end
END
GO
/****** Object:  StoredProcedure [dbo].[USP_UpdateCustomer_]    Script Date: 5/8/2021 10:41:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[USP_UpdateCustomer_]
@id char(10),@name nvarchar(50),@idCard nvarchar(50),@idCustomerType char(10),@phoneNumber int, @dateOfBirth date,@address nvarchar(100),@sex nvarchar(20),@nationality nvarchar(100)
as
begin
	update Customer
	set Name=@name,IDCard=@idCard,IDCustomerType=@idCustomerType,PhoneNumber=@phoneNumber,DateOfBirth=@dateOfBirth,Address=@address,Sex=@sex,Nationality=@nationality
	where ID=@id
end
GO
/****** Object:  StoredProcedure [dbo].[USP_UpdateDisplayName]    Script Date: 5/8/2021 10:41:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[USP_UpdateDisplayName]
@username nvarchar(100),@displayname nvarchar(100)
as
begin
	update Staff
	set DisplayName=@displayname
	where UserName=@username
end
GO
/****** Object:  StoredProcedure [dbo].[USP_UpdateInfo]    Script Date: 5/8/2021 10:41:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[USP_UpdateInfo]
@username nvarchar(100),@address nvarchar(100),@phonenumber int,@idcard nvarchar(100),@dateOfBirth date,@sex nvarchar(50)
as
begin
	update Staff
	set Address=@address,PhoneNumber=@phonenumber,IDCard=@idcard,Sex=@sex, DateOfBirth=@dateOfBirth
	where UserName=@username
end
GO
/****** Object:  StoredProcedure [dbo].[USP_UpdateParameter]    Script Date: 5/8/2021 10:41:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_UpdateParameter]
@name NVARCHAR(200), @value float, @describe NVARCHAR(200)
AS
BEGIN
UPDATE dbo.PARAMETER
	SET
	Value = @value,
	Describe = @describe,
	datemodify = GETDATE()
	WHERE name = @name
	SELECT @name = [dbo].[ConvertString](@name)
	IF(@name = 'QD2.1')
		UPDATE dbo.ROOMTYPE SET LimitPerson = @value WHERE ID = 'LP001'
	ELSE IF(@name = 'QD2.2')
		UPDATE dbo.ROOMTYPE SET LimitPerson = @value WHERE ID = 'LP002'
	ELSE IF(@name = 'QD2.3')
		UPDATE dbo.ROOMTYPE SET LimitPerson = @value WHERE ID = 'LP003'
	ELSE IF(@name = 'QD2.4')
		UPDATE dbo.ROOMTYPE SET LimitPerson = @value WHERE ID = 'LP004'
END
GO
/****** Object:  StoredProcedure [dbo].[USP_UpdatePassword]    Script Date: 5/8/2021 10:41:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[USP_UpdatePassword]
@username nvarchar(100),@password nvarchar(100)
as
begin
	update Staff
	set PassWord=@password
	where UserName=@username
end
GO
/****** Object:  StoredProcedure [dbo].[USP_UpdateReceiveRoom]    Script Date: 5/8/2021 10:41:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[USP_UpdateReceiveRoom]
@id char(10),@idRoom char(10)
as
begin
	update ReceiveRoom
	set IDRoom=@idRoom
	where ID=@id

	update Room
	set IDStatusRoom=2
	where ID=@idRoom
end	

GO
/****** Object:  StoredProcedure [dbo].[USP_UpdateRoom]    Script Date: 5/8/2021 10:41:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_UpdateRoom]
@id char(10), @nameRoom NVARCHAR(100), @idRoomType char(10), @idStatusRoom INT
AS
UPDATE dbo.Room
SET
	Name = @nameRoom, IDRoomType = @idRoomType, IDStatusRoom = @idStatusRoom
WHERE ID = @id
GO
/****** Object:  StoredProcedure [dbo].[USP_UpdateRoomType]    Script Date: 5/8/2021 10:41:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_UpdateRoomType]
@id char(10), @name NVARCHAR(100), @price int, @limitPerson int
AS
	UPDATE RoomType
	SET
    name = @name, Price = @price, LimitPerson = @limitPerson
	WHERE id =@id
GO
/****** Object:  StoredProcedure [dbo].[USP_UpdateService]    Script Date: 5/8/2021 10:41:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[USP_UpdateService]
@id char(10), @name nvarchar(200), @idServiceType char(10), @price int
as
begin
	update service
	set
	name = @name,
	idservicetype = @idservicetype,
	price = @price
	where id = @id
END
GO
/****** Object:  StoredProcedure [dbo].[USP_UpdateServiceType]    Script Date: 5/8/2021 10:41:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_UpdateServiceType]
@id char(10), @name NVARCHAR(100)
AS
BEGIN
	UPDATE dbo.ServiceType
	SET
    name = @name
	WHERE id =@id
END
GO
/****** Object:  StoredProcedure [dbo].[USP_UpdateStaff]    Script Date: 5/8/2021 10:41:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_UpdateStaff]
@user NVARCHAR(100), @name NVARCHAR(100),@idStaffType char(10),
@idCard NVARCHAR(100), @dateOfBirth DATE, @sex NVARCHAR(100),
@address NVARCHAR(200), @phoneNumber INT, @startDay DATE
AS
BEGIN
	DECLARE @count INT = 0
	SELECT @count=COUNT(*) FROM staff
	WHERE IDCard = @idCard AND UserName != @user
	IF(@count = 0)
	UPDATE dbo.STAFF
	SET
    displayname = @name, idstafftype = @idstafftype,
	idcard= @idCard, DateOfBirth = @dateOfBirth, sex = @sex,
	Address = @address, PhoneNumber = @phoneNumber, StartDay = @startDay
	WHERE UserName = @user
END
GO
/****** Object:  StoredProcedure [dbo].[USP_UpdateStaffType]    Script Date: 5/8/2021 10:41:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_UpdateStaffType] 
@id char(10), @name NVARCHAR(100)
AS
BEGIN
	UPDATE dbo.StaffType
	SET
    Name = @name
	WHERE ID = @id
END
GO
/****** Object:  StoredProcedure [dbo].[USP_UpdateStatusRoom]    Script Date: 5/8/2021 10:41:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[USP_UpdateStatusRoom]
@idRoom char(10)
as
begin
	update Room
	set IDStatusRoom=1
	where ID=@idRoom
end
GO
/****** Object:  Trigger [dbo].[Audit_DeleteBill]    Script Date: 5/8/2021 10:41:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[Audit_DeleteBill]
   ON  [dbo].[Bill]
   AFTER delete
AS 
BEGIN
	
	SET NOCOUNT ON;

INSERT INTO Aud_Bill SELECT *,'D',GETDATE() FROM deleted

END
GO
ALTER TABLE [dbo].[Bill] ENABLE TRIGGER [Audit_DeleteBill]
GO
/****** Object:  Trigger [dbo].[Audit_InsertBill]    Script Date: 5/8/2021 10:41:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[Audit_InsertBill]
   ON  [dbo].[Bill]
   AFTER insert
AS 
BEGIN
	
	SET NOCOUNT ON;

   INSERT INTO Aud_Bill SELECT *,'I',GETDATE() FROM Inserted

END
GO
ALTER TABLE [dbo].[Bill] ENABLE TRIGGER [Audit_InsertBill]
GO
/****** Object:  Trigger [dbo].[Audit_UpdateBill]    Script Date: 5/8/2021 10:41:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[Audit_UpdateBill]
   ON  [dbo].[Bill]
   AFTER update
AS 
BEGIN
	
	SET NOCOUNT ON;

  INSERT INTO Aud_Bill SELECT *,'U',GETDATE() FROM deleted

END
GO
ALTER TABLE [dbo].[Bill] ENABLE TRIGGER [Audit_UpdateBill]
GO
/****** Object:  Trigger [dbo].[Audit_DeleteBillDetails]    Script Date: 5/8/2021 10:41:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[Audit_DeleteBillDetails]
   ON  [dbo].[BillDetails]
   AFTER delete
AS 
BEGIN
	
	SET NOCOUNT ON;

INSERT INTO Aud_BillDetails SELECT *,'D',GETDATE() FROM deleted

END
GO
ALTER TABLE [dbo].[BillDetails] ENABLE TRIGGER [Audit_DeleteBillDetails]
GO
/****** Object:  Trigger [dbo].[Audit_InsertBillDetails]    Script Date: 5/8/2021 10:41:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[Audit_InsertBillDetails]
   ON  [dbo].[BillDetails]
   AFTER insert
AS 
BEGIN
	
	SET NOCOUNT ON;

   INSERT INTO Aud_BillDetails SELECT *,'I',GETDATE() FROM Inserted

END
GO
ALTER TABLE [dbo].[BillDetails] ENABLE TRIGGER [Audit_InsertBillDetails]
GO
/****** Object:  Trigger [dbo].[Audit_UpdateBillDetails]    Script Date: 5/8/2021 10:41:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[Audit_UpdateBillDetails]
   ON  [dbo].[BillDetails]
   AFTER update
AS 
BEGIN
	
	SET NOCOUNT ON;

  INSERT INTO Aud_BillDetails SELECT *,'U',GETDATE() FROM deleted

END
GO
ALTER TABLE [dbo].[BillDetails] ENABLE TRIGGER [Audit_UpdateBillDetails]
GO
/****** Object:  Trigger [dbo].[Audit_DeleteBookRoom]    Script Date: 5/8/2021 10:41:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[Audit_DeleteBookRoom]
   ON  [dbo].[BookRoom]
   AFTER delete
AS 
BEGIN
	
	SET NOCOUNT ON;

INSERT INTO Aud_BookRoom SELECT *,'D',GETDATE() FROM deleted

END
GO
ALTER TABLE [dbo].[BookRoom] ENABLE TRIGGER [Audit_DeleteBookRoom]
GO
/****** Object:  Trigger [dbo].[Audit_InsertBookRoom]    Script Date: 5/8/2021 10:41:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[Audit_InsertBookRoom]
   ON  [dbo].[BookRoom]
   AFTER insert
AS 
BEGIN
	
	SET NOCOUNT ON;

   INSERT INTO Aud_BookRoom SELECT *,'I',GETDATE() FROM Inserted

END
GO
ALTER TABLE [dbo].[BookRoom] ENABLE TRIGGER [Audit_InsertBookRoom]
GO
/****** Object:  Trigger [dbo].[Audit_UpdateBookRoom]    Script Date: 5/8/2021 10:41:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[Audit_UpdateBookRoom]
   ON  [dbo].[BookRoom]
   AFTER update
AS 
BEGIN
	
	SET NOCOUNT ON;

  INSERT INTO Aud_BookRoom SELECT *,'U',GETDATE() FROM deleted

END
GO
ALTER TABLE [dbo].[BookRoom] ENABLE TRIGGER [Audit_UpdateBookRoom]
GO
/****** Object:  Trigger [dbo].[Audit_DeleteCustomer]    Script Date: 5/8/2021 10:41:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[Audit_DeleteCustomer]
   ON  [dbo].[Customer]
   AFTER delete
AS 
BEGIN
	
	SET NOCOUNT ON;

INSERT INTO Aud_Customer SELECT *,'D',GETDATE() FROM deleted

END
GO
ALTER TABLE [dbo].[Customer] ENABLE TRIGGER [Audit_DeleteCustomer]
GO
/****** Object:  Trigger [dbo].[Audit_InsertCustomer]    Script Date: 5/8/2021 10:41:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[Audit_InsertCustomer]
   ON  [dbo].[Customer]
   AFTER insert
AS 
BEGIN
	
	SET NOCOUNT ON;

   INSERT INTO Aud_Customer SELECT *,'I',GETDATE() FROM Inserted

END
GO
ALTER TABLE [dbo].[Customer] ENABLE TRIGGER [Audit_InsertCustomer]
GO
/****** Object:  Trigger [dbo].[Audit_UpdateCustomer]    Script Date: 5/8/2021 10:41:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[Audit_UpdateCustomer]
   ON  [dbo].[Customer]
   AFTER update
AS 
BEGIN
	
	SET NOCOUNT ON;

  INSERT INTO Aud_Customer SELECT *,'U',GETDATE() FROM deleted

END
GO
ALTER TABLE [dbo].[Customer] ENABLE TRIGGER [Audit_UpdateCustomer]
GO
/****** Object:  Trigger [dbo].[Audit_DeleteCustomerType]    Script Date: 5/8/2021 10:41:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[Audit_DeleteCustomerType]
   ON  [dbo].[CustomerType]
   AFTER delete
AS 
BEGIN
	
	SET NOCOUNT ON;

INSERT INTO Aud_CustomerType SELECT *,'D',GETDATE() FROM deleted

END
GO
ALTER TABLE [dbo].[CustomerType] ENABLE TRIGGER [Audit_DeleteCustomerType]
GO
/****** Object:  Trigger [dbo].[Audit_InsertCustomerType]    Script Date: 5/8/2021 10:41:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[Audit_InsertCustomerType]
   ON  [dbo].[CustomerType]
   AFTER insert
AS 
BEGIN
	
	SET NOCOUNT ON;

   INSERT INTO Aud_CustomerType SELECT *,'I',GETDATE() FROM Inserted

END
GO
ALTER TABLE [dbo].[CustomerType] ENABLE TRIGGER [Audit_InsertCustomerType]
GO
/****** Object:  Trigger [dbo].[Audit_UpdateCustomerType]    Script Date: 5/8/2021 10:41:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[Audit_UpdateCustomerType]
   ON  [dbo].[CustomerType]
   AFTER update
AS 
BEGIN
	
	SET NOCOUNT ON;

  INSERT INTO Aud_CustomerType SELECT *,'U',GETDATE() FROM deleted

END
GO
ALTER TABLE [dbo].[CustomerType] ENABLE TRIGGER [Audit_UpdateCustomerType]
GO
/****** Object:  Trigger [dbo].[Audit_DeleteParameter]    Script Date: 5/8/2021 10:41:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[Audit_DeleteParameter]
   ON  [dbo].[Parameter]
   AFTER delete
AS 
BEGIN
	
	SET NOCOUNT ON;

INSERT INTO Aud_Parameter SELECT *,'D',GETDATE() FROM deleted

END
GO
ALTER TABLE [dbo].[Parameter] ENABLE TRIGGER [Audit_DeleteParameter]
GO
/****** Object:  Trigger [dbo].[Audit_InsertParameter]    Script Date: 5/8/2021 10:41:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[Audit_InsertParameter]
   ON  [dbo].[Parameter]
   AFTER insert
AS 
BEGIN
	
	SET NOCOUNT ON;

   INSERT INTO Aud_Parameter SELECT *,'I',GETDATE() FROM Inserted

END
GO
ALTER TABLE [dbo].[Parameter] ENABLE TRIGGER [Audit_InsertParameter]
GO
/****** Object:  Trigger [dbo].[Audit_UpdateParameter]    Script Date: 5/8/2021 10:41:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[Audit_UpdateParameter]
   ON  [dbo].[Parameter]
   AFTER update
AS 
BEGIN
	
	SET NOCOUNT ON;

  INSERT INTO Aud_Parameter SELECT *,'U',GETDATE() FROM deleted

END
GO
ALTER TABLE [dbo].[Parameter] ENABLE TRIGGER [Audit_UpdateParameter]
GO
/****** Object:  Trigger [dbo].[Audit_DeleteReceiveRoom]    Script Date: 5/8/2021 10:41:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[Audit_DeleteReceiveRoom]
   ON  [dbo].[ReceiveRoom]
   AFTER delete
AS 
BEGIN
	
	SET NOCOUNT ON;

INSERT INTO Aud_ReceiveRoom SELECT *,'D',GETDATE() FROM deleted

END
GO
ALTER TABLE [dbo].[ReceiveRoom] ENABLE TRIGGER [Audit_DeleteReceiveRoom]
GO
/****** Object:  Trigger [dbo].[Audit_InsertReceiveRoom]    Script Date: 5/8/2021 10:41:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[Audit_InsertReceiveRoom]
   ON  [dbo].[ReceiveRoom]
   AFTER insert
AS 
BEGIN
	
	SET NOCOUNT ON;

   INSERT INTO Aud_ReceiveRoom SELECT *,'I',GETDATE() FROM Inserted

END
GO
ALTER TABLE [dbo].[ReceiveRoom] ENABLE TRIGGER [Audit_InsertReceiveRoom]
GO
/****** Object:  Trigger [dbo].[Audit_UpdateReceiveRoom]    Script Date: 5/8/2021 10:41:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[Audit_UpdateReceiveRoom]
   ON  [dbo].[ReceiveRoom]
   AFTER update
AS 
BEGIN
	
	SET NOCOUNT ON;

  INSERT INTO Aud_ReceiveRoom SELECT *,'U',GETDATE() FROM deleted

END
GO
ALTER TABLE [dbo].[ReceiveRoom] ENABLE TRIGGER [Audit_UpdateReceiveRoom]
GO
/****** Object:  Trigger [dbo].[Audit_DeleteReceiveRoomDetails]    Script Date: 5/8/2021 10:41:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[Audit_DeleteReceiveRoomDetails]
   ON  [dbo].[ReceiveRoomDetails]
   AFTER delete
AS 
BEGIN
	
	SET NOCOUNT ON;

INSERT INTO Aud_ReceiveRoomDetails SELECT *,'D',GETDATE() FROM deleted

END
GO
ALTER TABLE [dbo].[ReceiveRoomDetails] ENABLE TRIGGER [Audit_DeleteReceiveRoomDetails]
GO
/****** Object:  Trigger [dbo].[Audit_InsertReceiveRoomDetails]    Script Date: 5/8/2021 10:41:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[Audit_InsertReceiveRoomDetails]
   ON  [dbo].[ReceiveRoomDetails]
   AFTER insert
AS 
BEGIN
	
	SET NOCOUNT ON;

   INSERT INTO Aud_ReceiveRoomDetails SELECT *,'I',GETDATE() FROM Inserted

END
GO
ALTER TABLE [dbo].[ReceiveRoomDetails] ENABLE TRIGGER [Audit_InsertReceiveRoomDetails]
GO
/****** Object:  Trigger [dbo].[Audit_UpdateReceiveRoomDetails]    Script Date: 5/8/2021 10:41:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[Audit_UpdateReceiveRoomDetails]
   ON  [dbo].[ReceiveRoomDetails]
   AFTER update
AS 
BEGIN
	
	SET NOCOUNT ON;

  INSERT INTO Aud_ReceiveRoomDetails SELECT *,'U',GETDATE() FROM deleted

END
GO
ALTER TABLE [dbo].[ReceiveRoomDetails] ENABLE TRIGGER [Audit_UpdateReceiveRoomDetails]
GO
/****** Object:  Trigger [dbo].[Audit_DeleteRoom]    Script Date: 5/8/2021 10:41:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[Audit_DeleteRoom]
   ON  [dbo].[Room]
   AFTER delete
AS 
BEGIN
	
	SET NOCOUNT ON;

INSERT INTO Aud_Room SELECT *,'D',GETDATE() FROM deleted

END
GO
ALTER TABLE [dbo].[Room] ENABLE TRIGGER [Audit_DeleteRoom]
GO
/****** Object:  Trigger [dbo].[Audit_InsertRoom]    Script Date: 5/8/2021 10:41:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[Audit_InsertRoom]
   ON  [dbo].[Room]
   AFTER insert
AS 
BEGIN
	
	SET NOCOUNT ON;

   INSERT INTO Aud_Room SELECT *,'I',GETDATE() FROM Inserted

END
GO
ALTER TABLE [dbo].[Room] ENABLE TRIGGER [Audit_InsertRoom]
GO
/****** Object:  Trigger [dbo].[Audit_UpdateRoom]    Script Date: 5/8/2021 10:41:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[Audit_UpdateRoom]
   ON  [dbo].[Room]
   AFTER update
AS 
BEGIN
	
	SET NOCOUNT ON;

  INSERT INTO Aud_Room SELECT *,'U',GETDATE() FROM deleted

END
GO
ALTER TABLE [dbo].[Room] ENABLE TRIGGER [Audit_UpdateRoom]
GO
/****** Object:  Trigger [dbo].[Audit_DeleteRoomType]    Script Date: 5/8/2021 10:41:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[Audit_DeleteRoomType]
   ON  [dbo].[RoomType]
   AFTER delete
AS 
BEGIN
	
	SET NOCOUNT ON;

INSERT INTO Aud_RoomType SELECT *,'D',GETDATE() FROM deleted

END
GO
ALTER TABLE [dbo].[RoomType] ENABLE TRIGGER [Audit_DeleteRoomType]
GO
/****** Object:  Trigger [dbo].[Audit_InsertRoomType]    Script Date: 5/8/2021 10:41:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[Audit_InsertRoomType]
   ON  [dbo].[RoomType]
   AFTER insert
AS 
BEGIN
	
	SET NOCOUNT ON;

   INSERT INTO Aud_RoomType SELECT *,'I',GETDATE() FROM Inserted

END
GO
ALTER TABLE [dbo].[RoomType] ENABLE TRIGGER [Audit_InsertRoomType]
GO
/****** Object:  Trigger [dbo].[Audit_UpdateRoomType]    Script Date: 5/8/2021 10:41:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[Audit_UpdateRoomType]
   ON  [dbo].[RoomType]
   AFTER update
AS 
BEGIN
	
	SET NOCOUNT ON;

  INSERT INTO Aud_RoomType SELECT *,'U',GETDATE() FROM deleted

END
GO
ALTER TABLE [dbo].[RoomType] ENABLE TRIGGER [Audit_UpdateRoomType]
GO
/****** Object:  Trigger [dbo].[Audit_DeleteService]    Script Date: 5/8/2021 10:41:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[Audit_DeleteService]
   ON  [dbo].[Service]
   AFTER delete
AS 
BEGIN
	
	SET NOCOUNT ON;

INSERT INTO Aud_Service SELECT *,'D',GETDATE() FROM deleted

END
GO
ALTER TABLE [dbo].[Service] ENABLE TRIGGER [Audit_DeleteService]
GO
/****** Object:  Trigger [dbo].[Audit_InsertService]    Script Date: 5/8/2021 10:41:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[Audit_InsertService]
   ON  [dbo].[Service]
   AFTER insert
AS 
BEGIN
	
	SET NOCOUNT ON;

   INSERT INTO Aud_Service SELECT *,'I',GETDATE() FROM Inserted

END
GO
ALTER TABLE [dbo].[Service] ENABLE TRIGGER [Audit_InsertService]
GO
/****** Object:  Trigger [dbo].[Audit_UpdateService]    Script Date: 5/8/2021 10:41:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[Audit_UpdateService]
   ON  [dbo].[Service]
   AFTER update
AS 
BEGIN
	
	SET NOCOUNT ON;

  INSERT INTO Aud_Service SELECT *,'U',GETDATE() FROM deleted

END
GO
ALTER TABLE [dbo].[Service] ENABLE TRIGGER [Audit_UpdateService]
GO
/****** Object:  Trigger [dbo].[Audit_DeleteServiceType]    Script Date: 5/8/2021 10:41:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[Audit_DeleteServiceType]
   ON  [dbo].[ServiceType]
   AFTER delete
AS 
BEGIN
	
	SET NOCOUNT ON;

INSERT INTO Aud_ServiceType SELECT *,'D',GETDATE() FROM deleted

END
GO
ALTER TABLE [dbo].[ServiceType] ENABLE TRIGGER [Audit_DeleteServiceType]
GO
/****** Object:  Trigger [dbo].[Audit_InsertServiceType]    Script Date: 5/8/2021 10:41:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[Audit_InsertServiceType]
   ON  [dbo].[ServiceType]
   AFTER insert
AS 
BEGIN
	
	SET NOCOUNT ON;

   INSERT INTO Aud_ServiceType SELECT *,'I',GETDATE() FROM Inserted

END
GO
ALTER TABLE [dbo].[ServiceType] ENABLE TRIGGER [Audit_InsertServiceType]
GO
/****** Object:  Trigger [dbo].[Audit_UpdateServiceType]    Script Date: 5/8/2021 10:41:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[Audit_UpdateServiceType]
   ON  [dbo].[ServiceType]
   AFTER update
AS 
BEGIN
	
	SET NOCOUNT ON;

  INSERT INTO Aud_ServiceType SELECT *,'U',GETDATE() FROM deleted

END
GO
ALTER TABLE [dbo].[ServiceType] ENABLE TRIGGER [Audit_UpdateServiceType]
GO
/****** Object:  Trigger [dbo].[Audit_DeleteStaff]    Script Date: 5/8/2021 10:41:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[Audit_DeleteStaff]
   ON  [dbo].[Staff]
   AFTER delete
AS 
BEGIN
	
	SET NOCOUNT ON;

INSERT INTO Aud_Staff SELECT *,'D',GETDATE() FROM deleted

END
GO
ALTER TABLE [dbo].[Staff] ENABLE TRIGGER [Audit_DeleteStaff]
GO
/****** Object:  Trigger [dbo].[Audit_InsertStaff]    Script Date: 5/8/2021 10:41:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[Audit_InsertStaff]
   ON  [dbo].[Staff]
   AFTER insert
AS 
BEGIN
	
	SET NOCOUNT ON;

   INSERT INTO Aud_Staff SELECT *,'I',GETDATE() FROM Inserted

END
GO
ALTER TABLE [dbo].[Staff] ENABLE TRIGGER [Audit_InsertStaff]
GO
/****** Object:  Trigger [dbo].[Audit_UpdateStaff]    Script Date: 5/8/2021 10:41:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[Audit_UpdateStaff]
   ON  [dbo].[Staff]
   AFTER update
AS 
BEGIN
	
	SET NOCOUNT ON;

  INSERT INTO Aud_Staff SELECT *,'U',GETDATE() FROM deleted

END
GO
ALTER TABLE [dbo].[Staff] ENABLE TRIGGER [Audit_UpdateStaff]
GO
/****** Object:  Trigger [dbo].[Audit_DeleteStaffType]    Script Date: 5/8/2021 10:41:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[Audit_DeleteStaffType]
   ON  [dbo].[StaffType]
   AFTER delete
AS 
BEGIN
	
	SET NOCOUNT ON;

INSERT INTO Aud_StaffType SELECT *,'D',GETDATE() FROM deleted

END
GO
ALTER TABLE [dbo].[StaffType] ENABLE TRIGGER [Audit_DeleteStaffType]
GO
