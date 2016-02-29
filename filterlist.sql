USE [SQLOPSDB]
GO

/****** Object:  Table [dbo].[filterlist]    Script Date: 2/28/2016 9:22:40 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[filterlist](
	[databasename] [varchar](255) NULL,
	[tablename] [varchar](255) NULL,
	[aliasname] [varchar](255) NULL,
	[columnname] [varchar](255) NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


