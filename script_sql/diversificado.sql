USE [udeo]
GO

/****** Object:  Table [dbo].[DIVERSIFICADO]    Script Date: 6/06/2024 01:07:38 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DIVERSIFICADO](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DIVERSIFICADO] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_DIVERSIFICADO] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


