-- ADDRESS

USE [FiBot]
GO

	/****** Object:  Table [dbo].[Address]    Script Date: 12/9/2018 6:33:40 PM ******/
			SET ANSI_NULLS ON
			GO

			SET QUOTED_IDENTIFIER ON
			GO

			CREATE TABLE [dbo].[Address](
				[AddressId] [int] IDENTITY(1,1) NOT NULL,
				[Address1] [varchar](255) NULL,
				[Address2] [varchar](255) NULL,
				[City] [varchar](255) NULL,
				[State] [varchar](255) NULL,
				[ZipCode] [varchar](255) NULL,
			 CONSTRAINT [PK_Address] PRIMARY KEY CLUSTERED 
			(
				[AddressId] ASC
			)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
			) ON [PRIMARY]
			GO

			ALTER TABLE [dbo].[Address]  WITH CHECK ADD  CONSTRAINT [FK_Address_User] FOREIGN KEY([AddressId])
			REFERENCES [dbo].[Address] ([AddressId])
			GO

			ALTER TABLE [dbo].[Address] CHECK CONSTRAINT [FK_Address_User]
			GO



			-- Budget 

			USE [FiBot]
			GO

	/****** Object:  Table [dbo].[Budget]    Script Date: 12/9/2018 6:34:01 PM ******/
			SET ANSI_NULLS ON
			GO

			SET QUOTED_IDENTIFIER ON
			GO

			CREATE TABLE [dbo].[Budget](
				[BudgetId] [int] IDENTITY(1,1) NOT NULL,
				[CategoryId] [int] NULL,
				[Title] [varchar](255) NULL,
				[About] [varchar](255) NULL,
				[DateStart] [date] NULL,
				[DateEnd] [date] NULL,
				[Active] [int] NULL,
				[CreatedDate] [datetime] NULL,
				[recurring] [int] NULL,
				[UserId] [int] NULL,
			 CONSTRAINT [PK_Budget] PRIMARY KEY CLUSTERED 
			(
				[BudgetId] ASC
			)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
			) ON [PRIMARY]
			GO

			ALTER TABLE [dbo].[Budget]  WITH CHECK ADD  CONSTRAINT [FK_Budget_Categories] FOREIGN KEY([CategoryId])
			REFERENCES [dbo].[Categories] ([CategoryId])
			GO

			ALTER TABLE [dbo].[Budget] CHECK CONSTRAINT [FK_Budget_Categories]
			GO

			ALTER TABLE [dbo].[Budget]  WITH CHECK ADD  CONSTRAINT [FK_Budget_User] FOREIGN KEY([UserId])
			REFERENCES [dbo].[Users] ([UserId])
			GO

			ALTER TABLE [dbo].[Budget] CHECK CONSTRAINT [FK_Budget_User]
			GO



	-- CATEGORIES

		USE [FiBot]
		GO

		/****** Object:  Table [dbo].[Categories]    Script Date: 12/9/2018 6:34:15 PM ******/
		SET ANSI_NULLS ON
		GO

		SET QUOTED_IDENTIFIER ON
		GO

		CREATE TABLE [dbo].[Categories](
			[CategoryId] [int] IDENTITY(1,1) NOT NULL,
			[Name] [varchar](255) NULL,
			[Description] [varchar](255) NULL,
			[CreatedDate] [datetime] NULL,
		 CONSTRAINT [PK_Category\] PRIMARY KEY CLUSTERED 
		(
			[CategoryId] ASC
		)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
		) ON [PRIMARY]
		GO



	-- TRANSACTIONS		
	USE [FiBot]
	GO

	/****** Object:  Table [dbo].[Transactions]    Script Date: 12/9/2018 6:34:32 PM ******/
			SET ANSI_NULLS ON
			GO

			SET QUOTED_IDENTIFIER ON
			GO

			CREATE TABLE [dbo].[Transactions](
				[Amount] [decimal](5, 2) NOT NULL,
				[Title] [varchar](255) NULL,
				[Subject] [varchar](255) NULL,
				[About] [varchar](255) NULL,
				[Scheduled] [int] NULL,
				[ScheduledDate] [date] NULL,
				[TransactionId] [int] IDENTITY(1,1) NOT NULL,
				[CategoryId] [int] NULL,
				[Recurring] [int] NULL,
				[EndDate] [date] NULL,
				[CreatedDate] [datetime] NULL,
				[BudgetId] [int] NULL,
				[UserId] [int] NULL,
				[TransactionType] [int] NULL,
			 CONSTRAINT [PK_Transactions] PRIMARY KEY CLUSTERED 
			(
				[TransactionId] ASC
			)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
			) ON [PRIMARY]
			GO

			ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD  CONSTRAINT [FK_Transactions_Budgets] FOREIGN KEY([BudgetId])
			REFERENCES [dbo].[Budget] ([BudgetId])
			GO

			ALTER TABLE [dbo].[Transactions] CHECK CONSTRAINT [FK_Transactions_Budgets]
			GO

			ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD  CONSTRAINT [FK_Transactions_Categories] FOREIGN KEY([CategoryId])
			REFERENCES [dbo].[Categories] ([CategoryId])
			GO

			ALTER TABLE [dbo].[Transactions] CHECK CONSTRAINT [FK_Transactions_Categories]
			GO

			ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD  CONSTRAINT [FK_Transactions_TTypes] FOREIGN KEY([TransactionType])
			REFERENCES [dbo].[TransactionTypes] ([TransactionType])
			GO

			ALTER TABLE [dbo].[Transactions] CHECK CONSTRAINT [FK_Transactions_TTypes]
			GO

			ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD  CONSTRAINT [FK_Transactions_Users] FOREIGN KEY([UserId])
			REFERENCES [dbo].[Users] ([UserId])
			GO

			ALTER TABLE [dbo].[Transactions] CHECK CONSTRAINT [FK_Transactions_Users]
			GO


	-- Transaction Types

			USE [FiBot]
			GO

			/****** Object:  Table [dbo].[TransactionTypes]    Script Date: 12/9/2018 6:34:44 PM ******/
			SET ANSI_NULLS ON
			GO

			SET QUOTED_IDENTIFIER ON
			GO

			CREATE TABLE [dbo].[TransactionTypes](
				[TransactionType] [int] NOT NULL,
				[Name] [varchar](255) NULL,
				[Description] [varchar](255) NULL,
				[CreatedDate] [datetime] NULL,
			 CONSTRAINT [PK_TransactionTypes] PRIMARY KEY CLUSTERED 
			(
				[TransactionType] ASC
			)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
			) ON [PRIMARY]
			GO

			ALTER TABLE [dbo].[TransactionTypes] ADD  CONSTRAINT [DF_TransactionTypes_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
			GO


