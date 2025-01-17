USE [master]
GO
/****** Object:  Database [baseIBM]    Script Date: 28/05/2024 7:50:53 p. m. ******/
CREATE DATABASE [baseIBM]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'baseIBM', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\baseIBM.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'baseIBM_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\baseIBM_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [baseIBM] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [baseIBM].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [baseIBM] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [baseIBM] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [baseIBM] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [baseIBM] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [baseIBM] SET ARITHABORT OFF 
GO
ALTER DATABASE [baseIBM] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [baseIBM] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [baseIBM] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [baseIBM] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [baseIBM] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [baseIBM] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [baseIBM] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [baseIBM] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [baseIBM] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [baseIBM] SET  DISABLE_BROKER 
GO
ALTER DATABASE [baseIBM] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [baseIBM] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [baseIBM] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [baseIBM] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [baseIBM] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [baseIBM] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [baseIBM] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [baseIBM] SET RECOVERY FULL 
GO
ALTER DATABASE [baseIBM] SET  MULTI_USER 
GO
ALTER DATABASE [baseIBM] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [baseIBM] SET DB_CHAINING OFF 
GO
ALTER DATABASE [baseIBM] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [baseIBM] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [baseIBM] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [baseIBM] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'baseIBM', N'ON'
GO
ALTER DATABASE [baseIBM] SET QUERY_STORE = ON
GO
ALTER DATABASE [baseIBM] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [baseIBM]
GO
/****** Object:  Table [dbo].[cliente]    Script Date: 28/05/2024 7:50:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cliente](
	[id_cliente] [int] NOT NULL,
	[nombre_cliente] [varchar](200) NOT NULL,
	[direccion_cliente] [geography] NOT NULL,
	[tipo_cliente] [int] NOT NULL,
 CONSTRAINT [PK_cliente] PRIMARY KEY CLUSTERED 
(
	[id_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DET_ventas_productos]    Script Date: 28/05/2024 7:50:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DET_ventas_productos](
	[id_ventas] [int] NOT NULL,
	[id_productos] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[productos]    Script Date: 28/05/2024 7:50:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[productos](
	[id_producto] [int] NOT NULL,
	[nombre_producto] [varchar](200) NOT NULL,
	[foto_producto] [varbinary](max) NOT NULL,
	[precio] [money] NOT NULL,
	[tipo_electronico] [int] NOT NULL,
 CONSTRAINT [PK_productos] PRIMARY KEY CLUSTERED 
(
	[id_producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipo_cliente]    Script Date: 28/05/2024 7:50:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipo_cliente](
	[id_tipocliente] [int] NOT NULL,
	[tipo_cliente] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tipo_cliente] PRIMARY KEY CLUSTERED 
(
	[id_tipocliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipo_producto]    Script Date: 28/05/2024 7:50:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipo_producto](
	[id_tipoprod] [int] NOT NULL,
	[tipo_producto] [varchar](100) NOT NULL,
 CONSTRAINT [PK_tipo_producto] PRIMARY KEY CLUSTERED 
(
	[id_tipoprod] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vendedores]    Script Date: 28/05/2024 7:50:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vendedores](
	[id_vendedor] [int] NOT NULL,
	[nombre_vendedor] [varchar](200) NOT NULL,
	[foto_vendedor] [varbinary](max) NOT NULL,
 CONSTRAINT [PK_vendedores] PRIMARY KEY CLUSTERED 
(
	[id_vendedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ventas]    Script Date: 28/05/2024 7:50:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ventas](
	[id_venta] [int] NOT NULL,
	[comision] [bit] NOT NULL,
	[total] [money] NOT NULL,
	[punto_venta] [geography] NOT NULL,
	[vendedor_asociado] [int] NOT NULL,
	[cliente_asociado] [int] NOT NULL,
 CONSTRAINT [PK_ventas] PRIMARY KEY CLUSTERED 
(
	[id_venta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[cliente]  WITH CHECK ADD  CONSTRAINT [FK_cliente_tipo_cliente] FOREIGN KEY([tipo_cliente])
REFERENCES [dbo].[tipo_cliente] ([id_tipocliente])
GO
ALTER TABLE [dbo].[cliente] CHECK CONSTRAINT [FK_cliente_tipo_cliente]
GO
ALTER TABLE [dbo].[DET_ventas_productos]  WITH CHECK ADD  CONSTRAINT [FK_DET_ventas_productos_productos] FOREIGN KEY([id_productos])
REFERENCES [dbo].[productos] ([id_producto])
GO
ALTER TABLE [dbo].[DET_ventas_productos] CHECK CONSTRAINT [FK_DET_ventas_productos_productos]
GO
ALTER TABLE [dbo].[DET_ventas_productos]  WITH CHECK ADD  CONSTRAINT [FK_DET_ventas_productos_ventas] FOREIGN KEY([id_ventas])
REFERENCES [dbo].[ventas] ([id_venta])
GO
ALTER TABLE [dbo].[DET_ventas_productos] CHECK CONSTRAINT [FK_DET_ventas_productos_ventas]
GO
ALTER TABLE [dbo].[productos]  WITH CHECK ADD  CONSTRAINT [FK_productos_tipo_producto] FOREIGN KEY([tipo_electronico])
REFERENCES [dbo].[tipo_producto] ([id_tipoprod])
GO
ALTER TABLE [dbo].[productos] CHECK CONSTRAINT [FK_productos_tipo_producto]
GO
ALTER TABLE [dbo].[ventas]  WITH CHECK ADD  CONSTRAINT [FK_ventas_cliente] FOREIGN KEY([cliente_asociado])
REFERENCES [dbo].[cliente] ([id_cliente])
GO
ALTER TABLE [dbo].[ventas] CHECK CONSTRAINT [FK_ventas_cliente]
GO
ALTER TABLE [dbo].[ventas]  WITH CHECK ADD  CONSTRAINT [FK_ventas_vendedores] FOREIGN KEY([vendedor_asociado])
REFERENCES [dbo].[vendedores] ([id_vendedor])
GO
ALTER TABLE [dbo].[ventas] CHECK CONSTRAINT [FK_ventas_vendedores]
GO
USE [master]
GO
ALTER DATABASE [baseIBM] SET  READ_WRITE 
GO
