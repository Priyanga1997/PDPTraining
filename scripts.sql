USE [DigitalBooks]
GO
/****** Object:  Table [dbo].[Book]    Script Date: 04-01-2023 14:34:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book](
	[BookId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NULL,
	[Category] [nvarchar](50) NULL,
	[Image] [nvarchar](50) NULL,
	[Price] [int] NULL,
	[Publisher] [nvarchar](50) NULL,
	[Active] [nvarchar](50) NULL,
	[BookContent] [nvarchar](max) NULL,
	[Author] [nvarchar](50) NULL,
	[EmailId] [nvarchar](50) NULL,
	[UserId] [int] NULL,
 CONSTRAINT [PK_Book] PRIMARY KEY CLUSTERED 
(
	[BookId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subscription]    Script Date: 04-01-2023 14:34:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subscription](
	[SubscriptionId] [int] IDENTITY(1,1) NOT NULL,
	[BookId] [int] NULL,
	[Title] [nvarchar](50) NULL,
	[EmailId] [nvarchar](50) NULL,
	[SubscriptionActive] [nvarchar](50) NULL,
	[UserId] [int] NULL,
	[Author] [nvarchar](50) NULL,
 CONSTRAINT [PK_Subscription] PRIMARY KEY CLUSTERED 
(
	[SubscriptionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 04-01-2023 14:34:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NULL,
	[EmailId] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[UserType] [nvarchar](50) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Book] ON 

INSERT [dbo].[Book] ([BookId], [Title], [Category], [Image], [Price], [Publisher], [Active], [BookContent], [Author], [EmailId], [UserId]) VALUES (2, N'aa', N'Fantasy', N'books/ImagesWizardOfEarthSea.jpg20221228224335', 100, N'aa', N'yes', N'aa', N'aa', NULL, NULL)
INSERT [dbo].[Book] ([BookId], [Title], [Category], [Image], [Price], [Publisher], [Active], [BookContent], [Author], [EmailId], [UserId]) VALUES (3, N'The Name of the Wind', N'Fantasy', NULL, 100, N'DAW Books', NULL, NULL, N'Patrick Rothfuss', NULL, NULL)
INSERT [dbo].[Book] ([BookId], [Title], [Category], [Image], [Price], [Publisher], [Active], [BookContent], [Author], [EmailId], [UserId]) VALUES (4, N'The Name of the Wind', N'Fantasy', NULL, 100, N'DAW Books', NULL, NULL, N'Patrick Rothfuss', NULL, NULL)
INSERT [dbo].[Book] ([BookId], [Title], [Category], [Image], [Price], [Publisher], [Active], [BookContent], [Author], [EmailId], [UserId]) VALUES (5, N'The Name of the Wind', N'Fantasy', NULL, 100, N'DAW Books', NULL, NULL, N'Patrick Rothfuss', NULL, NULL)
INSERT [dbo].[Book] ([BookId], [Title], [Category], [Image], [Price], [Publisher], [Active], [BookContent], [Author], [EmailId], [UserId]) VALUES (7, N'Pride and Prejudice', N'Fantasy', N'books/ImagesPrideAndPrejudice.jpg20221230125023', 200, N'T. Egerton, Whitehall', N'yes', N'Pride and Prejudice is an 1813 novel of manners by Jane Austen. The novel follows the character development of Elizabeth Bennet, the dynamic protagonist of the book who learns about the repercussions of hasty judgments and comes to appreciate the difference between superficial goodness and actual goodness.', N'Jane Austen', N'testauthor@gmail.com', NULL)
INSERT [dbo].[Book] ([BookId], [Title], [Category], [Image], [Price], [Publisher], [Active], [BookContent], [Author], [EmailId], [UserId]) VALUES (8, N'Where The Mountain Meets The Moon', N'Fiction', NULL, 300, N'Little, Brown and Company', N'yes', N'Where the Mountain Meets the Moon is a fantasy-adventure children''s novel inspired by Chinese folklore. It was written and illustrated by Grace Lin and published in 2009.', N'Grace Lin', N'testauthor@gmail.com', NULL)
INSERT [dbo].[Book] ([BookId], [Title], [Category], [Image], [Price], [Publisher], [Active], [BookContent], [Author], [EmailId], [UserId]) VALUES (10, N'A Wizard Of Earthsea', N'Fantasy', NULL, 150, N'Parnassus Press', N'yes', N'A Wizard of Earthsea is a fantasy novel written by American author Ursula K. Le Guin and first published by the small press Parnassus in 1968. It is regarded as a classic of children''s literature and of fantasy, within which it is widely influential.', N'Ursula K. Le Guin', N'testauthor@gmail.com', NULL)
SET IDENTITY_INSERT [dbo].[Book] OFF
GO
SET IDENTITY_INSERT [dbo].[Subscription] ON 

INSERT [dbo].[Subscription] ([SubscriptionId], [BookId], [Title], [EmailId], [SubscriptionActive], [UserId], [Author]) VALUES (1, 2, N'aa', NULL, N'yes', NULL, NULL)
INSERT [dbo].[Subscription] ([SubscriptionId], [BookId], [Title], [EmailId], [SubscriptionActive], [UserId], [Author]) VALUES (2, 8, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Subscription] ([SubscriptionId], [BookId], [Title], [EmailId], [SubscriptionActive], [UserId], [Author]) VALUES (3, 8, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Subscription] ([SubscriptionId], [BookId], [Title], [EmailId], [SubscriptionActive], [UserId], [Author]) VALUES (7, 8, N'Where The Mountain Meets The Moon', N'testauthor@gmail.com', N'yes', NULL, NULL)
INSERT [dbo].[Subscription] ([SubscriptionId], [BookId], [Title], [EmailId], [SubscriptionActive], [UserId], [Author]) VALUES (8, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Subscription] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserId], [UserName], [EmailId], [Password], [UserType]) VALUES (1, N'Priyanga', N'priyanga@gmail.com', N'Password01', N'Author')
INSERT [dbo].[User] ([UserId], [UserName], [EmailId], [Password], [UserType]) VALUES (2, N'Test', N'testauthor@gmail.com', N'Password01', N'Author')
INSERT [dbo].[User] ([UserId], [UserName], [EmailId], [Password], [UserType]) VALUES (3, N'TestReader', N'testreader@gmail.com', N'Password01', N'Reader')
INSERT [dbo].[User] ([UserId], [UserName], [EmailId], [Password], [UserType]) VALUES (4, NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserId], [UserName], [EmailId], [Password], [UserType]) VALUES (5, N'Priya', N'priya@gmail.com', N'Password01', N'author')
INSERT [dbo].[User] ([UserId], [UserName], [EmailId], [Password], [UserType]) VALUES (6, N'Test1', N'test1@gmail.com', N'Password01', N'author')
INSERT [dbo].[User] ([UserId], [UserName], [EmailId], [Password], [UserType]) VALUES (7, N'Test1', N'test1@gmail.com', N'Password', N'Author')
INSERT [dbo].[User] ([UserId], [UserName], [EmailId], [Password], [UserType]) VALUES (8, N'Test2', N'test2@gmail.com', N'Password01', N'Author')
INSERT [dbo].[User] ([UserId], [UserName], [EmailId], [Password], [UserType]) VALUES (9, N'Test3', N'test3@gmail.com', N'Password01', N'Author')
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Book]  WITH CHECK ADD  CONSTRAINT [FK_Book_User1] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[Book] CHECK CONSTRAINT [FK_Book_User1]
GO
ALTER TABLE [dbo].[Subscription]  WITH CHECK ADD  CONSTRAINT [FK_Subscription_Book1] FOREIGN KEY([BookId])
REFERENCES [dbo].[Book] ([BookId])
GO
ALTER TABLE [dbo].[Subscription] CHECK CONSTRAINT [FK_Subscription_Book1]
GO
ALTER TABLE [dbo].[Subscription]  WITH CHECK ADD  CONSTRAINT [FK_Subscription_User1] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[Subscription] CHECK CONSTRAINT [FK_Subscription_User1]
GO
