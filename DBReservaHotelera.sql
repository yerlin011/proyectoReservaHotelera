USE [master]
GO
/****** Object:  Database [ReservasHotel ]    Script Date: 5/1/2022 8:09:43 PM ******/
CREATE DATABASE [ReservasHotel ]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ReservasHotel', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\ReservasHotel .mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ReservasHotel _log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\ReservasHotel _log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ReservasHotel ] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ReservasHotel ].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ReservasHotel ] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ReservasHotel ] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ReservasHotel ] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ReservasHotel ] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ReservasHotel ] SET ARITHABORT OFF 
GO
ALTER DATABASE [ReservasHotel ] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ReservasHotel ] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ReservasHotel ] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ReservasHotel ] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ReservasHotel ] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ReservasHotel ] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ReservasHotel ] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ReservasHotel ] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ReservasHotel ] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ReservasHotel ] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ReservasHotel ] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ReservasHotel ] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ReservasHotel ] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ReservasHotel ] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ReservasHotel ] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ReservasHotel ] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ReservasHotel ] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ReservasHotel ] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ReservasHotel ] SET  MULTI_USER 
GO
ALTER DATABASE [ReservasHotel ] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ReservasHotel ] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ReservasHotel ] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ReservasHotel ] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [ReservasHotel ] SET DELAYED_DURABILITY = DISABLED 
GO
USE [ReservasHotel ]
GO
/****** Object:  Table [dbo].[Administrador]    Script Date: 5/1/2022 8:09:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Administrador](
	[administrador_id] [bigint] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[is_active] [bit] NOT NULL CONSTRAINT [DF_Administrador_is_active]  DEFAULT ((1)),
 CONSTRAINT [PK_Administrador] PRIMARY KEY CLUSTERED 
(
	[administrador_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Habitacion]    Script Date: 5/1/2022 8:09:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Habitacion](
	[idhabitacion] [bigint] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[capacidad] [tinyint] NOT NULL,
 CONSTRAINT [PK_Habitacion] PRIMARY KEY CLUSTERED 
(
	[idhabitacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Hotel]    Script Date: 5/1/2022 8:09:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Hotel](
	[idhotel] [bigint] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[descripcion] [varchar](1000) NOT NULL,
	[categoria] [tinyint] NOT NULL,
	[domicilio] [varchar](100) NOT NULL,
	[localidad] [varchar](50) NOT NULL,
	[provincia] [varchar](50) NOT NULL,
	[codpostal] [varchar](50) NOT NULL,
	[telefono] [varchar](50) NOT NULL,
	[administrador_id] [bigint] NOT NULL,
 CONSTRAINT [PK_Hotel] PRIMARY KEY CLUSTERED 
(
	[idhotel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Reserva]    Script Date: 5/1/2022 8:09:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Reserva](
	[idreserva] [bigint] IDENTITY(1,1) NOT NULL,
	[fechainicio] [datetime] NOT NULL,
	[fechafin] [datetime2](7) NOT NULL,
	[precio] [money] NOT NULL,
	[ocupacion] [tinyint] NOT NULL,
	[nombretomador] [varchar](100) NOT NULL,
	[cantidad] [int] NOT NULL,
	[cliente_id] [bigint] NULL,
	[hotel_id] [bigint] NULL,
	[habitacion_id] [bigint] NULL,
 CONSTRAINT [PK_Reserva] PRIMARY KEY CLUSTERED 
(
	[idreserva] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TipoHabitacion]    Script Date: 5/1/2022 8:09:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TipoHabitacion](
	[tipoHabitacion_id] [bigint] IDENTITY(1,1) NOT NULL,
	[hotel_id] [bigint] NOT NULL,
	[habitacion_id] [bigint] NOT NULL,
	[descripcion] [varchar](1000) NOT NULL,
	[precio] [money] NOT NULL,
	[numhabitaciones] [tinyint] NOT NULL,
 CONSTRAINT [PK_TipoHabitacion] PRIMARY KEY CLUSTERED 
(
	[tipoHabitacion_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 5/1/2022 8:09:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Usuario](
	[idusuario] [bigint] IDENTITY(1,1) NOT NULL,
	[usuario] [varchar](50) NULL,
	[nombres] [varchar](50) NULL,
	[correo] [varchar](255) NULL,
	[clave] [varchar](60) NULL,
	[is_active] [bit] NOT NULL CONSTRAINT [DF_Usuario_is_active]  DEFAULT ((1)),
	[is_admin] [bit] NOT NULL CONSTRAINT [DF_Usuario_is_admin]  DEFAULT ((0)),
	[fechacreacion] [datetime] NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[idusuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Administrador] ON 

INSERT [dbo].[Administrador] ([administrador_id], [nombre], [is_active]) VALUES (1, N'Robot2', 1)
SET IDENTITY_INSERT [dbo].[Administrador] OFF
SET IDENTITY_INSERT [dbo].[Habitacion] ON 

INSERT [dbo].[Habitacion] ([idhabitacion], [nombre], [capacidad]) VALUES (1, N'3B', 8)
SET IDENTITY_INSERT [dbo].[Habitacion] OFF
SET IDENTITY_INSERT [dbo].[Usuario] ON 

INSERT [dbo].[Usuario] ([idusuario], [usuario], [nombres], [correo], [clave], [is_active], [is_admin], [fechacreacion]) VALUES (1, N'yerlin022', N'yerlin', N'yerlin022@gmail.com', N'1234', 1, 1, CAST(N'2022-04-27 00:00:00.000' AS DateTime))
INSERT [dbo].[Usuario] ([idusuario], [usuario], [nombres], [correo], [clave], [is_active], [is_admin], [fechacreacion]) VALUES (2, N'admin', N'Robot', N'robot@gmail.com', N'1234', 1, 1, CAST(N'2022-04-30 23:48:22.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Usuario] OFF
ALTER TABLE [dbo].[Hotel]  WITH CHECK ADD  CONSTRAINT [FK_Hotel_Administrador] FOREIGN KEY([administrador_id])
REFERENCES [dbo].[Administrador] ([administrador_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Hotel] CHECK CONSTRAINT [FK_Hotel_Administrador]
GO
ALTER TABLE [dbo].[Reserva]  WITH CHECK ADD  CONSTRAINT [FK_Reserva_Habitacion] FOREIGN KEY([habitacion_id])
REFERENCES [dbo].[Habitacion] ([idhabitacion])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Reserva] CHECK CONSTRAINT [FK_Reserva_Habitacion]
GO
ALTER TABLE [dbo].[Reserva]  WITH CHECK ADD  CONSTRAINT [FK_Reserva_Hotel] FOREIGN KEY([hotel_id])
REFERENCES [dbo].[Hotel] ([idhotel])
GO
ALTER TABLE [dbo].[Reserva] CHECK CONSTRAINT [FK_Reserva_Hotel]
GO
ALTER TABLE [dbo].[Reserva]  WITH CHECK ADD  CONSTRAINT [FK_Reserva_Usuario] FOREIGN KEY([cliente_id])
REFERENCES [dbo].[Usuario] ([idusuario])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Reserva] CHECK CONSTRAINT [FK_Reserva_Usuario]
GO
ALTER TABLE [dbo].[TipoHabitacion]  WITH CHECK ADD  CONSTRAINT [FK_TipoHabitacion_Habitacion] FOREIGN KEY([habitacion_id])
REFERENCES [dbo].[Habitacion] ([idhabitacion])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TipoHabitacion] CHECK CONSTRAINT [FK_TipoHabitacion_Habitacion]
GO
ALTER TABLE [dbo].[TipoHabitacion]  WITH CHECK ADD  CONSTRAINT [FK_TipoHabitacion_Hotel] FOREIGN KEY([hotel_id])
REFERENCES [dbo].[Hotel] ([idhotel])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TipoHabitacion] CHECK CONSTRAINT [FK_TipoHabitacion_Hotel]
GO
/****** Object:  StoredProcedure [dbo].[SpEditarAdministradores]    Script Date: 5/1/2022 8:09:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SpEditarAdministradores](

 @idAdministrador bigint,
 @Nombre VARCHAR(100),
 @IsActive bit
 )
AS

 UPDATE Administrador SET nombre=@Nombre, is_active=@IsActive WHERE administrador_id=@idAdministrador




GO
/****** Object:  StoredProcedure [dbo].[SpEditarHabitaciones]    Script Date: 5/1/2022 8:09:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SpEditarHabitaciones](

 @IdHabitacion int,
 @Nombre VARCHAR(100),
 @Capacidad int
 )
AS

 UPDATE Habitacion SET nombre=@Nombre, capacidad=@Capacidad WHERE idhabitacion=@IdHabitacion



GO
/****** Object:  StoredProcedure [dbo].[SpEditarUsuarios]    Script Date: 5/1/2022 8:09:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SpEditarUsuarios](

 @IdUsuario int,
 @Usuario VARCHAR(50),
 @Nombres VARCHAR(50),
 @Correo VARCHAR(255),
 @Clave VARCHAR(60),
 @IsActive bit,
 @IsAdmin bit)
AS

 UPDATE Usuario SET usuario=@Usuario, nombres=@Nombres,correo=@Correo, 
 clave=@Clave,is_active=@IsActive,is_admin=@IsAdmin WHERE idusuario=@IdUsuario


GO
/****** Object:  StoredProcedure [dbo].[SpEliminarAdministradores]    Script Date: 5/1/2022 8:09:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SpEliminarAdministradores](

@IdAdministrador int
)

AS

DELETE FROM Administrador WHERE administrador_id =@IdAdministrador



GO
/****** Object:  StoredProcedure [dbo].[SpEliminarHabitaciones]    Script Date: 5/1/2022 8:09:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SpEliminarHabitaciones](

@IdHabitacion int
)

AS

DELETE FROM Habitacion WHERE idhabitacion =@IdHabitacion



GO
/****** Object:  StoredProcedure [dbo].[SpEliminarUsuarios]    Script Date: 5/1/2022 8:09:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SpEliminarUsuarios](

@IdUsuario int
)

AS

DELETE FROM Usuario WHERE idusuario =@IdUsuario


GO
/****** Object:  StoredProcedure [dbo].[SpInsertarAdministradores]    Script Date: 5/1/2022 8:09:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SpInsertarAdministradores](

 @Nombre VARCHAR(100),
 @IsActive bit)
 AS

 INSERT INTO Administrador VALUES(@Nombre, @IsActive)



GO
/****** Object:  StoredProcedure [dbo].[SpInsertarHabitaciones]    Script Date: 5/1/2022 8:09:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SpInsertarHabitaciones](

 @Nombre VARCHAR(100),
 @Capacidad tinyint)
 AS

 INSERT INTO Habitacion VALUES(@Nombre, @Capacidad)


GO
/****** Object:  StoredProcedure [dbo].[SpInsertarUsuarios]    Script Date: 5/1/2022 8:09:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SpInsertarUsuarios](

 @Usuario VARCHAR(50),
 @Nombres VARCHAR(50),
 @Correo VARCHAR(255),
 @Clave VARCHAR(60),
 @IsActive bit,
 @IsAdmin bit,
 @FechaCreacion datetime)
 AS
 if(not exists(select usuario FROM Usuario where  usuario=@Usuario))
 INSERT INTO Usuario VALUES(@Usuario, @Nombres,@Correo,@Clave,@IsActive,@IsAdmin,@FechaCreacion)

GO
/****** Object:  StoredProcedure [dbo].[SpListarAdministradores]    Script Date: 5/1/2022 8:09:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SpListarAdministradores]

AS

SELECT administrador_id, nombre AS NOMBRE, is_active AS ACTIVO FROM Administrador



GO
/****** Object:  StoredProcedure [dbo].[SpListarHabitacion]    Script Date: 5/1/2022 8:09:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SpListarHabitacion]

AS

SELECT idhabitacion, nombre AS NOMBRE, capacidad AS CAPACIDAD FROM Habitacion


GO
/****** Object:  StoredProcedure [dbo].[SpListarUsuarios]    Script Date: 5/1/2022 8:09:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SpListarUsuarios]

AS

SELECT idusuario, usuario AS USUARIO, nombres AS NOMBRES, correo AS CORREO, clave AS CLAVE, is_active AS ACTIVO, is_admin AS ADMINISTRADOR, fechacreacion AS FECHACREACION FROM Usuario

GO
/****** Object:  StoredProcedure [dbo].[SpLogin]    Script Date: 5/1/2022 8:09:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SpLogin] 
    @Usuario varchar(50), 
    @Clave varchar(60) 
AS 
    SELECT * FROM Usuario
    WHERE usuario = @Usuario AND clave = @Clave;


GO
USE [master]
GO
ALTER DATABASE [ReservasHotel ] SET  READ_WRITE 
GO
