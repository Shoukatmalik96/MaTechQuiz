USE [Matech_19Oct2021]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 10/21/2021 1:55:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [varchar](50) NOT NULL,
	[CategoryDescription] [varchar](320) NOT NULL,
	[ParentCategoryID] [int] NULL,
	[DisplaySeqNo] [int] NULL,
	[IsVisible] [bit] NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 10/21/2021 1:55:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[SKU] [varchar](50) NOT NULL,
	[Description] [varchar](50) NOT NULL,
	[Price] [decimal](18, 0) NOT NULL,
	[ProductCode] [varchar](50) NOT NULL,
	[ProductTypeId] [int] NOT NULL,
	[CatgoryID] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductType]    Script Date: 10/21/2021 1:55:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductType](
	[ProductTypeID] [int] IDENTITY(1,1) NOT NULL,
	[ProductTypeName] [varchar](50) NOT NULL,
	[Initials] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ProductType] PRIMARY KEY CLUSTERED 
(
	[ProductTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 10/21/2021 1:55:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 
GO
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [CategoryDescription], [ParentCategoryID], [DisplaySeqNo], [IsVisible]) VALUES (2, N'Mobiles', N'Branded Mobil phones', NULL, 2, 1)
GO
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [CategoryDescription], [ParentCategoryID], [DisplaySeqNo], [IsVisible]) VALUES (3, N'Electronics', N'electronics', NULL, 3, 1)
GO
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [CategoryDescription], [ParentCategoryID], [DisplaySeqNo], [IsVisible]) VALUES (24, N'Geo', N'news', NULL, 5, 1)
GO
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [CategoryDescription], [ParentCategoryID], [DisplaySeqNo], [IsVisible]) VALUES (27, N'Hello', N'Firends', NULL, 5, 1)
GO
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 
GO
INSERT [dbo].[Products] ([ProductID], [Name], [SKU], [Description], [Price], [ProductCode], [ProductTypeId], [CatgoryID], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy]) VALUES (1, N'Samsumg Ideapad', N'1234567891012', N'Lenovo 15 workstation', CAST(120000 AS Decimal(18, 0)), N'LEN-201', 1, 1, 1, 0, CAST(N'2021-10-19T16:20:50.677' AS DateTime), 1)
GO
INSERT [dbo].[Products] ([ProductID], [Name], [SKU], [Description], [Price], [ProductCode], [ProductTypeId], [CatgoryID], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy]) VALUES (2, N'HP Ideapad', N'1234567891012', N'HP 15 workstation', CAST(120000 AS Decimal(18, 0)), N'HP-201', 1, 1, 1, 0, CAST(N'2021-10-19T16:20:50.680' AS DateTime), 1)
GO
INSERT [dbo].[Products] ([ProductID], [Name], [SKU], [Description], [Price], [ProductCode], [ProductTypeId], [CatgoryID], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy]) VALUES (3, N'Dell Ideapad', N'1234567891012', N'Dell 15 workstation', CAST(120000 AS Decimal(18, 0)), N'DELL-201', 1, 1, 1, 0, CAST(N'2021-10-19T16:20:50.683' AS DateTime), 1)
GO
INSERT [dbo].[Products] ([ProductID], [Name], [SKU], [Description], [Price], [ProductCode], [ProductTypeId], [CatgoryID], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy]) VALUES (4, N'Samsung Note 5', N'1234567891012', N'samsung note 5', CAST(80000 AS Decimal(18, 0)), N'SMG-201', 1, 2, 1, 0, CAST(N'2021-10-19T16:21:02.367' AS DateTime), 1)
GO
INSERT [dbo].[Products] ([ProductID], [Name], [SKU], [Description], [Price], [ProductCode], [ProductTypeId], [CatgoryID], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy]) VALUES (5, N'Iphone 11', N'1234567891012', N'Iphone 11 pro', CAST(120000 AS Decimal(18, 0)), N'IPhone-11', 1, 2, 1, 0, CAST(N'2021-10-19T16:21:02.373' AS DateTime), 1)
GO
INSERT [dbo].[Products] ([ProductID], [Name], [SKU], [Description], [Price], [ProductCode], [ProductTypeId], [CatgoryID], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy]) VALUES (6, N'Iphone 10', N'1234567891012', N'Iphone 10 pro', CAST(120000 AS Decimal(18, 0)), N'IPhone-10', 1, 2, 1, 0, CAST(N'2021-10-19T16:21:02.373' AS DateTime), 1)
GO
INSERT [dbo].[Products] ([ProductID], [Name], [SKU], [Description], [Price], [ProductCode], [ProductTypeId], [CatgoryID], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy]) VALUES (7, N'Smart TV', N'1234567891012', N'Smart tv with led', CAST(80000 AS Decimal(18, 0)), N'SMG-201', 1, 3, 1, 0, CAST(N'2021-10-19T16:22:07.987' AS DateTime), 1)
GO
INSERT [dbo].[Products] ([ProductID], [Name], [SKU], [Description], [Price], [ProductCode], [ProductTypeId], [CatgoryID], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy]) VALUES (8, N'Gucer machine', N'1234567891012', N'Gucer with all functions', CAST(120000 AS Decimal(18, 0)), N'IPhone-11', 1, 3, 1, 0, CAST(N'2021-10-19T16:22:07.987' AS DateTime), 1)
GO
INSERT [dbo].[Products] ([ProductID], [Name], [SKU], [Description], [Price], [ProductCode], [ProductTypeId], [CatgoryID], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy]) VALUES (9, N'washing machine', N'1234567891012', N'min washing machine', CAST(120000 AS Decimal(18, 0)), N'IPhone-10', 1, 3, 1, 0, CAST(N'2021-10-19T16:22:07.987' AS DateTime), 1)
GO
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 
GO
INSERT [dbo].[Users] ([UserID], [FirstName], [LastName], [Email], [Password]) VALUES (1, N'Shoukat', N'Malik', N'shoukatmalik70@gmail.com', N'123')
GO
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
/****** Object:  StoredProcedure [dbo].[PopulateDataInCategoryTable]    Script Date: 10/21/2021 1:55:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PopulateDataInCategoryTable] 
(@CategoryID   INTEGER,
 @CategoryName    VARCHAR(50),
 @categoryDescription     VARCHAR(320),
 @DisplaySeqNo        int,
 @IsVisible bit ,
 @StatementType NVARCHAR(20) = '')


AS
  BEGIN
  --declare @IsVisible          bit = 1
      IF @StatementType = 'Insert'
        BEGIN
            INSERT INTO Categories
                        (CategoryName,
                         CategoryDescription,
                         DisplaySeqNo,
                         IsVisible)
            VALUES     (
                         @CategoryName,
                         @categoryDescription,
                         @DisplaySeqNo,
						 @IsVisible)
        END

      IF @StatementType = 'Select'
        BEGIN
            SELECT *
            FROM   Categories
        END

      IF @StatementType = 'Update'
        BEGIN
            UPDATE Categories
            SET    CategoryName = @CategoryName,
                   CategoryDescription = @categoryDescription,
                   DisplaySeqNo = @DisplaySeqNo
            WHERE  CategoryID = @CategoryID
        END
      ELSE IF @StatementType = 'Delete'
        BEGIN
            DELETE FROM Categories
            WHERE  CategoryID = @CategoryID
        END
  END
GO
