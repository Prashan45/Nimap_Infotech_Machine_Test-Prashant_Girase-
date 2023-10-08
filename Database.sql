USE [DbNimapInfotech ]
GO
/****** Object:  Table [dbo].[MCategory]    Script Date: 10/5/2023 12:26:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MCategory](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](50) NULL,
	[IsActiv] [bit] NULL,
 CONSTRAINT [PK_MCategory] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MProduct]    Script Date: 10/5/2023 12:26:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MProduct](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](50) NULL,
	[CategoryId] [int] NULL,
 CONSTRAINT [PK_MProduct] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[MCategory] ON 
GO
INSERT [dbo].[MCategory] ([CategoryId], [CategoryName], [IsActiv]) VALUES (1, N'Headache', 1)
GO
INSERT [dbo].[MCategory] ([CategoryId], [CategoryName], [IsActiv]) VALUES (2, N'Fever', 1)
GO
INSERT [dbo].[MCategory] ([CategoryId], [CategoryName], [IsActiv]) VALUES (3, N'Vomiting', 1)
GO
INSERT [dbo].[MCategory] ([CategoryId], [CategoryName], [IsActiv]) VALUES (4, N'Cold', 1)
GO	
SET IDENTITY_INSERT [dbo].[MCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[MProduct] ON 
GO
INSERT [dbo].[MProduct] ([ProductId], [ProductName], [CategoryId]) VALUES (1, N'Floricet', 1)
GO
INSERT [dbo].[MProduct] ([ProductId], [ProductName], [CategoryId]) VALUES (2, N'Paracetamol', 2)
GO
INSERT [dbo].[MProduct] ([ProductId], [ProductName], [CategoryId]) VALUES (3, N'Emetrol', 3)
GO
INSERT [dbo].[MProduct] ([ProductId], [ProductName], [CategoryId]) VALUES (4, N'Filfast-180', 4)
GO
INSERT [dbo].[MProduct] ([ProductId], [ProductName], [CategoryId]) VALUES (5, N'Acetaminophen', 2)
GO
INSERT [dbo].[MProduct] ([ProductId], [ProductName], [CategoryId]) VALUES (6, N'Prescription naproxen',1)
GO
INSERT [dbo].[MProduct] ([ProductId], [ProductName], [CategoryId]) VALUES (7, N'Meclizine (Bonine)', 3)
GO
INSERT [dbo].[MProduct] ([ProductId], [ProductName], [CategoryId]) VALUES (8, N'XYLID-PC Tablet', 4)
GO
INSERT [dbo].[MProduct] ([ProductId], [ProductName], [CategoryId]) VALUES (9, N'XYLID-PC Tablet', 1)
GO
INSERT [dbo].[MProduct] ([ProductId], [ProductName], [CategoryId]) VALUES (10, N'Dolono', 2)
GO
INSERT [dbo].[MProduct] ([ProductId], [ProductName], [CategoryId]) VALUES (10, N'ALTRIZ-M',4)
GO	
INSERT [dbo].[MProduct] ([ProductId], [ProductName], [CategoryId]) VALUES (11, N'Tusq',4)
GO	
INSERT [dbo].[MProduct] ([ProductId], [ProductName], [CategoryId]) VALUES (12, N'Acetaminophen',2)
GO
INSERT [dbo].[MProduct] ([ProductId], [ProductName], [CategoryId]) VALUES (13, N'XYLID-PC Tablet',4)
GO	
INSERT [dbo].[MProduct] ([ProductId], [ProductName], [CategoryId]) VALUES (14, N'ALTRIZ-M',4)
GO
INSERT [dbo].[MProduct] ([ProductId], [ProductName], [CategoryId]) VALUES (15, N'Sumatriptan',1)
GO
INSERT [dbo].[MProduct] ([ProductId], [ProductName], [CategoryId]) VALUES (16, N'Aspirin',1)
GO
INSERT [dbo].[MProduct] ([ProductId], [ProductName], [CategoryId]) VALUES (17, N'Naproxen ',1)
GO
INSERT [dbo].[MProduct] ([ProductId], [ProductName], [CategoryId]) VALUES (18, N'Ibuprofen ',2)
GO
INSERT [dbo].[MProduct] ([ProductId], [ProductName], [CategoryId]) VALUES (19, N'Dimenhydrinate  ',3)
GO
INSERT [dbo].[MProduct] ([ProductId], [ProductName], [CategoryId]) VALUES (20, N'Ondansetron',3)
GO
INSERT [dbo].[MProduct] ([ProductId], [ProductName], [CategoryId]) VALUES (21, N'Pseudoephedrine',4)
GO
INSERT [dbo].[MProduct] ([ProductId], [ProductName], [CategoryId]) VALUES (22, N'Chlorpheniramine ',4)
GO	
SET IDENTITY_INSERT [dbo].[MProduct] OFF
GO
/****** Object:  StoredProcedure [dbo].[SpProduct]    Script Date: 10/5/2023 12:26:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[SpProduct] 
@ProductId int ,
@ProductName nvarchar(50),
@CategoryId int,
@Flag nvarchar(1)
As
Begin
if(@Flag='I')
Begin
Insert into MProduct values(@ProductName,@CategoryId)
End
If(@Flag='U')
Begin
Update MProduct Set 
ProductName=@ProductName,CategoryId=@CategoryId
Where ProductId=@ProductId
End
End
GO

create proc [dbo].[SpCategory]
@CategoryId int,
@CategoryName nvarchar(50),
@IsActiv bit,
@IUFlag nvarchar(1)
as 
begin 
if(@IUFlag='I')
begin 
insert into MCategory(CategoryName,IsActiv) values (@CategoryName,@IsActiv)
end
if(@IUFlag='U')
begin 
update MCategory 
set CategoryName=@CategoryName,
IsActiv =@IsActiv
where CategoryId=@CategoryId
end
end



