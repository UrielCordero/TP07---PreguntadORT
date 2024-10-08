USE [master]
GO
/****** Object:  Database [TP07-PreguntadORT]    Script Date: 3/9/2024 09:01:08 ******/
CREATE DATABASE [TP07-PreguntadORT]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TP07-PreguntadORT', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\TP07-PreguntadORT.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TP07-PreguntadORT_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\TP07-PreguntadORT_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [TP07-PreguntadORT] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TP07-PreguntadORT].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TP07-PreguntadORT] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TP07-PreguntadORT] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TP07-PreguntadORT] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TP07-PreguntadORT] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TP07-PreguntadORT] SET ARITHABORT OFF 
GO
ALTER DATABASE [TP07-PreguntadORT] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TP07-PreguntadORT] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TP07-PreguntadORT] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TP07-PreguntadORT] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TP07-PreguntadORT] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TP07-PreguntadORT] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TP07-PreguntadORT] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TP07-PreguntadORT] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TP07-PreguntadORT] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TP07-PreguntadORT] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TP07-PreguntadORT] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TP07-PreguntadORT] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TP07-PreguntadORT] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TP07-PreguntadORT] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TP07-PreguntadORT] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TP07-PreguntadORT] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TP07-PreguntadORT] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TP07-PreguntadORT] SET RECOVERY FULL 
GO
ALTER DATABASE [TP07-PreguntadORT] SET  MULTI_USER 
GO
ALTER DATABASE [TP07-PreguntadORT] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TP07-PreguntadORT] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TP07-PreguntadORT] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TP07-PreguntadORT] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TP07-PreguntadORT] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'TP07-PreguntadORT', N'ON'
GO
ALTER DATABASE [TP07-PreguntadORT] SET QUERY_STORE = OFF
GO
USE [TP07-PreguntadORT]
GO
/****** Object:  User [alumno]    Script Date: 3/9/2024 09:01:08 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Categorias]    Script Date: 3/9/2024 09:01:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categorias](
	[idCategoria] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Foto] [varchar](50) NULL,
 CONSTRAINT [PK_Categorias] PRIMARY KEY CLUSTERED 
(
	[idCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dificultades]    Script Date: 3/9/2024 09:01:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dificultades](
	[idDificultad] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Dificultades] PRIMARY KEY CLUSTERED 
(
	[idDificultad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Preguntas]    Script Date: 3/9/2024 09:01:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Preguntas](
	[idPregunta] [int] IDENTITY(1,1) NOT NULL,
	[idCategoria] [int] NOT NULL,
	[idDificultad] [int] NOT NULL,
	[Enunciado] [varchar](500) NOT NULL,
	[Foto] [varchar](50) NULL,
 CONSTRAINT [PK_Preguntas] PRIMARY KEY CLUSTERED 
(
	[idPregunta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Respuestas]    Script Date: 3/9/2024 09:01:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Respuestas](
	[idRespuesta] [int] IDENTITY(1,1) NOT NULL,
	[idPregunta] [int] NOT NULL,
	[Opcion] [int] NOT NULL,
	[Contenido] [varchar](50) NOT NULL,
	[Correcta] [bit] NOT NULL,
	[Foto] [varchar](50) NULL,
 CONSTRAINT [PK_Respuestas] PRIMARY KEY CLUSTERED 
(
	[idRespuesta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categorias] ON 

INSERT [dbo].[Categorias] ([idCategoria], [Nombre], [Foto]) VALUES (1, N'Historia del fútbol', NULL)
INSERT [dbo].[Categorias] ([idCategoria], [Nombre], [Foto]) VALUES (2, N'Mundiales', NULL)
INSERT [dbo].[Categorias] ([idCategoria], [Nombre], [Foto]) VALUES (3, N'Jugadores', NULL)
INSERT [dbo].[Categorias] ([idCategoria], [Nombre], [Foto]) VALUES (4, N'Clubes', NULL)
INSERT [dbo].[Categorias] ([idCategoria], [Nombre], [Foto]) VALUES (5, N'Fútbol argentino', NULL)
SET IDENTITY_INSERT [dbo].[Categorias] OFF
GO
SET IDENTITY_INSERT [dbo].[Dificultades] ON 

INSERT [dbo].[Dificultades] ([idDificultad], [Nombre]) VALUES (1, N'Fácil')
INSERT [dbo].[Dificultades] ([idDificultad], [Nombre]) VALUES (2, N'Medio')
INSERT [dbo].[Dificultades] ([idDificultad], [Nombre]) VALUES (3, N'Difícil')
SET IDENTITY_INSERT [dbo].[Dificultades] OFF
GO
SET IDENTITY_INSERT [dbo].[Preguntas] ON 

INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (1, 1, 1, N'¿En qué año se jugó el primer Mundial de Fútbol?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (2, 1, 2, N'¿Quién es considerado el inventor del fútbol moderno?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (3, 1, 2, N'¿Cuál fue el primer club de fútbol del mundo?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (4, 1, 3, N'¿En qué año se fundó la FIFA?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (5, 1, 3, N'¿Qué equipo ganó la primera Copa de Europa (ahora Champions League)?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (6, 2, 1, N'¿Qué país ha ganado más Copas del Mundo?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (7, 2, 2, N'¿En qué país se celebró el Mundial de 1970?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (8, 2, 2, N'¿Qué jugador ha marcado más goles en una sola edición del Mundial?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (9, 2, 3, N'¿Cuál fue la primera selección europea en ganar un Mundial?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (10, 2, 3, N'¿Quién fue el entrenador de Brasil en el Mundial de 2002?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (11, 3, 1, N'¿Quién es el máximo goleador en la historia de los Mundiales?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (12, 3, 2, N'¿Qué jugador ha ganado más veces el Balón de Oro?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (13, 3, 2, N'¿Qué jugador tiene el récord de más goles en un año calendario?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (14, 3, 3, N'¿Quién es el máximo goleador en la historia del FC Barcelona?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (15, 3, 3, N'¿Qué jugador es apodado "El Fenómeno"?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (16, 4, 1, N'¿Cuál es el club con más títulos de la UEFA Champions League?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (17, 4, 2, N'¿Qué club ganó la primera edición de la Premier League en 1992?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (18, 4, 2, N'¿Cuál es el club más antiguo de Inglaterra?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (19, 4, 3, N'¿Qué equipo ganó la primera Copa Libertadores?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (20, 4, 3, N'¿Cuál es el equipo con más títulos en la Serie A de Italia?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (21, 5, 1, N'¿Qué equipo ha ganado más títulos en la liga argentina?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (22, 5, 2, N'¿En qué año se jugó el primer superclásico entre Boca y River?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (23, 5, 2, N'¿Quién es el máximo goleador en la historia de la selección argentina?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (24, 5, 3, N'¿Qué jugador argentino ganó el Balón de Oro en 1986?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (25, 5, 3, N'¿Cuál es el club más antiguo de Argentina?', NULL)
SET IDENTITY_INSERT [dbo].[Preguntas] OFF
GO
SET IDENTITY_INSERT [dbo].[Respuestas] ON 

INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (1, 1, 1, N'1930', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (2, 1, 2, N'1924', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (3, 1, 3, N'1934', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (4, 1, 4, N'1928', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (5, 2, 1, N'Charles W. Alcock', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (6, 2, 2, N'Jules Rimet', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (7, 2, 3, N'Ebenezer Cobb Morley', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (8, 2, 4, N'William McGregor', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (9, 3, 1, N'Sheffield FC', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (10, 3, 2, N'Cambridge University AFC', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (11, 3, 3, N'Notts County FC', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (12, 3, 4, N'Lima Cricket and Football Club', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (13, 4, 1, N'1904', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (14, 4, 2, N'1910', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (15, 4, 3, N'1896', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (16, 4, 4, N'1920', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (17, 5, 1, N'Real Madrid', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (18, 5, 2, N'AC Milan', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (19, 5, 3, N'Benfica', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (20, 5, 4, N'Barcelona', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (21, 6, 1, N'Brasil', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (22, 6, 2, N'Alemania', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (23, 6, 3, N'Italia', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (24, 6, 4, N'Argentina', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (25, 7, 1, N'México', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (26, 7, 2, N'Alemania', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (27, 7, 3, N'Argentina', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (28, 7, 4, N'España', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (29, 8, 1, N'Just Fontaine', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (30, 8, 2, N'Gerd Müller', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (31, 8, 3, N'Pelé', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (32, 8, 4, N'Ronaldo', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (33, 9, 1, N'Italia', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (34, 9, 2, N'Alemania', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (35, 9, 3, N'Inglaterra', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (36, 9, 4, N'Hungría', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (37, 10, 1, N'Luiz Felipe Scolari', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (38, 10, 2, N'Carlos Alberto Parreira', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (39, 10, 3, N'Mario Zagallo', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (40, 10, 4, N'Dunga', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (41, 6, 1, N'Brasil', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (42, 6, 2, N'Alemania', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (43, 6, 3, N'Italia', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (44, 6, 4, N'Argentina', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (45, 7, 1, N'México', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (46, 7, 2, N'Alemania', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (47, 7, 3, N'Argentina', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (48, 7, 4, N'España', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (49, 8, 1, N'Just Fontaine', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (50, 8, 2, N'Gerd Müller', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (51, 8, 3, N'Pelé', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (52, 8, 4, N'Ronaldo', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (53, 9, 1, N'Italia', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (54, 9, 2, N'Alemania', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (55, 9, 3, N'Inglaterra', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (56, 9, 4, N'Hungría', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (57, 10, 1, N'Luiz Felipe Scolari', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (58, 10, 2, N'Carlos Alberto Parreira', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (59, 10, 3, N'Mario Zagallo', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (60, 10, 4, N'Dunga', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (61, 11, 1, N'Miroslav Klose', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (62, 11, 2, N'Ronaldo', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (63, 11, 3, N'Pelé', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (64, 11, 4, N'Just Fontaine', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (65, 12, 1, N'Lionel Messi', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (66, 12, 2, N'Cristiano Ronaldo', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (67, 12, 3, N'Michel Platini', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (68, 12, 4, N'Johan Cruyff', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (69, 13, 1, N'Lionel Messi', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (70, 13, 2, N'Cristiano Ronaldo', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (71, 13, 3, N'Pelé', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (72, 13, 4, N'Gerd Müller', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (73, 14, 1, N'Lionel Messi', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (74, 14, 2, N'César Rodríguez', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (75, 14, 3, N'Ronaldinho', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (76, 14, 4, N'Luis Suárez', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (77, 15, 1, N'Ronaldo', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (78, 15, 2, N'Cristiano Ronaldo', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (79, 15, 3, N'Ronaldinho', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (80, 15, 4, N'Pelé', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (81, 16, 1, N'Real Madrid', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (82, 16, 2, N'AC Milan', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (83, 16, 3, N'Liverpool', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (84, 16, 4, N'Barcelona', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (85, 17, 1, N'Manchester United', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (86, 17, 2, N'Liverpool', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (87, 17, 3, N'Arsenal', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (88, 17, 4, N'Chelsea', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (89, 18, 1, N'Sheffield FC', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (90, 18, 2, N'Notts County', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (91, 18, 3, N'Stoke City', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (92, 18, 4, N'Manchester United', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (93, 19, 1, N'Club Atlético Independiente', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (94, 19, 2, N'Peñarol', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (95, 19, 3, N'Boca Juniors', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (96, 19, 4, N'River Plate', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (97, 20, 1, N'Juventus', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (98, 20, 2, N'AC Milan', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (99, 20, 3, N'Inter de Milán', 0, NULL)
GO
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (100, 20, 4, N'Roma', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (101, 21, 1, N'River Plate', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (102, 21, 2, N'Boca Juniors', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (103, 21, 3, N'Racing Club', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (104, 21, 4, N'Independiente', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (105, 22, 1, N'1913', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (106, 22, 2, N'1908', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (107, 22, 3, N'1920', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (108, 22, 4, N'1930', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (109, 23, 1, N'Lionel Messi', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (110, 23, 2, N'Gabriel Batistuta', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (111, 23, 3, N'Diego Maradona', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (112, 23, 4, N'Ariel Ortega', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (113, 24, 1, N'Diego Maradona', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (114, 24, 2, N'Lionel Messi', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (115, 24, 3, N'Gabriel Batistuta', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (116, 24, 4, N'Ariel Ortega', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (117, 25, 1, N'Club Atlético All Boys', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (118, 25, 2, N'Club Atlético Independiente', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (119, 25, 3, N'Club Atlético Boca Juniors', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (120, 25, 4, N'Club Atlético River Plate', 0, NULL)
SET IDENTITY_INSERT [dbo].[Respuestas] OFF
GO
ALTER TABLE [dbo].[Preguntas]  WITH CHECK ADD  CONSTRAINT [FK_Preguntas_Categorias] FOREIGN KEY([idCategoria])
REFERENCES [dbo].[Categorias] ([idCategoria])
GO
ALTER TABLE [dbo].[Preguntas] CHECK CONSTRAINT [FK_Preguntas_Categorias]
GO
ALTER TABLE [dbo].[Preguntas]  WITH CHECK ADD  CONSTRAINT [FK_Preguntas_Dificultades] FOREIGN KEY([idDificultad])
REFERENCES [dbo].[Dificultades] ([idDificultad])
GO
ALTER TABLE [dbo].[Preguntas] CHECK CONSTRAINT [FK_Preguntas_Dificultades]
GO
ALTER TABLE [dbo].[Respuestas]  WITH CHECK ADD  CONSTRAINT [FK_Respuestas_Preguntas] FOREIGN KEY([idPregunta])
REFERENCES [dbo].[Preguntas] ([idPregunta])
GO
ALTER TABLE [dbo].[Respuestas] CHECK CONSTRAINT [FK_Respuestas_Preguntas]
GO
USE [master]
GO
ALTER DATABASE [TP07-PreguntadORT] SET  READ_WRITE 
GO
