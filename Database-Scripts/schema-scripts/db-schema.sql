USE [Matech_19Oct2021]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 10/20/2021 7:32:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CateogoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [varchar](50) NOT NULL,
	[CategoryDescription] [varchar](320) NOT NULL,
	[ParentCategoryID] [int] NULL,
	[DisplaySeqNo] [int] NULL,
	[IsVisible] [bit] NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CateogoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 10/20/2021 7:32:16 PM ******/
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
/****** Object:  Table [dbo].[ProductType]    Script Date: 10/20/2021 7:32:16 PM ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 10/20/2021 7:32:16 PM ******/
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
/****** Object:  StoredProcedure [dbo].[PopulateDataInCategoryTable]    Script Date: 10/20/2021 7:32:16 PM ******/
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
            WHERE  CateogoryID = @CategoryID
        END
      ELSE IF @StatementType = 'Delete'
        BEGIN
            DELETE FROM Categories
            WHERE  CateogoryID = @CategoryID
        END
  END
GO
