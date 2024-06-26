USE [master]
GO
/****** Object:  Database [UDBVirtual]    Script Date: 28/04/2024 09:02:10 p. m. ******/
CREATE DATABASE [UDBVirtual]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'UDBVirtual', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\UDBVirtual.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'UDBVirtual_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\UDBVirtual_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [UDBVirtual] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [UDBVirtual].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [UDBVirtual] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [UDBVirtual] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [UDBVirtual] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [UDBVirtual] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [UDBVirtual] SET ARITHABORT OFF 
GO
ALTER DATABASE [UDBVirtual] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [UDBVirtual] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [UDBVirtual] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [UDBVirtual] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [UDBVirtual] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [UDBVirtual] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [UDBVirtual] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [UDBVirtual] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [UDBVirtual] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [UDBVirtual] SET  ENABLE_BROKER 
GO
ALTER DATABASE [UDBVirtual] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [UDBVirtual] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [UDBVirtual] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [UDBVirtual] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [UDBVirtual] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [UDBVirtual] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [UDBVirtual] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [UDBVirtual] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [UDBVirtual] SET  MULTI_USER 
GO
ALTER DATABASE [UDBVirtual] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [UDBVirtual] SET DB_CHAINING OFF 
GO
ALTER DATABASE [UDBVirtual] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [UDBVirtual] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [UDBVirtual] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [UDBVirtual] SET QUERY_STORE = OFF
GO
USE [UDBVirtual]
GO
/****** Object:  Table [dbo].[Alumnos]    Script Date: 28/04/2024 09:02:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Alumnos](
	[id_alumno] [int] NOT NULL,
	[nombre] [varchar](100) NULL,
	[id_profesor] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_alumno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Asignaturas]    Script Date: 28/04/2024 09:02:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Asignaturas](
	[id_asignatura] [int] NOT NULL,
	[nombre_asignatura] [varchar](100) NULL,
	[id_materia] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_asignatura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Evaluaciones]    Script Date: 28/04/2024 09:02:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Evaluaciones](
	[id_evaluacion] [int] NOT NULL,
	[tipo_evaluacion] [varchar](50) NULL,
	[nota] [decimal](5, 2) NULL,
	[id_alumno] [int] NULL,
	[id_asignatura] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_evaluacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Materias]    Script Date: 28/04/2024 09:02:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Materias](
	[id_materia] [int] NOT NULL,
	[nombre_materia] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_materia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Profesores]    Script Date: 28/04/2024 09:02:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Profesores](
	[id_profesor] [int] NOT NULL,
	[nombre] [varchar](100) NULL,
	[email] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_profesor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Alumnos] ([id_alumno], [nombre], [id_profesor]) VALUES (1, N'Alumno 1', 1)
INSERT [dbo].[Alumnos] ([id_alumno], [nombre], [id_profesor]) VALUES (2, N' oscar', 2)
INSERT [dbo].[Alumnos] ([id_alumno], [nombre], [id_profesor]) VALUES (3, N'erika', 3)
INSERT [dbo].[Alumnos] ([id_alumno], [nombre], [id_profesor]) VALUES (4, N'karla', 4)
INSERT [dbo].[Alumnos] ([id_alumno], [nombre], [id_profesor]) VALUES (5, N'carolina', 5)
INSERT [dbo].[Alumnos] ([id_alumno], [nombre], [id_profesor]) VALUES (6, N'luis', 6)
GO
INSERT [dbo].[Asignaturas] ([id_asignatura], [nombre_asignatura], [id_materia]) VALUES (1, N'Asignatura 1', 1)
INSERT [dbo].[Asignaturas] ([id_asignatura], [nombre_asignatura], [id_materia]) VALUES (2, N'Ciencia', 2)
INSERT [dbo].[Asignaturas] ([id_asignatura], [nombre_asignatura], [id_materia]) VALUES (3, N'Calculo', 3)
INSERT [dbo].[Asignaturas] ([id_asignatura], [nombre_asignatura], [id_materia]) VALUES (4, N'Ingles', 4)
INSERT [dbo].[Asignaturas] ([id_asignatura], [nombre_asignatura], [id_materia]) VALUES (5, N' Aplicaciones', 5)
INSERT [dbo].[Asignaturas] ([id_asignatura], [nombre_asignatura], [id_materia]) VALUES (6, N'Auditoria', 6)
INSERT [dbo].[Asignaturas] ([id_asignatura], [nombre_asignatura], [id_materia]) VALUES (7, N'Programacion', 7)
GO
INSERT [dbo].[Evaluaciones] ([id_evaluacion], [tipo_evaluacion], [nota], [id_alumno], [id_asignatura]) VALUES (1, N'Examen 1', CAST(95.00 AS Decimal(5, 2)), 1, 1)
INSERT [dbo].[Evaluaciones] ([id_evaluacion], [tipo_evaluacion], [nota], [id_alumno], [id_asignatura]) VALUES (2, N'Examen 2', CAST(55.20 AS Decimal(5, 2)), 2, 2)
INSERT [dbo].[Evaluaciones] ([id_evaluacion], [tipo_evaluacion], [nota], [id_alumno], [id_asignatura]) VALUES (3, N'Examen 3', CAST(60.00 AS Decimal(5, 2)), 3, 3)
INSERT [dbo].[Evaluaciones] ([id_evaluacion], [tipo_evaluacion], [nota], [id_alumno], [id_asignatura]) VALUES (4, N'Examen 4', CAST(90.50 AS Decimal(5, 2)), 4, 4)
INSERT [dbo].[Evaluaciones] ([id_evaluacion], [tipo_evaluacion], [nota], [id_alumno], [id_asignatura]) VALUES (5, N'Examen 5', CAST(75.10 AS Decimal(5, 2)), 5, 5)
INSERT [dbo].[Evaluaciones] ([id_evaluacion], [tipo_evaluacion], [nota], [id_alumno], [id_asignatura]) VALUES (6, N'Examen 6', CAST(85.00 AS Decimal(5, 2)), 6, 6)
GO
INSERT [dbo].[Materias] ([id_materia], [nombre_materia]) VALUES (1, N'Materia 1')
INSERT [dbo].[Materias] ([id_materia], [nombre_materia]) VALUES (2, N'Ciencia')
INSERT [dbo].[Materias] ([id_materia], [nombre_materia]) VALUES (3, N'Calculo')
INSERT [dbo].[Materias] ([id_materia], [nombre_materia]) VALUES (4, N'Ingles')
INSERT [dbo].[Materias] ([id_materia], [nombre_materia]) VALUES (5, N' Aplicaciones')
INSERT [dbo].[Materias] ([id_materia], [nombre_materia]) VALUES (6, N'Auditoria')
INSERT [dbo].[Materias] ([id_materia], [nombre_materia]) VALUES (7, N'Programacion')
GO
INSERT [dbo].[Profesores] ([id_profesor], [nombre], [email]) VALUES (1, N'Profesor 1', N'profesor1@udbvirtual.edu')
INSERT [dbo].[Profesores] ([id_profesor], [nombre], [email]) VALUES (2, N'Juan Carlos', N'juancarlos@udbvirtual.edu')
INSERT [dbo].[Profesores] ([id_profesor], [nombre], [email]) VALUES (3, N'Alejando Campos', N'alejandrocampos@udbvirtual.edu')
INSERT [dbo].[Profesores] ([id_profesor], [nombre], [email]) VALUES (4, N'Jabes reyes', N'jabesreyes@udbvirtual.edu')
INSERT [dbo].[Profesores] ([id_profesor], [nombre], [email]) VALUES (5, N'Alexandra', N'alexandra@udbvirtual.edu')
INSERT [dbo].[Profesores] ([id_profesor], [nombre], [email]) VALUES (6, N'Diego', N'diego@udbvirtual.edu')
GO
ALTER TABLE [dbo].[Alumnos]  WITH CHECK ADD FOREIGN KEY([id_profesor])
REFERENCES [dbo].[Profesores] ([id_profesor])
GO
ALTER TABLE [dbo].[Asignaturas]  WITH CHECK ADD FOREIGN KEY([id_materia])
REFERENCES [dbo].[Materias] ([id_materia])
GO
ALTER TABLE [dbo].[Evaluaciones]  WITH CHECK ADD FOREIGN KEY([id_alumno])
REFERENCES [dbo].[Alumnos] ([id_alumno])
GO
ALTER TABLE [dbo].[Evaluaciones]  WITH CHECK ADD FOREIGN KEY([id_asignatura])
REFERENCES [dbo].[Asignaturas] ([id_asignatura])
GO
USE [master]
GO
ALTER DATABASE [UDBVirtual] SET  READ_WRITE 
GO
