USE [master]
GO
ALTER DATABASE [DB2024] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DB2024].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DB2024] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DB2024] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DB2024] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DB2024] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DB2024] SET ARITHABORT OFF 
GO
ALTER DATABASE [DB2024] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [DB2024] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DB2024] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DB2024] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DB2024] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DB2024] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DB2024] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DB2024] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DB2024] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DB2024] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DB2024] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DB2024] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DB2024] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DB2024] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DB2024] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DB2024] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DB2024] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DB2024] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DB2024] SET  MULTI_USER 
GO
ALTER DATABASE [DB2024] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DB2024] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DB2024] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DB2024] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DB2024] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DB2024] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [DB2024] SET QUERY_STORE = ON
GO
ALTER DATABASE [DB2024] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [DB2024]
GO
/****** Object:  Table [dbo].[Clinica]    Script Date: 15/8/2024 5:20:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clinica](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](30) NOT NULL,
	[director] [int] NOT NULL,
	[domicilio] [varchar](255) NOT NULL,
	[cuit] [char](11) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Especialidad]    Script Date: 15/8/2024 5:20:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Especialidad](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](256) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EspecialidadesMedico]    Script Date: 15/8/2024 5:20:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EspecialidadesMedico](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[medico_id] [int] NOT NULL,
	[especialidad_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medico]    Script Date: 15/8/2024 5:20:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medico](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[persona_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ObraSocial]    Script Date: 15/8/2024 5:20:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ObraSocial](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](128) NOT NULL,
	[domicilio] [varchar](256) NULL,
	[telefono] [varchar](256) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Paciente]    Script Date: 15/8/2024 5:20:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Paciente](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[persona_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Persona]    Script Date: 15/8/2024 5:20:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Persona](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[apellido] [varchar](128) NOT NULL,
	[nombre] [varchar](128) NOT NULL,
	[dni] [int] NOT NULL,
	[genero] [char](1) NOT NULL,
	[fnacto] [date] NOT NULL,
	[telefono] [varchar](10) NOT NULL,
	[email] [varchar](128) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlanesOSPaciente]    Script Date: 15/8/2024 5:20:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlanesOSPaciente](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[paciente_id] [int] NOT NULL,
	[planobrasocialid] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlanObraSocial]    Script Date: 15/8/2024 5:20:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlanObraSocial](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[obrasocial_id] [int] NOT NULL,
	[nombre] [varchar](128) NOT NULL,
	[copago_sn] [char](1) NOT NULL,
	[copago] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Especialidad] ON 
GO
INSERT [dbo].[Especialidad] ([id], [nombre]) VALUES (1, N'Oncologia')
GO
INSERT [dbo].[Especialidad] ([id], [nombre]) VALUES (12, N'Pediatria')
GO
SET IDENTITY_INSERT [dbo].[Especialidad] OFF
GO
SET IDENTITY_INSERT [dbo].[Persona] ON 
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1, N'Diez', N'Moisés Elías', 20000001, N'M', CAST(N'1980-01-04' AS Date), N'3365401609', N'moisés_elías.diez@diez.moisés_elías@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2, N'Herrero', N'Nour Carlota', 20000002, N'F', CAST(N'1980-01-23' AS Date), N'3366931602', N'nour_carlota.herrero@herrero.nour_carlota@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3, N'Hidalgo', N'Amaia Cloe', 20000003, N'F', CAST(N'1980-01-08' AS Date), N'3365697783', N'amaia_cloe.hidalgo@hidalgo.amaia_cloe@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (4, N'Crespo', N'Cayetana Celia', 20000004, N'F', CAST(N'1980-01-23' AS Date), N'3365242715', N'cayetana_celia.crespo@crespo.cayetana_celia@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (5, N'Muñoz', N'Andrés Ahzià', 20000005, N'M', CAST(N'1980-01-30' AS Date), N'3364831959', N'andrés_ahzià.muñoz@muñoz.andrés_ahzià@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (6, N'Ruiz', N'Moisés Naín', 20000006, N'M', CAST(N'1980-01-05' AS Date), N'3369785247', N'moisés_naín.ruiz@ruiz.moisés_naín@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (7, N'Domínguez', N'Elena Valeria', 20000007, N'F', CAST(N'1980-01-09' AS Date), N'3367758807', N'elena_valeria.domínguez@domínguez.elena_valeria@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (8, N'Vidal', N'Sara Aurora', 20000008, N'F', CAST(N'1980-01-14' AS Date), N'3368816984', N'sara_aurora.vidal@vidal.sara_aurora@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (9, N'Aguilar', N'Eliel Lemuel', 20000009, N'M', CAST(N'1980-01-29' AS Date), N'3366779893', N'eliel_lemuel.aguilar@aguilar.eliel_lemuel@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (10, N'Sánchez', N'Joanix Abdiel', 20000010, N'M', CAST(N'1980-01-10' AS Date), N'3365992037', N'joanix_abdiel.sánchez@sánchez.joanix_abdiel@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (11, N'Díaz', N'Ezequiel Andrés', 20000011, N'M', CAST(N'1980-01-01' AS Date), N'3368275051', N'ezequiel_andrés.díaz@díaz.ezequiel_andrés@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (12, N'Marin', N'Caín Abdiel', 20000012, N'M', CAST(N'1980-01-04' AS Date), N'3369592629', N'caín_abdiel.marin@marin.caín_abdiel@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (13, N'Garrido', N'Nora Cristina', 20000013, N'F', CAST(N'1980-01-25' AS Date), N'3364310183', N'nora_cristina.garrido@garrido.nora_cristina@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (14, N'Soler', N'Inés Vera', 20000014, N'F', CAST(N'1980-01-29' AS Date), N'3364708411', N'inés_vera.soler@soler.inés_vera@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (15, N'Serrano', N'Sofía Nerea', 20000015, N'F', CAST(N'1980-01-08' AS Date), N'3365027878', N'sofía_nerea.serrano@serrano.sofía_nerea@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (16, N'Martín', N'Aarón Jehoram', 20000016, N'M', CAST(N'1980-01-17' AS Date), N'3365034562', N'aarón_jehoram.martín@martín.aarón_jehoram@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (17, N'Vázquez', N'Ahzià Félix', 20000017, N'M', CAST(N'1980-01-03' AS Date), N'3369814988', N'ahzià_félix.vázquez@vázquez.ahzià_félix@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (18, N'Sáez', N'Noa Triana', 20000018, N'F', CAST(N'1980-01-19' AS Date), N'3367569346', N'noa_triana.sáez@sáez.noa_triana@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (19, N'Serrano', N'Set Juan', 20000019, N'M', CAST(N'1980-01-12' AS Date), N'3365300587', N'set_juan.serrano@serrano.set_juan@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (20, N'Ortiz', N'Victoria Marta', 20000020, N'F', CAST(N'1980-01-13' AS Date), N'3366985624', N'victoria_marta.ortiz@ortiz.victoria_marta@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (21, N'Ramos', N'Julieta Alejandra', 20000021, N'F', CAST(N'1980-01-19' AS Date), N'3366816148', N'julieta_alejandra.ramos@ramos.julieta_alejandra@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (22, N'Bravo', N'Lola Abril', 20000022, N'F', CAST(N'1980-01-06' AS Date), N'3368780299', N'lola_abril.bravo@bravo.lola_abril@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (23, N'Calvo', N'Abril Isabella', 20000023, N'F', CAST(N'1980-01-03' AS Date), N'3363874894', N'abril_isabella.calvo@calvo.abril_isabella@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (24, N'Santana', N'Andrea Ariadna', 20000024, N'F', CAST(N'1980-01-19' AS Date), N'3368050816', N'andrea_ariadna.santana@santana.andrea_ariadna@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (25, N'Bravo', N'Dámaso Labán', 20000025, N'M', CAST(N'1980-01-30' AS Date), N'3365668736', N'dámaso_labán.bravo@bravo.dámaso_labán@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (26, N'Velasco', N'Jared Sergio', 20000026, N'M', CAST(N'1980-01-26' AS Date), N'3363811311', N'jared_sergio.velasco@velasco.jared_sergio@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (27, N'Bravo', N'Vega Ainhoa', 20000027, N'F', CAST(N'1980-01-23' AS Date), N'3368808242', N'vega_ainhoa.bravo@bravo.vega_ainhoa@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (28, N'León', N'Aitana Ona', 20000028, N'F', CAST(N'1980-01-07' AS Date), N'3368388108', N'aitana_ona.león@león.aitana_ona@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (29, N'Duran', N'Jiram Lemuel', 20000029, N'M', CAST(N'1980-01-23' AS Date), N'3365235287', N'jiram_lemuel.duran@duran.jiram_lemuel@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (30, N'Soto', N'Martina Jimena', 20000030, N'F', CAST(N'1980-01-02' AS Date), N'3367540119', N'martina_jimena.soto@soto.martina_jimena@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (31, N'Sáez', N'Marcos Esteban', 20000031, N'M', CAST(N'1980-01-22' AS Date), N'3366091315', N'marcos_esteban.sáez@sáez.marcos_esteban@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (32, N'Fuentes', N'Nerea Amira', 20000032, N'F', CAST(N'1980-01-23' AS Date), N'3367804610', N'nerea_amira.fuentes@fuentes.nerea_amira@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (33, N'Velasco', N'María Manuela', 20000033, N'F', CAST(N'1980-01-18' AS Date), N'3363092068', N'maría_manuela.velasco@velasco.maría_manuela@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (34, N'García', N'Jiram Demócrito', 20000034, N'M', CAST(N'1980-01-02' AS Date), N'3368209171', N'jiram_demócrito.garcía@garcía.jiram_demócrito@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (35, N'Nuñez', N'Guido Fabián', 20000035, N'M', CAST(N'1980-01-12' AS Date), N'3366344317', N'guido_fabián.nuñez@nuñez.guido_fabián@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (36, N'Garrido', N'Adán Caín', 20000036, N'M', CAST(N'1980-01-06' AS Date), N'3366076224', N'adán_caín.garrido@garrido.adán_caín@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (37, N'Medina', N'Rocío Lia', 20000037, N'F', CAST(N'1980-01-30' AS Date), N'3363732802', N'rocío_lia.medina@medina.rocío_lia@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (38, N'Vidal', N'Cayetana Lina', 20000038, N'F', CAST(N'1980-01-22' AS Date), N'3367496378', N'cayetana_lina.vidal@vidal.cayetana_lina@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (39, N'Ortiz', N'Set Simón', 20000039, N'M', CAST(N'1980-01-06' AS Date), N'3367936733', N'set_simón.ortiz@ortiz.set_simón@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (40, N'Bravo', N'Leire Berta', 20000040, N'F', CAST(N'1980-01-26' AS Date), N'3365620210', N'leire_berta.bravo@bravo.leire_berta@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (41, N'Pascual', N'Fabián Jiram', 20000041, N'M', CAST(N'1980-01-28' AS Date), N'3365807335', N'fabián_jiram.pascual@pascual.fabián_jiram@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (42, N'Suárez', N'Neftalí Pablo', 20000042, N'M', CAST(N'1980-01-09' AS Date), N'3366767326', N'neftalí_pablo.suárez@suárez.neftalí_pablo@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (43, N'Hidalgo', N'Arlet Carlota', 20000043, N'F', CAST(N'1980-01-13' AS Date), N'3367106742', N'arlet_carlota.hidalgo@hidalgo.arlet_carlota@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (44, N'Campos', N'Daniela África', 20000044, N'F', CAST(N'1980-01-13' AS Date), N'3364335031', N'daniela_África.campos@campos.daniela_áfrica@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (45, N'Vargas', N'Dámaso Ashur', 20000045, N'M', CAST(N'1980-01-11' AS Date), N'3366303028', N'dámaso_ashur.vargas@vargas.dámaso_ashur@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (46, N'Diez', N'Salomón Set', 20000046, N'M', CAST(N'1980-01-09' AS Date), N'3369639142', N'salomón_set.diez@diez.salomón_set@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (47, N'Lozano', N'Sara Lola', 20000047, N'F', CAST(N'1980-01-30' AS Date), N'3363948216', N'sara_lola.lozano@lozano.sara_lola@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (48, N'Duran', N'Victoria Gabriela', 20000048, N'F', CAST(N'1980-01-10' AS Date), N'3369346554', N'victoria_gabriela.duran@duran.victoria_gabriela@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (49, N'Santos', N'Daniel Noé', 20000049, N'M', CAST(N'1980-01-01' AS Date), N'3365716135', N'daniel_noé.santos@santos.daniel_noé@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (50, N'Pérez', N'Abimael Saúl', 20000050, N'M', CAST(N'1980-01-10' AS Date), N'3365679774', N'abimael_saúl.pérez@pérez.abimael_saúl@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (51, N'Duran', N'Chloe Naia', 20000051, N'F', CAST(N'1980-01-18' AS Date), N'3369206421', N'chloe_naia.duran@duran.chloe_naia@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (52, N'Santana', N'Adán Isaac', 20000052, N'M', CAST(N'1980-01-10' AS Date), N'3368799174', N'adán_isaac.santana@santana.adán_isaac@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (53, N'Vargas', N'Arlet Cloe', 20000053, N'F', CAST(N'1980-01-30' AS Date), N'3366784945', N'arlet_cloe.vargas@vargas.arlet_cloe@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (54, N'Calvo', N'Israel Ashur', 20000054, N'M', CAST(N'1980-01-28' AS Date), N'3365563495', N'israel_ashur.calvo@calvo.israel_ashur@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (55, N'Navarro', N'Cloe Elena', 20000055, N'F', CAST(N'1980-01-06' AS Date), N'3364567458', N'cloe_elena.navarro@navarro.cloe_elena@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (56, N'Martín', N'Eliseo Jacob', 20000056, N'M', CAST(N'1980-01-09' AS Date), N'3364530543', N'eliseo_jacob.martín@martín.eliseo_jacob@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (57, N'Vega', N'Isaías Félix', 20000057, N'M', CAST(N'1980-01-21' AS Date), N'3367026815', N'isaías_félix.vega@vega.isaías_félix@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (58, N'Martínez', N'Lemuel Eliel', 20000058, N'M', CAST(N'1980-01-26' AS Date), N'3369524563', N'lemuel_eliel.martínez@martínez.lemuel_eliel@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (59, N'Gómez', N'Isabel Noa', 20000059, N'F', CAST(N'1980-01-19' AS Date), N'3369711668', N'isabel_noa.gómez@gómez.isabel_noa@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (60, N'Sanz', N'Efraín Agustín', 20000060, N'M', CAST(N'1980-01-22' AS Date), N'3367989548', N'efraín_agustín.sanz@sanz.efraín_agustín@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (61, N'Sánchez', N'Irene Clara', 20000061, N'F', CAST(N'1980-01-04' AS Date), N'3366816315', N'irene_clara.sánchez@sánchez.irene_clara@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (62, N'Lorenzo', N'Sofía Isabel', 20000062, N'F', CAST(N'1980-01-04' AS Date), N'3368490064', N'sofía_isabel.lorenzo@lorenzo.sofía_isabel@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (63, N'Carmona', N'María Leyre', 20000063, N'F', CAST(N'1980-01-05' AS Date), N'3367037433', N'maría_leyre.carmona@carmona.maría_leyre@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (64, N'Martín', N'Set Agustín', 20000064, N'M', CAST(N'1980-01-28' AS Date), N'3366361399', N'set_agustín.martín@martín.set_agustín@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (65, N'Hidalgo', N'Andrea Victoria', 20000065, N'F', CAST(N'1980-01-09' AS Date), N'3365428086', N'andrea_victoria.hidalgo@hidalgo.andrea_victoria@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (66, N'Ferrer', N'Chloe Jimena', 20000066, N'F', CAST(N'1980-01-05' AS Date), N'3365207087', N'chloe_jimena.ferrer@ferrer.chloe_jimena@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (67, N'Soto', N'Ismael Alejandro', 20000067, N'M', CAST(N'1980-01-23' AS Date), N'3368509652', N'ismael_alejandro.soto@soto.ismael_alejandro@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (68, N'Ramos', N'Cayetana Nuria', 20000068, N'F', CAST(N'1980-01-25' AS Date), N'3368987622', N'cayetana_nuria.ramos@ramos.cayetana_nuria@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (69, N'Sanz', N'Jesús Abel', 20000069, N'M', CAST(N'1980-01-30' AS Date), N'3363161220', N'jesús_abel.sanz@sanz.jesús_abel@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (70, N'Márquez', N'Leire Abril', 20000070, N'F', CAST(N'1980-01-10' AS Date), N'3364836330', N'leire_abril.márquez@márquez.leire_abril@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (71, N'García', N'Mateo Omar', 20000071, N'M', CAST(N'1980-01-20' AS Date), N'3368117096', N'mateo_omar.garcía@garcía.mateo_omar@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (72, N'Santiago', N'David Alejandro', 20000072, N'M', CAST(N'1980-01-27' AS Date), N'3363964721', N'david_alejandro.santiago@santiago.david_alejandro@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (73, N'Ortiz', N'José Uzías', 20000073, N'M', CAST(N'1980-01-06' AS Date), N'3366338435', N'josé_uzías.ortiz@ortiz.josé_uzías@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (74, N'Ferrer', N'Helena Aroa', 20000074, N'F', CAST(N'1980-01-02' AS Date), N'3366800837', N'helena_aroa.ferrer@ferrer.helena_aroa@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (75, N'Crespo', N'Zacarías Dámaso', 20000075, N'M', CAST(N'1980-01-17' AS Date), N'3363042332', N'zacarías_dámaso.crespo@crespo.zacarías_dámaso@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (76, N'Vega', N'Germán Efraín', 20000076, N'M', CAST(N'1980-01-15' AS Date), N'3366729554', N'germán_efraín.vega@vega.germán_efraín@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (77, N'Pérez', N'Set Josué', 20000077, N'M', CAST(N'1980-01-13' AS Date), N'3365389598', N'set_josué.pérez@pérez.set_josué@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (78, N'Muñoz', N'Neftalí Matías', 20000078, N'M', CAST(N'1980-01-09' AS Date), N'3364007516', N'neftalí_matías.muñoz@muñoz.neftalí_matías@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (79, N'Duran', N'Aurora Alma', 20000079, N'F', CAST(N'1980-01-29' AS Date), N'3368226280', N'aurora_alma.duran@duran.aurora_alma@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (80, N'Serrano', N'Leire Iria', 20000080, N'F', CAST(N'1980-01-21' AS Date), N'3363453820', N'leire_iria.serrano@serrano.leire_iria@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (81, N'Pastor', N'Naia Ariadna', 20000081, N'F', CAST(N'1980-01-04' AS Date), N'3367544563', N'naia_ariadna.pastor@pastor.naia_ariadna@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (82, N'Prieto', N'Isabella Carolina', 20000082, N'F', CAST(N'1980-01-29' AS Date), N'3366593463', N'isabella_carolina.prieto@prieto.isabella_carolina@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (83, N'Bravo', N'Miguel Jairo', 20000083, N'M', CAST(N'1980-01-30' AS Date), N'3367300022', N'miguel_jairo.bravo@bravo.miguel_jairo@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (84, N'Medina', N'Isabella Naia', 20000084, N'F', CAST(N'1980-01-10' AS Date), N'3364248351', N'isabella_naia.medina@medina.isabella_naia@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (85, N'Prieto', N'Aarón Neftalí', 20000085, N'M', CAST(N'1980-01-08' AS Date), N'3363012618', N'aarón_neftalí.prieto@prieto.aarón_neftalí@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (86, N'Vázquez', N'Olivia Ona', 20000086, N'F', CAST(N'1980-01-28' AS Date), N'3366214718', N'olivia_ona.vázquez@vázquez.olivia_ona@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (87, N'Domínguez', N'Adriana Nerea', 20000087, N'F', CAST(N'1980-01-17' AS Date), N'3369124094', N'adriana_nerea.domínguez@domínguez.adriana_nerea@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (88, N'Márquez', N'Zoe Lucía', 20000088, N'F', CAST(N'1980-01-28' AS Date), N'3366438124', N'zoe_lucía.márquez@márquez.zoe_lucía@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (89, N'Marin', N'Jehoram Francisco', 20000089, N'M', CAST(N'1980-01-03' AS Date), N'3367113827', N'jehoram_francisco.marin@marin.jehoram_francisco@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (90, N'Carrasco', N'Nicolás Zacarías', 20000090, N'M', CAST(N'1980-01-08' AS Date), N'3364811832', N'nicolás_zacarías.carrasco@carrasco.nicolás_zacarías@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (91, N'Medina', N'Iria Carla', 20000091, N'F', CAST(N'1980-01-02' AS Date), N'3367050392', N'iria_carla.medina@medina.iria_carla@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (92, N'Bravo', N'Amaia Zoe', 20000092, N'F', CAST(N'1980-01-17' AS Date), N'3366536887', N'amaia_zoe.bravo@bravo.amaia_zoe@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (93, N'Vega', N'Helena Julia', 20000093, N'F', CAST(N'1980-01-08' AS Date), N'3365439634', N'helena_julia.vega@vega.helena_julia@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (94, N'Campos', N'Jesús Ciro', 20000094, N'M', CAST(N'1980-01-20' AS Date), N'3364380924', N'jesús_ciro.campos@campos.jesús_ciro@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (95, N'Jimenez', N'Joanix Aram', 20000095, N'M', CAST(N'1980-01-15' AS Date), N'3363645431', N'joanix_aram.jimenez@jimenez.joanix_aram@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (96, N'Diez', N'Ismael Benjamín', 20000096, N'M', CAST(N'1980-01-17' AS Date), N'3366837666', N'ismael_benjamín.diez@diez.ismael_benjamín@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (97, N'Muñoz', N'Jimena Eva', 20000097, N'F', CAST(N'1980-01-29' AS Date), N'3365563790', N'jimena_eva.muñoz@muñoz.jimena_eva@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (98, N'Santana', N'Jesús José', 20000098, N'M', CAST(N'1980-01-08' AS Date), N'3363428885', N'jesús_josé.santana@santana.jesús_josé@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (99, N'Reyes', N'Nora Alejandra', 20000099, N'F', CAST(N'1980-01-04' AS Date), N'3363107911', N'nora_alejandra.reyes@reyes.nora_alejandra@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (100, N'Velasco', N'Candela', 20500001, N'F', CAST(N'1981-01-06' AS Date), N'3366177357', N'candela.velasco@velasco.candela@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (101, N'Flores', N'Daniela Elena', 20500002, N'F', CAST(N'1981-01-07' AS Date), N'3369850259', N'daniela_elena.flores@flores.daniela_elena@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (102, N'Rubio', N'Malak Rocío', 20500003, N'F', CAST(N'1981-01-12' AS Date), N'3368108448', N'malak_rocío.rubio@rubio.malak_rocío@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (103, N'Santiago', N'Jesús Caín', 20500004, N'M', CAST(N'1981-01-20' AS Date), N'3365326471', N'jesús_caín.santiago@santiago.jesús_caín@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (104, N'Calvo', N'Juan Gabriel', 20500005, N'M', CAST(N'1981-01-16' AS Date), N'3365791393', N'juan_gabriel.calvo@calvo.juan_gabriel@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (105, N'Nieto', N'Dámaso Lucas', 20500006, N'M', CAST(N'1981-01-04' AS Date), N'3363750006', N'dámaso_lucas.nieto@nieto.dámaso_lucas@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (106, N'Navarro', N'Marta Laura', 20500007, N'F', CAST(N'1981-01-23' AS Date), N'3369151282', N'marta_laura.navarro@navarro.marta_laura@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (107, N'Santiago', N'Jimena Arlet', 20500008, N'F', CAST(N'1981-01-30' AS Date), N'3369183085', N'jimena_arlet.santiago@santiago.jimena_arlet@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (108, N'Roman', N'Nicolás Jairo', 20500009, N'M', CAST(N'1981-01-03' AS Date), N'3363934141', N'nicolás_jairo.roman@roman.nicolás_jairo@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (109, N'Lorenzo', N'Jana Irene', 20500010, N'F', CAST(N'1981-01-17' AS Date), N'3368431958', N'jana_irene.lorenzo@lorenzo.jana_irene@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (110, N'Alonso', N'Abraham Julio', 20500011, N'M', CAST(N'1981-01-11' AS Date), N'3365178938', N'abraham_julio.alonso@alonso.abraham_julio@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (111, N'Serrano', N'Manuela Claudia', 20500012, N'F', CAST(N'1981-01-29' AS Date), N'3368524456', N'manuela_claudia.serrano@serrano.manuela_claudia@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (112, N'Delgado', N'Dámaso Mateo', 20500013, N'M', CAST(N'1981-01-09' AS Date), N'3364541858', N'dámaso_mateo.delgado@delgado.dámaso_mateo@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (113, N'Nieto', N'Azahara Leyre', 20500014, N'F', CAST(N'1981-01-27' AS Date), N'3366709321', N'azahara_leyre.nieto@nieto.azahara_leyre@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (114, N'Vázquez', N'Neftalí Beltrán', 20500015, N'M', CAST(N'1981-01-02' AS Date), N'3369677729', N'neftalí_beltrán.vázquez@vázquez.neftalí_beltrán@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (115, N'García', N'Tobías Bartolomé', 20500016, N'M', CAST(N'1981-01-27' AS Date), N'3364720785', N'tobías_bartolomé.garcía@garcía.tobías_bartolomé@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (116, N'Arias', N'Jared Labán', 20500017, N'M', CAST(N'1981-01-28' AS Date), N'3368556918', N'jared_labán.arias@arias.jared_labán@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (117, N'Márquez', N'Naia Vera', 20500018, N'F', CAST(N'1981-01-14' AS Date), N'3368743414', N'naia_vera.márquez@márquez.naia_vera@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (118, N'Ferrer', N'Fátima Adara', 20500019, N'F', CAST(N'1981-01-28' AS Date), N'3365576673', N'fátima_adara.ferrer@ferrer.fátima_adara@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (119, N'León', N'Nour Iris', 20500020, N'F', CAST(N'1981-01-27' AS Date), N'3367123226', N'nour_iris.león@león.nour_iris@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (120, N'Soler', N'Jeremías Jehoram', 20500021, N'M', CAST(N'1981-01-04' AS Date), N'3369130186', N'jeremías_jehoram.soler@soler.jeremías_jehoram@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (121, N'Pérez', N'Abel Abraham', 20500022, N'M', CAST(N'1981-01-09' AS Date), N'3364654293', N'abel_abraham.pérez@pérez.abel_abraham@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (122, N'Vicente', N'Adriana Julia', 20500023, N'F', CAST(N'1981-01-01' AS Date), N'3364448137', N'adriana_julia.vicente@vicente.adriana_julia@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (123, N'Méndez', N'Malak Aurora', 20500024, N'F', CAST(N'1981-01-09' AS Date), N'3367615792', N'malak_aurora.méndez@méndez.malak_aurora@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (124, N'Pastor', N'Blanca Amira', 20500025, N'F', CAST(N'1981-01-11' AS Date), N'3368401904', N'blanca_amira.pastor@pastor.blanca_amira@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (125, N'Alonso', N'Mia Diana', 20500026, N'F', CAST(N'1981-01-07' AS Date), N'3364455858', N'mia_diana.alonso@alonso.mia_diana@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (126, N'Crespo', N'Helena Amira', 20500027, N'F', CAST(N'1981-01-05' AS Date), N'3369160964', N'helena_amira.crespo@crespo.helena_amira@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (127, N'Diez', N'Esteban Israel', 20500028, N'M', CAST(N'1981-01-03' AS Date), N'3367996606', N'esteban_israel.diez@diez.esteban_israel@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (128, N'Nuñez', N'Clara Valentina', 20500029, N'F', CAST(N'1981-01-30' AS Date), N'3368259075', N'clara_valentina.nuñez@nuñez.clara_valentina@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (129, N'Gallardo', N'Matías Andrés', 20500030, N'M', CAST(N'1981-01-10' AS Date), N'3365961979', N'matías_andrés.gallardo@gallardo.matías_andrés@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (130, N'Nieto', N'Daniela Ana', 20500031, N'F', CAST(N'1981-01-29' AS Date), N'3368667585', N'daniela_ana.nieto@nieto.daniela_ana@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (131, N'Lozano', N'Beltrán Ashur', 20500032, N'M', CAST(N'1981-01-23' AS Date), N'3367223379', N'beltrán_ashur.lozano@lozano.beltrán_ashur@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (132, N'Lozano', N'Mia Aina', 20500033, N'F', CAST(N'1981-01-19' AS Date), N'3369053085', N'mia_aina.lozano@lozano.mia_aina@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (133, N'Medina', N'Carlota Inés', 20500034, N'F', CAST(N'1981-01-02' AS Date), N'3363654926', N'carlota_inés.medina@medina.carlota_inés@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (134, N'Vicente', N'Sofía Celia', 20500035, N'F', CAST(N'1981-01-15' AS Date), N'3366017080', N'sofía_celia.vicente@vicente.sofía_celia@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (135, N'Morales', N'Ainara Amira', 20500036, N'F', CAST(N'1981-01-12' AS Date), N'3365259468', N'ainara_amira.morales@morales.ainara_amira@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (136, N'Giménez', N'Homero Joaquín', 20500037, N'M', CAST(N'1981-01-26' AS Date), N'3367886290', N'homero_joaquín.giménez@giménez.homero_joaquín@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (137, N'Calvo', N'Elías Israel', 20500038, N'M', CAST(N'1981-01-12' AS Date), N'3368431475', N'elías_israel.calvo@calvo.elías_israel@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (138, N'Montero', N'Nora Olivia', 20500039, N'F', CAST(N'1981-01-22' AS Date), N'3364164266', N'nora_olivia.montero@montero.nora_olivia@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (139, N'Rodríguez', N'Olivia Lola', 20500040, N'F', CAST(N'1981-01-07' AS Date), N'3366714796', N'olivia_lola.rodríguez@rodríguez.olivia_lola@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (140, N'Bravo', N'Nahia Noa', 20500041, N'F', CAST(N'1981-01-21' AS Date), N'3367630713', N'nahia_noa.bravo@bravo.nahia_noa@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (141, N'Pérez', N'Lemuel Francisco', 20500042, N'M', CAST(N'1981-01-16' AS Date), N'3368337067', N'lemuel_francisco.pérez@pérez.lemuel_francisco@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (142, N'Cano', N'Lucas Agustín', 20500043, N'M', CAST(N'1981-01-26' AS Date), N'3366211606', N'lucas_agustín.cano@cano.lucas_agustín@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (143, N'Ramos', N'Gabriela Carolina', 20500044, N'F', CAST(N'1981-01-14' AS Date), N'3369283889', N'gabriela_carolina.ramos@ramos.gabriela_carolina@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (144, N'Ortiz', N'Clara ', 20500045, N'F', CAST(N'1981-01-18' AS Date), N'3366070246', N'clara_.ortiz@ortiz.clara_@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (145, N'Pastor', N'Aarón Israel', 20500046, N'M', CAST(N'1981-01-23' AS Date), N'3366638007', N'aarón_israel.pastor@pastor.aarón_israel@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (146, N'Gutiérrez', N'Aitana Isabella', 20500047, N'F', CAST(N'1981-01-27' AS Date), N'3366340236', N'aitana_isabella.gutiérrez@gutiérrez.aitana_isabella@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (147, N'Medina', N'Vera Lina', 20500048, N'F', CAST(N'1981-01-07' AS Date), N'3369294832', N'vera_lina.medina@medina.vera_lina@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (148, N'Soler', N'Iria Ana', 20500049, N'F', CAST(N'1981-01-28' AS Date), N'3368057235', N'iria_ana.soler@soler.iria_ana@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (149, N'Nuñez', N'África Martina', 20500050, N'F', CAST(N'1981-01-11' AS Date), N'3366243417', N'África_martina.nuñez@nuñez.áfrica_martina@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (150, N'Cano', N'Elena Ainhoa', 20500051, N'F', CAST(N'1981-01-20' AS Date), N'3364403709', N'elena_ainhoa.cano@cano.elena_ainhoa@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (151, N'Cortés', N'Édgar Omar', 20500052, N'M', CAST(N'1981-01-23' AS Date), N'3368619578', N'Édgar_omar.cortés@cortés.édgar_omar@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (152, N'Cruz', N'Carmen Luna', 20500053, N'F', CAST(N'1981-01-27' AS Date), N'3365579862', N'carmen_luna.cruz@cruz.carmen_luna@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (153, N'Morales', N'Lucas Labán', 20500054, N'M', CAST(N'1981-01-22' AS Date), N'3366234437', N'lucas_labán.morales@morales.lucas_labán@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (154, N'Morales', N'Isabel Nahia', 20500055, N'F', CAST(N'1981-01-06' AS Date), N'3369902548', N'isabel_nahia.morales@morales.isabel_nahia@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (155, N'Soto', N'Samuel Daniel', 20500056, N'M', CAST(N'1981-01-21' AS Date), N'3366376427', N'samuel_daniel.soto@soto.samuel_daniel@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (156, N'Carrasco', N'Olivia ', 20500057, N'F', CAST(N'1981-01-16' AS Date), N'3363531234', N'olivia_.carrasco@carrasco.olivia_@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (157, N'Lozano', N'Nour Arlet', 20500058, N'F', CAST(N'1981-01-07' AS Date), N'3367476712', N'nour_arlet.lozano@lozano.nour_arlet@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (158, N'Nieto', N'María Mar', 20500059, N'F', CAST(N'1981-01-15' AS Date), N'3364986034', N'maría_mar.nieto@nieto.maría_mar@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (159, N'Montero', N'Zoe Marta', 20500060, N'F', CAST(N'1981-01-09' AS Date), N'3363750780', N'zoe_marta.montero@montero.zoe_marta@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (160, N'Álvarez', N'Elia Alma', 20500061, N'F', CAST(N'1981-01-30' AS Date), N'3369435335', N'elia_alma.Álvarez@álvarez.elia_alma@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (161, N'León', N'Jonás Salomón', 20500062, N'M', CAST(N'1981-01-24' AS Date), N'3365789465', N'jonás_salomón.león@león.jonás_salomón@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (162, N'Marin', N'Lucía Isabel', 20500063, N'F', CAST(N'1981-01-02' AS Date), N'3368842253', N'lucía_isabel.marin@marin.lucía_isabel@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (163, N'Pérez', N'Gala Lia', 20500064, N'F', CAST(N'1981-01-23' AS Date), N'3366226801', N'gala_lia.pérez@pérez.gala_lia@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (164, N'Fuentes', N'Eneas Édgar', 20500065, N'M', CAST(N'1981-01-12' AS Date), N'3364567050', N'eneas_Édgar.fuentes@fuentes.eneas_édgar@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (165, N'Gallego', N'Mara Ángela', 20500066, N'F', CAST(N'1981-01-19' AS Date), N'3364027720', N'mara_Ángela.gallego@gallego.mara_ángela@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (166, N'Cabrera', N'Aitana Amira', 20500067, N'F', CAST(N'1981-01-28' AS Date), N'3364217478', N'aitana_amira.cabrera@cabrera.aitana_amira@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (167, N'Blanco', N'Aroa Vera', 20500068, N'F', CAST(N'1981-01-05' AS Date), N'3363960340', N'aroa_vera.blanco@blanco.aroa_vera@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (168, N'Calvo', N'India Adara', 20500069, N'F', CAST(N'1981-01-30' AS Date), N'3364601571', N'india_adara.calvo@calvo.india_adara@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (169, N'Rivera', N'Naia Carla', 20500070, N'F', CAST(N'1981-01-20' AS Date), N'3363611434', N'naia_carla.rivera@rivera.naia_carla@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (170, N'Ortiz', N'Jeremías Zacarías', 20500071, N'M', CAST(N'1981-01-14' AS Date), N'3363618234', N'jeremías_zacarías.ortiz@ortiz.jeremías_zacarías@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (171, N'Ferrer', N'Rocío Chloe', 20500072, N'F', CAST(N'1981-01-10' AS Date), N'3368354710', N'rocío_chloe.ferrer@ferrer.rocío_chloe@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (172, N'Garrido', N'Pablo Aram', 20500073, N'M', CAST(N'1981-01-04' AS Date), N'3368764964', N'pablo_aram.garrido@garrido.pablo_aram@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (173, N'Bravo', N'Adara Nora', 20500074, N'F', CAST(N'1981-01-03' AS Date), N'3367135925', N'adara_nora.bravo@bravo.adara_nora@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (174, N'Benitez', N'Ana Alba', 20500075, N'F', CAST(N'1981-01-17' AS Date), N'3364827451', N'ana_alba.benitez@benitez.ana_alba@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (175, N'Gil', N'Valeria Celia', 20500076, N'F', CAST(N'1981-01-18' AS Date), N'3365912498', N'valeria_celia.gil@gil.valeria_celia@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (176, N'Cano', N'Zacarías Caín', 20500077, N'M', CAST(N'1981-01-19' AS Date), N'3363341558', N'zacarías_caín.cano@cano.zacarías_caín@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (177, N'Giménez', N'Aurora Emma', 20500078, N'F', CAST(N'1981-01-14' AS Date), N'3364062499', N'aurora_emma.giménez@giménez.aurora_emma@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (178, N'Hidalgo', N'Ainara Rocío', 20500079, N'F', CAST(N'1981-01-28' AS Date), N'3367020345', N'ainara_rocío.hidalgo@hidalgo.ainara_rocío@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (179, N'González', N'Lucas Fabián', 20500080, N'M', CAST(N'1981-01-07' AS Date), N'3365412129', N'lucas_fabián.gonzález@gonzález.lucas_fabián@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (180, N'Castro', N'Uzías Francisco', 20500081, N'M', CAST(N'1981-01-13' AS Date), N'3363731433', N'uzías_francisco.castro@castro.uzías_francisco@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (181, N'Ferrer', N'Noé Fabián', 20500082, N'M', CAST(N'1981-01-26' AS Date), N'3364388273', N'noé_fabián.ferrer@ferrer.noé_fabián@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (182, N'Castro', N'Berta Chloe', 20500083, N'F', CAST(N'1981-01-10' AS Date), N'3367839199', N'berta_chloe.castro@castro.berta_chloe@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (183, N'Ramírez', N'Abraham Abimael', 20500084, N'M', CAST(N'1981-01-07' AS Date), N'3367789640', N'abraham_abimael.ramírez@ramírez.abraham_abimael@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (184, N'Cano', N'Eliseo Daniel', 20500085, N'M', CAST(N'1981-01-18' AS Date), N'3367544275', N'eliseo_daniel.cano@cano.eliseo_daniel@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (185, N'Delgado', N'Mateo Samuel', 20500086, N'M', CAST(N'1981-01-28' AS Date), N'3366648759', N'mateo_samuel.delgado@delgado.mateo_samuel@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (186, N'Ortega', N'Malak Noa', 20500087, N'F', CAST(N'1981-01-17' AS Date), N'3365012795', N'malak_noa.ortega@ortega.malak_noa@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (187, N'Ferrer', N'Isaías Jared', 20500088, N'M', CAST(N'1981-01-14' AS Date), N'3365821150', N'isaías_jared.ferrer@ferrer.isaías_jared@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (188, N'Fuentes', N'Renato Jehoram', 20500089, N'M', CAST(N'1981-01-12' AS Date), N'3368203315', N'renato_jehoram.fuentes@fuentes.renato_jehoram@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (189, N'Nieto', N'Francisco Abdiel', 20500090, N'M', CAST(N'1981-01-06' AS Date), N'3366258268', N'francisco_abdiel.nieto@nieto.francisco_abdiel@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (190, N'Reyes', N'Jared Herodes', 20500091, N'M', CAST(N'1981-01-16' AS Date), N'3363825363', N'jared_herodes.reyes@reyes.jared_herodes@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (191, N'Cortés', N'Efraín Joanix', 20500092, N'M', CAST(N'1981-01-05' AS Date), N'3364023070', N'efraín_joanix.cortés@cortés.efraín_joanix@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (192, N'Herrero', N'Aram Ezequiel', 20500093, N'M', CAST(N'1981-01-21' AS Date), N'3366878739', N'aram_ezequiel.herrero@herrero.aram_ezequiel@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (193, N'García', N'Daniela Azahara', 20500094, N'F', CAST(N'1981-01-09' AS Date), N'3364340880', N'daniela_azahara.garcía@garcía.daniela_azahara@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (194, N'Sanz', N'Alejandro Germán', 20500095, N'M', CAST(N'1981-01-15' AS Date), N'3365689738', N'alejandro_germán.sanz@sanz.alejandro_germán@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (195, N'López', N'Nour India', 20500096, N'F', CAST(N'1981-01-22' AS Date), N'3364642680', N'nour_india.lópez@lópez.nour_india@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (196, N'Pascual', N'Bartolomé Gadiel', 20500097, N'M', CAST(N'1981-01-18' AS Date), N'3369386433', N'bartolomé_gadiel.pascual@pascual.bartolomé_gadiel@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (197, N'Diez', N'Caín Francisco', 20500098, N'M', CAST(N'1981-01-07' AS Date), N'3366622953', N'caín_francisco.diez@diez.caín_francisco@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (198, N'Calvo', N'Vera Diana', 20500099, N'F', CAST(N'1981-01-24' AS Date), N'3363693924', N'vera_diana.calvo@calvo.vera_diana@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (199, N'Díaz', N'Benjamín Lucas', 21000001, N'M', CAST(N'1982-01-10' AS Date), N'3366127285', N'benjamín_lucas.díaz@díaz.benjamín_lucas@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (200, N'Diez', N'Lucas Mateo', 21000002, N'M', CAST(N'1982-01-08' AS Date), N'3363123549', N'lucas_mateo.diez@diez.lucas_mateo@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (201, N'Castro', N'Naín Beltrán', 21000003, N'M', CAST(N'1982-01-02' AS Date), N'3363342089', N'naín_beltrán.castro@castro.naín_beltrán@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (202, N'Fernández', N'Azahara Macarena', 21000004, N'F', CAST(N'1982-01-09' AS Date), N'3367598568', N'azahara_macarena.fernández@fernández.azahara_macarena@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (203, N'Méndez', N'Daniela Arlet', 21000005, N'F', CAST(N'1982-01-05' AS Date), N'3368727247', N'daniela_arlet.méndez@méndez.daniela_arlet@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (204, N'Serrano', N'Cristina Lina', 21000006, N'F', CAST(N'1982-01-12' AS Date), N'3363315018', N'cristina_lina.serrano@serrano.cristina_lina@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (205, N'Jimenez', N'Francisco Jeremías', 21000007, N'M', CAST(N'1982-01-09' AS Date), N'3367528433', N'francisco_jeremías.jimenez@jimenez.francisco_jeremías@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (206, N'Aguilar', N'Sergio Jesús', 21000008, N'M', CAST(N'1982-01-07' AS Date), N'3368598977', N'sergio_jesús.aguilar@aguilar.sergio_jesús@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (207, N'Álvarez', N'Gaspar Aram', 21000009, N'M', CAST(N'1982-01-03' AS Date), N'3364559803', N'gaspar_aram.Álvarez@álvarez.gaspar_aram@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (208, N'Pascual', N'Nora Ángela', 21000010, N'F', CAST(N'1982-01-08' AS Date), N'3364745352', N'nora_Ángela.pascual@pascual.nora_ángela@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (209, N'Prieto', N'Carlota Azahara', 21000011, N'F', CAST(N'1982-01-01' AS Date), N'3366211631', N'carlota_azahara.prieto@prieto.carlota_azahara@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (210, N'Gallardo', N'Rafael Eliseo', 21000012, N'M', CAST(N'1982-01-25' AS Date), N'3369775839', N'rafael_eliseo.gallardo@gallardo.rafael_eliseo@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (211, N'García', N'Jana Vera', 21000013, N'F', CAST(N'1982-01-03' AS Date), N'3369138386', N'jana_vera.garcía@garcía.jana_vera@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (212, N'Gallego', N'Nerea Manuela', 21000014, N'F', CAST(N'1982-01-20' AS Date), N'3366459736', N'nerea_manuela.gallego@gallego.nerea_manuela@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (213, N'Cabrera', N'Julia Helena', 21000015, N'F', CAST(N'1982-01-18' AS Date), N'3369458006', N'julia_helena.cabrera@cabrera.julia_helena@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (214, N'Gil', N'Efraín Neftalí', 21000016, N'M', CAST(N'1982-01-21' AS Date), N'3367144737', N'efraín_neftalí.gil@gil.efraín_neftalí@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (215, N'Herrero', N'Martina Rocío', 21000017, N'F', CAST(N'1982-01-27' AS Date), N'3367252790', N'martina_rocío.herrero@herrero.martina_rocío@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (216, N'Márquez', N'Elia Fátima', 21000018, N'F', CAST(N'1982-01-29' AS Date), N'3364226856', N'elia_fátima.márquez@márquez.elia_fátima@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (217, N'Lorenzo', N'Amira Julia', 21000019, N'F', CAST(N'1982-01-11' AS Date), N'3367891996', N'amira_julia.lorenzo@lorenzo.amira_julia@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (218, N'Calvo', N'Triana Alejandra', 21000020, N'F', CAST(N'1982-01-25' AS Date), N'3367730751', N'triana_alejandra.calvo@calvo.triana_alejandra@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (219, N'Navarro', N'Nerea Andrea', 21000021, N'F', CAST(N'1982-01-29' AS Date), N'3364656703', N'nerea_andrea.navarro@navarro.nerea_andrea@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (220, N'Carrasco', N'Zacarías Uzías', 21000022, N'M', CAST(N'1982-01-06' AS Date), N'3369491869', N'zacarías_uzías.carrasco@carrasco.zacarías_uzías@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (221, N'Mora', N'Jimena María', 21000023, N'F', CAST(N'1982-01-03' AS Date), N'3368543853', N'jimena_maría.mora@mora.jimena_maría@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (222, N'Rivera', N'Carlota Cristina', 21000024, N'F', CAST(N'1982-01-26' AS Date), N'3366592800', N'carlota_cristina.rivera@rivera.carlota_cristina@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (223, N'Gutiérrez', N'Noa Nour', 21000025, N'F', CAST(N'1982-01-04' AS Date), N'3365183084', N'noa_nour.gutiérrez@gutiérrez.noa_nour@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (224, N'Cortés', N'Sofía Azahara', 21000026, N'F', CAST(N'1982-01-27' AS Date), N'3366721581', N'sofía_azahara.cortés@cortés.sofía_azahara@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (225, N'Gallardo', N'Simón Noé', 21000027, N'M', CAST(N'1982-01-26' AS Date), N'3363767170', N'simón_noé.gallardo@gallardo.simón_noé@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (226, N'Garrido', N'Jonás Jesús', 21000028, N'M', CAST(N'1982-01-12' AS Date), N'3363151868', N'jonás_jesús.garrido@garrido.jonás_jesús@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (227, N'Muñoz', N'Nerea Carmen', 21000029, N'F', CAST(N'1982-01-02' AS Date), N'3367048403', N'nerea_carmen.muñoz@muñoz.nerea_carmen@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (228, N'Sanz', N'Vera Nerea', 21000030, N'F', CAST(N'1982-01-07' AS Date), N'3366337229', N'vera_nerea.sanz@sanz.vera_nerea@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (229, N'Ortiz', N'Daniel Ismael', 21000031, N'M', CAST(N'1982-01-23' AS Date), N'3367586949', N'daniel_ismael.ortiz@ortiz.daniel_ismael@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (230, N'Caballero', N'Carlota Amaia', 21000032, N'F', CAST(N'1982-01-17' AS Date), N'3363103698', N'carlota_amaia.caballero@caballero.carlota_amaia@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (231, N'Ramírez', N'Candela Valentina', 21000033, N'F', CAST(N'1982-01-03' AS Date), N'3368445008', N'candela_valentina.ramírez@ramírez.candela_valentina@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (232, N'Alonso', N'Esteban Jeremías', 21000034, N'M', CAST(N'1982-01-16' AS Date), N'3369004006', N'esteban_jeremías.alonso@alonso.esteban_jeremías@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (233, N'Herrera', N'Set Isaías', 21000035, N'M', CAST(N'1982-01-19' AS Date), N'3363031398', N'set_isaías.herrera@herrera.set_isaías@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (234, N'Crespo', N'Eliel Guido', 21000036, N'M', CAST(N'1982-01-12' AS Date), N'3368309996', N'eliel_guido.crespo@crespo.eliel_guido@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (235, N'Castillo', N'Benjamín Aarón', 21000037, N'M', CAST(N'1982-01-05' AS Date), N'3365023431', N'benjamín_aarón.castillo@castillo.benjamín_aarón@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (236, N'Rubio', N'Ariadna Ana', 21000038, N'F', CAST(N'1982-01-09' AS Date), N'3368726479', N'ariadna_ana.rubio@rubio.ariadna_ana@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (237, N'Domínguez', N'Jana Aina', 21000039, N'F', CAST(N'1982-01-25' AS Date), N'3364094893', N'jana_aina.domínguez@domínguez.jana_aina@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (238, N'Reyes', N'Simón Zacarías', 21000040, N'M', CAST(N'1982-01-25' AS Date), N'3365076898', N'simón_zacarías.reyes@reyes.simón_zacarías@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (239, N'Cabrera', N'Leire Victoria', 21000041, N'F', CAST(N'1982-01-05' AS Date), N'3363308365', N'leire_victoria.cabrera@cabrera.leire_victoria@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (240, N'Cortés', N'Mia Alma', 21000042, N'F', CAST(N'1982-01-06' AS Date), N'3366774970', N'mia_alma.cortés@cortés.mia_alma@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (241, N'Rubio', N'Manuela Marta', 21000043, N'F', CAST(N'1982-01-16' AS Date), N'3365939829', N'manuela_marta.rubio@rubio.manuela_marta@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (242, N'Duran', N'Luna Carmen', 21000044, N'F', CAST(N'1982-01-13' AS Date), N'3367279553', N'luna_carmen.duran@duran.luna_carmen@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (243, N'Giménez', N'Acab Matías', 21000045, N'M', CAST(N'1982-01-22' AS Date), N'3368178542', N'acab_matías.giménez@giménez.acab_matías@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (244, N'Sánchez', N'Juan Jehoram', 21000046, N'M', CAST(N'1982-01-29' AS Date), N'3365102962', N'juan_jehoram.sánchez@sánchez.juan_jehoram@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (245, N'Moya', N'Benjamín Francisco', 21000047, N'M', CAST(N'1982-01-30' AS Date), N'3368188042', N'benjamín_francisco.moya@moya.benjamín_francisco@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (246, N'Domínguez', N'Clara Fátima', 21000048, N'F', CAST(N'1982-01-29' AS Date), N'3365537978', N'clara_fátima.domínguez@domínguez.clara_fátima@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (247, N'Santiago', N'Ana Laia', 21000049, N'F', CAST(N'1982-01-11' AS Date), N'3364498709', N'ana_laia.santiago@santiago.ana_laia@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (248, N'Gutiérrez', N'Candela Celia', 21000050, N'F', CAST(N'1982-01-23' AS Date), N'3369768922', N'candela_celia.gutiérrez@gutiérrez.candela_celia@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (249, N'Calvo', N'Zoe Nuria', 21000051, N'F', CAST(N'1982-01-25' AS Date), N'3369754714', N'zoe_nuria.calvo@calvo.zoe_nuria@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (250, N'Rojas', N'Cristina Macarena', 21000052, N'F', CAST(N'1982-01-13' AS Date), N'3368156091', N'cristina_macarena.rojas@rojas.cristina_macarena@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (251, N'Cabrera', N'Isaac Acab', 21000053, N'M', CAST(N'1982-01-08' AS Date), N'3364924213', N'isaac_acab.cabrera@cabrera.isaac_acab@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (252, N'Rubio', N'Aram Bartolomé', 21000054, N'M', CAST(N'1982-01-21' AS Date), N'3368301000', N'aram_bartolomé.rubio@rubio.aram_bartolomé@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (253, N'Gil', N'Aitana Berta', 21000055, N'F', CAST(N'1982-01-15' AS Date), N'3368811380', N'aitana_berta.gil@gil.aitana_berta@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (254, N'Lorenzo', N'India Nuria', 21000056, N'F', CAST(N'1982-01-06' AS Date), N'3368000844', N'india_nuria.lorenzo@lorenzo.india_nuria@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (255, N'Iglesias', N'Bartolomé Homero', 21000057, N'M', CAST(N'1982-01-21' AS Date), N'3367161641', N'bartolomé_homero.iglesias@iglesias.bartolomé_homero@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (256, N'Santiago', N'Ángela Jimena', 21000058, N'F', CAST(N'1982-01-11' AS Date), N'3364283852', N'Ángela_jimena.santiago@santiago.ángela_jimena@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (257, N'León', N'Gala Helena', 21000059, N'F', CAST(N'1982-01-28' AS Date), N'3365028422', N'gala_helena.león@león.gala_helena@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (258, N'Moreno', N'Luna Lara', 21000060, N'F', CAST(N'1982-01-12' AS Date), N'3368389612', N'luna_lara.moreno@moreno.luna_lara@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (259, N'Santiago', N'Leyre Malak', 21000061, N'F', CAST(N'1982-01-28' AS Date), N'3363176519', N'leyre_malak.santiago@santiago.leyre_malak@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (260, N'Sánchez', N'Marduk Elías', 21000062, N'M', CAST(N'1982-01-16' AS Date), N'3366596679', N'marduk_elías.sánchez@sánchez.marduk_elías@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (261, N'Roman', N'Jonás Marduk', 21000063, N'M', CAST(N'1982-01-20' AS Date), N'3368792693', N'jonás_marduk.roman@roman.jonás_marduk@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (262, N'Nieto', N'Vera Fátima', 21000064, N'F', CAST(N'1982-01-22' AS Date), N'3364970621', N'vera_fátima.nieto@nieto.vera_fátima@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (263, N'Méndez', N'Jaír de Galaad Guido', 21000065, N'M', CAST(N'1982-01-03' AS Date), N'3368039823', N'jaír_de_galaad_guido.méndez@méndez.jaír_de_galaad_guido@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (264, N'Vargas', N'Carolina Jimena', 21000066, N'F', CAST(N'1982-01-14' AS Date), N'3364560972', N'carolina_jimena.vargas@vargas.carolina_jimena@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (265, N'Ruiz', N'Nahia India', 21000067, N'F', CAST(N'1982-01-20' AS Date), N'3364727853', N'nahia_india.ruiz@ruiz.nahia_india@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (266, N'Alonso', N'Mateo Neftalí', 21000068, N'M', CAST(N'1982-01-24' AS Date), N'3363999490', N'mateo_neftalí.alonso@alonso.mateo_neftalí@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (267, N'Gutiérrez', N'Abril Leyre', 21000069, N'F', CAST(N'1982-01-23' AS Date), N'3363743183', N'abril_leyre.gutiérrez@gutiérrez.abril_leyre@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (268, N'Márquez', N'Cayetana África', 21000070, N'F', CAST(N'1982-01-04' AS Date), N'3367622704', N'cayetana_África.márquez@márquez.cayetana_áfrica@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (269, N'Gil', N'Marina Celia', 21000071, N'F', CAST(N'1982-01-26' AS Date), N'3367542540', N'marina_celia.gil@gil.marina_celia@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (270, N'Calvo', N'Ana Aroa', 21000072, N'F', CAST(N'1982-01-27' AS Date), N'3365179377', N'ana_aroa.calvo@calvo.ana_aroa@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (271, N'López', N'Isabel Iris', 21000073, N'F', CAST(N'1982-01-09' AS Date), N'3365091158', N'isabel_iris.lópez@lópez.isabel_iris@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (272, N'Parra', N'Moisés', 21000074, N'M', CAST(N'1982-01-22' AS Date), N'3365132547', N'moisés.parra@parra.moisés@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (273, N'Márquez', N'Victoria Macarena', 21000075, N'F', CAST(N'1982-01-13' AS Date), N'3369561453', N'victoria_macarena.márquez@márquez.victoria_macarena@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (274, N'Flores', N'Leví Dámaso', 21000076, N'M', CAST(N'1982-01-07' AS Date), N'3369704445', N'leví_dámaso.flores@flores.leví_dámaso@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (275, N'Díaz', N'Isabel Zoe', 21000077, N'F', CAST(N'1982-01-25' AS Date), N'3364835422', N'isabel_zoe.díaz@díaz.isabel_zoe@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (276, N'Castillo', N'Aitana Manuela', 21000078, N'F', CAST(N'1982-01-17' AS Date), N'3369383622', N'aitana_manuela.castillo@castillo.aitana_manuela@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (277, N'Campos', N'Blanca Elia', 21000079, N'F', CAST(N'1982-01-14' AS Date), N'3367639866', N'blanca_elia.campos@campos.blanca_elia@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (278, N'Jimenez', N'Naín Ashur', 21000080, N'M', CAST(N'1982-01-19' AS Date), N'3366066410', N'naín_ashur.jimenez@jimenez.naín_ashur@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (279, N'Roman', N'Valeria Olivia', 21000081, N'F', CAST(N'1982-01-14' AS Date), N'3366731593', N'valeria_olivia.roman@roman.valeria_olivia@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (280, N'Benitez', N'Alma Nora', 21000082, N'F', CAST(N'1982-01-09' AS Date), N'3369817131', N'alma_nora.benitez@benitez.alma_nora@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (281, N'Nieto', N'Rafael Uzías', 21000083, N'M', CAST(N'1982-01-24' AS Date), N'3369332695', N'rafael_uzías.nieto@nieto.rafael_uzías@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (282, N'Ibáñez', N'Abimael Neftalí', 21000084, N'M', CAST(N'1982-01-29' AS Date), N'3367322207', N'abimael_neftalí.ibáñez@ibáñez.abimael_neftalí@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (283, N'Méndez', N'Alejandro Noé', 21000085, N'M', CAST(N'1982-01-10' AS Date), N'3369030496', N'alejandro_noé.méndez@méndez.alejandro_noé@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (284, N'Torres', N'Eneas Abel', 21000086, N'M', CAST(N'1982-01-01' AS Date), N'3368684811', N'eneas_abel.torres@torres.eneas_abel@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (285, N'Hidalgo', N'Carmen Emma', 21000087, N'F', CAST(N'1982-01-28' AS Date), N'3368053778', N'carmen_emma.hidalgo@hidalgo.carmen_emma@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (286, N'Gutiérrez', N'Marcos Neftalí', 21000088, N'M', CAST(N'1982-01-11' AS Date), N'3368165700', N'marcos_neftalí.gutiérrez@gutiérrez.marcos_neftalí@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (287, N'Pascual', N'David Gaspar', 21000089, N'M', CAST(N'1982-01-19' AS Date), N'3365558433', N'david_gaspar.pascual@pascual.david_gaspar@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (288, N'Morales', N'Valentina Sofía', 21000090, N'F', CAST(N'1982-01-20' AS Date), N'3368727428', N'valentina_sofía.morales@morales.valentina_sofía@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (289, N'Márquez', N'Leire Luna', 21000091, N'F', CAST(N'1982-01-05' AS Date), N'3363696084', N'leire_luna.márquez@márquez.leire_luna@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (290, N'Mora', N'Claudia Triana', 21000092, N'F', CAST(N'1982-01-07' AS Date), N'3363595986', N'claudia_triana.mora@mora.claudia_triana@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (291, N'Marin', N'Set Abdiel', 21000093, N'M', CAST(N'1982-01-26' AS Date), N'3363781527', N'set_abdiel.marin@marin.set_abdiel@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (292, N'Pérez', N'Matías Demócrito', 21000094, N'M', CAST(N'1982-01-20' AS Date), N'3368247245', N'matías_demócrito.pérez@pérez.matías_demócrito@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (293, N'Gómez', N'Zacarías Aram', 21000095, N'M', CAST(N'1982-01-11' AS Date), N'3368968180', N'zacarías_aram.gómez@gómez.zacarías_aram@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (294, N'Marin', N'Clara Nerea', 21000096, N'F', CAST(N'1982-01-28' AS Date), N'3363098594', N'clara_nerea.marin@marin.clara_nerea@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (295, N'Santos', N'Ashur Sergio', 21000097, N'M', CAST(N'1982-01-18' AS Date), N'3365471239', N'ashur_sergio.santos@santos.ashur_sergio@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (296, N'Pérez', N'Natalia Paula', 21000098, N'F', CAST(N'1982-01-04' AS Date), N'3367315298', N'natalia_paula.pérez@pérez.natalia_paula@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (297, N'Delgado', N'Zacarías Ismael', 21000099, N'M', CAST(N'1982-01-15' AS Date), N'3369405471', N'zacarías_ismael.delgado@delgado.zacarías_ismael@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (298, N'Delgado', N'Simón Gadiel', 21500001, N'M', CAST(N'1983-01-29' AS Date), N'3364403215', N'simón_gadiel.delgado@delgado.simón_gadiel@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (299, N'Muñoz', N'Andrés Caín', 21500002, N'M', CAST(N'1983-01-23' AS Date), N'3363031598', N'andrés_caín.muñoz@muñoz.andrés_caín@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (300, N'Vicente', N'Laura Vega', 21500003, N'F', CAST(N'1983-01-28' AS Date), N'3363810517', N'laura_vega.vicente@vicente.laura_vega@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (301, N'Sanz', N'Adán Efraín', 21500004, N'M', CAST(N'1983-01-04' AS Date), N'3365869514', N'adán_efraín.sanz@sanz.adán_efraín@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (302, N'Sanz', N'Ona Abril', 21500005, N'F', CAST(N'1983-01-18' AS Date), N'3366984072', N'ona_abril.sanz@sanz.ona_abril@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (303, N'Moreno', N'Isaías Marduk', 21500006, N'M', CAST(N'1983-01-17' AS Date), N'3367248288', N'isaías_marduk.moreno@moreno.isaías_marduk@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (304, N'Gutiérrez', N'Inés Isabella', 21500007, N'F', CAST(N'1983-01-10' AS Date), N'3367876574', N'inés_isabella.gutiérrez@gutiérrez.inés_isabella@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (305, N'Campos', N'Laura Gala', 21500008, N'F', CAST(N'1983-01-19' AS Date), N'3368359531', N'laura_gala.campos@campos.laura_gala@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (306, N'López', N'Gala Mar', 21500009, N'F', CAST(N'1983-01-26' AS Date), N'3363036550', N'gala_mar.lópez@lópez.gala_mar@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (307, N'Morales', N'Aarón Lucas', 21500010, N'M', CAST(N'1983-01-24' AS Date), N'3366032435', N'aarón_lucas.morales@morales.aarón_lucas@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (308, N'Prieto', N'Carlota Amira', 21500011, N'F', CAST(N'1983-01-24' AS Date), N'3366521346', N'carlota_amira.prieto@prieto.carlota_amira@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (309, N'Rubio', N'Demócrito Naín', 21500012, N'M', CAST(N'1983-01-30' AS Date), N'3366614133', N'demócrito_naín.rubio@rubio.demócrito_naín@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (310, N'Calvo', N'Labán Herodes', 21500013, N'M', CAST(N'1983-01-07' AS Date), N'3368390130', N'labán_herodes.calvo@calvo.labán_herodes@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (311, N'Sáez', N'Rubén Isaías', 21500014, N'M', CAST(N'1983-01-30' AS Date), N'3363303789', N'rubén_isaías.sáez@sáez.rubén_isaías@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (312, N'Hernández', N'Iria Aitana', 21500015, N'F', CAST(N'1983-01-13' AS Date), N'3363719740', N'iria_aitana.hernández@hernández.iria_aitana@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (313, N'Ramírez', N'Cristina Nerea', 21500016, N'F', CAST(N'1983-01-30' AS Date), N'3365122476', N'cristina_nerea.ramírez@ramírez.cristina_nerea@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (314, N'Fuentes', N'Lucas Zacarías', 21500017, N'M', CAST(N'1983-01-10' AS Date), N'3366644509', N'lucas_zacarías.fuentes@fuentes.lucas_zacarías@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (315, N'Cruz', N'Nuria Gabriela', 21500018, N'F', CAST(N'1983-01-06' AS Date), N'3366465709', N'nuria_gabriela.cruz@cruz.nuria_gabriela@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (316, N'Rodríguez', N'Leyre Paula', 21500019, N'F', CAST(N'1983-01-11' AS Date), N'3364730883', N'leyre_paula.rodríguez@rodríguez.leyre_paula@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (317, N'Nieto', N'Efraín Esteban', 21500020, N'M', CAST(N'1983-01-24' AS Date), N'3369339491', N'efraín_esteban.nieto@nieto.efraín_esteban@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (318, N'Arias', N'Julio Efraín', 21500021, N'M', CAST(N'1983-01-09' AS Date), N'3369632682', N'julio_efraín.arias@arias.julio_efraín@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (319, N'Cano', N'Malak Manuela', 21500022, N'F', CAST(N'1983-01-20' AS Date), N'3367657365', N'malak_manuela.cano@cano.malak_manuela@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (320, N'Arias', N'Alejandro Lucas', 21500023, N'M', CAST(N'1983-01-01' AS Date), N'3367023119', N'alejandro_lucas.arias@arias.alejandro_lucas@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (321, N'Ferrer', N'Jiram Ciro', 21500024, N'M', CAST(N'1983-01-13' AS Date), N'3368422241', N'jiram_ciro.ferrer@ferrer.jiram_ciro@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (322, N'Rojas', N'Cloe', 21500025, N'F', CAST(N'1983-01-03' AS Date), N'3367795099', N'cloe.rojas@rojas.cloe@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (323, N'Diez', N'Beltrán David', 21500026, N'M', CAST(N'1983-01-26' AS Date), N'3368170612', N'beltrán_david.diez@diez.beltrán_david@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (324, N'Torres', N'Jonás Omar', 21500027, N'M', CAST(N'1983-01-27' AS Date), N'3366316441', N'jonás_omar.torres@torres.jonás_omar@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (325, N'Ruiz', N'Mara Sofía', 21500028, N'F', CAST(N'1983-01-14' AS Date), N'3365752492', N'mara_sofía.ruiz@ruiz.mara_sofía@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (326, N'Carrasco', N'Lucía Berta', 21500029, N'F', CAST(N'1983-01-28' AS Date), N'3369746303', N'lucía_berta.carrasco@carrasco.lucía_berta@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (327, N'Molina', N'Saúl', 21500030, N'M', CAST(N'1983-01-08' AS Date), N'3365600160', N'saúl.molina@molina.saúl@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (328, N'Martín', N'Mateo Germán', 21500031, N'M', CAST(N'1983-01-12' AS Date), N'3366516302', N'mateo_germán.martín@martín.mateo_germán@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (329, N'Marin', N'Amira Helena', 21500032, N'F', CAST(N'1983-01-01' AS Date), N'3365603144', N'amira_helena.marin@marin.amira_helena@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (330, N'Fernández', N'Neftalí Beltrán', 21500033, N'M', CAST(N'1983-01-08' AS Date), N'3364637672', N'neftalí_beltrán.fernández@fernández.neftalí_beltrán@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (331, N'Bravo', N'Ariadna Nour', 21500034, N'F', CAST(N'1983-01-06' AS Date), N'3365878905', N'ariadna_nour.bravo@bravo.ariadna_nour@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (332, N'Cano', N'Lola Martina', 21500035, N'F', CAST(N'1983-01-20' AS Date), N'3365385588', N'lola_martina.cano@cano.lola_martina@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (333, N'Torres', N'Isabella Olivia', 21500036, N'F', CAST(N'1983-01-05' AS Date), N'3369799071', N'isabella_olivia.torres@torres.isabella_olivia@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (334, N'Campos', N'Abril Chloe', 21500037, N'F', CAST(N'1983-01-01' AS Date), N'3363016125', N'abril_chloe.campos@campos.abril_chloe@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (335, N'Gómez', N'Abraham Lucas', 21500038, N'M', CAST(N'1983-01-08' AS Date), N'3363257539', N'abraham_lucas.gómez@gómez.abraham_lucas@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (336, N'Prieto', N'Germán Josué', 21500039, N'M', CAST(N'1983-01-14' AS Date), N'3364424146', N'germán_josué.prieto@prieto.germán_josué@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (337, N'Sanz', N'Guido Marduk', 21500040, N'M', CAST(N'1983-01-24' AS Date), N'3365641513', N'guido_marduk.sanz@sanz.guido_marduk@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (338, N'Ferrer', N'Miguel Joaquín', 21500041, N'M', CAST(N'1983-01-08' AS Date), N'3364029504', N'miguel_joaquín.ferrer@ferrer.miguel_joaquín@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (339, N'Reyes', N'Cristina Gala', 21500042, N'F', CAST(N'1983-01-04' AS Date), N'3367253569', N'cristina_gala.reyes@reyes.cristina_gala@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (340, N'Sáez', N'Malak Azahara', 21500043, N'F', CAST(N'1983-01-17' AS Date), N'3364592494', N'malak_azahara.sáez@sáez.malak_azahara@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (341, N'Sáez', N'Valeria', 21500044, N'F', CAST(N'1983-01-10' AS Date), N'3369266534', N'valeria.sáez@sáez.valeria@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (342, N'Morales', N'Naín Renato', 21500045, N'M', CAST(N'1983-01-30' AS Date), N'3363222012', N'naín_renato.morales@morales.naín_renato@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (343, N'Parra', N'Isabella Lina', 21500046, N'F', CAST(N'1983-01-16' AS Date), N'3364560250', N'isabella_lina.parra@parra.isabella_lina@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (344, N'Montero', N'Gabriela Noa', 21500047, N'F', CAST(N'1983-01-11' AS Date), N'3369922253', N'gabriela_noa.montero@montero.gabriela_noa@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (345, N'Gil', N'Daniela Paula', 21500048, N'F', CAST(N'1983-01-27' AS Date), N'3363501456', N'daniela_paula.gil@gil.daniela_paula@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (346, N'Rivera', N'Nicolás Hugo', 21500049, N'M', CAST(N'1983-01-01' AS Date), N'3369655751', N'nicolás_hugo.rivera@rivera.nicolás_hugo@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (347, N'Ramírez', N'Nicolás Acab', 21500050, N'M', CAST(N'1983-01-27' AS Date), N'3365495338', N'nicolás_acab.ramírez@ramírez.nicolás_acab@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (348, N'Santiago', N'Lia Candela', 21500051, N'F', CAST(N'1983-01-28' AS Date), N'3364087335', N'lia_candela.santiago@santiago.lia_candela@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (349, N'Vidal', N'Laia Malak', 21500052, N'F', CAST(N'1983-01-23' AS Date), N'3363239700', N'laia_malak.vidal@vidal.laia_malak@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (350, N'Domínguez', N'Leyre Julia', 21500053, N'F', CAST(N'1983-01-03' AS Date), N'3367088140', N'leyre_julia.domínguez@domínguez.leyre_julia@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (351, N'Peña', N'Jehoram Lemuel', 21500054, N'M', CAST(N'1983-01-05' AS Date), N'3364055319', N'jehoram_lemuel.peña@peña.jehoram_lemuel@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (352, N'Rubio', N'Juan Homero', 21500055, N'M', CAST(N'1983-01-12' AS Date), N'3365809690', N'juan_homero.rubio@rubio.juan_homero@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (353, N'Prieto', N'Lucas Andrés', 21500056, N'M', CAST(N'1983-01-18' AS Date), N'3365581553', N'lucas_andrés.prieto@prieto.lucas_andrés@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (354, N'Pastor', N'Ángela Aroa', 21500057, N'F', CAST(N'1983-01-28' AS Date), N'3368815992', N'Ángela_aroa.pastor@pastor.ángela_aroa@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (355, N'Campos', N'Iris Noa', 21500058, N'F', CAST(N'1983-01-15' AS Date), N'3366660089', N'iris_noa.campos@campos.iris_noa@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (356, N'Benitez', N'Jeremías Saúl', 21500059, N'M', CAST(N'1983-01-08' AS Date), N'3367862120', N'jeremías_saúl.benitez@benitez.jeremías_saúl@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (357, N'Ramos', N'India Mia', 21500060, N'F', CAST(N'1983-01-01' AS Date), N'3369397665', N'india_mia.ramos@ramos.india_mia@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (358, N'Pérez', N'Naín Ciro', 21500061, N'M', CAST(N'1983-01-24' AS Date), N'3363421165', N'naín_ciro.pérez@pérez.naín_ciro@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (359, N'Hidalgo', N'Efraín Nicolás', 21500062, N'M', CAST(N'1983-01-21' AS Date), N'3363591121', N'efraín_nicolás.hidalgo@hidalgo.efraín_nicolás@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (360, N'Gil', N'Daniel Eliseo', 21500063, N'M', CAST(N'1983-01-23' AS Date), N'3369110626', N'daniel_eliseo.gil@gil.daniel_eliseo@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (361, N'López', N'Simón Darío', 21500064, N'M', CAST(N'1983-01-25' AS Date), N'3368537395', N'simón_darío.lópez@lópez.simón_darío@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (362, N'Méndez', N'Félix Aram', 21500065, N'M', CAST(N'1983-01-23' AS Date), N'3368756621', N'félix_aram.méndez@méndez.félix_aram@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (363, N'Molina', N'Esteban Noé', 21500066, N'M', CAST(N'1983-01-02' AS Date), N'3368644401', N'esteban_noé.molina@molina.esteban_noé@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (364, N'Flores', N'Diana María', 21500067, N'F', CAST(N'1983-01-29' AS Date), N'3363350610', N'diana_maría.flores@flores.diana_maría@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (365, N'Garrido', N'Jairo Ahzià', 21500068, N'M', CAST(N'1983-01-24' AS Date), N'3364295422', N'jairo_ahzià.garrido@garrido.jairo_ahzià@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (366, N'Delgado', N'Joaquín Lemuel', 21500069, N'M', CAST(N'1983-01-02' AS Date), N'3366101237', N'joaquín_lemuel.delgado@delgado.joaquín_lemuel@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (367, N'Benitez', N'Paula Andrea', 21500070, N'F', CAST(N'1983-01-10' AS Date), N'3364888560', N'paula_andrea.benitez@benitez.paula_andrea@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (368, N'Álvarez', N'Carolina Aitana', 21500071, N'F', CAST(N'1983-01-25' AS Date), N'3367491072', N'carolina_aitana.Álvarez@álvarez.carolina_aitana@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (369, N'Márquez', N'Adán Félix', 21500072, N'M', CAST(N'1983-01-19' AS Date), N'3369249874', N'adán_félix.márquez@márquez.adán_félix@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (370, N'Arias', N'Triana Elia', 21500073, N'F', CAST(N'1983-01-15' AS Date), N'3366510896', N'triana_elia.arias@arias.triana_elia@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (371, N'Morales', N'Jana Sofía', 21500074, N'F', CAST(N'1983-01-09' AS Date), N'3365807010', N'jana_sofía.morales@morales.jana_sofía@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (372, N'Rivera', N'Homero Isaías', 21500075, N'M', CAST(N'1983-01-25' AS Date), N'3366431808', N'homero_isaías.rivera@rivera.homero_isaías@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (373, N'Ramírez', N'Iris Fátima', 21500076, N'F', CAST(N'1983-01-08' AS Date), N'3363642656', N'iris_fátima.ramírez@ramírez.iris_fátima@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (374, N'Nieto', N'Gala Nuria', 21500077, N'F', CAST(N'1983-01-10' AS Date), N'3364352808', N'gala_nuria.nieto@nieto.gala_nuria@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (375, N'Rubio', N'Uzías Miguel', 21500078, N'M', CAST(N'1983-01-29' AS Date), N'3368626166', N'uzías_miguel.rubio@rubio.uzías_miguel@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (376, N'Castillo', N'Gadiel Aarón', 21500079, N'M', CAST(N'1983-01-04' AS Date), N'3363580412', N'gadiel_aarón.castillo@castillo.gadiel_aarón@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (377, N'Ibáñez', N'Ashur Baltasar', 21500080, N'M', CAST(N'1983-01-17' AS Date), N'3366722375', N'ashur_baltasar.ibáñez@ibáñez.ashur_baltasar@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (378, N'Roman', N'Vega Carla', 21500081, N'F', CAST(N'1983-01-06' AS Date), N'3366235157', N'vega_carla.roman@roman.vega_carla@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (379, N'León', N'Alma Alba', 21500082, N'F', CAST(N'1983-01-23' AS Date), N'3368137321', N'alma_alba.león@león.alma_alba@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (380, N'Díaz', N'Neftalí Mateo', 21500083, N'M', CAST(N'1983-01-21' AS Date), N'3366309348', N'neftalí_mateo.díaz@díaz.neftalí_mateo@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (381, N'Ortiz', N'Elsa Berta', 21500084, N'F', CAST(N'1983-01-06' AS Date), N'3367934158', N'elsa_berta.ortiz@ortiz.elsa_berta@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (382, N'Duran', N'Vera Gala', 21500085, N'F', CAST(N'1983-01-14' AS Date), N'3368155373', N'vera_gala.duran@duran.vera_gala@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (383, N'Martín', N'Ciro Isaías', 21500086, N'M', CAST(N'1983-01-03' AS Date), N'3363784422', N'ciro_isaías.martín@martín.ciro_isaías@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (384, N'Carmona', N'Julio Labán', 21500087, N'M', CAST(N'1983-01-30' AS Date), N'3363162936', N'julio_labán.carmona@carmona.julio_labán@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (385, N'Rivera', N'Herodes Benjamín', 21500088, N'M', CAST(N'1983-01-26' AS Date), N'3367477986', N'herodes_benjamín.rivera@rivera.herodes_benjamín@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (386, N'Campos', N'Carlota Celia', 21500089, N'F', CAST(N'1983-01-26' AS Date), N'3364669819', N'carlota_celia.campos@campos.carlota_celia@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (387, N'Lorenzo', N'Aitana Marta', 21500090, N'F', CAST(N'1983-01-04' AS Date), N'3364710526', N'aitana_marta.lorenzo@lorenzo.aitana_marta@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (388, N'Mora', N'Lucía Valentina', 21500091, N'F', CAST(N'1983-01-06' AS Date), N'3366252360', N'lucía_valentina.mora@mora.lucía_valentina@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (389, N'Velasco', N'Guido Miguel', 21500092, N'M', CAST(N'1983-01-12' AS Date), N'3366621865', N'guido_miguel.velasco@velasco.guido_miguel@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (390, N'Rodríguez', N'Jesús Gaspar', 21500093, N'M', CAST(N'1983-01-14' AS Date), N'3369074544', N'jesús_gaspar.rodríguez@rodríguez.jesús_gaspar@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (391, N'Herrero', N'Lucía Macarena', 21500094, N'F', CAST(N'1983-01-10' AS Date), N'3365707107', N'lucía_macarena.herrero@herrero.lucía_macarena@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (392, N'Ramos', N'Matías Abdiel', 21500095, N'M', CAST(N'1983-01-19' AS Date), N'3363656227', N'matías_abdiel.ramos@ramos.matías_abdiel@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (393, N'Santana', N'Mateo Ahzià', 21500096, N'M', CAST(N'1983-01-26' AS Date), N'3364156384', N'mateo_ahzià.santana@santana.mateo_ahzià@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (394, N'Méndez', N'Israel Ismael', 21500097, N'M', CAST(N'1983-01-19' AS Date), N'3365466257', N'israel_ismael.méndez@méndez.israel_ismael@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (395, N'Torres', N'Eneas Salomón', 21500098, N'M', CAST(N'1983-01-01' AS Date), N'3363549808', N'eneas_salomón.torres@torres.eneas_salomón@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (396, N'Álvarez', N'Blanca Candela', 21500099, N'F', CAST(N'1983-01-12' AS Date), N'3366043995', N'blanca_candela.Álvarez@álvarez.blanca_candela@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (397, N'Rivera', N'India Lia', 22000001, N'F', CAST(N'1984-01-24' AS Date), N'3363809250', N'india_lia.rivera@rivera.india_lia@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (398, N'López', N'Nora Zoe', 22000002, N'F', CAST(N'1984-01-02' AS Date), N'3364677130', N'nora_zoe.lópez@lópez.nora_zoe@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (399, N'Ortega', N'Vega Triana', 22000003, N'F', CAST(N'1984-01-08' AS Date), N'3363133476', N'vega_triana.ortega@ortega.vega_triana@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (400, N'Vázquez', N'Clara Elsa', 22000004, N'F', CAST(N'1984-01-28' AS Date), N'3369985874', N'clara_elsa.vázquez@vázquez.clara_elsa@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (401, N'Carmona', N'Laia Ana', 22000005, N'F', CAST(N'1984-01-05' AS Date), N'3369206700', N'laia_ana.carmona@carmona.laia_ana@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (402, N'Arias', N'Gabriela Ona', 22000006, N'F', CAST(N'1984-01-20' AS Date), N'3368830320', N'gabriela_ona.arias@arias.gabriela_ona@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (403, N'Caballero', N'Ana Lucía', 22000007, N'F', CAST(N'1984-01-13' AS Date), N'3369076094', N'ana_lucía.caballero@caballero.ana_lucía@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (404, N'Serrano', N'Germán Homero', 22000008, N'M', CAST(N'1984-01-02' AS Date), N'3365152736', N'germán_homero.serrano@serrano.germán_homero@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (405, N'Benitez', N'Neftalí', 22000009, N'M', CAST(N'1984-01-11' AS Date), N'3363937219', N'neftalí.benitez@benitez.neftalí@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (406, N'Rubio', N'Carla Julia', 22000010, N'F', CAST(N'1984-01-03' AS Date), N'3364190950', N'carla_julia.rubio@rubio.carla_julia@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (407, N'Navarro', N'Baltasar Francisco', 22000011, N'M', CAST(N'1984-01-08' AS Date), N'3369175992', N'baltasar_francisco.navarro@navarro.baltasar_francisco@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (408, N'Aguilar', N'Ainara Elia', 22000012, N'F', CAST(N'1984-01-30' AS Date), N'3363806159', N'ainara_elia.aguilar@aguilar.ainara_elia@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (409, N'Jimenez', N'Lola Isabella', 22000013, N'F', CAST(N'1984-01-27' AS Date), N'3363569397', N'lola_isabella.jimenez@jimenez.lola_isabella@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (410, N'León', N'Amaia Ángela', 22000014, N'F', CAST(N'1984-01-03' AS Date), N'3364483309', N'amaia_Ángela.león@león.amaia_ángela@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (411, N'Bravo', N' Ángela', 22000015, N'F', CAST(N'1984-01-07' AS Date), N'3365719311', N'_Ángela.bravo@bravo._ángela@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (412, N'Vidal', N'Israel Acab', 22000016, N'M', CAST(N'1984-01-06' AS Date), N'3368992120', N'israel_acab.vidal@vidal.israel_acab@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (413, N'Vega', N'Nuria Alicia', 22000017, N'F', CAST(N'1984-01-11' AS Date), N'3367516486', N'nuria_alicia.vega@vega.nuria_alicia@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (414, N'Morales', N'Laia Amaia', 22000018, N'F', CAST(N'1984-01-19' AS Date), N'3363705419', N'laia_amaia.morales@morales.laia_amaia@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (415, N'Castro', N'Nuria Berta', 22000019, N'F', CAST(N'1984-01-29' AS Date), N'3369507564', N'nuria_berta.castro@castro.nuria_berta@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (416, N'León', N'Aina Nora', 22000020, N'F', CAST(N'1984-01-22' AS Date), N'3366768184', N'aina_nora.león@león.aina_nora@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (417, N'Morales', N'Neftalí Renato', 22000021, N'M', CAST(N'1984-01-17' AS Date), N'3368526886', N'neftalí_renato.morales@morales.neftalí_renato@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (418, N'Martínez', N'Ahzià Ashur', 22000022, N'M', CAST(N'1984-01-26' AS Date), N'3366694425', N'ahzià_ashur.martínez@martínez.ahzià_ashur@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (419, N'Cabrera', N'Noa Amira', 22000023, N'F', CAST(N'1984-01-21' AS Date), N'3364268234', N'noa_amira.cabrera@cabrera.noa_amira@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (420, N'Ortiz', N'Neftalí Joanix', 22000024, N'M', CAST(N'1984-01-14' AS Date), N'3366273750', N'neftalí_joanix.ortiz@ortiz.neftalí_joanix@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (421, N'Álvarez', N'Valentina Mara', 22000025, N'F', CAST(N'1984-01-08' AS Date), N'3365962745', N'valentina_mara.Álvarez@álvarez.valentina_mara@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (422, N'Márquez', N'Nour Paula', 22000026, N'F', CAST(N'1984-01-18' AS Date), N'3369675454', N'nour_paula.márquez@márquez.nour_paula@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (423, N'Vargas', N'Nuria Blanca', 22000027, N'F', CAST(N'1984-01-07' AS Date), N'3368364844', N'nuria_blanca.vargas@vargas.nuria_blanca@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (424, N'Márquez', N'Triana Alma', 22000028, N'F', CAST(N'1984-01-25' AS Date), N'3368785809', N'triana_alma.márquez@márquez.triana_alma@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (425, N'Lozano', N'Eva Ariadna', 22000029, N'F', CAST(N'1984-01-21' AS Date), N'3364934234', N'eva_ariadna.lozano@lozano.eva_ariadna@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (426, N'Ramos', N'Lucas Abdiel', 22000030, N'M', CAST(N'1984-01-20' AS Date), N'3367886092', N'lucas_abdiel.ramos@ramos.lucas_abdiel@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (427, N'Pastor', N'Rafael Agustín', 22000031, N'M', CAST(N'1984-01-30' AS Date), N'3367320554', N'rafael_agustín.pastor@pastor.rafael_agustín@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (428, N'Benitez', N'Nerea Emma', 22000032, N'F', CAST(N'1984-01-20' AS Date), N'3365073341', N'nerea_emma.benitez@benitez.nerea_emma@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (429, N'Romero', N'Abraham Demócrito', 22000033, N'M', CAST(N'1984-01-29' AS Date), N'3363768077', N'abraham_demócrito.romero@romero.abraham_demócrito@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (430, N'Santos', N'Cloe Nuria', 22000034, N'F', CAST(N'1984-01-08' AS Date), N'3366092995', N'cloe_nuria.santos@santos.cloe_nuria@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (431, N'Arias', N'Aitana María', 22000035, N'F', CAST(N'1984-01-18' AS Date), N'3364158461', N'aitana_maría.arias@arias.aitana_maría@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (432, N'Santiago', N'Labán Naín', 22000036, N'M', CAST(N'1984-01-11' AS Date), N'3369738444', N'labán_naín.santiago@santiago.labán_naín@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (433, N'Medina', N'Miguel Julio', 22000037, N'M', CAST(N'1984-01-10' AS Date), N'3366222528', N'miguel_julio.medina@medina.miguel_julio@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (434, N'Cano', N'Lina Lia', 22000038, N'F', CAST(N'1984-01-04' AS Date), N'3368976426', N'lina_lia.cano@cano.lina_lia@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (435, N'Prieto', N'Yasmín Noa', 22000039, N'F', CAST(N'1984-01-04' AS Date), N'3368614991', N'yasmín_noa.prieto@prieto.yasmín_noa@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (436, N'Campos', N'Laia Marta', 22000040, N'F', CAST(N'1984-01-16' AS Date), N'3368543149', N'laia_marta.campos@campos.laia_marta@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (437, N'Molina', N'Adriana Helena', 22000041, N'F', CAST(N'1984-01-25' AS Date), N'3365414885', N'adriana_helena.molina@molina.adriana_helena@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (438, N'Ortega', N'Lucía Sara', 22000042, N'F', CAST(N'1984-01-04' AS Date), N'3364305026', N'lucía_sara.ortega@ortega.lucía_sara@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (439, N'Prieto', N'Ainara Elsa', 22000043, N'F', CAST(N'1984-01-17' AS Date), N'3368078390', N'ainara_elsa.prieto@prieto.ainara_elsa@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (440, N'Ruiz', N'Cayetana Emma', 22000044, N'F', CAST(N'1984-01-08' AS Date), N'3369466831', N'cayetana_emma.ruiz@ruiz.cayetana_emma@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (441, N'Peña', N'Victoria Alba', 22000045, N'F', CAST(N'1984-01-14' AS Date), N'3368328974', N'victoria_alba.peña@peña.victoria_alba@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (442, N'Blanco', N'Berta Diana', 22000046, N'F', CAST(N'1984-01-08' AS Date), N'3368156391', N'berta_diana.blanco@blanco.berta_diana@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (443, N'Soto', N'Caín Uzías', 22000047, N'M', CAST(N'1984-01-28' AS Date), N'3366032001', N'caín_uzías.soto@soto.caín_uzías@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (444, N'Ortega', N'Daniela África', 22000048, N'F', CAST(N'1984-01-25' AS Date), N'3368885337', N'daniela_África.ortega@ortega.daniela_áfrica@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (445, N'Rojas', N'Alicia Fátima', 22000049, N'F', CAST(N'1984-01-28' AS Date), N'3368182746', N'alicia_fátima.rojas@rojas.alicia_fátima@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (446, N'Santiago', N'Ainhoa Ona', 22000050, N'F', CAST(N'1984-01-27' AS Date), N'3365126621', N'ainhoa_ona.santiago@santiago.ainhoa_ona@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (447, N'Gallego', N'Mateo Aarón', 22000051, N'M', CAST(N'1984-01-27' AS Date), N'3365662941', N'mateo_aarón.gallego@gallego.mateo_aarón@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (448, N'Gutiérrez', N'Julieta Olivia', 22000052, N'F', CAST(N'1984-01-23' AS Date), N'3367061653', N'julieta_olivia.gutiérrez@gutiérrez.julieta_olivia@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (449, N'Ortiz', N'Eneas Jairo', 22000053, N'M', CAST(N'1984-01-19' AS Date), N'3365399109', N'eneas_jairo.ortiz@ortiz.eneas_jairo@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (450, N'Márquez', N'Jairo Jonás', 22000054, N'M', CAST(N'1984-01-18' AS Date), N'3368529384', N'jairo_jonás.márquez@márquez.jairo_jonás@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (451, N'Martín', N'Clara María', 22000055, N'F', CAST(N'1984-01-05' AS Date), N'3363982899', N'clara_maría.martín@martín.clara_maría@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (452, N'González', N'Moisés Neftalí', 22000056, N'M', CAST(N'1984-01-04' AS Date), N'3363558890', N'moisés_neftalí.gonzález@gonzález.moisés_neftalí@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (453, N'Nieto', N'Felipe Mateo', 22000057, N'M', CAST(N'1984-01-11' AS Date), N'3366766579', N'felipe_mateo.nieto@nieto.felipe_mateo@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (454, N'Bravo', N'Beltrán Tobías', 22000058, N'M', CAST(N'1984-01-14' AS Date), N'3365821161', N'beltrán_tobías.bravo@bravo.beltrán_tobías@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (455, N'Gil', N'Natalia Clara', 22000059, N'F', CAST(N'1984-01-24' AS Date), N'3367832913', N'natalia_clara.gil@gil.natalia_clara@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (456, N'López', N'Manuela Blanca', 22000060, N'F', CAST(N'1984-01-01' AS Date), N'3364451185', N'manuela_blanca.lópez@lópez.manuela_blanca@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (457, N'Morales', N'Sergio Francisco', 22000061, N'M', CAST(N'1984-01-21' AS Date), N'3363909698', N'sergio_francisco.morales@morales.sergio_francisco@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (458, N'Gallego', N'Bartolomé Isaac', 22000062, N'M', CAST(N'1984-01-08' AS Date), N'3364554087', N'bartolomé_isaac.gallego@gallego.bartolomé_isaac@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (459, N'Santana', N'Simón Lucas', 22000063, N'M', CAST(N'1984-01-19' AS Date), N'3363560809', N'simón_lucas.santana@santana.simón_lucas@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (460, N'Cruz', N'Abdiel Isaías', 22000064, N'M', CAST(N'1984-01-07' AS Date), N'3367151032', N'abdiel_isaías.cruz@cruz.abdiel_isaías@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (461, N'Gil', N'Azahara Marina', 22000065, N'F', CAST(N'1984-01-06' AS Date), N'3368612166', N'azahara_marina.gil@gil.azahara_marina@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (462, N'Castro', N'Esteban Baltasar', 22000066, N'M', CAST(N'1984-01-27' AS Date), N'3369903292', N'esteban_baltasar.castro@castro.esteban_baltasar@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (463, N'Arias', N'Ainara Triana', 22000067, N'F', CAST(N'1984-01-08' AS Date), N'3367081268', N'ainara_triana.arias@arias.ainara_triana@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (464, N'Gallego', N'Isabel Clara', 22000068, N'F', CAST(N'1984-01-17' AS Date), N'3367336125', N'isabel_clara.gallego@gallego.isabel_clara@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (465, N'Benitez', N'Valeria Laia', 22000069, N'F', CAST(N'1984-01-14' AS Date), N'3368785617', N'valeria_laia.benitez@benitez.valeria_laia@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (466, N'Nuñez', N'Lina Adara', 22000070, N'F', CAST(N'1984-01-08' AS Date), N'3365864499', N'lina_adara.nuñez@nuñez.lina_adara@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (467, N'Gómez', N'Renato Isaías', 22000071, N'M', CAST(N'1984-01-04' AS Date), N'3367187771', N'renato_isaías.gómez@gómez.renato_isaías@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (468, N'Delgado', N'Rocío Vega', 22000072, N'F', CAST(N'1984-01-28' AS Date), N'3368539478', N'rocío_vega.delgado@delgado.rocío_vega@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (469, N'Ferrer', N'Germán Agustín', 22000073, N'M', CAST(N'1984-01-21' AS Date), N'3368886354', N'germán_agustín.ferrer@ferrer.germán_agustín@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (470, N'Pascual', N'Moisés Demócrito', 22000074, N'M', CAST(N'1984-01-12' AS Date), N'3368786758', N'moisés_demócrito.pascual@pascual.moisés_demócrito@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (471, N'Navarro', N'Laura Isabel', 22000075, N'F', CAST(N'1984-01-05' AS Date), N'3368988722', N'laura_isabel.navarro@navarro.laura_isabel@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (472, N'García', N'Elia Lina', 22000076, N'F', CAST(N'1984-01-18' AS Date), N'3365474933', N'elia_lina.garcía@garcía.elia_lina@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (473, N'Ortega', N'Vega Paula', 22000077, N'F', CAST(N'1984-01-26' AS Date), N'3368120626', N'vega_paula.ortega@ortega.vega_paula@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (474, N'Cano', N'Naia Marina', 22000078, N'F', CAST(N'1984-01-09' AS Date), N'3365184458', N'naia_marina.cano@cano.naia_marina@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (475, N'Crespo', N'Ainara Claudia', 22000079, N'F', CAST(N'1984-01-09' AS Date), N'3365662877', N'ainara_claudia.crespo@crespo.ainara_claudia@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (476, N'Aguilar', N'Leyre Laia', 22000080, N'F', CAST(N'1984-01-29' AS Date), N'3367058222', N'leyre_laia.aguilar@aguilar.leyre_laia@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (477, N'Herrero', N'Ángela Helena', 22000081, N'F', CAST(N'1984-01-07' AS Date), N'3369432978', N'Ángela_helena.herrero@herrero.ángela_helena@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (478, N'Montero', N'Lina Olivia', 22000082, N'F', CAST(N'1984-01-28' AS Date), N'3367693715', N'lina_olivia.montero@montero.lina_olivia@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (479, N'Campos', N'Gadiel Bartolomé', 22000083, N'M', CAST(N'1984-01-22' AS Date), N'3363436659', N'gadiel_bartolomé.campos@campos.gadiel_bartolomé@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (480, N'Hernández', N'Laura Candela', 22000084, N'F', CAST(N'1984-01-08' AS Date), N'3366234039', N'laura_candela.hernández@hernández.laura_candela@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (481, N'Benitez', N'Daniel Samuel', 22000085, N'M', CAST(N'1984-01-25' AS Date), N'3368177690', N'daniel_samuel.benitez@benitez.daniel_samuel@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (482, N'Parra', N'Pablo José', 22000086, N'M', CAST(N'1984-01-23' AS Date), N'3367989438', N'pablo_josé.parra@parra.pablo_josé@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (483, N'Ruiz', N'Efraín Renato', 22000087, N'M', CAST(N'1984-01-04' AS Date), N'3366519979', N'efraín_renato.ruiz@ruiz.efraín_renato@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (484, N'Nieto', N'Sara María', 22000088, N'F', CAST(N'1984-01-25' AS Date), N'3369530398', N'sara_maría.nieto@nieto.sara_maría@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (485, N'Arias', N'Eliel Uzías', 22000089, N'M', CAST(N'1984-01-22' AS Date), N'3369683899', N'eliel_uzías.arias@arias.eliel_uzías@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (486, N'Soler', N'Demócrito Darío', 22000090, N'M', CAST(N'1984-01-20' AS Date), N'3367591423', N'demócrito_darío.soler@soler.demócrito_darío@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (487, N'Vázquez', N'Nour Leyre', 22000091, N'F', CAST(N'1984-01-18' AS Date), N'3366030180', N'nour_leyre.vázquez@vázquez.nour_leyre@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (488, N'Santana', N'Lara Candela', 22000092, N'F', CAST(N'1984-01-23' AS Date), N'3363704347', N'lara_candela.santana@santana.lara_candela@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (489, N'Álvarez', N'Félix Elí', 22000093, N'M', CAST(N'1984-01-15' AS Date), N'3369739492', N'félix_elí.Álvarez@álvarez.félix_elí@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (490, N'Velasco', N'Natalia Iria', 22000094, N'F', CAST(N'1984-01-18' AS Date), N'3366134368', N'natalia_iria.velasco@velasco.natalia_iria@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (491, N'Santiago', N'Elia Ainara', 22000095, N'F', CAST(N'1984-01-13' AS Date), N'3365465615', N'elia_ainara.santiago@santiago.elia_ainara@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (492, N'Ferrer', N'Carlota Alba', 22000096, N'F', CAST(N'1984-01-23' AS Date), N'3368681365', N'carlota_alba.ferrer@ferrer.carlota_alba@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (493, N'Santiago', N'Neftalí Eneas', 22000097, N'M', CAST(N'1984-01-20' AS Date), N'3369701523', N'neftalí_eneas.santiago@santiago.neftalí_eneas@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (494, N'Blanco', N' Carlota', 22000098, N'F', CAST(N'1984-01-24' AS Date), N'3365032843', N'_carlota.blanco@blanco._carlota@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (495, N'Flores', N'Triana Marina', 22000099, N'F', CAST(N'1984-01-24' AS Date), N'3363076234', N'triana_marina.flores@flores.triana_marina@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (496, N'Roman', N'Marina Eva', 22500001, N'F', CAST(N'1985-01-07' AS Date), N'3364339606', N'marina_eva.roman@roman.marina_eva@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (497, N'Gil', N'Hugo Uzías', 22500002, N'M', CAST(N'1985-01-09' AS Date), N'3368726410', N'hugo_uzías.gil@gil.hugo_uzías@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (498, N'Benitez', N'Ángela Abril', 22500003, N'F', CAST(N'1985-01-15' AS Date), N'3368264085', N'Ángela_abril.benitez@benitez.ángela_abril@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (499, N'Pascual', N'Aroa Chloe', 22500004, N'F', CAST(N'1985-01-22' AS Date), N'3364214695', N'aroa_chloe.pascual@pascual.aroa_chloe@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (500, N'García', N'Pablo Francisco', 22500005, N'M', CAST(N'1985-01-02' AS Date), N'3367854610', N'pablo_francisco.garcía@garcía.pablo_francisco@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (501, N'Vidal', N'Mateo Guido', 22500006, N'M', CAST(N'1985-01-02' AS Date), N'3363346519', N'mateo_guido.vidal@vidal.mateo_guido@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (502, N'Santos', N'Laura Clara', 22500007, N'F', CAST(N'1985-01-27' AS Date), N'3368671560', N'laura_clara.santos@santos.laura_clara@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (503, N'Flores', N'Félix Uzías', 22500008, N'M', CAST(N'1985-01-28' AS Date), N'3365720543', N'félix_uzías.flores@flores.félix_uzías@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (504, N'Pastor', N'Marta Alicia', 22500009, N'F', CAST(N'1985-01-26' AS Date), N'3367923442', N'marta_alicia.pastor@pastor.marta_alicia@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (505, N'Calvo', N'David Josué', 22500010, N'M', CAST(N'1985-01-05' AS Date), N'3366265007', N'david_josué.calvo@calvo.david_josué@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (506, N'Álvarez', N'Gaspar Félix', 22500011, N'M', CAST(N'1985-01-26' AS Date), N'3368409641', N'gaspar_félix.Álvarez@álvarez.gaspar_félix@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (507, N'Soto', N'Abraham Renato', 22500012, N'M', CAST(N'1985-01-03' AS Date), N'3364568518', N'abraham_renato.soto@soto.abraham_renato@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (508, N'Ruiz', N'Ashur Homero', 22500013, N'M', CAST(N'1985-01-07' AS Date), N'3363188235', N'ashur_homero.ruiz@ruiz.ashur_homero@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (509, N'Prieto', N'Fátima Adara', 22500014, N'F', CAST(N'1985-01-21' AS Date), N'3367343395', N'fátima_adara.prieto@prieto.fátima_adara@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (510, N'Pastor', N'Neftalí Matías', 22500015, N'M', CAST(N'1985-01-01' AS Date), N'3363419844', N'neftalí_matías.pastor@pastor.neftalí_matías@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (511, N'Lozano', N'Eneas Tobías', 22500016, N'M', CAST(N'1985-01-11' AS Date), N'3364949795', N'eneas_tobías.lozano@lozano.eneas_tobías@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (512, N'Santana', N'Olivia Cayetana', 22500017, N'F', CAST(N'1985-01-27' AS Date), N'3364024449', N'olivia_cayetana.santana@santana.olivia_cayetana@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (513, N'Álvarez', N'Labán Isaías', 22500018, N'M', CAST(N'1985-01-20' AS Date), N'3364329976', N'labán_isaías.Álvarez@álvarez.labán_isaías@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (514, N'Reyes', N'Leví Édgar', 22500019, N'M', CAST(N'1985-01-21' AS Date), N'3366488056', N'leví_Édgar.reyes@reyes.leví_édgar@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (515, N'Pérez', N'Candela Fátima', 22500020, N'F', CAST(N'1985-01-20' AS Date), N'3368698371', N'candela_fátima.pérez@pérez.candela_fátima@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (516, N'Peña', N'Cayetana Victoria', 22500021, N'F', CAST(N'1985-01-13' AS Date), N'3366249744', N'cayetana_victoria.peña@peña.cayetana_victoria@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (517, N'Mora', N'Leyre Amira', 22500022, N'F', CAST(N'1985-01-24' AS Date), N'3368678212', N'leyre_amira.mora@mora.leyre_amira@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (518, N'Flores', N'Triana Azahara', 22500023, N'F', CAST(N'1985-01-04' AS Date), N'3368197182', N'triana_azahara.flores@flores.triana_azahara@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (519, N'Carmona', N'Noé Isaías', 22500024, N'M', CAST(N'1985-01-15' AS Date), N'3367048072', N'noé_isaías.carmona@carmona.noé_isaías@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (520, N'Rojas', N'Triana Ana', 22500025, N'F', CAST(N'1985-01-22' AS Date), N'3367462373', N'triana_ana.rojas@rojas.triana_ana@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (521, N'Martín', N'Alejandro Rafael', 22500026, N'M', CAST(N'1985-01-17' AS Date), N'3363777883', N'alejandro_rafael.martín@martín.alejandro_rafael@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (522, N'Duran', N'Uzías Sergio', 22500027, N'M', CAST(N'1985-01-21' AS Date), N'3364235074', N'uzías_sergio.duran@duran.uzías_sergio@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (523, N'Pascual', N'Sofía Cayetana', 22500028, N'F', CAST(N'1985-01-12' AS Date), N'3368555417', N'sofía_cayetana.pascual@pascual.sofía_cayetana@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (524, N'Duran', N'Lola Jimena', 22500029, N'F', CAST(N'1985-01-26' AS Date), N'3363594656', N'lola_jimena.duran@duran.lola_jimena@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (525, N'Soler', N'Adán Neftalí', 22500030, N'M', CAST(N'1985-01-12' AS Date), N'3368374259', N'adán_neftalí.soler@soler.adán_neftalí@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (526, N'Gallardo', N'Aina Candela', 22500031, N'F', CAST(N'1985-01-22' AS Date), N'3366950042', N'aina_candela.gallardo@gallardo.aina_candela@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (527, N'Marin', N'Adara Amira', 22500032, N'F', CAST(N'1985-01-04' AS Date), N'3368472722', N'adara_amira.marin@marin.adara_amira@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (528, N'Vidal', N'Adriana Leire', 22500033, N'F', CAST(N'1985-01-13' AS Date), N'3366716925', N'adriana_leire.vidal@vidal.adriana_leire@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (529, N'Carrasco', N'Efraín Moisés', 22500034, N'M', CAST(N'1985-01-22' AS Date), N'3368887703', N'efraín_moisés.carrasco@carrasco.efraín_moisés@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (530, N'Aguilar', N'Nerea Lina', 22500035, N'F', CAST(N'1985-01-01' AS Date), N'3365803927', N'nerea_lina.aguilar@aguilar.nerea_lina@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (531, N'Bravo', N'Abdiel Francisco', 22500036, N'M', CAST(N'1985-01-30' AS Date), N'3365207732', N'abdiel_francisco.bravo@bravo.abdiel_francisco@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (532, N'Álvarez', N' Valeria', 22500037, N'F', CAST(N'1985-01-07' AS Date), N'3368431471', N'_valeria.Álvarez@álvarez._valeria@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (533, N'Rivera', N'Ariadna Rocío', 22500038, N'F', CAST(N'1985-01-11' AS Date), N'3363747528', N'ariadna_rocío.rivera@rivera.ariadna_rocío@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (534, N'Delgado', N'Abraham Hugo', 22500039, N'M', CAST(N'1985-01-26' AS Date), N'3366546456', N'abraham_hugo.delgado@delgado.abraham_hugo@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (535, N'Benitez', N'Carmen Cloe', 22500040, N'F', CAST(N'1985-01-13' AS Date), N'3367078031', N'carmen_cloe.benitez@benitez.carmen_cloe@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (536, N'Gallardo', N'Jana Irene', 22500041, N'F', CAST(N'1985-01-10' AS Date), N'3368887701', N'jana_irene.gallardo@gallardo.jana_irene@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (537, N'Garrido', N'Édgar Omar', 22500042, N'M', CAST(N'1985-01-26' AS Date), N'3364330965', N'Édgar_omar.garrido@garrido.édgar_omar@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (538, N'Serrano', N'Gaspar Omar', 22500043, N'M', CAST(N'1985-01-04' AS Date), N'3369494711', N'gaspar_omar.serrano@serrano.gaspar_omar@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (539, N'Pastor', N'Lemuel Jared', 22500044, N'M', CAST(N'1985-01-05' AS Date), N'3363655943', N'lemuel_jared.pastor@pastor.lemuel_jared@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (540, N'Vega', N'Bartolomé Guido', 22500045, N'M', CAST(N'1985-01-08' AS Date), N'3368512868', N'bartolomé_guido.vega@vega.bartolomé_guido@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (541, N'Reyes', N'Aurora Andrea', 22500046, N'F', CAST(N'1985-01-04' AS Date), N'3368412142', N'aurora_andrea.reyes@reyes.aurora_andrea@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (542, N'Blanco', N'Diana Lina', 22500047, N'F', CAST(N'1985-01-09' AS Date), N'3364074015', N'diana_lina.blanco@blanco.diana_lina@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (543, N'Calvo', N'Jacob Lemuel', 22500048, N'M', CAST(N'1985-01-21' AS Date), N'3365732688', N'jacob_lemuel.calvo@calvo.jacob_lemuel@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (544, N'Medina', N'Eliseo José', 22500049, N'M', CAST(N'1985-01-18' AS Date), N'3364625394', N'eliseo_josé.medina@medina.eliseo_josé@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (545, N'Ibáñez', N'Irene Alba', 22500050, N'F', CAST(N'1985-01-09' AS Date), N'3366797875', N'irene_alba.ibáñez@ibáñez.irene_alba@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (546, N'Aguilar', N'Ariadna Chloe', 22500051, N'F', CAST(N'1985-01-29' AS Date), N'3366859692', N'ariadna_chloe.aguilar@aguilar.ariadna_chloe@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (547, N'Pascual', N'Renato Matías', 22500052, N'M', CAST(N'1985-01-27' AS Date), N'3366586103', N'renato_matías.pascual@pascual.renato_matías@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (548, N'Ramos', N'Triana Irene', 22500053, N'F', CAST(N'1985-01-20' AS Date), N'3366661327', N'triana_irene.ramos@ramos.triana_irene@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (549, N'Álvarez', N'Mateo Pablo', 22500054, N'M', CAST(N'1985-01-22' AS Date), N'3363200909', N'mateo_pablo.Álvarez@álvarez.mateo_pablo@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (550, N'Ibáñez', N'África Julieta', 22500055, N'F', CAST(N'1985-01-29' AS Date), N'3366373925', N'África_julieta.ibáñez@ibáñez.áfrica_julieta@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (551, N'Iglesias', N'Ashur Jiram', 22500056, N'M', CAST(N'1985-01-21' AS Date), N'3366570443', N'ashur_jiram.iglesias@iglesias.ashur_jiram@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (552, N'Lozano', N'Carmen Noa', 22500057, N'F', CAST(N'1985-01-04' AS Date), N'3363249886', N'carmen_noa.lozano@lozano.carmen_noa@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (553, N'Ibáñez', N'Tobías Isaac', 22500058, N'M', CAST(N'1985-01-28' AS Date), N'3363502890', N'tobías_isaac.ibáñez@ibáñez.tobías_isaac@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (554, N'Vicente', N'Abimael Jeremías', 22500059, N'M', CAST(N'1985-01-15' AS Date), N'3364668163', N'abimael_jeremías.vicente@vicente.abimael_jeremías@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (555, N'Garrido', N'Marta Jimena', 22500060, N'F', CAST(N'1985-01-15' AS Date), N'3363762736', N'marta_jimena.garrido@garrido.marta_jimena@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (556, N'Romero', N'Ariadna Adriana', 22500061, N'F', CAST(N'1985-01-16' AS Date), N'3363694814', N'ariadna_adriana.romero@romero.ariadna_adriana@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (557, N'Sanz', N'Aitana Andrea', 22500062, N'F', CAST(N'1985-01-22' AS Date), N'3367931779', N'aitana_andrea.sanz@sanz.aitana_andrea@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (558, N'Sanz', N'África Elsa', 22500063, N'F', CAST(N'1985-01-04' AS Date), N'3364344477', N'África_elsa.sanz@sanz.áfrica_elsa@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (559, N'Pascual', N'Jimena Gala', 22500064, N'F', CAST(N'1985-01-12' AS Date), N'3369491242', N'jimena_gala.pascual@pascual.jimena_gala@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (560, N'Campos', N'Benjamín Uzías', 22500065, N'M', CAST(N'1985-01-16' AS Date), N'3364867690', N'benjamín_uzías.campos@campos.benjamín_uzías@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (561, N'Rivera', N'Matías Ciro', 22500066, N'M', CAST(N'1985-01-06' AS Date), N'3365165258', N'matías_ciro.rivera@rivera.matías_ciro@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (562, N'Vargas', N'Julieta Sofía', 22500067, N'F', CAST(N'1985-01-25' AS Date), N'3369976299', N'julieta_sofía.vargas@vargas.julieta_sofía@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (563, N'Ferrer', N'Sofía Malak', 22500068, N'F', CAST(N'1985-01-09' AS Date), N'3363353761', N'sofía_malak.ferrer@ferrer.sofía_malak@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (564, N'Vargas', N'Carolina Nour', 22500069, N'F', CAST(N'1985-01-05' AS Date), N'3368577084', N'carolina_nour.vargas@vargas.carolina_nour@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (565, N'Álvarez', N'Ainara ', 22500070, N'F', CAST(N'1985-01-15' AS Date), N'3363533632', N'ainara_.Álvarez@álvarez.ainara_@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (566, N'Serrano', N'Carla Julieta', 22500071, N'F', CAST(N'1985-01-07' AS Date), N'3364501578', N'carla_julieta.serrano@serrano.carla_julieta@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (567, N'Jimenez', N'Lara Aroa', 22500072, N'F', CAST(N'1985-01-18' AS Date), N'3367812277', N'lara_aroa.jimenez@jimenez.lara_aroa@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (568, N'Serrano', N'Lucía Martina', 22500073, N'F', CAST(N'1985-01-19' AS Date), N'3368310944', N'lucía_martina.serrano@serrano.lucía_martina@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (569, N'Cruz', N'Julieta Chloe', 22500074, N'F', CAST(N'1985-01-03' AS Date), N'3366696608', N'julieta_chloe.cruz@cruz.julieta_chloe@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (570, N'Lorenzo', N'Gabriel Aram', 22500075, N'M', CAST(N'1985-01-03' AS Date), N'3366670519', N'gabriel_aram.lorenzo@lorenzo.gabriel_aram@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (571, N'Molina', N'Carla Diana', 22500076, N'F', CAST(N'1985-01-26' AS Date), N'3368030922', N'carla_diana.molina@molina.carla_diana@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (572, N'Fuentes', N'Nerea Jimena', 22500077, N'F', CAST(N'1985-01-22' AS Date), N'3367578069', N'nerea_jimena.fuentes@fuentes.nerea_jimena@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (573, N'Cortés', N'Salomón Joaquín', 22500078, N'M', CAST(N'1985-01-24' AS Date), N'3366995080', N'salomón_joaquín.cortés@cortés.salomón_joaquín@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (574, N'Santana', N'Ángela Abril', 22500079, N'F', CAST(N'1985-01-15' AS Date), N'3365503589', N'Ángela_abril.santana@santana.ángela_abril@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (575, N'Arias', N'Paula Jimena', 22500080, N'F', CAST(N'1985-01-16' AS Date), N'3364838775', N'paula_jimena.arias@arias.paula_jimena@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (576, N'Rodríguez', N'Lucía Julieta', 22500081, N'F', CAST(N'1985-01-15' AS Date), N'3366028518', N'lucía_julieta.rodríguez@rodríguez.lucía_julieta@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (577, N'Gutiérrez', N'Zoe India', 22500082, N'F', CAST(N'1985-01-01' AS Date), N'3366430653', N'zoe_india.gutiérrez@gutiérrez.zoe_india@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (578, N'Lorenzo', N'Jana Helena', 22500083, N'F', CAST(N'1985-01-27' AS Date), N'3369516005', N'jana_helena.lorenzo@lorenzo.jana_helena@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (579, N'Gallardo', N'Claudia Aina', 22500084, N'F', CAST(N'1985-01-18' AS Date), N'3364810658', N'claudia_aina.gallardo@gallardo.claudia_aina@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (580, N'Gil', N'Jana Ana', 22500085, N'F', CAST(N'1985-01-28' AS Date), N'3367326750', N'jana_ana.gil@gil.jana_ana@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (581, N'Morales', N'Ana Marta', 22500086, N'F', CAST(N'1985-01-18' AS Date), N'3368650709', N'ana_marta.morales@morales.ana_marta@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (582, N'Martínez', N'Abril Carolina', 22500087, N'F', CAST(N'1985-01-02' AS Date), N'3364065580', N'abril_carolina.martínez@martínez.abril_carolina@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (583, N'Cano', N'Jimena Valentina', 22500088, N'F', CAST(N'1985-01-01' AS Date), N'3369932898', N'jimena_valentina.cano@cano.jimena_valentina@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (584, N'Díaz', N'Valeria Irene', 22500089, N'F', CAST(N'1985-01-16' AS Date), N'3365301448', N'valeria_irene.díaz@díaz.valeria_irene@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (585, N'Blanco', N'Beltrán Guido', 22500090, N'M', CAST(N'1985-01-28' AS Date), N'3367608139', N'beltrán_guido.blanco@blanco.beltrán_guido@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (586, N'Vega', N'Martina Cloe', 22500091, N'F', CAST(N'1985-01-25' AS Date), N'3369035018', N'martina_cloe.vega@vega.martina_cloe@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (587, N'Lorenzo', N'Set Zacarías', 22500092, N'M', CAST(N'1985-01-14' AS Date), N'3365453226', N'set_zacarías.lorenzo@lorenzo.set_zacarías@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (588, N'Medina', N'Leví Josué', 22500093, N'M', CAST(N'1985-01-08' AS Date), N'3369675027', N'leví_josué.medina@medina.leví_josué@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (589, N'Blanco', N'Guido Sergio', 22500094, N'M', CAST(N'1985-01-20' AS Date), N'3366371779', N'guido_sergio.blanco@blanco.guido_sergio@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (590, N'Muñoz', N'Daniela Claudia', 22500095, N'F', CAST(N'1985-01-20' AS Date), N'3367678058', N'daniela_claudia.muñoz@muñoz.daniela_claudia@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (591, N'Vázquez', N'Saúl Francisco', 22500096, N'M', CAST(N'1985-01-06' AS Date), N'3367000526', N'saúl_francisco.vázquez@vázquez.saúl_francisco@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (592, N'Cruz', N'Gadiel Julio', 22500097, N'M', CAST(N'1985-01-11' AS Date), N'3365381719', N'gadiel_julio.cruz@cruz.gadiel_julio@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (593, N'Parra', N'Isaías Caleb', 22500098, N'M', CAST(N'1985-01-24' AS Date), N'3364474273', N'isaías_caleb.parra@parra.isaías_caleb@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (594, N'Ortega', N'Esteban Ismael', 22500099, N'M', CAST(N'1985-01-13' AS Date), N'3365814639', N'esteban_ismael.ortega@ortega.esteban_ismael@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (595, N'Fernández', N'Isabel Noa', 23000001, N'F', CAST(N'1986-01-26' AS Date), N'3364289891', N'isabel_noa.fernández@fernández.isabel_noa@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (596, N'Molina', N'Homero Leví', 23000002, N'M', CAST(N'1986-01-07' AS Date), N'3365582902', N'homero_leví.molina@molina.homero_leví@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (597, N'Ferrer', N'Martina Jana', 23000003, N'F', CAST(N'1986-01-08' AS Date), N'3368127627', N'martina_jana.ferrer@ferrer.martina_jana@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (598, N'Serrano', N'Acab Adán', 23000004, N'M', CAST(N'1986-01-21' AS Date), N'3363705054', N'acab_adán.serrano@serrano.acab_adán@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (599, N'Montero', N'Bartolomé Demócrito', 23000005, N'M', CAST(N'1986-01-12' AS Date), N'3366595020', N'bartolomé_demócrito.montero@montero.bartolomé_demócrito@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (600, N'Lozano', N'Darío Simón', 23000006, N'M', CAST(N'1986-01-14' AS Date), N'3368923074', N'darío_simón.lozano@lozano.darío_simón@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (601, N'Ortega', N' Alba', 23000007, N'F', CAST(N'1986-01-11' AS Date), N'3369219490', N'_alba.ortega@ortega._alba@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (602, N'Delgado', N'Alejandra Zoe', 23000008, N'F', CAST(N'1986-01-05' AS Date), N'3363270452', N'alejandra_zoe.delgado@delgado.alejandra_zoe@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (603, N'Cruz', N'Cristina Andrea', 23000009, N'F', CAST(N'1986-01-30' AS Date), N'3363293869', N'cristina_andrea.cruz@cruz.cristina_andrea@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (604, N'Fuentes', N'Fátima Manuela', 23000010, N'F', CAST(N'1986-01-29' AS Date), N'3369623809', N'fátima_manuela.fuentes@fuentes.fátima_manuela@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (605, N'Velasco', N'Daniel Benjamín', 23000011, N'M', CAST(N'1986-01-17' AS Date), N'3365478730', N'daniel_benjamín.velasco@velasco.daniel_benjamín@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (606, N'Crespo', N'Simón Benjamín', 23000012, N'M', CAST(N'1986-01-29' AS Date), N'3365511872', N'simón_benjamín.crespo@crespo.simón_benjamín@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (607, N'Santana', N'Irene Victoria', 23000013, N'F', CAST(N'1986-01-22' AS Date), N'3364218943', N'irene_victoria.santana@santana.irene_victoria@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (608, N'Rodríguez', N'Aurora Adara', 23000014, N'F', CAST(N'1986-01-05' AS Date), N'3365004903', N'aurora_adara.rodríguez@rodríguez.aurora_adara@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (609, N'Márquez', N'Caín Jared', 23000015, N'M', CAST(N'1986-01-16' AS Date), N'3364692641', N'caín_jared.márquez@márquez.caín_jared@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (610, N'Serrano', N'Isaías Simón', 23000016, N'M', CAST(N'1986-01-18' AS Date), N'3363266808', N'isaías_simón.serrano@serrano.isaías_simón@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (611, N'Rubio', N' Alma', 23000017, N'F', CAST(N'1986-01-13' AS Date), N'3365365230', N'_alma.rubio@rubio._alma@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (612, N'Crespo', N'Darío José', 23000018, N'M', CAST(N'1986-01-22' AS Date), N'3369646142', N'darío_josé.crespo@crespo.darío_josé@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (613, N'Parra', N'Esteban Pablo', 23000019, N'M', CAST(N'1986-01-26' AS Date), N'3365101981', N'esteban_pablo.parra@parra.esteban_pablo@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (614, N'Soto', N' Triana', 23000020, N'F', CAST(N'1986-01-13' AS Date), N'3367421923', N'_triana.soto@soto._triana@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (615, N'Peña', N'Elsa Inés', 23000021, N'F', CAST(N'1986-01-23' AS Date), N'3363068759', N'elsa_inés.peña@peña.elsa_inés@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (616, N'Herrero', N'Luna Isabel', 23000022, N'F', CAST(N'1986-01-01' AS Date), N'3368062349', N'luna_isabel.herrero@herrero.luna_isabel@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (617, N'León', N'Carlota Inés', 23000023, N'F', CAST(N'1986-01-25' AS Date), N'3368180738', N'carlota_inés.león@león.carlota_inés@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (618, N'Vicente', N'Gala Nerea', 23000024, N'F', CAST(N'1986-01-14' AS Date), N'3365684567', N'gala_nerea.vicente@vicente.gala_nerea@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (619, N'Bravo', N'Nora Carla', 23000025, N'F', CAST(N'1986-01-28' AS Date), N'3367642659', N'nora_carla.bravo@bravo.nora_carla@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (620, N'Carmona', N'Naín Joaquín', 23000026, N'M', CAST(N'1986-01-01' AS Date), N'3368824301', N'naín_joaquín.carmona@carmona.naín_joaquín@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (621, N'Castro', N'Elia Cayetana', 23000027, N'F', CAST(N'1986-01-11' AS Date), N'3367340911', N'elia_cayetana.castro@castro.elia_cayetana@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (622, N'Ortega', N'Bartolomé Jaír de Galaad', 23000028, N'M', CAST(N'1986-01-04' AS Date), N'3369125259', N'bartolomé_jaír_de_galaad.ortega@ortega.bartolomé_jaír_de_galaad@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (623, N'Marin', N'Zacarías Uzías', 23000029, N'M', CAST(N'1986-01-10' AS Date), N'3369232981', N'zacarías_uzías.marin@marin.zacarías_uzías@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (624, N'Soto', N'Aarón Josué', 23000030, N'M', CAST(N'1986-01-04' AS Date), N'3364953847', N'aarón_josué.soto@soto.aarón_josué@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (625, N'Bravo', N'Abimael Adán', 23000031, N'M', CAST(N'1986-01-24' AS Date), N'3367625871', N'abimael_adán.bravo@bravo.abimael_adán@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (626, N'Soler', N'Valentina Eva', 23000032, N'F', CAST(N'1986-01-30' AS Date), N'3369366482', N'valentina_eva.soler@soler.valentina_eva@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (627, N'Sánchez', N'Abdiel Mateo', 23000033, N'M', CAST(N'1986-01-13' AS Date), N'3366436841', N'abdiel_mateo.sánchez@sánchez.abdiel_mateo@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (628, N'Herrero', N'Uzías Rafael', 23000034, N'M', CAST(N'1986-01-27' AS Date), N'3365436805', N'uzías_rafael.herrero@herrero.uzías_rafael@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (629, N'Santana', N'Salomón Esteban', 23000035, N'M', CAST(N'1986-01-02' AS Date), N'3365276487', N'salomón_esteban.santana@santana.salomón_esteban@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (630, N'Vázquez', N'Martina Iris', 23000036, N'F', CAST(N'1986-01-16' AS Date), N'3369322797', N'martina_iris.vázquez@vázquez.martina_iris@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (631, N'Vidal', N'Ana Irene', 23000037, N'F', CAST(N'1986-01-11' AS Date), N'3367799981', N'ana_irene.vidal@vidal.ana_irene@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (632, N'Santana', N'Naín Josué', 23000038, N'M', CAST(N'1986-01-28' AS Date), N'3367565145', N'naín_josué.santana@santana.naín_josué@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (633, N'Diez', N'Marcos Andrés', 23000039, N'M', CAST(N'1986-01-22' AS Date), N'3364693635', N'marcos_andrés.diez@diez.marcos_andrés@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (634, N'Iglesias', N'Aina Irene', 23000040, N'F', CAST(N'1986-01-19' AS Date), N'3368049236', N'aina_irene.iglesias@iglesias.aina_irene@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (635, N'Santiago', N'Eva Leire', 23000041, N'F', CAST(N'1986-01-16' AS Date), N'3364931078', N'eva_leire.santiago@santiago.eva_leire@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (636, N'Pastor', N'Josué Esteban', 23000042, N'M', CAST(N'1986-01-17' AS Date), N'3369476619', N'josué_esteban.pastor@pastor.josué_esteban@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (637, N'Carmona', N'Mateo Rubén', 23000043, N'M', CAST(N'1986-01-03' AS Date), N'3363138975', N'mateo_rubén.carmona@carmona.mateo_rubén@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (638, N'Jimenez', N'Julio Lucas', 23000044, N'M', CAST(N'1986-01-11' AS Date), N'3364519682', N'julio_lucas.jimenez@jimenez.julio_lucas@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (639, N'Pastor', N'Lola Valeria', 23000045, N'F', CAST(N'1986-01-27' AS Date), N'3366662895', N'lola_valeria.pastor@pastor.lola_valeria@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (640, N'Marin', N'Abraham Guido', 23000046, N'M', CAST(N'1986-01-01' AS Date), N'3367437140', N'abraham_guido.marin@marin.abraham_guido@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (641, N'Vargas', N'Eliel Lemuel', 23000047, N'M', CAST(N'1986-01-03' AS Date), N'3365839768', N'eliel_lemuel.vargas@vargas.eliel_lemuel@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (642, N'Iglesias', N'Mara Alma', 23000048, N'F', CAST(N'1986-01-06' AS Date), N'3363094321', N'mara_alma.iglesias@iglesias.mara_alma@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (643, N'Moreno', N'Aram Jeremías', 23000049, N'M', CAST(N'1986-01-18' AS Date), N'3365361862', N'aram_jeremías.moreno@moreno.aram_jeremías@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (644, N'Méndez', N'Juan Elías', 23000050, N'M', CAST(N'1986-01-08' AS Date), N'3367192417', N'juan_elías.méndez@méndez.juan_elías@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (645, N'Arias', N'Jana Valeria', 23000051, N'F', CAST(N'1986-01-05' AS Date), N'3367541851', N'jana_valeria.arias@arias.jana_valeria@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (646, N'Ruiz', N'Macarena Laia', 23000052, N'F', CAST(N'1986-01-21' AS Date), N'3365459152', N'macarena_laia.ruiz@ruiz.macarena_laia@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (647, N'Aguilar', N'Daniel Félix', 23000053, N'M', CAST(N'1986-01-11' AS Date), N'3364801113', N'daniel_félix.aguilar@aguilar.daniel_félix@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (648, N'Martín', N'Clara Ángela', 23000054, N'F', CAST(N'1986-01-18' AS Date), N'3364079157', N'clara_Ángela.martín@martín.clara_ángela@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (649, N'Méndez', N'Lucía Alma', 23000055, N'F', CAST(N'1986-01-26' AS Date), N'3363782327', N'lucía_alma.méndez@méndez.lucía_alma@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (650, N'Medina', N'Bartolomé Benjamín', 23000056, N'M', CAST(N'1986-01-04' AS Date), N'3364890521', N'bartolomé_benjamín.medina@medina.bartolomé_benjamín@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (651, N'Lozano', N'Gabriel Dámaso', 23000057, N'M', CAST(N'1986-01-01' AS Date), N'3367397950', N'gabriel_dámaso.lozano@lozano.gabriel_dámaso@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (652, N'Carrasco', N'Alba Mar', 23000058, N'F', CAST(N'1986-01-30' AS Date), N'3368157333', N'alba_mar.carrasco@carrasco.alba_mar@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (653, N'León', N'Elsa Carolina', 23000059, N'F', CAST(N'1986-01-29' AS Date), N'3368734310', N'elsa_carolina.león@león.elsa_carolina@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (654, N'Cruz', N'Azahara Macarena', 23000060, N'F', CAST(N'1986-01-12' AS Date), N'3366741679', N'azahara_macarena.cruz@cruz.azahara_macarena@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (655, N'Medina', N'Zacarías Saúl', 23000061, N'M', CAST(N'1986-01-23' AS Date), N'3365700824', N'zacarías_saúl.medina@medina.zacarías_saúl@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (656, N'López', N'Blanca Malak', 23000062, N'F', CAST(N'1986-01-04' AS Date), N'3365700874', N'blanca_malak.lópez@lópez.blanca_malak@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (657, N'Blanco', N'Leví Acab', 23000063, N'M', CAST(N'1986-01-01' AS Date), N'3368912155', N'leví_acab.blanco@blanco.leví_acab@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (658, N'Campos', N'Neftalí Lemuel', 23000064, N'M', CAST(N'1986-01-19' AS Date), N'3364616128', N'neftalí_lemuel.campos@campos.neftalí_lemuel@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (659, N'Giménez', N'Beltrán Israel', 23000065, N'M', CAST(N'1986-01-26' AS Date), N'3369087756', N'beltrán_israel.giménez@giménez.beltrán_israel@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (660, N'Domínguez', N'Cayetana África', 23000066, N'F', CAST(N'1986-01-08' AS Date), N'3363623653', N'cayetana_África.domínguez@domínguez.cayetana_áfrica@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (661, N'Molina', N'Simón Mateo', 23000067, N'M', CAST(N'1986-01-11' AS Date), N'3363588329', N'simón_mateo.molina@molina.simón_mateo@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (662, N'Iglesias', N'Nora Andrea', 23000068, N'F', CAST(N'1986-01-12' AS Date), N'3368493838', N'nora_andrea.iglesias@iglesias.nora_andrea@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (663, N'Sanz', N'Felipe Jeremías', 23000069, N'M', CAST(N'1986-01-14' AS Date), N'3369864765', N'felipe_jeremías.sanz@sanz.felipe_jeremías@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (664, N'Lorenzo', N'Abimael Ahzià', 23000070, N'M', CAST(N'1986-01-24' AS Date), N'3363662382', N'abimael_ahzià.lorenzo@lorenzo.abimael_ahzià@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (665, N'Blanco', N'Laia Carmen', 23000071, N'F', CAST(N'1986-01-15' AS Date), N'3363411592', N'laia_carmen.blanco@blanco.laia_carmen@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (666, N'Lozano', N'Saúl Édgar', 23000072, N'M', CAST(N'1986-01-15' AS Date), N'3367936746', N'saúl_Édgar.lozano@lozano.saúl_édgar@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (667, N'Molina', N'Andrea Gala', 23000073, N'F', CAST(N'1986-01-15' AS Date), N'3367970747', N'andrea_gala.molina@molina.andrea_gala@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (668, N'Montero', N'Jonás Zacarías', 23000074, N'M', CAST(N'1986-01-10' AS Date), N'3367543979', N'jonás_zacarías.montero@montero.jonás_zacarías@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (669, N'Arias', N'Martina Iris', 23000075, N'F', CAST(N'1986-01-16' AS Date), N'3365820549', N'martina_iris.arias@arias.martina_iris@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (670, N'Vicente', N'Noé Gabriel', 23000076, N'M', CAST(N'1986-01-20' AS Date), N'3367559495', N'noé_gabriel.vicente@vicente.noé_gabriel@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (671, N'Lozano', N'Ona Clara', 23000077, N'F', CAST(N'1986-01-09' AS Date), N'3365242831', N'ona_clara.lozano@lozano.ona_clara@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (672, N'Castillo', N'Ariadna Macarena', 23000078, N'F', CAST(N'1986-01-12' AS Date), N'3365359254', N'ariadna_macarena.castillo@castillo.ariadna_macarena@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (673, N'Soler', N'Marcos Uzías', 23000079, N'M', CAST(N'1986-01-08' AS Date), N'3365340422', N'marcos_uzías.soler@soler.marcos_uzías@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (674, N'Mora', N'Ciro Benjamín', 23000080, N'M', CAST(N'1986-01-19' AS Date), N'3369556584', N'ciro_benjamín.mora@mora.ciro_benjamín@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (675, N'Herrera', N'Laia Blanca', 23000081, N'F', CAST(N'1986-01-28' AS Date), N'3366746665', N'laia_blanca.herrera@herrera.laia_blanca@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (676, N'Guerrero', N'Ainara Aitana', 23000082, N'F', CAST(N'1986-01-27' AS Date), N'3369733217', N'ainara_aitana.guerrero@guerrero.ainara_aitana@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (677, N'Arias', N'Felipe Sergio', 23000083, N'M', CAST(N'1986-01-24' AS Date), N'3363145741', N'felipe_sergio.arias@arias.felipe_sergio@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (678, N'González', N'Édgar Herodes', 23000084, N'M', CAST(N'1986-01-15' AS Date), N'3369901133', N'Édgar_herodes.gonzález@gonzález.édgar_herodes@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (679, N'Guerrero', N'Lina Leyre', 23000085, N'F', CAST(N'1986-01-15' AS Date), N'3367229922', N'lina_leyre.guerrero@guerrero.lina_leyre@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (680, N'Gómez', N'Gadiel Germán', 23000086, N'M', CAST(N'1986-01-25' AS Date), N'3368685816', N'gadiel_germán.gómez@gómez.gadiel_germán@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (681, N'Gallego', N'Alicia Abril', 23000087, N'F', CAST(N'1986-01-24' AS Date), N'3365835258', N'alicia_abril.gallego@gallego.alicia_abril@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (682, N'Pastor', N'Lucía Marina', 23000088, N'F', CAST(N'1986-01-07' AS Date), N'3364139055', N'lucía_marina.pastor@pastor.lucía_marina@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (683, N'Gutiérrez', N'Irene Iris', 23000089, N'F', CAST(N'1986-01-19' AS Date), N'3365847481', N'irene_iris.gutiérrez@gutiérrez.irene_iris@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (684, N'Santiago', N'Andrea Ainara', 23000090, N'F', CAST(N'1986-01-07' AS Date), N'3369694334', N'andrea_ainara.santiago@santiago.andrea_ainara@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (685, N'Gallego', N'Paula Cristina', 23000091, N'F', CAST(N'1986-01-24' AS Date), N'3365267262', N'paula_cristina.gallego@gallego.paula_cristina@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (686, N'Vega', N'Moisés Lucas', 23000092, N'M', CAST(N'1986-01-20' AS Date), N'3365501311', N'moisés_lucas.vega@vega.moisés_lucas@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (687, N'Ortiz', N'Juan Andrés', 23000093, N'M', CAST(N'1986-01-02' AS Date), N'3367494393', N'juan_andrés.ortiz@ortiz.juan_andrés@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (688, N'Méndez', N'Édgar Jacob', 23000094, N'M', CAST(N'1986-01-06' AS Date), N'3366916676', N'Édgar_jacob.méndez@méndez.édgar_jacob@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (689, N'Parra', N'Gala Amaia', 23000095, N'F', CAST(N'1986-01-10' AS Date), N'3366177177', N'gala_amaia.parra@parra.gala_amaia@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (690, N'Mora', N'Emma Iris', 23000096, N'F', CAST(N'1986-01-27' AS Date), N'3368697678', N'emma_iris.mora@mora.emma_iris@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (691, N'Jimenez', N'Fabián Israel', 23000097, N'M', CAST(N'1986-01-25' AS Date), N'3364293661', N'fabián_israel.jimenez@jimenez.fabián_israel@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (692, N'Cruz', N'Gala Yasmín', 23000098, N'F', CAST(N'1986-01-14' AS Date), N'3367001732', N'gala_yasmín.cruz@cruz.gala_yasmín@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (693, N'Gallego', N'Julio Matías', 23000099, N'M', CAST(N'1986-01-01' AS Date), N'3369142638', N'julio_matías.gallego@gallego.julio_matías@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (694, N'Velasco', N'Abel Neftalí', 23500001, N'M', CAST(N'1987-01-11' AS Date), N'3365398668', N'abel_neftalí.velasco@velasco.abel_neftalí@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (695, N'Gil', N'Labán Baltasar', 23500002, N'M', CAST(N'1987-01-14' AS Date), N'3367323427', N'labán_baltasar.gil@gil.labán_baltasar@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (696, N'Torres', N'Jared Gaspar', 23500003, N'M', CAST(N'1987-01-19' AS Date), N'3363756001', N'jared_gaspar.torres@torres.jared_gaspar@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (697, N'Romero', N'Jiram Aarón', 23500004, N'M', CAST(N'1987-01-14' AS Date), N'3369817942', N'jiram_aarón.romero@romero.jiram_aarón@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (698, N'Sáez', N'Ona Mia', 23500005, N'F', CAST(N'1987-01-03' AS Date), N'3367955157', N'ona_mia.sáez@sáez.ona_mia@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (699, N'Calvo', N'Alicia Vera', 23500006, N'F', CAST(N'1987-01-21' AS Date), N'3367306879', N'alicia_vera.calvo@calvo.alicia_vera@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (700, N'Muñoz', N'Mateo Marcos', 23500007, N'M', CAST(N'1987-01-21' AS Date), N'3364508389', N'mateo_marcos.muñoz@muñoz.mateo_marcos@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (701, N'Prieto', N'Elia Laura', 23500008, N'F', CAST(N'1987-01-21' AS Date), N'3366117089', N'elia_laura.prieto@prieto.elia_laura@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (702, N'Hernández', N'Isaías Salomón', 23500009, N'M', CAST(N'1987-01-24' AS Date), N'3363358356', N'isaías_salomón.hernández@hernández.isaías_salomón@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (703, N'Ferrer', N'Édgar Omar', 23500010, N'M', CAST(N'1987-01-30' AS Date), N'3369137808', N'Édgar_omar.ferrer@ferrer.édgar_omar@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (704, N'Morales', N'Arlet Noa', 23500011, N'F', CAST(N'1987-01-19' AS Date), N'3363784723', N'arlet_noa.morales@morales.arlet_noa@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (705, N'Romero', N'Emma Naia', 23500012, N'F', CAST(N'1987-01-15' AS Date), N'3366265262', N'emma_naia.romero@romero.emma_naia@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (706, N'Cano', N'Marduk Baltasar', 23500013, N'M', CAST(N'1987-01-02' AS Date), N'3366547419', N'marduk_baltasar.cano@cano.marduk_baltasar@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (707, N'Martín', N'Elías Acab', 23500014, N'M', CAST(N'1987-01-01' AS Date), N'3365860568', N'elías_acab.martín@martín.elías_acab@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (708, N'Gómez', N'Josué Germán', 23500015, N'M', CAST(N'1987-01-29' AS Date), N'3369124587', N'josué_germán.gómez@gómez.josué_germán@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (709, N'Sáez', N'Blanca Irene', 23500016, N'F', CAST(N'1987-01-28' AS Date), N'3369191395', N'blanca_irene.sáez@sáez.blanca_irene@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (710, N'Muñoz', N'Vera Mar', 23500017, N'F', CAST(N'1987-01-02' AS Date), N'3369276955', N'vera_mar.muñoz@muñoz.vera_mar@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (711, N'Herrero', N'Bartolomé Isaac', 23500018, N'M', CAST(N'1987-01-23' AS Date), N'3365700078', N'bartolomé_isaac.herrero@herrero.bartolomé_isaac@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (712, N'Montero', N'Isabella Arlet', 23500019, N'F', CAST(N'1987-01-14' AS Date), N'3366783504', N'isabella_arlet.montero@montero.isabella_arlet@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (713, N'Herrera', N'Labán Jaír de Galaad', 23500020, N'M', CAST(N'1987-01-12' AS Date), N'3365596674', N'labán_jaír_de_galaad.herrera@herrera.labán_jaír_de_galaad@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (714, N'Rojas', N'Gaspar Felipe', 23500021, N'M', CAST(N'1987-01-22' AS Date), N'3367060254', N'gaspar_felipe.rojas@rojas.gaspar_felipe@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (715, N'Lozano', N'Marta Jimena', 23500022, N'F', CAST(N'1987-01-28' AS Date), N'3367354790', N'marta_jimena.lozano@lozano.marta_jimena@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (716, N'Montero', N'Sofía Ona', 23500023, N'F', CAST(N'1987-01-30' AS Date), N'3366915477', N'sofía_ona.montero@montero.sofía_ona@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (717, N'Rodríguez', N'Sofía Leyre', 23500024, N'F', CAST(N'1987-01-04' AS Date), N'3367885613', N'sofía_leyre.rodríguez@rodríguez.sofía_leyre@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (718, N'Lozano', N'Leyre Marina', 23500025, N'F', CAST(N'1987-01-01' AS Date), N'3368863066', N'leyre_marina.lozano@lozano.leyre_marina@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (719, N'Gil', N'Alejandra Manuela', 23500026, N'F', CAST(N'1987-01-06' AS Date), N'3367011441', N'alejandra_manuela.gil@gil.alejandra_manuela@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (720, N'Domínguez', N'Valentina Paula', 23500027, N'F', CAST(N'1987-01-12' AS Date), N'3366776529', N'valentina_paula.domínguez@domínguez.valentina_paula@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (721, N'Giménez', N'Aitana Blanca', 23500028, N'F', CAST(N'1987-01-12' AS Date), N'3364397384', N'aitana_blanca.giménez@giménez.aitana_blanca@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (722, N'León', N'Abril Valentina', 23500029, N'F', CAST(N'1987-01-03' AS Date), N'3365872492', N'abril_valentina.león@león.abril_valentina@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (723, N'Fernández', N'Marduk Naín', 23500030, N'M', CAST(N'1987-01-18' AS Date), N'3368493877', N'marduk_naín.fernández@fernández.marduk_naín@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (724, N'Parra', N'Lina Nour', 23500031, N'F', CAST(N'1987-01-14' AS Date), N'3366677818', N'lina_nour.parra@parra.lina_nour@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (725, N'Garrido', N'Esteban Isaac', 23500032, N'M', CAST(N'1987-01-24' AS Date), N'3366870274', N'esteban_isaac.garrido@garrido.esteban_isaac@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (726, N'Moreno', N'Aina Elia', 23500033, N'F', CAST(N'1987-01-28' AS Date), N'3369901810', N'aina_elia.moreno@moreno.aina_elia@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (727, N'Jimenez', N'Sergio Adán', 23500034, N'M', CAST(N'1987-01-24' AS Date), N'3364083559', N'sergio_adán.jimenez@jimenez.sergio_adán@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (728, N'Martínez', N'Aitana Arlet', 23500035, N'F', CAST(N'1987-01-22' AS Date), N'3365898270', N'aitana_arlet.martínez@martínez.aitana_arlet@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (729, N'Marin', N'Francisco Abimael', 23500036, N'M', CAST(N'1987-01-21' AS Date), N'3367900628', N'francisco_abimael.marin@marin.francisco_abimael@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (730, N'Hidalgo', N'Nahia Vega', 23500037, N'F', CAST(N'1987-01-03' AS Date), N'3364856119', N'nahia_vega.hidalgo@hidalgo.nahia_vega@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (731, N'Vidal', N'Rubén Daniel', 23500038, N'M', CAST(N'1987-01-19' AS Date), N'3364363388', N'rubén_daniel.vidal@vidal.rubén_daniel@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (732, N'Moya', N'Lola Lara', 23500039, N'F', CAST(N'1987-01-14' AS Date), N'3363130623', N'lola_lara.moya@moya.lola_lara@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (733, N'Benitez', N'Ariadna Lucía', 23500040, N'F', CAST(N'1987-01-16' AS Date), N'3366434577', N'ariadna_lucía.benitez@benitez.ariadna_lucía@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (734, N'Vicente', N'Iria Martina', 23500041, N'F', CAST(N'1987-01-18' AS Date), N'3363630224', N'iria_martina.vicente@vicente.iria_martina@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (735, N'Mora', N'Elías Gadiel', 23500042, N'M', CAST(N'1987-01-24' AS Date), N'3367991357', N'elías_gadiel.mora@mora.elías_gadiel@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (736, N'Pascual', N'Homero Miguel', 23500043, N'M', CAST(N'1987-01-04' AS Date), N'3363732348', N'homero_miguel.pascual@pascual.homero_miguel@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (737, N'Cortés', N'Ashur Saúl', 23500044, N'M', CAST(N'1987-01-29' AS Date), N'3366253136', N'ashur_saúl.cortés@cortés.ashur_saúl@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (738, N'Hernández', N'Jeremías Efraín', 23500045, N'M', CAST(N'1987-01-17' AS Date), N'3366596258', N'jeremías_efraín.hernández@hernández.jeremías_efraín@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (739, N'Diez', N'Labán Matías', 23500046, N'M', CAST(N'1987-01-18' AS Date), N'3369152161', N'labán_matías.diez@diez.labán_matías@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (740, N'Calvo', N'Rafael Zacarías', 23500047, N'M', CAST(N'1987-01-29' AS Date), N'3366704870', N'rafael_zacarías.calvo@calvo.rafael_zacarías@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (741, N'Rojas', N'Leví Omar', 23500048, N'M', CAST(N'1987-01-01' AS Date), N'3364841398', N'leví_omar.rojas@rojas.leví_omar@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (742, N'González', N'Jairo Ciro', 23500049, N'M', CAST(N'1987-01-21' AS Date), N'3365174129', N'jairo_ciro.gonzález@gonzález.jairo_ciro@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (743, N'Castillo', N'Sergio Elí', 23500050, N'M', CAST(N'1987-01-02' AS Date), N'3369430979', N'sergio_elí.castillo@castillo.sergio_elí@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (744, N'Sánchez', N'Agustín Alejandro', 23500051, N'M', CAST(N'1987-01-03' AS Date), N'3367302160', N'agustín_alejandro.sánchez@sánchez.agustín_alejandro@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (745, N'Campos', N'Cayetana Carmen', 23500052, N'F', CAST(N'1987-01-03' AS Date), N'3368831132', N'cayetana_carmen.campos@campos.cayetana_carmen@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (746, N'Vargas', N'Noa Lia', 23500053, N'F', CAST(N'1987-01-13' AS Date), N'3367207619', N'noa_lia.vargas@vargas.noa_lia@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (747, N'Medina', N'Abdiel Nicolás', 23500054, N'M', CAST(N'1987-01-07' AS Date), N'3364215241', N'abdiel_nicolás.medina@medina.abdiel_nicolás@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (748, N'Navarro', N'Leyre Adriana', 23500055, N'F', CAST(N'1987-01-25' AS Date), N'3365731893', N'leyre_adriana.navarro@navarro.leyre_adriana@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (749, N'Rojas', N'Jaír de Galaad Isaac', 23500056, N'M', CAST(N'1987-01-21' AS Date), N'3369478691', N'jaír_de_galaad_isaac.rojas@rojas.jaír_de_galaad_isaac@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (750, N'Molina', N'Mateo Neftalí', 23500057, N'M', CAST(N'1987-01-02' AS Date), N'3367543085', N'mateo_neftalí.molina@molina.mateo_neftalí@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (751, N'Ferrer', N'Hugo Aram', 23500058, N'M', CAST(N'1987-01-17' AS Date), N'3366129093', N'hugo_aram.ferrer@ferrer.hugo_aram@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (752, N'Nuñez', N'Noa Sofía', 23500059, N'F', CAST(N'1987-01-30' AS Date), N'3368125762', N'noa_sofía.nuñez@nuñez.noa_sofía@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (753, N'Ortiz', N'Ismael Adán', 23500060, N'M', CAST(N'1987-01-18' AS Date), N'3368839056', N'ismael_adán.ortiz@ortiz.ismael_adán@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (754, N'Aguilar', N'Leví Pablo', 23500061, N'M', CAST(N'1987-01-15' AS Date), N'3365183443', N'leví_pablo.aguilar@aguilar.leví_pablo@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (755, N'Diez', N'Lia Celia', 23500062, N'F', CAST(N'1987-01-10' AS Date), N'3363238224', N'lia_celia.diez@diez.lia_celia@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (756, N'Martín', N'Abel Aram', 23500063, N'M', CAST(N'1987-01-05' AS Date), N'3367087101', N'abel_aram.martín@martín.abel_aram@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (757, N'Vargas', N'Jesús Sergio', 23500064, N'M', CAST(N'1987-01-07' AS Date), N'3365248564', N'jesús_sergio.vargas@vargas.jesús_sergio@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (758, N'Nieto', N'Olivia Abril', 23500065, N'F', CAST(N'1987-01-21' AS Date), N'3364502784', N'olivia_abril.nieto@nieto.olivia_abril@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (759, N'Castro', N'Azahara Helena', 23500066, N'F', CAST(N'1987-01-24' AS Date), N'3369214601', N'azahara_helena.castro@castro.azahara_helena@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (760, N'Medina', N'Valeria Ona', 23500067, N'F', CAST(N'1987-01-10' AS Date), N'3369689739', N'valeria_ona.medina@medina.valeria_ona@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (761, N'Carrasco', N'Irene Cristina', 23500068, N'F', CAST(N'1987-01-09' AS Date), N'3365265379', N'irene_cristina.carrasco@carrasco.irene_cristina@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (762, N'Nieto', N'Felipe Elí', 23500069, N'M', CAST(N'1987-01-15' AS Date), N'3364253893', N'felipe_elí.nieto@nieto.felipe_elí@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (763, N'Iglesias', N'Agustín Lemuel', 23500070, N'M', CAST(N'1987-01-03' AS Date), N'3365949317', N'agustín_lemuel.iglesias@iglesias.agustín_lemuel@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (764, N'Gutiérrez', N'Abraham Caleb', 23500071, N'M', CAST(N'1987-01-04' AS Date), N'3363893405', N'abraham_caleb.gutiérrez@gutiérrez.abraham_caleb@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (765, N'Hernández', N'Lola Gala', 23500072, N'F', CAST(N'1987-01-21' AS Date), N'3368879090', N'lola_gala.hernández@hernández.lola_gala@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (766, N'Nuñez', N'Tobías Ismael', 23500073, N'M', CAST(N'1987-01-16' AS Date), N'3369726549', N'tobías_ismael.nuñez@nuñez.tobías_ismael@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (767, N'Rodríguez', N'Esteban Mateo', 23500074, N'M', CAST(N'1987-01-01' AS Date), N'3369173168', N'esteban_mateo.rodríguez@rodríguez.esteban_mateo@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (768, N'Diez', N'Carmen Vega', 23500075, N'F', CAST(N'1987-01-20' AS Date), N'3368852737', N'carmen_vega.diez@diez.carmen_vega@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (769, N'Fuentes', N'Fátima Aroa', 23500076, N'F', CAST(N'1987-01-09' AS Date), N'3367815788', N'fátima_aroa.fuentes@fuentes.fátima_aroa@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (770, N'Roman', N'Abril Elia', 23500077, N'F', CAST(N'1987-01-21' AS Date), N'3366668617', N'abril_elia.roman@roman.abril_elia@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (771, N'Romero', N'Naia Marina', 23500078, N'F', CAST(N'1987-01-03' AS Date), N'3368120533', N'naia_marina.romero@romero.naia_marina@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (772, N'Gallego', N'Jairo Caín', 23500079, N'M', CAST(N'1987-01-23' AS Date), N'3369340708', N'jairo_caín.gallego@gallego.jairo_caín@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (773, N'Cortés', N'Gabriela Lia', 23500080, N'F', CAST(N'1987-01-13' AS Date), N'3366204852', N'gabriela_lia.cortés@cortés.gabriela_lia@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (774, N'García', N'Eneas José', 23500081, N'M', CAST(N'1987-01-29' AS Date), N'3366854610', N'eneas_josé.garcía@garcía.eneas_josé@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (775, N'López', N'Amaia Victoria', 23500082, N'F', CAST(N'1987-01-11' AS Date), N'3369907351', N'amaia_victoria.lópez@lópez.amaia_victoria@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (776, N'Herrero', N'Celia Diana', 23500083, N'F', CAST(N'1987-01-05' AS Date), N'3363445928', N'celia_diana.herrero@herrero.celia_diana@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (777, N'Pastor', N'Fabián Juan', 23500084, N'M', CAST(N'1987-01-02' AS Date), N'3366664319', N'fabián_juan.pastor@pastor.fabián_juan@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (778, N'Peña', N'Neftalí Acab', 23500085, N'M', CAST(N'1987-01-20' AS Date), N'3367068942', N'neftalí_acab.peña@peña.neftalí_acab@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (779, N'García', N'Julia Victoria', 23500086, N'F', CAST(N'1987-01-17' AS Date), N'3364202387', N'julia_victoria.garcía@garcía.julia_victoria@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (780, N'Cano', N'Eliel Mateo', 23500087, N'M', CAST(N'1987-01-04' AS Date), N'3369950029', N'eliel_mateo.cano@cano.eliel_mateo@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (781, N'Sánchez', N'Bartolomé Esteban', 23500088, N'M', CAST(N'1987-01-07' AS Date), N'3364661690', N'bartolomé_esteban.sánchez@sánchez.bartolomé_esteban@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (782, N'Garrido', N'Samuel Dámaso', 23500089, N'M', CAST(N'1987-01-03' AS Date), N'3368464157', N'samuel_dámaso.garrido@garrido.samuel_dámaso@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (783, N'Montero', N'Isaías Gabriel', 23500090, N'M', CAST(N'1987-01-15' AS Date), N'3367708247', N'isaías_gabriel.montero@montero.isaías_gabriel@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (784, N'Mora', N'Nuria Clara', 23500091, N'F', CAST(N'1987-01-24' AS Date), N'3367728239', N'nuria_clara.mora@mora.nuria_clara@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (785, N'Álvarez', N'Jared Efraín', 23500092, N'M', CAST(N'1987-01-21' AS Date), N'3363828054', N'jared_efraín.Álvarez@álvarez.jared_efraín@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (786, N'Cano', N'Jimena Triana', 23500093, N'F', CAST(N'1987-01-05' AS Date), N'3367586248', N'jimena_triana.cano@cano.jimena_triana@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (787, N'Santana', N'Naín Simón', 23500094, N'M', CAST(N'1987-01-09' AS Date), N'3369342127', N'naín_simón.santana@santana.naín_simón@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (788, N'Hidalgo', N'Aina Carla', 23500095, N'F', CAST(N'1987-01-19' AS Date), N'3368880927', N'aina_carla.hidalgo@hidalgo.aina_carla@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (789, N'Lozano', N'Valentina Carolina', 23500096, N'F', CAST(N'1987-01-30' AS Date), N'3365569265', N'valentina_carolina.lozano@lozano.valentina_carolina@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (790, N'Ramírez', N'Celia Naia', 23500097, N'F', CAST(N'1987-01-26' AS Date), N'3364938588', N'celia_naia.ramírez@ramírez.celia_naia@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (791, N'Marin', N'Neftalí Julio', 23500098, N'M', CAST(N'1987-01-11' AS Date), N'3363957163', N'neftalí_julio.marin@marin.neftalí_julio@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (792, N'Díaz', N'Aurora Lucía', 23500099, N'F', CAST(N'1987-01-23' AS Date), N'3368179140', N'aurora_lucía.díaz@díaz.aurora_lucía@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (793, N'Márquez', N'Vega Eva', 24000001, N'F', CAST(N'1988-01-07' AS Date), N'3364908250', N'vega_eva.márquez@márquez.vega_eva@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (794, N'Pascual', N'Fátima Diana', 24000002, N'F', CAST(N'1988-01-12' AS Date), N'3365265761', N'fátima_diana.pascual@pascual.fátima_diana@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (795, N'Sánchez', N'Elena Isabel', 24000003, N'F', CAST(N'1988-01-03' AS Date), N'3367712337', N'elena_isabel.sánchez@sánchez.elena_isabel@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (796, N'Cabrera', N'Aurora Zoe', 24000004, N'F', CAST(N'1988-01-22' AS Date), N'3368030752', N'aurora_zoe.cabrera@cabrera.aurora_zoe@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (797, N'Bravo', N'Vera Laura', 24000005, N'F', CAST(N'1988-01-17' AS Date), N'3367848584', N'vera_laura.bravo@bravo.vera_laura@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (798, N'Vázquez', N'Mara Ainhoa', 24000006, N'F', CAST(N'1988-01-17' AS Date), N'3364005849', N'mara_ainhoa.vázquez@vázquez.mara_ainhoa@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (799, N'Gutiérrez', N'Lia Blanca', 24000007, N'F', CAST(N'1988-01-16' AS Date), N'3364568236', N'lia_blanca.gutiérrez@gutiérrez.lia_blanca@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (800, N'León', N'Ainhoa Mar', 24000008, N'F', CAST(N'1988-01-19' AS Date), N'3367659530', N'ainhoa_mar.león@león.ainhoa_mar@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (801, N'León', N'Salomón Agustín', 24000009, N'M', CAST(N'1988-01-02' AS Date), N'3365890919', N'salomón_agustín.león@león.salomón_agustín@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (802, N'Alonso', N'Gala Valeria', 24000010, N'F', CAST(N'1988-01-29' AS Date), N'3367345240', N'gala_valeria.alonso@alonso.gala_valeria@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (803, N'Ferrer', N'Martina Julia', 24000011, N'F', CAST(N'1988-01-22' AS Date), N'3363129031', N'martina_julia.ferrer@ferrer.martina_julia@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (804, N'Soto', N'Amaia Gala', 24000012, N'F', CAST(N'1988-01-19' AS Date), N'3368150133', N'amaia_gala.soto@soto.amaia_gala@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (805, N'Gómez', N'Abimael Hugo', 24000013, N'M', CAST(N'1988-01-03' AS Date), N'3363085301', N'abimael_hugo.gómez@gómez.abimael_hugo@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (806, N'Castillo', N'Beltrán Francisco', 24000014, N'M', CAST(N'1988-01-23' AS Date), N'3368529013', N'beltrán_francisco.castillo@castillo.beltrán_francisco@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (807, N'Crespo', N'Jacob Daniel', 24000015, N'M', CAST(N'1988-01-23' AS Date), N'3369095004', N'jacob_daniel.crespo@crespo.jacob_daniel@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (808, N'Gil', N'Carmen Clara', 24000016, N'F', CAST(N'1988-01-09' AS Date), N'3368897279', N'carmen_clara.gil@gil.carmen_clara@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (809, N'Rivera', N'Helena Ainara', 24000017, N'F', CAST(N'1988-01-18' AS Date), N'3368214566', N'helena_ainara.rivera@rivera.helena_ainara@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (810, N'Garrido', N'Irene Clara', 24000018, N'F', CAST(N'1988-01-16' AS Date), N'3366312073', N'irene_clara.garrido@garrido.irene_clara@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (811, N'Sanz', N'Claudia Adara', 24000019, N'F', CAST(N'1988-01-25' AS Date), N'3363299156', N'claudia_adara.sanz@sanz.claudia_adara@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (812, N'Reyes', N'Marduk Beltrán', 24000020, N'M', CAST(N'1988-01-11' AS Date), N'3364293538', N'marduk_beltrán.reyes@reyes.marduk_beltrán@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (813, N'Muñoz', N'Juan Jonás', 24000021, N'M', CAST(N'1988-01-25' AS Date), N'3363829140', N'juan_jonás.muñoz@muñoz.juan_jonás@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (814, N'Cortés', N'Chloe Sara', 24000022, N'F', CAST(N'1988-01-01' AS Date), N'3365606286', N'chloe_sara.cortés@cortés.chloe_sara@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (815, N'Rivera', N'Chloe Irene', 24000023, N'F', CAST(N'1988-01-14' AS Date), N'3368866612', N'chloe_irene.rivera@rivera.chloe_irene@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (816, N'Iglesias', N'Neftalí Ahzià', 24000024, N'M', CAST(N'1988-01-11' AS Date), N'3364339168', N'neftalí_ahzià.iglesias@iglesias.neftalí_ahzià@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (817, N'León', N'Nuria Laia', 24000025, N'F', CAST(N'1988-01-13' AS Date), N'3363070638', N'nuria_laia.león@león.nuria_laia@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (818, N'Martínez', N'Julia Laia', 24000026, N'F', CAST(N'1988-01-18' AS Date), N'3368231517', N'julia_laia.martínez@martínez.julia_laia@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (819, N'Gutiérrez', N'África Naia', 24000027, N'F', CAST(N'1988-01-02' AS Date), N'3368439871', N'África_naia.gutiérrez@gutiérrez.áfrica_naia@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (820, N'Fuentes', N'Ismael Zacarías', 24000028, N'M', CAST(N'1988-01-13' AS Date), N'3363339190', N'ismael_zacarías.fuentes@fuentes.ismael_zacarías@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (821, N'Hernández', N'Simón Jeremías', 24000029, N'M', CAST(N'1988-01-11' AS Date), N'3369284312', N'simón_jeremías.hernández@hernández.simón_jeremías@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (822, N'Gallego', N'Hugo Joaquín', 24000030, N'M', CAST(N'1988-01-13' AS Date), N'3364136173', N'hugo_joaquín.gallego@gallego.hugo_joaquín@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (823, N'Carmona', N'Labán Mateo', 24000031, N'M', CAST(N'1988-01-06' AS Date), N'3367970761', N'labán_mateo.carmona@carmona.labán_mateo@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (824, N'León', N'Jimena Alejandra', 24000032, N'F', CAST(N'1988-01-04' AS Date), N'3367258107', N'jimena_alejandra.león@león.jimena_alejandra@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (825, N'Díaz', N'Clara Emma', 24000033, N'F', CAST(N'1988-01-07' AS Date), N'3364820483', N'clara_emma.díaz@díaz.clara_emma@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (826, N'Prieto', N'Cloe Iris', 24000034, N'F', CAST(N'1988-01-21' AS Date), N'3366527301', N'cloe_iris.prieto@prieto.cloe_iris@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (827, N'Flores', N'Yasmín Carolina', 24000035, N'F', CAST(N'1988-01-11' AS Date), N'3368579243', N'yasmín_carolina.flores@flores.yasmín_carolina@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (828, N'Cruz', N'Lucía Nora', 24000036, N'F', CAST(N'1988-01-09' AS Date), N'3363803065', N'lucía_nora.cruz@cruz.lucía_nora@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (829, N'Gil', N'Claudia Rocío', 24000037, N'F', CAST(N'1988-01-29' AS Date), N'3367398027', N'claudia_rocío.gil@gil.claudia_rocío@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (830, N'Santiago', N'Candela Iria', 24000038, N'F', CAST(N'1988-01-29' AS Date), N'3368224148', N'candela_iria.santiago@santiago.candela_iria@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (831, N'Soler', N'Amira Lucía', 24000039, N'F', CAST(N'1988-01-27' AS Date), N'3365684482', N'amira_lucía.soler@soler.amira_lucía@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (832, N'Navarro', N'Iris Mara', 24000040, N'F', CAST(N'1988-01-14' AS Date), N'3365566492', N'iris_mara.navarro@navarro.iris_mara@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (833, N'Díaz', N'Guido Daniel', 24000041, N'M', CAST(N'1988-01-26' AS Date), N'3368386350', N'guido_daniel.díaz@díaz.guido_daniel@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (834, N'Alonso', N'Nicolás Andrés', 24000042, N'M', CAST(N'1988-01-21' AS Date), N'3364431188', N'nicolás_andrés.alonso@alonso.nicolás_andrés@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (835, N'Montero', N'Iris Lina', 24000043, N'F', CAST(N'1988-01-24' AS Date), N'3369490150', N'iris_lina.montero@montero.iris_lina@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (836, N'Herrero', N'Isaías Fabián', 24000044, N'M', CAST(N'1988-01-11' AS Date), N'3366505033', N'isaías_fabián.herrero@herrero.isaías_fabián@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (837, N'Ramos', N'Iris Alba', 24000045, N'F', CAST(N'1988-01-22' AS Date), N'3366680136', N'iris_alba.ramos@ramos.iris_alba@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (838, N'Gallardo', N'Luna Laia', 24000046, N'F', CAST(N'1988-01-30' AS Date), N'3365966300', N'luna_laia.gallardo@gallardo.luna_laia@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (839, N'Delgado', N'Naia Cristina', 24000047, N'F', CAST(N'1988-01-04' AS Date), N'3365137580', N'naia_cristina.delgado@delgado.naia_cristina@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (840, N'Pérez', N'Manuela Nora', 24000048, N'F', CAST(N'1988-01-26' AS Date), N'3365907791', N'manuela_nora.pérez@pérez.manuela_nora@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (841, N'González', N'Omar Jacob', 24000049, N'M', CAST(N'1988-01-10' AS Date), N'3369200691', N'omar_jacob.gonzález@gonzález.omar_jacob@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (842, N'Suárez', N'Abraham Gaspar', 24000050, N'M', CAST(N'1988-01-14' AS Date), N'3366391497', N'abraham_gaspar.suárez@suárez.abraham_gaspar@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (843, N'Cruz', N'Benjamín Lucas', 24000051, N'M', CAST(N'1988-01-28' AS Date), N'3364365334', N'benjamín_lucas.cruz@cruz.benjamín_lucas@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (844, N'Herrera', N'Joaquín Marduk', 24000052, N'M', CAST(N'1988-01-17' AS Date), N'3369314411', N'joaquín_marduk.herrera@herrera.joaquín_marduk@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (845, N'León', N'Lara Victoria', 24000053, N'F', CAST(N'1988-01-06' AS Date), N'3366258593', N'lara_victoria.león@león.lara_victoria@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (846, N'Herrero', N'Sofía Claudia', 24000054, N'F', CAST(N'1988-01-13' AS Date), N'3364612078', N'sofía_claudia.herrero@herrero.sofía_claudia@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (847, N'Soto', N'Arlet Sofía', 24000055, N'F', CAST(N'1988-01-10' AS Date), N'3364442577', N'arlet_sofía.soto@soto.arlet_sofía@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (848, N'Rubio', N'Amaia Paula', 24000056, N'F', CAST(N'1988-01-27' AS Date), N'3363086334', N'amaia_paula.rubio@rubio.amaia_paula@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (849, N'Morales', N'Isabel Manuela', 24000057, N'F', CAST(N'1988-01-19' AS Date), N'3367727429', N'isabel_manuela.morales@morales.isabel_manuela@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (850, N'Gómez', N'Triana Iria', 24000058, N'F', CAST(N'1988-01-22' AS Date), N'3369655491', N'triana_iria.gómez@gómez.triana_iria@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (851, N'Aguilar', N'Fabián Lucas', 24000059, N'M', CAST(N'1988-01-24' AS Date), N'3368877691', N'fabián_lucas.aguilar@aguilar.fabián_lucas@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (852, N'Nuñez', N'Eliseo Lemuel', 24000060, N'M', CAST(N'1988-01-02' AS Date), N'3367316702', N'eliseo_lemuel.nuñez@nuñez.eliseo_lemuel@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (853, N'Álvarez', N'Triana Marina', 24000061, N'F', CAST(N'1988-01-12' AS Date), N'3363595278', N'triana_marina.Álvarez@álvarez.triana_marina@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (854, N'Suárez', N'Abraham Agustín', 24000062, N'M', CAST(N'1988-01-26' AS Date), N'3369893375', N'abraham_agustín.suárez@suárez.abraham_agustín@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (855, N'Vargas', N'Isaías Zacarías', 24000063, N'M', CAST(N'1988-01-10' AS Date), N'3368195056', N'isaías_zacarías.vargas@vargas.isaías_zacarías@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (856, N'Velasco', N'Carlota Nahia', 24000064, N'F', CAST(N'1988-01-17' AS Date), N'3369504975', N'carlota_nahia.velasco@velasco.carlota_nahia@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (857, N'Álvarez', N'Efraín José', 24000065, N'M', CAST(N'1988-01-21' AS Date), N'3369977149', N'efraín_josé.Álvarez@álvarez.efraín_josé@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (858, N'Sanz', N'Diana María', 24000066, N'F', CAST(N'1988-01-28' AS Date), N'3364231881', N'diana_maría.sanz@sanz.diana_maría@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (859, N'Sánchez', N'María Ainhoa', 24000067, N'F', CAST(N'1988-01-12' AS Date), N'3367864933', N'maría_ainhoa.sánchez@sánchez.maría_ainhoa@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (860, N'Romero', N'Carolina Martina', 24000068, N'F', CAST(N'1988-01-07' AS Date), N'3363975108', N'carolina_martina.romero@romero.carolina_martina@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (861, N'Marin', N'Zoe Mia', 24000069, N'F', CAST(N'1988-01-25' AS Date), N'3365096244', N'zoe_mia.marin@marin.zoe_mia@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (862, N'Suárez', N'Ainara Fátima', 24000070, N'F', CAST(N'1988-01-10' AS Date), N'3363055331', N'ainara_fátima.suárez@suárez.ainara_fátima@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (863, N'Rodríguez', N'Lucía Vera', 24000071, N'F', CAST(N'1988-01-03' AS Date), N'3366226853', N'lucía_vera.rodríguez@rodríguez.lucía_vera@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (864, N'Aguilar', N'Eneas Acab', 24000072, N'M', CAST(N'1988-01-19' AS Date), N'3364412662', N'eneas_acab.aguilar@aguilar.eneas_acab@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (865, N'Gómez', N'Cristina Nerea', 24000073, N'F', CAST(N'1988-01-21' AS Date), N'3367513916', N'cristina_nerea.gómez@gómez.cristina_nerea@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (866, N'Martínez', N'Amaia Candela', 24000074, N'F', CAST(N'1988-01-04' AS Date), N'3366337758', N'amaia_candela.martínez@martínez.amaia_candela@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (867, N'Aguilar', N'Luna Nora', 24000075, N'F', CAST(N'1988-01-29' AS Date), N'3369518410', N'luna_nora.aguilar@aguilar.luna_nora@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (868, N'López', N'Nour Aina', 24000076, N'F', CAST(N'1988-01-21' AS Date), N'3367951133', N'nour_aina.lópez@lópez.nour_aina@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (869, N'Castillo', N'Carolina Elsa', 24000077, N'F', CAST(N'1988-01-14' AS Date), N'3369867515', N'carolina_elsa.castillo@castillo.carolina_elsa@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (870, N'Serrano', N'Sara Adara', 24000078, N'F', CAST(N'1988-01-07' AS Date), N'3364651628', N'sara_adara.serrano@serrano.sara_adara@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (871, N'Ortiz', N'Darío Noé', 24000079, N'M', CAST(N'1988-01-01' AS Date), N'3364923601', N'darío_noé.ortiz@ortiz.darío_noé@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (872, N'Bravo', N'Mia Blanca', 24000080, N'F', CAST(N'1988-01-27' AS Date), N'3363016571', N'mia_blanca.bravo@bravo.mia_blanca@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (873, N'Gallardo', N'Caleb Joaquín', 24000081, N'M', CAST(N'1988-01-08' AS Date), N'3365088854', N'caleb_joaquín.gallardo@gallardo.caleb_joaquín@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (874, N'Vargas', N'Martina África', 24000082, N'F', CAST(N'1988-01-25' AS Date), N'3369907903', N'martina_África.vargas@vargas.martina_áfrica@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (875, N'Parra', N'Macarena Carla', 24000083, N'F', CAST(N'1988-01-17' AS Date), N'3369575589', N'macarena_carla.parra@parra.macarena_carla@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (876, N'Ruiz', N'Uzías Jaír de Galaad', 24000084, N'M', CAST(N'1988-01-07' AS Date), N'3364403560', N'uzías_jaír_de_galaad.ruiz@ruiz.uzías_jaír_de_galaad@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (877, N'Lozano', N'Abimael Édgar', 24000085, N'M', CAST(N'1988-01-15' AS Date), N'3366304280', N'abimael_Édgar.lozano@lozano.abimael_édgar@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (878, N'Sáez', N'Celia Carolina', 24000086, N'F', CAST(N'1988-01-28' AS Date), N'3367168541', N'celia_carolina.sáez@sáez.celia_carolina@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (879, N'Calvo', N'Ángela Lia', 24000087, N'F', CAST(N'1988-01-24' AS Date), N'3365819039', N'Ángela_lia.calvo@calvo.ángela_lia@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (880, N'Reyes', N'Ainhoa Yasmín', 24000088, N'F', CAST(N'1988-01-23' AS Date), N'3369668074', N'ainhoa_yasmín.reyes@reyes.ainhoa_yasmín@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (881, N'Ibáñez', N'Benjamín Beltrán', 24000089, N'M', CAST(N'1988-01-13' AS Date), N'3366407430', N'benjamín_beltrán.ibáñez@ibáñez.benjamín_beltrán@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (882, N'Campos', N'Jiram Juan', 24000090, N'M', CAST(N'1988-01-05' AS Date), N'3367940176', N'jiram_juan.campos@campos.jiram_juan@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (883, N'García', N'Felipe Daniel', 24000091, N'M', CAST(N'1988-01-07' AS Date), N'3363567569', N'felipe_daniel.garcía@garcía.felipe_daniel@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (884, N'Ferrer', N'Ana', 24000092, N'F', CAST(N'1988-01-09' AS Date), N'3366531899', N'ana.ferrer@ferrer.ana@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (885, N'Peña', N'Jeremías Efraín', 24000093, N'M', CAST(N'1988-01-26' AS Date), N'3366435959', N'jeremías_efraín.peña@peña.jeremías_efraín@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (886, N'Gallardo', N'Simón Esteban', 24000094, N'M', CAST(N'1988-01-03' AS Date), N'3364518297', N'simón_esteban.gallardo@gallardo.simón_esteban@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (887, N'Garrido', N'Nour Lina', 24000095, N'F', CAST(N'1988-01-28' AS Date), N'3368160435', N'nour_lina.garrido@garrido.nour_lina@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (888, N'Fernández', N'Alma Blanca', 24000096, N'F', CAST(N'1988-01-11' AS Date), N'3366356702', N'alma_blanca.fernández@fernández.alma_blanca@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (889, N'Navarro', N'Elsa Lia', 24000097, N'F', CAST(N'1988-01-11' AS Date), N'3365381077', N'elsa_lia.navarro@navarro.elsa_lia@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (890, N'Ramos', N'Diana Candela', 24000098, N'F', CAST(N'1988-01-01' AS Date), N'3368290233', N'diana_candela.ramos@ramos.diana_candela@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (891, N'Méndez', N'Herodes Jiram', 24000099, N'M', CAST(N'1988-01-14' AS Date), N'3368795659', N'herodes_jiram.méndez@méndez.herodes_jiram@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (892, N'Alonso', N'Clara Lucía', 24500001, N'F', CAST(N'1989-01-19' AS Date), N'3367230091', N'clara_lucía.alonso@alonso.clara_lucía@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (893, N'Flores', N'Julio Nicolás', 24500002, N'M', CAST(N'1989-01-08' AS Date), N'3369520560', N'julio_nicolás.flores@flores.julio_nicolás@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (894, N'Carrasco', N'José David', 24500003, N'M', CAST(N'1989-01-07' AS Date), N'3365466530', N'josé_david.carrasco@carrasco.josé_david@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (895, N'Herrero', N'Jesús Sergio', 24500004, N'M', CAST(N'1989-01-14' AS Date), N'3365691870', N'jesús_sergio.herrero@herrero.jesús_sergio@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (896, N'Peña', N'Caleb Andrés', 24500005, N'M', CAST(N'1989-01-04' AS Date), N'3368989327', N'caleb_andrés.peña@peña.caleb_andrés@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (897, N'Benitez', N'Ona Chloe', 24500006, N'F', CAST(N'1989-01-18' AS Date), N'3364150946', N'ona_chloe.benitez@benitez.ona_chloe@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (898, N'Moreno', N'Triana Ona', 24500007, N'F', CAST(N'1989-01-26' AS Date), N'3369772804', N'triana_ona.moreno@moreno.triana_ona@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (899, N'Ramos', N'Isabel Noa', 24500008, N'F', CAST(N'1989-01-13' AS Date), N'3365086842', N'isabel_noa.ramos@ramos.isabel_noa@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (900, N'Carrasco', N'Claudia Nahia', 24500009, N'F', CAST(N'1989-01-19' AS Date), N'3368030587', N'claudia_nahia.carrasco@carrasco.claudia_nahia@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (901, N'Crespo', N'Nora Noa', 24500010, N'F', CAST(N'1989-01-11' AS Date), N'3363086962', N'nora_noa.crespo@crespo.nora_noa@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (902, N'Alonso', N'Jonás Mateo', 24500011, N'M', CAST(N'1989-01-18' AS Date), N'3364450736', N'jonás_mateo.alonso@alonso.jonás_mateo@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (903, N'Ortega', N'Gaspar Francisco', 24500012, N'M', CAST(N'1989-01-26' AS Date), N'3363025458', N'gaspar_francisco.ortega@ortega.gaspar_francisco@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (904, N'Márquez', N'Nora Manuela', 24500013, N'F', CAST(N'1989-01-25' AS Date), N'3363348237', N'nora_manuela.márquez@márquez.nora_manuela@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (905, N'Ferrer', N'Ahzià Zacarías', 24500014, N'M', CAST(N'1989-01-23' AS Date), N'3368386232', N'ahzià_zacarías.ferrer@ferrer.ahzià_zacarías@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (906, N'Gil', N'Andrés Jacob', 24500015, N'M', CAST(N'1989-01-16' AS Date), N'3368139645', N'andrés_jacob.gil@gil.andrés_jacob@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (907, N'Serrano', N'Agustín Ezequiel', 24500016, N'M', CAST(N'1989-01-16' AS Date), N'3368307092', N'agustín_ezequiel.serrano@serrano.agustín_ezequiel@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (908, N'Duran', N'Abril Triana', 24500017, N'F', CAST(N'1989-01-14' AS Date), N'3369220455', N'abril_triana.duran@duran.abril_triana@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (909, N'Calvo', N'Pablo Uzías', 24500018, N'M', CAST(N'1989-01-11' AS Date), N'3369692910', N'pablo_uzías.calvo@calvo.pablo_uzías@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (910, N'Guerrero', N'Julia Valeria', 24500019, N'F', CAST(N'1989-01-23' AS Date), N'3363023182', N'julia_valeria.guerrero@guerrero.julia_valeria@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (911, N'Morales', N'Cloe Azahara', 24500020, N'F', CAST(N'1989-01-02' AS Date), N'3363008555', N'cloe_azahara.morales@morales.cloe_azahara@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (912, N'Rodríguez', N'Elí Eneas', 24500021, N'M', CAST(N'1989-01-18' AS Date), N'3367605459', N'elí_eneas.rodríguez@rodríguez.elí_eneas@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (913, N'Vicente', N'Mateo Gaspar', 24500022, N'M', CAST(N'1989-01-09' AS Date), N'3365334922', N'mateo_gaspar.vicente@vicente.mateo_gaspar@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (914, N'Duran', N'Mar Aina', 24500023, N'F', CAST(N'1989-01-18' AS Date), N'3364231027', N'mar_aina.duran@duran.mar_aina@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (915, N'López', N'Chloe Alejandra', 24500024, N'F', CAST(N'1989-01-05' AS Date), N'3363444824', N'chloe_alejandra.lópez@lópez.chloe_alejandra@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (916, N'Lozano', N'Jiram Félix', 24500025, N'M', CAST(N'1989-01-07' AS Date), N'3363779561', N'jiram_félix.lozano@lozano.jiram_félix@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (917, N'García', N'Lemuel Jesús', 24500026, N'M', CAST(N'1989-01-29' AS Date), N'3364630286', N'lemuel_jesús.garcía@garcía.lemuel_jesús@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (918, N'Jimenez', N'Sara Manuela', 24500027, N'F', CAST(N'1989-01-03' AS Date), N'3367272858', N'sara_manuela.jimenez@jimenez.sara_manuela@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (919, N'Herrero', N'Eliel Israel', 24500028, N'M', CAST(N'1989-01-04' AS Date), N'3363466358', N'eliel_israel.herrero@herrero.eliel_israel@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (920, N'Caballero', N'Inés Andrea', 24500029, N'F', CAST(N'1989-01-06' AS Date), N'3368449501', N'inés_andrea.caballero@caballero.inés_andrea@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (921, N'Rojas', N'Esteban Caín', 24500030, N'M', CAST(N'1989-01-29' AS Date), N'3363537152', N'esteban_caín.rojas@rojas.esteban_caín@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (922, N'Velasco', N'Eliseo Adán', 24500031, N'M', CAST(N'1989-01-30' AS Date), N'3364120428', N'eliseo_adán.velasco@velasco.eliseo_adán@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (923, N'Gutiérrez', N'Alma Zoe', 24500032, N'F', CAST(N'1989-01-07' AS Date), N'3367967478', N'alma_zoe.gutiérrez@gutiérrez.alma_zoe@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (924, N'Sanz', N'Jesús Andrés', 24500033, N'M', CAST(N'1989-01-23' AS Date), N'3366563212', N'jesús_andrés.sanz@sanz.jesús_andrés@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (925, N'Castro', N'Olivia Aina', 24500034, N'F', CAST(N'1989-01-12' AS Date), N'3368988385', N'olivia_aina.castro@castro.olivia_aina@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (926, N'Moya', N'Leyre Clara', 24500035, N'F', CAST(N'1989-01-17' AS Date), N'3369034317', N'leyre_clara.moya@moya.leyre_clara@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (927, N'Blanco', N'Valeria Alejandra', 24500036, N'F', CAST(N'1989-01-04' AS Date), N'3367562805', N'valeria_alejandra.blanco@blanco.valeria_alejandra@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (928, N'Díaz', N'Ona Helena', 24500037, N'F', CAST(N'1989-01-18' AS Date), N'3367224583', N'ona_helena.díaz@díaz.ona_helena@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (929, N'Carmona', N'Ariadna Abril', 24500038, N'F', CAST(N'1989-01-07' AS Date), N'3363976183', N'ariadna_abril.carmona@carmona.ariadna_abril@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (930, N'Herrero', N'Claudia Carolina', 24500039, N'F', CAST(N'1989-01-22' AS Date), N'3368728622', N'claudia_carolina.herrero@herrero.claudia_carolina@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (931, N'Navarro', N'Eliel Eneas', 24500040, N'M', CAST(N'1989-01-22' AS Date), N'3369387061', N'eliel_eneas.navarro@navarro.eliel_eneas@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (932, N'Crespo', N'Alba Ainara', 24500041, N'F', CAST(N'1989-01-01' AS Date), N'3368547699', N'alba_ainara.crespo@crespo.alba_ainara@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (933, N'Montero', N'Elena Alma', 24500042, N'F', CAST(N'1989-01-24' AS Date), N'3368990609', N'elena_alma.montero@montero.elena_alma@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (934, N'Marin', N'Leyre Fátima', 24500043, N'F', CAST(N'1989-01-28' AS Date), N'3364853662', N'leyre_fátima.marin@marin.leyre_fátima@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (935, N'Vargas', N'Marina Mar', 24500044, N'F', CAST(N'1989-01-23' AS Date), N'3368726908', N'marina_mar.vargas@vargas.marina_mar@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (936, N'León', N'Zacarías Miguel', 24500045, N'M', CAST(N'1989-01-09' AS Date), N'3368125850', N'zacarías_miguel.león@león.zacarías_miguel@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (937, N'Lozano', N' Jana', 24500046, N'F', CAST(N'1989-01-23' AS Date), N'3368013543', N'_jana.lozano@lozano._jana@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (938, N'Nuñez', N'Zacarías Bartolomé', 24500047, N'M', CAST(N'1989-01-15' AS Date), N'3366272830', N'zacarías_bartolomé.nuñez@nuñez.zacarías_bartolomé@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (939, N'Crespo', N'Marcos David', 24500048, N'M', CAST(N'1989-01-16' AS Date), N'3366198612', N'marcos_david.crespo@crespo.marcos_david@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (940, N'Carmona', N'Fabián Germán', 24500049, N'M', CAST(N'1989-01-27' AS Date), N'3368069559', N'fabián_germán.carmona@carmona.fabián_germán@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (941, N'Santiago', N'Francisco Simón', 24500050, N'M', CAST(N'1989-01-06' AS Date), N'3363914444', N'francisco_simón.santiago@santiago.francisco_simón@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (942, N'Vicente', N'Sara Olivia', 24500051, N'F', CAST(N'1989-01-11' AS Date), N'3365223981', N'sara_olivia.vicente@vicente.sara_olivia@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (943, N'Aguilar', N'Julia Rocío', 24500052, N'F', CAST(N'1989-01-27' AS Date), N'3366337379', N'julia_rocío.aguilar@aguilar.julia_rocío@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (944, N'Rojas', N'Sergio Nicolás', 24500053, N'M', CAST(N'1989-01-12' AS Date), N'3369616730', N'sergio_nicolás.rojas@rojas.sergio_nicolás@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (945, N'Cano', N'Josué Beltrán', 24500054, N'M', CAST(N'1989-01-10' AS Date), N'3367240374', N'josué_beltrán.cano@cano.josué_beltrán@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (946, N'Soto', N'Neftalí Marcos', 24500055, N'M', CAST(N'1989-01-29' AS Date), N'3368177512', N'neftalí_marcos.soto@soto.neftalí_marcos@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (947, N'Soler', N'Simón David', 24500056, N'M', CAST(N'1989-01-27' AS Date), N'3366651473', N'simón_david.soler@soler.simón_david@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (948, N'Morales', N'Olivia Jana', 24500057, N'F', CAST(N'1989-01-28' AS Date), N'3367150819', N'olivia_jana.morales@morales.olivia_jana@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (949, N'Roman', N'Aina Isabel', 24500058, N'F', CAST(N'1989-01-08' AS Date), N'3364865483', N'aina_isabel.roman@roman.aina_isabel@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (950, N'Herrero', N'Set Mateo', 24500059, N'M', CAST(N'1989-01-27' AS Date), N'3366558226', N'set_mateo.herrero@herrero.set_mateo@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (951, N'Diez', N'Noé Ismael', 24500060, N'M', CAST(N'1989-01-25' AS Date), N'3367560341', N'noé_ismael.diez@diez.noé_ismael@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (952, N'Rivera', N'Triana Macarena', 24500061, N'F', CAST(N'1989-01-03' AS Date), N'3364318398', N'triana_macarena.rivera@rivera.triana_macarena@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (953, N'Caballero', N'Andrés Acab', 24500062, N'M', CAST(N'1989-01-20' AS Date), N'3366397337', N'andrés_acab.caballero@caballero.andrés_acab@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (954, N'Lozano', N'Vega Aroa', 24500063, N'F', CAST(N'1989-01-28' AS Date), N'3367707313', N'vega_aroa.lozano@lozano.vega_aroa@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (955, N'Martínez', N'Irene Vega', 24500064, N'F', CAST(N'1989-01-20' AS Date), N'3366967616', N'irene_vega.martínez@martínez.irene_vega@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (956, N'Campos', N'Carla Mia', 24500065, N'F', CAST(N'1989-01-27' AS Date), N'3369613762', N'carla_mia.campos@campos.carla_mia@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (957, N'Soto', N'Samuel Ashur', 24500066, N'M', CAST(N'1989-01-30' AS Date), N'3363119348', N'samuel_ashur.soto@soto.samuel_ashur@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (958, N'Carrasco', N'Homero Acab', 24500067, N'M', CAST(N'1989-01-30' AS Date), N'3368582318', N'homero_acab.carrasco@carrasco.homero_acab@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (959, N'Benitez', N'Mateo Benjamín', 24500068, N'M', CAST(N'1989-01-16' AS Date), N'3366517616', N'mateo_benjamín.benitez@benitez.mateo_benjamín@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (960, N'Jimenez', N'Elia Olivia', 24500069, N'F', CAST(N'1989-01-05' AS Date), N'3366372017', N'elia_olivia.jimenez@jimenez.elia_olivia@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (961, N'Marin', N'Nicolás Tobías', 24500070, N'M', CAST(N'1989-01-14' AS Date), N'3365162604', N'nicolás_tobías.marin@marin.nicolás_tobías@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (962, N'Muñoz', N'Mia Noa', 24500071, N'F', CAST(N'1989-01-09' AS Date), N'3367020528', N'mia_noa.muñoz@muñoz.mia_noa@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (963, N'Castro', N'Labán Jesús', 24500072, N'M', CAST(N'1989-01-20' AS Date), N'3368177213', N'labán_jesús.castro@castro.labán_jesús@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (964, N'Fernández', N'Claudia Nour', 24500073, N'F', CAST(N'1989-01-26' AS Date), N'3365862773', N'claudia_nour.fernández@fernández.claudia_nour@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (965, N'Muñoz', N'Eliel Esteban', 24500074, N'M', CAST(N'1989-01-29' AS Date), N'3366030019', N'eliel_esteban.muñoz@muñoz.eliel_esteban@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (966, N'Cabrera', N'Jacob Noé', 24500075, N'M', CAST(N'1989-01-18' AS Date), N'3366479046', N'jacob_noé.cabrera@cabrera.jacob_noé@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (967, N'Velasco', N'Valeria Alejandra', 24500076, N'F', CAST(N'1989-01-19' AS Date), N'3365256601', N'valeria_alejandra.velasco@velasco.valeria_alejandra@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (968, N'Pascual', N'Abdiel Eliseo', 24500077, N'M', CAST(N'1989-01-17' AS Date), N'3369191811', N'abdiel_eliseo.pascual@pascual.abdiel_eliseo@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (969, N'Cruz', N'Julieta Celia', 24500078, N'F', CAST(N'1989-01-18' AS Date), N'3368903032', N'julieta_celia.cruz@cruz.julieta_celia@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (970, N'Carrasco', N'Isaac Juan', 24500079, N'M', CAST(N'1989-01-07' AS Date), N'3369476191', N'isaac_juan.carrasco@carrasco.isaac_juan@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (971, N'Cortés', N'Amira Martina', 24500080, N'F', CAST(N'1989-01-21' AS Date), N'3364727790', N'amira_martina.cortés@cortés.amira_martina@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (972, N'Rojas', N'Benjamín Saúl', 24500081, N'M', CAST(N'1989-01-21' AS Date), N'3365526564', N'benjamín_saúl.rojas@rojas.benjamín_saúl@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (973, N'Montero', N'Elí Isaac', 24500082, N'M', CAST(N'1989-01-26' AS Date), N'3366306986', N'elí_isaac.montero@montero.elí_isaac@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (974, N'Ramírez', N'Benjamín Neftalí', 24500083, N'M', CAST(N'1989-01-10' AS Date), N'3363345146', N'benjamín_neftalí.ramírez@ramírez.benjamín_neftalí@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (975, N'Nuñez', N'Zacarías Adán', 24500084, N'M', CAST(N'1989-01-22' AS Date), N'3363560819', N'zacarías_adán.nuñez@nuñez.zacarías_adán@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (976, N'Prieto', N'Omar Esteban', 24500085, N'M', CAST(N'1989-01-02' AS Date), N'3365672119', N'omar_esteban.prieto@prieto.omar_esteban@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (977, N'López', N'Abraham Jacob', 24500086, N'M', CAST(N'1989-01-20' AS Date), N'3365238107', N'abraham_jacob.lópez@lópez.abraham_jacob@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (978, N'Crespo', N'Alma Ariadna', 24500087, N'F', CAST(N'1989-01-12' AS Date), N'3363668437', N'alma_ariadna.crespo@crespo.alma_ariadna@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (979, N'Torres', N'Felipe Set', 24500088, N'M', CAST(N'1989-01-12' AS Date), N'3369649363', N'felipe_set.torres@torres.felipe_set@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (980, N'González', N'Esteban Gaspar', 24500089, N'M', CAST(N'1989-01-14' AS Date), N'3363779512', N'esteban_gaspar.gonzález@gonzález.esteban_gaspar@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (981, N'Molina', N'Jesús Jeremías', 24500090, N'M', CAST(N'1989-01-05' AS Date), N'3368847577', N'jesús_jeremías.molina@molina.jesús_jeremías@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (982, N'Aguilar', N'Matías Mateo', 24500091, N'M', CAST(N'1989-01-13' AS Date), N'3363569154', N'matías_mateo.aguilar@aguilar.matías_mateo@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (983, N'León', N'Nuria Lola', 24500092, N'F', CAST(N'1989-01-28' AS Date), N'3365219857', N'nuria_lola.león@león.nuria_lola@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (984, N'Sáez', N'Alejandra Mia', 24500093, N'F', CAST(N'1989-01-14' AS Date), N'3367521720', N'alejandra_mia.sáez@sáez.alejandra_mia@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (985, N'Hernández', N'Julieta Lia', 24500094, N'F', CAST(N'1989-01-09' AS Date), N'3365391779', N'julieta_lia.hernández@hernández.julieta_lia@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (986, N'Cabrera', N'Adriana Ana', 24500095, N'F', CAST(N'1989-01-27' AS Date), N'3366816164', N'adriana_ana.cabrera@cabrera.adriana_ana@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (987, N'Fernández', N'Ainara Martina', 24500096, N'F', CAST(N'1989-01-27' AS Date), N'3369734406', N'ainara_martina.fernández@fernández.ainara_martina@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (988, N'Santos', N'Elsa Azahara', 24500097, N'F', CAST(N'1989-01-01' AS Date), N'3365000758', N'elsa_azahara.santos@santos.elsa_azahara@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (989, N'Ramos', N'Ana Ariadna', 24500098, N'F', CAST(N'1989-01-03' AS Date), N'3367254625', N'ana_ariadna.ramos@ramos.ana_ariadna@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (990, N'García', N'Triana Julieta', 24500099, N'F', CAST(N'1989-01-01' AS Date), N'3367496504', N'triana_julieta.garcía@garcía.triana_julieta@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (991, N'Cortés', N'Aurora Macarena', 25000001, N'F', CAST(N'1990-01-25' AS Date), N'3368062938', N'aurora_macarena.cortés@cortés.aurora_macarena@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (992, N'Rubio', N'Leire Celia', 25000002, N'F', CAST(N'1990-01-14' AS Date), N'3366880705', N'leire_celia.rubio@rubio.leire_celia@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (993, N'Soto', N'Vega Eva', 25000003, N'F', CAST(N'1990-01-08' AS Date), N'3369126593', N'vega_eva.soto@soto.vega_eva@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (994, N'Gil', N'Carolina Olivia', 25000004, N'F', CAST(N'1990-01-29' AS Date), N'3367067094', N'carolina_olivia.gil@gil.carolina_olivia@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (995, N'Moya', N'Malak Amira', 25000005, N'F', CAST(N'1990-01-14' AS Date), N'3369769384', N'malak_amira.moya@moya.malak_amira@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (996, N'Martínez', N'Cristina Luna', 25000006, N'F', CAST(N'1990-01-19' AS Date), N'3369832888', N'cristina_luna.martínez@martínez.cristina_luna@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (997, N'Ruiz', N'Jimena Elena', 25000007, N'F', CAST(N'1990-01-28' AS Date), N'3365172117', N'jimena_elena.ruiz@ruiz.jimena_elena@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (998, N'Gallardo', N'José Felipe', 25000008, N'M', CAST(N'1990-01-10' AS Date), N'3365096762', N'josé_felipe.gallardo@gallardo.josé_felipe@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (999, N'Serrano', N'Helena Olivia', 25000009, N'F', CAST(N'1990-01-30' AS Date), N'3368358260', N'helena_olivia.serrano@serrano.helena_olivia@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1000, N'Hidalgo', N'Jiram Joaquín', 25000010, N'M', CAST(N'1990-01-15' AS Date), N'3364215674', N'jiram_joaquín.hidalgo@hidalgo.jiram_joaquín@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1001, N'Martín', N'Leyre Cayetana', 25000011, N'F', CAST(N'1990-01-14' AS Date), N'3365946288', N'leyre_cayetana.martín@martín.leyre_cayetana@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1002, N'Hernández', N'Paula Mara', 25000012, N'F', CAST(N'1990-01-24' AS Date), N'3368974867', N'paula_mara.hernández@hernández.paula_mara@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1003, N'Martínez', N'José Félix', 25000013, N'M', CAST(N'1990-01-30' AS Date), N'3366588042', N'josé_félix.martínez@martínez.josé_félix@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1004, N'Alonso', N'Noé Juan', 25000014, N'M', CAST(N'1990-01-01' AS Date), N'3363785843', N'noé_juan.alonso@alonso.noé_juan@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1005, N'Lorenzo', N'Jared Acab', 25000015, N'M', CAST(N'1990-01-27' AS Date), N'3364154032', N'jared_acab.lorenzo@lorenzo.jared_acab@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1006, N'Gutiérrez', N'Homero Ezequiel', 25000016, N'M', CAST(N'1990-01-14' AS Date), N'3368186128', N'homero_ezequiel.gutiérrez@gutiérrez.homero_ezequiel@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1007, N'Nuñez', N'Ángela Adriana', 25000017, N'F', CAST(N'1990-01-06' AS Date), N'3368339468', N'Ángela_adriana.nuñez@nuñez.ángela_adriana@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1008, N'Vargas', N'Ismael Felipe', 25000018, N'M', CAST(N'1990-01-15' AS Date), N'3366008977', N'ismael_felipe.vargas@vargas.ismael_felipe@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1009, N'Martín', N'Abel Germán', 25000019, N'M', CAST(N'1990-01-29' AS Date), N'3365401420', N'abel_germán.martín@martín.abel_germán@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1010, N'Flores', N'Eliel Bartolomé', 25000020, N'M', CAST(N'1990-01-28' AS Date), N'3363848559', N'eliel_bartolomé.flores@flores.eliel_bartolomé@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1011, N'Hidalgo', N'Joaquín Francisco', 25000021, N'M', CAST(N'1990-01-14' AS Date), N'3365064416', N'joaquín_francisco.hidalgo@hidalgo.joaquín_francisco@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1012, N'Vicente', N'Elia Valentina', 25000022, N'F', CAST(N'1990-01-30' AS Date), N'3366414330', N'elia_valentina.vicente@vicente.elia_valentina@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1013, N'Vega', N'Nuria Victoria', 25000023, N'F', CAST(N'1990-01-22' AS Date), N'3366763111', N'nuria_victoria.vega@vega.nuria_victoria@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1014, N'Sánchez', N'Lia Eva', 25000024, N'F', CAST(N'1990-01-21' AS Date), N'3369595018', N'lia_eva.sánchez@sánchez.lia_eva@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1015, N'Romero', N'Manuela Ainhoa', 25000025, N'F', CAST(N'1990-01-08' AS Date), N'3369967853', N'manuela_ainhoa.romero@romero.manuela_ainhoa@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1016, N'Romero', N'Aurora Andrea', 25000026, N'F', CAST(N'1990-01-15' AS Date), N'3365665174', N'aurora_andrea.romero@romero.aurora_andrea@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1017, N'Ferrer', N'Leire Luna', 25000027, N'F', CAST(N'1990-01-14' AS Date), N'3365505087', N'leire_luna.ferrer@ferrer.leire_luna@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1018, N'Vázquez', N'Vega Luna', 25000028, N'F', CAST(N'1990-01-24' AS Date), N'3363095807', N'vega_luna.vázquez@vázquez.vega_luna@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1019, N'Moreno', N'Inés Luna', 25000029, N'F', CAST(N'1990-01-24' AS Date), N'3367379597', N'inés_luna.moreno@moreno.inés_luna@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1020, N'Sanz', N'Alejandro Lucas', 25000030, N'M', CAST(N'1990-01-22' AS Date), N'3364641399', N'alejandro_lucas.sanz@sanz.alejandro_lucas@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1021, N'Márquez', N'Alma Carlota', 25000031, N'F', CAST(N'1990-01-11' AS Date), N'3365994526', N'alma_carlota.márquez@márquez.alma_carlota@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1022, N'Ibáñez', N'Olivia Leyre', 25000032, N'F', CAST(N'1990-01-08' AS Date), N'3365337185', N'olivia_leyre.ibáñez@ibáñez.olivia_leyre@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1023, N'Duran', N'Daniel Sergio', 25000033, N'M', CAST(N'1990-01-14' AS Date), N'3363874955', N'daniel_sergio.duran@duran.daniel_sergio@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1024, N'Guerrero', N'Jiram Eneas', 25000034, N'M', CAST(N'1990-01-28' AS Date), N'3367756087', N'jiram_eneas.guerrero@guerrero.jiram_eneas@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1025, N'Soto', N'Efraín Abraham', 25000035, N'M', CAST(N'1990-01-19' AS Date), N'3369679597', N'efraín_abraham.soto@soto.efraín_abraham@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1026, N'Gutiérrez', N'Juan Jacob', 25000036, N'M', CAST(N'1990-01-23' AS Date), N'3364674217', N'juan_jacob.gutiérrez@gutiérrez.juan_jacob@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1027, N'Cabrera', N'Juan Rubén', 25000037, N'M', CAST(N'1990-01-17' AS Date), N'3364683665', N'juan_rubén.cabrera@cabrera.juan_rubén@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1028, N'Rubio', N'Renato Rafael', 25000038, N'M', CAST(N'1990-01-07' AS Date), N'3363244374', N'renato_rafael.rubio@rubio.renato_rafael@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1029, N'Gil', N'Isaías Lucas', 25000039, N'M', CAST(N'1990-01-28' AS Date), N'3366281130', N'isaías_lucas.gil@gil.isaías_lucas@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1030, N'Vargas', N'Ainhoa Elena', 25000040, N'F', CAST(N'1990-01-18' AS Date), N'3366553547', N'ainhoa_elena.vargas@vargas.ainhoa_elena@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1031, N'Mora', N'Vera Jana', 25000041, N'F', CAST(N'1990-01-03' AS Date), N'3365170779', N'vera_jana.mora@mora.vera_jana@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1032, N'García', N'Julia Laura', 25000042, N'F', CAST(N'1990-01-28' AS Date), N'3366374068', N'julia_laura.garcía@garcía.julia_laura@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1033, N'Gutiérrez', N'Chloe Elsa', 25000043, N'F', CAST(N'1990-01-12' AS Date), N'3369936692', N'chloe_elsa.gutiérrez@gutiérrez.chloe_elsa@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1034, N'Carmona', N'Lucas Isaac', 25000044, N'M', CAST(N'1990-01-19' AS Date), N'3364172321', N'lucas_isaac.carmona@carmona.lucas_isaac@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1035, N'Moreno', N'Aarón Daniel', 25000045, N'M', CAST(N'1990-01-13' AS Date), N'3366715947', N'aarón_daniel.moreno@moreno.aarón_daniel@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1036, N'Castro', N'Nora Blanca', 25000046, N'F', CAST(N'1990-01-29' AS Date), N'3368850565', N'nora_blanca.castro@castro.nora_blanca@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1037, N'Cruz', N'Elia Ángela', 25000047, N'F', CAST(N'1990-01-10' AS Date), N'3365317286', N'elia_Ángela.cruz@cruz.elia_ángela@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1038, N'Fernández', N'Lara Marta', 25000048, N'F', CAST(N'1990-01-01' AS Date), N'3367581558', N'lara_marta.fernández@fernández.lara_marta@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1039, N'Cruz', N'Samuel Caleb', 25000049, N'M', CAST(N'1990-01-08' AS Date), N'3367942183', N'samuel_caleb.cruz@cruz.samuel_caleb@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1040, N'Ruiz', N'Darío Ismael', 25000050, N'M', CAST(N'1990-01-25' AS Date), N'3367660449', N'darío_ismael.ruiz@ruiz.darío_ismael@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1041, N'Vargas', N'Ciro Lucas', 25000051, N'M', CAST(N'1990-01-07' AS Date), N'3364132136', N'ciro_lucas.vargas@vargas.ciro_lucas@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1042, N'Domínguez', N'Malak Julia', 25000052, N'F', CAST(N'1990-01-28' AS Date), N'3364230020', N'malak_julia.domínguez@domínguez.malak_julia@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1043, N'Aguilar', N'Eliel Daniel', 25000053, N'M', CAST(N'1990-01-13' AS Date), N'3363730429', N'eliel_daniel.aguilar@aguilar.eliel_daniel@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1044, N'Alonso', N'Claudia Lola', 25000054, N'F', CAST(N'1990-01-22' AS Date), N'3363252383', N'claudia_lola.alonso@alonso.claudia_lola@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1045, N'Rodríguez', N'Valentina Julia', 25000055, N'F', CAST(N'1990-01-29' AS Date), N'3363346867', N'valentina_julia.rodríguez@rodríguez.valentina_julia@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1046, N'Sanz', N'Eliel Caleb', 25000056, N'M', CAST(N'1990-01-07' AS Date), N'3367658305', N'eliel_caleb.sanz@sanz.eliel_caleb@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1047, N'Alonso', N'Berta Gala', 25000057, N'F', CAST(N'1990-01-16' AS Date), N'3366369321', N'berta_gala.alonso@alonso.berta_gala@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1048, N'Peña', N'Elías Félix', 25000058, N'M', CAST(N'1990-01-21' AS Date), N'3366244057', N'elías_félix.peña@peña.elías_félix@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1049, N'Sánchez', N'Pablo Israel', 25000059, N'M', CAST(N'1990-01-06' AS Date), N'3363199151', N'pablo_israel.sánchez@sánchez.pablo_israel@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1050, N'Vargas', N'Leire Elia', 25000060, N'F', CAST(N'1990-01-11' AS Date), N'3364311688', N'leire_elia.vargas@vargas.leire_elia@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1051, N'Cruz', N'Dámaso Neftalí', 25000061, N'M', CAST(N'1990-01-20' AS Date), N'3365145085', N'dámaso_neftalí.cruz@cruz.dámaso_neftalí@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1052, N'Fernández', N'Nerea Natalia', 25000062, N'F', CAST(N'1990-01-15' AS Date), N'3366194476', N'nerea_natalia.fernández@fernández.nerea_natalia@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1053, N'Nieto', N'Zoe Alba', 25000063, N'F', CAST(N'1990-01-17' AS Date), N'3368617299', N'zoe_alba.nieto@nieto.zoe_alba@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1054, N'Ramos', N'Eliseo Elías', 25000064, N'M', CAST(N'1990-01-05' AS Date), N'3365325011', N'eliseo_elías.ramos@ramos.eliseo_elías@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1055, N'Vázquez', N'Ángela María', 25000065, N'F', CAST(N'1990-01-16' AS Date), N'3369434080', N'Ángela_maría.vázquez@vázquez.ángela_maría@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1056, N'Duran', N' Aroa', 25000066, N'F', CAST(N'1990-01-25' AS Date), N'3365837533', N'_aroa.duran@duran._aroa@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1057, N'Sáez', N'Miguel Elí', 25000067, N'M', CAST(N'1990-01-06' AS Date), N'3367646266', N'miguel_elí.sáez@sáez.miguel_elí@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1058, N'Romero', N'Jimena Irene', 25000068, N'F', CAST(N'1990-01-17' AS Date), N'3364962399', N'jimena_irene.romero@romero.jimena_irene@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1059, N'Gallardo', N'Iris Clara', 25000069, N'F', CAST(N'1990-01-16' AS Date), N'3364296547', N'iris_clara.gallardo@gallardo.iris_clara@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1060, N'Ortiz', N'Paula Victoria', 25000070, N'F', CAST(N'1990-01-05' AS Date), N'3364194405', N'paula_victoria.ortiz@ortiz.paula_victoria@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1061, N'Vidal', N'Vega África', 25000071, N'F', CAST(N'1990-01-23' AS Date), N'3363486950', N'vega_África.vidal@vidal.vega_áfrica@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1062, N'Prieto', N'Jared Demócrito', 25000072, N'M', CAST(N'1990-01-03' AS Date), N'3369774901', N'jared_demócrito.prieto@prieto.jared_demócrito@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1063, N'Reyes', N'Amaia Azahara', 25000073, N'F', CAST(N'1990-01-23' AS Date), N'3365186042', N'amaia_azahara.reyes@reyes.amaia_azahara@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1064, N'Alonso', N'Caín Bartolomé', 25000074, N'M', CAST(N'1990-01-14' AS Date), N'3365594540', N'caín_bartolomé.alonso@alonso.caín_bartolomé@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1065, N'Moya', N'Candela Fátima', 25000075, N'F', CAST(N'1990-01-26' AS Date), N'3367513879', N'candela_fátima.moya@moya.candela_fátima@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1066, N'Santiago', N'Olivia Laia', 25000076, N'F', CAST(N'1990-01-15' AS Date), N'3363583207', N'olivia_laia.santiago@santiago.olivia_laia@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1067, N'Fernández', N'Alejandra Aurora', 25000077, N'F', CAST(N'1990-01-20' AS Date), N'3367788100', N'alejandra_aurora.fernández@fernández.alejandra_aurora@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1068, N'Herrera', N'Joaquín Ismael', 25000078, N'M', CAST(N'1990-01-27' AS Date), N'3364341935', N'joaquín_ismael.herrera@herrera.joaquín_ismael@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1069, N'Vargas', N'Olivia Mia', 25000079, N'F', CAST(N'1990-01-30' AS Date), N'3368907779', N'olivia_mia.vargas@vargas.olivia_mia@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1070, N'Crespo', N'Abril Daniela', 25000080, N'F', CAST(N'1990-01-21' AS Date), N'3366663025', N'abril_daniela.crespo@crespo.abril_daniela@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1071, N'Mora', N'Joanix Omar', 25000081, N'M', CAST(N'1990-01-22' AS Date), N'3365008616', N'joanix_omar.mora@mora.joanix_omar@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1072, N'Rivera', N'Rafael Baltasar', 25000082, N'M', CAST(N'1990-01-25' AS Date), N'3365353935', N'rafael_baltasar.rivera@rivera.rafael_baltasar@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1073, N'Cabrera', N'Mara Alejandra', 25000083, N'F', CAST(N'1990-01-04' AS Date), N'3364633265', N'mara_alejandra.cabrera@cabrera.mara_alejandra@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1074, N'Vega', N'Ana Triana', 25000084, N'F', CAST(N'1990-01-26' AS Date), N'3363689303', N'ana_triana.vega@vega.ana_triana@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1075, N'Parra', N'Lola Chloe', 25000085, N'F', CAST(N'1990-01-23' AS Date), N'3363354047', N'lola_chloe.parra@parra.lola_chloe@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1076, N'Velasco', N'Chloe Diana', 25000086, N'F', CAST(N'1990-01-13' AS Date), N'3364131126', N'chloe_diana.velasco@velasco.chloe_diana@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1077, N'Rodríguez', N'Abraham Abel', 25000087, N'M', CAST(N'1990-01-19' AS Date), N'3367787025', N'abraham_abel.rodríguez@rodríguez.abraham_abel@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1078, N'Moya', N'Dámaso Salomón', 25000088, N'M', CAST(N'1990-01-14' AS Date), N'3364470092', N'dámaso_salomón.moya@moya.dámaso_salomón@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1079, N'Sánchez', N'Renato Neftalí', 25000089, N'M', CAST(N'1990-01-14' AS Date), N'3364634585', N'renato_neftalí.sánchez@sánchez.renato_neftalí@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1080, N'Ortiz', N'Elías Lucas', 25000090, N'M', CAST(N'1990-01-05' AS Date), N'3364618429', N'elías_lucas.ortiz@ortiz.elías_lucas@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1081, N'Blanco', N'Claudia Laia', 25000091, N'F', CAST(N'1990-01-10' AS Date), N'3363654437', N'claudia_laia.blanco@blanco.claudia_laia@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1082, N'Carmona', N'Inés Aurora', 25000092, N'F', CAST(N'1990-01-10' AS Date), N'3366712554', N'inés_aurora.carmona@carmona.inés_aurora@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1083, N'Soto', N'Elia Isabel', 25000093, N'F', CAST(N'1990-01-11' AS Date), N'3364087168', N'elia_isabel.soto@soto.elia_isabel@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1084, N'Reyes', N'Andrea Aitana', 25000094, N'F', CAST(N'1990-01-07' AS Date), N'3369289956', N'andrea_aitana.reyes@reyes.andrea_aitana@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1085, N'Cabrera', N'Alicia Naia', 25000095, N'F', CAST(N'1990-01-25' AS Date), N'3365841904', N'alicia_naia.cabrera@cabrera.alicia_naia@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1086, N'Domínguez', N'Samuel Zacarías', 25000096, N'M', CAST(N'1990-01-16' AS Date), N'3368075311', N'samuel_zacarías.domínguez@domínguez.samuel_zacarías@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1087, N'Marin', N'Zacarías Caín', 25000097, N'M', CAST(N'1990-01-20' AS Date), N'3366760744', N'zacarías_caín.marin@marin.zacarías_caín@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1088, N'Fernández', N'Laia Vega', 25000098, N'F', CAST(N'1990-01-20' AS Date), N'3368279948', N'laia_vega.fernández@fernández.laia_vega@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1089, N'Soto', N'Cristina Inés', 25000099, N'F', CAST(N'1990-01-08' AS Date), N'3364212189', N'cristina_inés.soto@soto.cristina_inés@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1090, N'Benitez', N'Eva Helena', 25500001, N'F', CAST(N'1991-01-24' AS Date), N'3367545590', N'eva_helena.benitez@benitez.eva_helena@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1091, N'Pascual', N'Simón Homero', 25500002, N'M', CAST(N'1991-01-06' AS Date), N'3366234178', N'simón_homero.pascual@pascual.simón_homero@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1092, N'Medina', N'Jana Nour', 25500003, N'F', CAST(N'1991-01-09' AS Date), N'3366262124', N'jana_nour.medina@medina.jana_nour@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1093, N'Cortés', N'Triana Eva', 25500004, N'F', CAST(N'1991-01-17' AS Date), N'3364446842', N'triana_eva.cortés@cortés.triana_eva@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1094, N'Rubio', N'Marduk Jesús', 25500005, N'M', CAST(N'1991-01-11' AS Date), N'3363919570', N'marduk_jesús.rubio@rubio.marduk_jesús@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1095, N'Nieto', N'Renato Caleb', 25500006, N'M', CAST(N'1991-01-14' AS Date), N'3363205005', N'renato_caleb.nieto@nieto.renato_caleb@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1096, N'González', N'Alma Naia', 25500007, N'F', CAST(N'1991-01-19' AS Date), N'3367759842', N'alma_naia.gonzález@gonzález.alma_naia@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1097, N'Cruz', N'Berta Carmen', 25500008, N'F', CAST(N'1991-01-03' AS Date), N'3366653039', N'berta_carmen.cruz@cruz.berta_carmen@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1098, N'Santiago', N'Yasmín Valentina', 25500009, N'F', CAST(N'1991-01-04' AS Date), N'3367455183', N'yasmín_valentina.santiago@santiago.yasmín_valentina@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1099, N'Aguilar', N'Gadiel Aarón', 25500010, N'M', CAST(N'1991-01-22' AS Date), N'3363992661', N'gadiel_aarón.aguilar@aguilar.gadiel_aarón@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1100, N'Bravo', N'Germán Lucas', 25500011, N'M', CAST(N'1991-01-28' AS Date), N'3363391881', N'germán_lucas.bravo@bravo.germán_lucas@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1101, N'Gómez', N'Alba Nuria', 25500012, N'F', CAST(N'1991-01-24' AS Date), N'3365341352', N'alba_nuria.gómez@gómez.alba_nuria@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1102, N'Castro', N'Beltrán Jacob', 25500013, N'M', CAST(N'1991-01-16' AS Date), N'3363131418', N'beltrán_jacob.castro@castro.beltrán_jacob@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1103, N'Cano', N'Irene ', 25500014, N'F', CAST(N'1991-01-18' AS Date), N'3363269417', N'irene_.cano@cano.irene_@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1104, N'Hernández', N'Adriana Aina', 25500015, N'F', CAST(N'1991-01-16' AS Date), N'3363792175', N'adriana_aina.hernández@hernández.adriana_aina@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1105, N'Herrera', N'Cristina Gala', 25500016, N'F', CAST(N'1991-01-20' AS Date), N'3364371186', N'cristina_gala.herrera@herrera.cristina_gala@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1106, N'Márquez', N'Benjamín Marcos', 25500017, N'M', CAST(N'1991-01-02' AS Date), N'3365823479', N'benjamín_marcos.márquez@márquez.benjamín_marcos@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1107, N'Parra', N'Nahia Berta', 25500018, N'F', CAST(N'1991-01-29' AS Date), N'3367931416', N'nahia_berta.parra@parra.nahia_berta@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1108, N'Flores', N'Ángela Malak', 25500019, N'F', CAST(N'1991-01-01' AS Date), N'3365259881', N'Ángela_malak.flores@flores.ángela_malak@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1109, N'Suárez', N'Jaír de Galaad Salomón', 25500020, N'M', CAST(N'1991-01-14' AS Date), N'3364379807', N'jaír_de_galaad_salomón.suárez@suárez.jaír_de_galaad_salomón@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1110, N'Giménez', N'Carolina Lara', 25500021, N'F', CAST(N'1991-01-02' AS Date), N'3367710430', N'carolina_lara.giménez@giménez.carolina_lara@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1111, N'Cabrera', N'Iria Natalia', 25500022, N'F', CAST(N'1991-01-30' AS Date), N'3367644849', N'iria_natalia.cabrera@cabrera.iria_natalia@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1112, N'Serrano', N'Dámaso Fabián', 25500023, N'M', CAST(N'1991-01-02' AS Date), N'3364747570', N'dámaso_fabián.serrano@serrano.dámaso_fabián@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1113, N'Márquez', N'Blanca Berta', 25500024, N'F', CAST(N'1991-01-16' AS Date), N'3368780987', N'blanca_berta.márquez@márquez.blanca_berta@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1114, N'Lozano', N'Leví Renato', 25500025, N'M', CAST(N'1991-01-07' AS Date), N'3365736589', N'leví_renato.lozano@lozano.leví_renato@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1115, N'Medina', N'Nuria Noa', 25500026, N'F', CAST(N'1991-01-25' AS Date), N'3365365378', N'nuria_noa.medina@medina.nuria_noa@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1116, N'Morales', N'Ainara Vega', 25500027, N'F', CAST(N'1991-01-05' AS Date), N'3364544613', N'ainara_vega.morales@morales.ainara_vega@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1117, N'Gutiérrez', N'Claudia África', 25500028, N'F', CAST(N'1991-01-20' AS Date), N'3367948020', N'claudia_África.gutiérrez@gutiérrez.claudia_áfrica@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1118, N'Moya', N'Carmen Ainhoa', 25500029, N'F', CAST(N'1991-01-17' AS Date), N'3365409756', N'carmen_ainhoa.moya@moya.carmen_ainhoa@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1119, N'Lozano', N'Andrea Aurora', 25500030, N'F', CAST(N'1991-01-20' AS Date), N'3367862097', N'andrea_aurora.lozano@lozano.andrea_aurora@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1120, N'Soler', N'Mia Lara', 25500031, N'F', CAST(N'1991-01-06' AS Date), N'3368911710', N'mia_lara.soler@soler.mia_lara@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1121, N'Méndez', N'Juan Marcos', 25500032, N'M', CAST(N'1991-01-12' AS Date), N'3365646282', N'juan_marcos.méndez@méndez.juan_marcos@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1122, N'Iglesias', N'Nahia Lina', 25500033, N'F', CAST(N'1991-01-27' AS Date), N'3369116338', N'nahia_lina.iglesias@iglesias.nahia_lina@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1123, N'Flores', N'Laura Cristina', 25500034, N'F', CAST(N'1991-01-23' AS Date), N'3365896037', N'laura_cristina.flores@flores.laura_cristina@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1124, N'Cano', N'Gabriela Alba', 25500035, N'F', CAST(N'1991-01-24' AS Date), N'3364000430', N'gabriela_alba.cano@cano.gabriela_alba@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1125, N'Prieto', N'Darío Baltasar', 25500036, N'M', CAST(N'1991-01-20' AS Date), N'3363258876', N'darío_baltasar.prieto@prieto.darío_baltasar@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1126, N'Crespo', N'Ahzià Jaír de Galaad', 25500037, N'M', CAST(N'1991-01-21' AS Date), N'3367314905', N'ahzià_jaír_de_galaad.crespo@crespo.ahzià_jaír_de_galaad@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1127, N'Sanz', N'Arlet Nour', 25500038, N'F', CAST(N'1991-01-12' AS Date), N'3368307049', N'arlet_nour.sanz@sanz.arlet_nour@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1128, N'Martínez', N'Adara Irene', 25500039, N'F', CAST(N'1991-01-11' AS Date), N'3363601684', N'adara_irene.martínez@martínez.adara_irene@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1129, N'Roman', N'Marina Irene', 25500040, N'F', CAST(N'1991-01-15' AS Date), N'3366055162', N'marina_irene.roman@roman.marina_irene@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1130, N'Soto', N'Marta Alma', 25500041, N'F', CAST(N'1991-01-14' AS Date), N'3369569824', N'marta_alma.soto@soto.marta_alma@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1131, N'Ibáñez', N'Berta Emma', 25500042, N'F', CAST(N'1991-01-19' AS Date), N'3363797396', N'berta_emma.ibáñez@ibáñez.berta_emma@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1132, N'Vázquez', N'Carla Vera', 25500043, N'F', CAST(N'1991-01-29' AS Date), N'3363841495', N'carla_vera.vázquez@vázquez.carla_vera@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1133, N'Gómez', N'Baltasar Caín', 25500044, N'M', CAST(N'1991-01-30' AS Date), N'3368656993', N'baltasar_caín.gómez@gómez.baltasar_caín@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1134, N'Ibáñez', N'Elsa Ángela', 25500045, N'F', CAST(N'1991-01-15' AS Date), N'3364022492', N'elsa_Ángela.ibáñez@ibáñez.elsa_ángela@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1135, N'Cortés', N'Efraín Mateo', 25500046, N'M', CAST(N'1991-01-14' AS Date), N'3368992220', N'efraín_mateo.cortés@cortés.efraín_mateo@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1136, N'Sanz', N'Cloe Leyre', 25500047, N'F', CAST(N'1991-01-20' AS Date), N'3369384254', N'cloe_leyre.sanz@sanz.cloe_leyre@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1137, N'Ortiz', N'Alicia Mia', 25500048, N'F', CAST(N'1991-01-11' AS Date), N'3368851743', N'alicia_mia.ortiz@ortiz.alicia_mia@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1138, N'León', N'India Celia', 25500049, N'F', CAST(N'1991-01-09' AS Date), N'3369834457', N'india_celia.león@león.india_celia@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1139, N'Diez', N'Lucas Felipe', 25500050, N'M', CAST(N'1991-01-11' AS Date), N'3363916409', N'lucas_felipe.diez@diez.lucas_felipe@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1140, N'Herrera', N'Labán Jacob', 25500051, N'M', CAST(N'1991-01-24' AS Date), N'3366256114', N'labán_jacob.herrera@herrera.labán_jacob@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1141, N'Montero', N'Marduk Rafael', 25500052, N'M', CAST(N'1991-01-02' AS Date), N'3368180432', N'marduk_rafael.montero@montero.marduk_rafael@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1142, N'Hidalgo', N'Demócrito José', 25500053, N'M', CAST(N'1991-01-02' AS Date), N'3367698822', N'demócrito_josé.hidalgo@hidalgo.demócrito_josé@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1143, N'Medina', N'Jehoram Ashur', 25500054, N'M', CAST(N'1991-01-30' AS Date), N'3369540475', N'jehoram_ashur.medina@medina.jehoram_ashur@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1144, N'Diez', N'Abraham Jared', 25500055, N'M', CAST(N'1991-01-15' AS Date), N'3364843862', N'abraham_jared.diez@diez.abraham_jared@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1145, N'Santiago', N'Adán Ahzià', 25500056, N'M', CAST(N'1991-01-18' AS Date), N'3363392399', N'adán_ahzià.santiago@santiago.adán_ahzià@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1146, N'Rodríguez', N'Lucas Mateo', 25500057, N'M', CAST(N'1991-01-07' AS Date), N'3368521021', N'lucas_mateo.rodríguez@rodríguez.lucas_mateo@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1147, N'Pérez', N'Inés Candela', 25500058, N'F', CAST(N'1991-01-27' AS Date), N'3368017587', N'inés_candela.pérez@pérez.inés_candela@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1148, N'Domínguez', N'Clara Alba', 25500059, N'F', CAST(N'1991-01-10' AS Date), N'3367939367', N'clara_alba.domínguez@domínguez.clara_alba@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1149, N'Díaz', N'Acab Demócrito', 25500060, N'M', CAST(N'1991-01-09' AS Date), N'3369251265', N'acab_demócrito.díaz@díaz.acab_demócrito@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1150, N'Vidal', N'Ainhoa Diana', 25500061, N'F', CAST(N'1991-01-22' AS Date), N'3365384661', N'ainhoa_diana.vidal@vidal.ainhoa_diana@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1151, N'Alonso', N'Jaír de Galaad Abdiel', 25500062, N'M', CAST(N'1991-01-13' AS Date), N'3365169478', N'jaír_de_galaad_abdiel.alonso@alonso.jaír_de_galaad_abdiel@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1152, N'Sanz', N'Amira Blanca', 25500063, N'F', CAST(N'1991-01-27' AS Date), N'3366639120', N'amira_blanca.sanz@sanz.amira_blanca@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1153, N'Romero', N'Ainara Iria', 25500064, N'F', CAST(N'1991-01-14' AS Date), N'3366109232', N'ainara_iria.romero@romero.ainara_iria@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1154, N'Calvo', N'Gala Nuria', 25500065, N'F', CAST(N'1991-01-13' AS Date), N'3363032452', N'gala_nuria.calvo@calvo.gala_nuria@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1155, N'Castro', N'Gabriel Esteban', 25500066, N'M', CAST(N'1991-01-28' AS Date), N'3363310069', N'gabriel_esteban.castro@castro.gabriel_esteban@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1156, N'Montero', N'Celia Azahara', 25500067, N'F', CAST(N'1991-01-22' AS Date), N'3366827075', N'celia_azahara.montero@montero.celia_azahara@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1157, N'Cortés', N'Jonás Efraín', 25500068, N'M', CAST(N'1991-01-05' AS Date), N'3368197547', N'jonás_efraín.cortés@cortés.jonás_efraín@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1158, N'Soto', N'Mia Julia', 25500069, N'F', CAST(N'1991-01-03' AS Date), N'3365493732', N'mia_julia.soto@soto.mia_julia@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1159, N'Navarro', N'Gaspar José', 25500070, N'M', CAST(N'1991-01-04' AS Date), N'3365892668', N'gaspar_josé.navarro@navarro.gaspar_josé@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1160, N'Sanz', N'Laia Alma', 25500071, N'F', CAST(N'1991-01-25' AS Date), N'3365211238', N'laia_alma.sanz@sanz.laia_alma@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1161, N'Rivera', N'Beltrán Julio', 25500072, N'M', CAST(N'1991-01-13' AS Date), N'3363720103', N'beltrán_julio.rivera@rivera.beltrán_julio@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1162, N'Lorenzo', N'Dámaso Mateo', 25500073, N'M', CAST(N'1991-01-12' AS Date), N'3365982910', N'dámaso_mateo.lorenzo@lorenzo.dámaso_mateo@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1163, N'Moreno', N'Isaías Baltasar', 25500074, N'M', CAST(N'1991-01-05' AS Date), N'3364830412', N'isaías_baltasar.moreno@moreno.isaías_baltasar@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1164, N'Cano', N'Salomón Guido', 25500075, N'M', CAST(N'1991-01-11' AS Date), N'3365377765', N'salomón_guido.cano@cano.salomón_guido@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1165, N'Castro', N'Samuel Esteban', 25500076, N'M', CAST(N'1991-01-21' AS Date), N'3369059238', N'samuel_esteban.castro@castro.samuel_esteban@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1166, N'Cabrera', N'Felipe Agustín', 25500077, N'M', CAST(N'1991-01-21' AS Date), N'3366701411', N'felipe_agustín.cabrera@cabrera.felipe_agustín@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1167, N'Diez', N'Rafael Guido', 25500078, N'M', CAST(N'1991-01-17' AS Date), N'3363473718', N'rafael_guido.diez@diez.rafael_guido@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1168, N'Méndez', N'Miguel Homero', 25500079, N'M', CAST(N'1991-01-03' AS Date), N'3368788445', N'miguel_homero.méndez@méndez.miguel_homero@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1169, N'Guerrero', N'Bartolomé Uzías', 25500080, N'M', CAST(N'1991-01-23' AS Date), N'3363628820', N'bartolomé_uzías.guerrero@guerrero.bartolomé_uzías@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1170, N'Iglesias', N'Leví Homero', 25500081, N'M', CAST(N'1991-01-21' AS Date), N'3363224276', N'leví_homero.iglesias@iglesias.leví_homero@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1171, N'Campos', N' Lola', 25500082, N'F', CAST(N'1991-01-12' AS Date), N'3368931779', N'_lola.campos@campos._lola@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1172, N'Bravo', N'Sergio Demócrito', 25500083, N'M', CAST(N'1991-01-21' AS Date), N'3366916807', N'sergio_demócrito.bravo@bravo.sergio_demócrito@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1173, N'Nieto', N'Édgar Rafael', 25500084, N'M', CAST(N'1991-01-22' AS Date), N'3363356462', N'Édgar_rafael.nieto@nieto.édgar_rafael@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1174, N'Molina', N'Rocío Ainara', 25500085, N'F', CAST(N'1991-01-16' AS Date), N'3366928665', N'rocío_ainara.molina@molina.rocío_ainara@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1175, N'López', N'Macarena Julia', 25500086, N'F', CAST(N'1991-01-07' AS Date), N'3364624287', N'macarena_julia.lópez@lópez.macarena_julia@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1176, N'Martín', N'Andrés David', 25500087, N'M', CAST(N'1991-01-06' AS Date), N'3364234914', N'andrés_david.martín@martín.andrés_david@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1177, N'Gallardo', N'Set Lucas', 25500088, N'M', CAST(N'1991-01-24' AS Date), N'3366655478', N'set_lucas.gallardo@gallardo.set_lucas@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1178, N'Sánchez', N'Daniela Candela', 25500089, N'F', CAST(N'1991-01-16' AS Date), N'3367395534', N'daniela_candela.sánchez@sánchez.daniela_candela@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1179, N'Flores', N'Olivia Macarena', 25500090, N'F', CAST(N'1991-01-12' AS Date), N'3365356994', N'olivia_macarena.flores@flores.olivia_macarena@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1180, N'Giménez', N'Elena Marta', 25500091, N'F', CAST(N'1991-01-04' AS Date), N'3364663141', N'elena_marta.giménez@giménez.elena_marta@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1181, N'Nuñez', N'Marina Manuela', 25500092, N'F', CAST(N'1991-01-10' AS Date), N'3365073866', N'marina_manuela.nuñez@nuñez.marina_manuela@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1182, N'Peña', N'Nahia Carolina', 25500093, N'F', CAST(N'1991-01-14' AS Date), N'3367000169', N'nahia_carolina.peña@peña.nahia_carolina@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1183, N'López', N'José Benjamín', 25500094, N'M', CAST(N'1991-01-14' AS Date), N'3368267911', N'josé_benjamín.lópez@lópez.josé_benjamín@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1184, N'Blanco', N'Beltrán Guido', 25500095, N'M', CAST(N'1991-01-24' AS Date), N'3363218108', N'beltrán_guido.blanco@blanco.beltrán_guido@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1185, N'Martín', N'Aina María', 25500096, N'F', CAST(N'1991-01-21' AS Date), N'3363687529', N'aina_maría.martín@martín.aina_maría@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1186, N'Arias', N' Inés', 25500097, N'F', CAST(N'1991-01-01' AS Date), N'3365007340', N'_inés.arias@arias._inés@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1187, N'Muñoz', N'Inés África', 25500098, N'F', CAST(N'1991-01-29' AS Date), N'3367745894', N'inés_África.muñoz@muñoz.inés_áfrica@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1188, N'Martín', N'Renato Isaías', 25500099, N'M', CAST(N'1991-01-27' AS Date), N'3367378787', N'renato_isaías.martín@martín.renato_isaías@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1189, N'Soler', N'Leyre Jimena', 26000001, N'F', CAST(N'1992-01-28' AS Date), N'3368638175', N'leyre_jimena.soler@soler.leyre_jimena@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1190, N'Herrera', N'Elías Caín', 26000002, N'M', CAST(N'1992-01-20' AS Date), N'3366097009', N'elías_caín.herrera@herrera.elías_caín@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1191, N'León', N'Triana Berta', 26000003, N'F', CAST(N'1992-01-17' AS Date), N'3368296908', N'triana_berta.león@león.triana_berta@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1192, N'Delgado', N'Laia Lola', 26000004, N'F', CAST(N'1992-01-29' AS Date), N'3367081278', N'laia_lola.delgado@delgado.laia_lola@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1193, N'Álvarez', N'África Vega', 26000005, N'F', CAST(N'1992-01-09' AS Date), N'3364284866', N'África_vega.Álvarez@álvarez.áfrica_vega@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1194, N'Parra', N'Samuel Aram', 26000006, N'M', CAST(N'1992-01-30' AS Date), N'3364402379', N'samuel_aram.parra@parra.samuel_aram@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1195, N'Suárez', N'Ciro Lucas', 26000007, N'M', CAST(N'1992-01-02' AS Date), N'3363334689', N'ciro_lucas.suárez@suárez.ciro_lucas@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1196, N'Pastor', N'Daniela Naia', 26000008, N'F', CAST(N'1992-01-20' AS Date), N'3369132229', N'daniela_naia.pastor@pastor.daniela_naia@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1197, N'Rojas', N'Adriana Mara', 26000009, N'F', CAST(N'1992-01-20' AS Date), N'3367158410', N'adriana_mara.rojas@rojas.adriana_mara@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1198, N'Morales', N'Acab Ismael', 26000010, N'M', CAST(N'1992-01-03' AS Date), N'3366776479', N'acab_ismael.morales@morales.acab_ismael@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1199, N'Sánchez', N'Julio Leví', 26000011, N'M', CAST(N'1992-01-13' AS Date), N'3368154960', N'julio_leví.sánchez@sánchez.julio_leví@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1200, N'Hidalgo', N'Germán Gadiel', 26000012, N'M', CAST(N'1992-01-07' AS Date), N'3367999102', N'germán_gadiel.hidalgo@hidalgo.germán_gadiel@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1201, N'Morales', N'África Cristina', 26000013, N'F', CAST(N'1992-01-11' AS Date), N'3364175155', N'África_cristina.morales@morales.áfrica_cristina@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1202, N'Velasco', N'Caín Renato', 26000014, N'M', CAST(N'1992-01-16' AS Date), N'3367637575', N'caín_renato.velasco@velasco.caín_renato@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1203, N'Vidal', N'Samuel Mateo', 26000015, N'M', CAST(N'1992-01-23' AS Date), N'3365161999', N'samuel_mateo.vidal@vidal.samuel_mateo@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1204, N'Caballero', N'Francisco Tobías', 26000016, N'M', CAST(N'1992-01-17' AS Date), N'3367520741', N'francisco_tobías.caballero@caballero.francisco_tobías@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1205, N'Campos', N'Labán Tobías', 26000017, N'M', CAST(N'1992-01-20' AS Date), N'3365614736', N'labán_tobías.campos@campos.labán_tobías@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1206, N'Alonso', N'Andrea Cloe', 26000018, N'F', CAST(N'1992-01-24' AS Date), N'3369175304', N'andrea_cloe.alonso@alonso.andrea_cloe@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1207, N'Montero', N'Andrea Helena', 26000019, N'F', CAST(N'1992-01-27' AS Date), N'3368187003', N'andrea_helena.montero@montero.andrea_helena@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1208, N'Martínez', N'Julio Israel', 26000020, N'M', CAST(N'1992-01-05' AS Date), N'3363774533', N'julio_israel.martínez@martínez.julio_israel@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1209, N'Carmona', N'Lara Iria', 26000021, N'F', CAST(N'1992-01-07' AS Date), N'3368794822', N'lara_iria.carmona@carmona.lara_iria@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1210, N'Iglesias', N'Berta Lia', 26000022, N'F', CAST(N'1992-01-11' AS Date), N'3365588460', N'berta_lia.iglesias@iglesias.berta_lia@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1211, N'Romero', N'Natalia Amaia', 26000023, N'F', CAST(N'1992-01-20' AS Date), N'3364742947', N'natalia_amaia.romero@romero.natalia_amaia@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1212, N'Carmona', N'Nour Alma', 26000024, N'F', CAST(N'1992-01-10' AS Date), N'3369529019', N'nour_alma.carmona@carmona.nour_alma@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1213, N'Nuñez', N'Macarena Naia', 26000025, N'F', CAST(N'1992-01-12' AS Date), N'3365169913', N'macarena_naia.nuñez@nuñez.macarena_naia@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1214, N'Moreno', N'Omar Jaír de Galaad', 26000026, N'M', CAST(N'1992-01-13' AS Date), N'3364102587', N'omar_jaír_de_galaad.moreno@moreno.omar_jaír_de_galaad@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1215, N'Santana', N'José Jairo', 26000027, N'M', CAST(N'1992-01-17' AS Date), N'3367932009', N'josé_jairo.santana@santana.josé_jairo@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1216, N'Fernández', N'Mara Elena', 26000028, N'F', CAST(N'1992-01-09' AS Date), N'3367198719', N'mara_elena.fernández@fernández.mara_elena@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1217, N'Ortiz', N'Cayetana Ainhoa', 26000029, N'F', CAST(N'1992-01-07' AS Date), N'3365728955', N'cayetana_ainhoa.ortiz@ortiz.cayetana_ainhoa@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1218, N'Peña', N'Claudia Eva', 26000030, N'F', CAST(N'1992-01-12' AS Date), N'3366193706', N'claudia_eva.peña@peña.claudia_eva@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1219, N'González', N'Mara Nora', 26000031, N'F', CAST(N'1992-01-26' AS Date), N'3363018885', N'mara_nora.gonzález@gonzález.mara_nora@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1220, N'Nieto', N'Ismael Matías', 26000032, N'M', CAST(N'1992-01-06' AS Date), N'3368997400', N'ismael_matías.nieto@nieto.ismael_matías@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1221, N'Reyes', N'Candela Vera', 26000033, N'F', CAST(N'1992-01-07' AS Date), N'3368334951', N'candela_vera.reyes@reyes.candela_vera@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1222, N'Pascual', N'Samuel Tobías', 26000034, N'M', CAST(N'1992-01-10' AS Date), N'3363401851', N'samuel_tobías.pascual@pascual.samuel_tobías@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1223, N'Vázquez', N'Lia Noa', 26000035, N'F', CAST(N'1992-01-10' AS Date), N'3366456379', N'lia_noa.vázquez@vázquez.lia_noa@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1224, N'Ruiz', N'Berta Lina', 26000036, N'F', CAST(N'1992-01-04' AS Date), N'3367924850', N'berta_lina.ruiz@ruiz.berta_lina@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1225, N'Vázquez', N'Ariadna Lola', 26000037, N'F', CAST(N'1992-01-20' AS Date), N'3363159835', N'ariadna_lola.vázquez@vázquez.ariadna_lola@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1226, N'Reyes', N'Jiram Caleb', 26000038, N'M', CAST(N'1992-01-28' AS Date), N'3368091042', N'jiram_caleb.reyes@reyes.jiram_caleb@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1227, N'Nuñez', N'Joanix Israel', 26000039, N'M', CAST(N'1992-01-21' AS Date), N'3367592476', N'joanix_israel.nuñez@nuñez.joanix_israel@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1228, N'Gutiérrez', N'Vera Martina', 26000040, N'F', CAST(N'1992-01-08' AS Date), N'3368360060', N'vera_martina.gutiérrez@gutiérrez.vera_martina@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1229, N'Ramírez', N'Abdiel Eneas', 26000041, N'M', CAST(N'1992-01-22' AS Date), N'3364987539', N'abdiel_eneas.ramírez@ramírez.abdiel_eneas@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1230, N'Reyes', N'Candela Andrea', 26000042, N'F', CAST(N'1992-01-21' AS Date), N'3367621201', N'candela_andrea.reyes@reyes.candela_andrea@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1231, N'Cabrera', N'Matías Ahzià', 26000043, N'M', CAST(N'1992-01-23' AS Date), N'3367630322', N'matías_ahzià.cabrera@cabrera.matías_ahzià@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1232, N'Diez', N'Esteban Set', 26000044, N'M', CAST(N'1992-01-20' AS Date), N'3366975461', N'esteban_set.diez@diez.esteban_set@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1233, N'Crespo', N'Aram Eneas', 26000045, N'M', CAST(N'1992-01-07' AS Date), N'3364352000', N'aram_eneas.crespo@crespo.aram_eneas@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1234, N'Lozano', N'Abdiel Caleb', 26000046, N'M', CAST(N'1992-01-03' AS Date), N'3366895173', N'abdiel_caleb.lozano@lozano.abdiel_caleb@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1235, N'Soler', N'Lucas Alejandro', 26000047, N'M', CAST(N'1992-01-01' AS Date), N'3368887708', N'lucas_alejandro.soler@soler.lucas_alejandro@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1236, N'Cano', N'Carla Alicia', 26000048, N'F', CAST(N'1992-01-29' AS Date), N'3367097680', N'carla_alicia.cano@cano.carla_alicia@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1237, N'Montero', N'Triana Julieta', 26000049, N'F', CAST(N'1992-01-08' AS Date), N'3364940651', N'triana_julieta.montero@montero.triana_julieta@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1238, N'Martín', N'Ainara Carmen', 26000050, N'F', CAST(N'1992-01-01' AS Date), N'3368531745', N'ainara_carmen.martín@martín.ainara_carmen@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1239, N'Hidalgo', N'Laia Julia', 26000051, N'F', CAST(N'1992-01-17' AS Date), N'3368043017', N'laia_julia.hidalgo@hidalgo.laia_julia@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1240, N'Sanz', N'Clara Isabella', 26000052, N'F', CAST(N'1992-01-29' AS Date), N'3369350833', N'clara_isabella.sanz@sanz.clara_isabella@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1241, N'Delgado', N'David Jairo', 26000053, N'M', CAST(N'1992-01-13' AS Date), N'3364426116', N'david_jairo.delgado@delgado.david_jairo@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1242, N'Cruz', N'Celia Julia', 26000054, N'F', CAST(N'1992-01-26' AS Date), N'3369143155', N'celia_julia.cruz@cruz.celia_julia@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1243, N'García', N'Hugo Caín', 26000055, N'M', CAST(N'1992-01-23' AS Date), N'3368968902', N'hugo_caín.garcía@garcía.hugo_caín@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1244, N'Lozano', N'Zoe Amaia', 26000056, N'F', CAST(N'1992-01-22' AS Date), N'3369907940', N'zoe_amaia.lozano@lozano.zoe_amaia@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1245, N'Gallardo', N'Adara Adriana', 26000057, N'F', CAST(N'1992-01-27' AS Date), N'3368272089', N'adara_adriana.gallardo@gallardo.adara_adriana@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1246, N'Márquez', N'Elías Moisés', 26000058, N'M', CAST(N'1992-01-15' AS Date), N'3369784731', N'elías_moisés.márquez@márquez.elías_moisés@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1247, N'Carrasco', N'Candela Alba', 26000059, N'F', CAST(N'1992-01-15' AS Date), N'3367935768', N'candela_alba.carrasco@carrasco.candela_alba@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1248, N'Moreno', N'Ahzià Neftalí', 26000060, N'M', CAST(N'1992-01-26' AS Date), N'3366799458', N'ahzià_neftalí.moreno@moreno.ahzià_neftalí@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1249, N'Reyes', N'Paula Carmen', 26000061, N'F', CAST(N'1992-01-09' AS Date), N'3364925291', N'paula_carmen.reyes@reyes.paula_carmen@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1250, N'Gil', N'Jana Vera', 26000062, N'F', CAST(N'1992-01-25' AS Date), N'3365636345', N'jana_vera.gil@gil.jana_vera@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1251, N'Caballero', N'Abril Malak', 26000063, N'F', CAST(N'1992-01-05' AS Date), N'3368784687', N'abril_malak.caballero@caballero.abril_malak@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1252, N'Crespo', N'Pablo Joanix', 26000064, N'M', CAST(N'1992-01-13' AS Date), N'3365087553', N'pablo_joanix.crespo@crespo.pablo_joanix@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1253, N'Pérez', N'Marduk Jiram', 26000065, N'M', CAST(N'1992-01-27' AS Date), N'3369870115', N'marduk_jiram.pérez@pérez.marduk_jiram@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1254, N'Torres', N'Natalia Naia', 26000066, N'F', CAST(N'1992-01-13' AS Date), N'3368339628', N'natalia_naia.torres@torres.natalia_naia@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1255, N'Ramos', N'Marcos Jiram', 26000067, N'M', CAST(N'1992-01-15' AS Date), N'3368051235', N'marcos_jiram.ramos@ramos.marcos_jiram@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1256, N'Soler', N'Abril Natalia', 26000068, N'F', CAST(N'1992-01-27' AS Date), N'3369276055', N'abril_natalia.soler@soler.abril_natalia@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1257, N'Mora', N'Macarena Laia', 26000069, N'F', CAST(N'1992-01-23' AS Date), N'3364745825', N'macarena_laia.mora@mora.macarena_laia@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1258, N'Ferrer', N'Noa Cayetana', 26000070, N'F', CAST(N'1992-01-22' AS Date), N'3367674873', N'noa_cayetana.ferrer@ferrer.noa_cayetana@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1259, N'Vidal', N'Lemuel Julio', 26000071, N'M', CAST(N'1992-01-01' AS Date), N'3363149284', N'lemuel_julio.vidal@vidal.lemuel_julio@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1260, N'Carrasco', N'Claudia Aitana', 26000072, N'F', CAST(N'1992-01-01' AS Date), N'3363695665', N'claudia_aitana.carrasco@carrasco.claudia_aitana@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1261, N'Herrera', N'Omar Josué', 26000073, N'M', CAST(N'1992-01-19' AS Date), N'3369217784', N'omar_josué.herrera@herrera.omar_josué@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1262, N'Marin', N'Andrés Rafael', 26000074, N'M', CAST(N'1992-01-01' AS Date), N'3365978623', N'andrés_rafael.marin@marin.andrés_rafael@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1263, N'Arias', N'Lemuel Baltasar', 26000075, N'M', CAST(N'1992-01-20' AS Date), N'3364573513', N'lemuel_baltasar.arias@arias.lemuel_baltasar@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1264, N'Moya', N'Eliel Herodes', 26000076, N'M', CAST(N'1992-01-18' AS Date), N'3363090420', N'eliel_herodes.moya@moya.eliel_herodes@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1265, N'Alonso', N'Isabel Vega', 26000077, N'F', CAST(N'1992-01-17' AS Date), N'3367540703', N'isabel_vega.alonso@alonso.isabel_vega@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1266, N'Pascual', N'Leyre Carolina', 26000078, N'F', CAST(N'1992-01-03' AS Date), N'3367823576', N'leyre_carolina.pascual@pascual.leyre_carolina@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1267, N'Ortega', N'Lucas Demócrito', 26000079, N'M', CAST(N'1992-01-04' AS Date), N'3367178059', N'lucas_demócrito.ortega@ortega.lucas_demócrito@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1268, N'Sáez', N'Jehoram Neftalí', 26000080, N'M', CAST(N'1992-01-24' AS Date), N'3368788979', N'jehoram_neftalí.sáez@sáez.jehoram_neftalí@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1269, N'Vega', N'Gaspar Abel', 26000081, N'M', CAST(N'1992-01-28' AS Date), N'3363235601', N'gaspar_abel.vega@vega.gaspar_abel@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1270, N'Martínez', N'Laia Helena', 26000082, N'F', CAST(N'1992-01-14' AS Date), N'3365859603', N'laia_helena.martínez@martínez.laia_helena@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1271, N'Vega', N'Mar Alejandra', 26000083, N'F', CAST(N'1992-01-27' AS Date), N'3366727450', N'mar_alejandra.vega@vega.mar_alejandra@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1272, N'Parra', N'Jared Sergio', 26000084, N'M', CAST(N'1992-01-02' AS Date), N'3366272627', N'jared_sergio.parra@parra.jared_sergio@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1273, N'Hidalgo', N'Clara Valeria', 26000085, N'F', CAST(N'1992-01-03' AS Date), N'3366910649', N'clara_valeria.hidalgo@hidalgo.clara_valeria@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1274, N'Alonso', N'Alicia Nahia', 26000086, N'F', CAST(N'1992-01-07' AS Date), N'3367744307', N'alicia_nahia.alonso@alonso.alicia_nahia@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1275, N'Díaz', N'Elena Adriana', 26000087, N'F', CAST(N'1992-01-09' AS Date), N'3368796777', N'elena_adriana.díaz@díaz.elena_adriana@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1276, N'Lozano', N'Joaquín Noé', 26000088, N'M', CAST(N'1992-01-11' AS Date), N'3368228804', N'joaquín_noé.lozano@lozano.joaquín_noé@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1277, N'Moya', N'Blanca Martina', 26000089, N'F', CAST(N'1992-01-17' AS Date), N'3369958303', N'blanca_martina.moya@moya.blanca_martina@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1278, N'Cano', N'Candela Malak', 26000090, N'F', CAST(N'1992-01-06' AS Date), N'3366555845', N'candela_malak.cano@cano.candela_malak@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1279, N'Cano', N'Jeremías Aarón', 26000091, N'M', CAST(N'1992-01-09' AS Date), N'3369022160', N'jeremías_aarón.cano@cano.jeremías_aarón@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1280, N'Fernández', N'Abel Noé', 26000092, N'M', CAST(N'1992-01-10' AS Date), N'3364752498', N'abel_noé.fernández@fernández.abel_noé@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1281, N'Santana', N'Isabel Victoria', 26000093, N'F', CAST(N'1992-01-25' AS Date), N'3367053275', N'isabel_victoria.santana@santana.isabel_victoria@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1282, N'López', N'Abdiel Lemuel', 26000094, N'M', CAST(N'1992-01-17' AS Date), N'3368044100', N'abdiel_lemuel.lópez@lópez.abdiel_lemuel@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1283, N'Gallego', N'Cayetana Chloe', 26000095, N'F', CAST(N'1992-01-17' AS Date), N'3367841161', N'cayetana_chloe.gallego@gallego.cayetana_chloe@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1284, N'Diez', N'Dámaso Joaquín', 26000096, N'M', CAST(N'1992-01-30' AS Date), N'3363520073', N'dámaso_joaquín.diez@diez.dámaso_joaquín@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1285, N'Ferrer', N'Josué Rubén', 26000097, N'M', CAST(N'1992-01-07' AS Date), N'3364453298', N'josué_rubén.ferrer@ferrer.josué_rubén@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1286, N'Pascual', N'Alicia Zoe', 26000098, N'F', CAST(N'1992-01-29' AS Date), N'3364506941', N'alicia_zoe.pascual@pascual.alicia_zoe@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1287, N'Montero', N'Julieta Celia', 26000099, N'F', CAST(N'1992-01-30' AS Date), N'3364208758', N'julieta_celia.montero@montero.julieta_celia@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1288, N'Fernández', N'Caín Ahzià', 26500001, N'M', CAST(N'1993-01-14' AS Date), N'3365769113', N'caín_ahzià.fernández@fernández.caín_ahzià@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1289, N'Blanco', N'Noé Mateo', 26500002, N'M', CAST(N'1993-01-30' AS Date), N'3364262602', N'noé_mateo.blanco@blanco.noé_mateo@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1290, N'Delgado', N'Lucía África', 26500003, N'F', CAST(N'1993-01-11' AS Date), N'3368031131', N'lucía_África.delgado@delgado.lucía_áfrica@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1291, N'Parra', N'Esteban', 26500004, N'M', CAST(N'1993-01-16' AS Date), N'3364824079', N'esteban.parra@parra.esteban@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1292, N'Rodríguez', N'Luna Mar', 26500005, N'F', CAST(N'1993-01-18' AS Date), N'3363731371', N'luna_mar.rodríguez@rodríguez.luna_mar@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1293, N'Bravo', N'Acab Joaquín', 26500006, N'M', CAST(N'1993-01-12' AS Date), N'3369480256', N'acab_joaquín.bravo@bravo.acab_joaquín@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1294, N'Carrasco', N'Leyre Cristina', 26500007, N'F', CAST(N'1993-01-26' AS Date), N'3365363167', N'leyre_cristina.carrasco@carrasco.leyre_cristina@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1295, N'Nieto', N'Zoe Aina', 26500008, N'F', CAST(N'1993-01-07' AS Date), N'3366003085', N'zoe_aina.nieto@nieto.zoe_aina@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1296, N'Santos', N'Lia Nour', 26500009, N'F', CAST(N'1993-01-23' AS Date), N'3364134848', N'lia_nour.santos@santos.lia_nour@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1297, N'Romero', N'Cayetana Yasmín', 26500010, N'F', CAST(N'1993-01-14' AS Date), N'3363506481', N'cayetana_yasmín.romero@romero.cayetana_yasmín@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1298, N'Rojas', N'Salomón Naín', 26500011, N'M', CAST(N'1993-01-10' AS Date), N'3366242432', N'salomón_naín.rojas@rojas.salomón_naín@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1299, N'Roman', N'Elsa Rocío', 26500012, N'F', CAST(N'1993-01-18' AS Date), N'3367322259', N'elsa_rocío.roman@roman.elsa_rocío@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1300, N'Márquez', N'Mar Aroa', 26500013, N'F', CAST(N'1993-01-08' AS Date), N'3366441312', N'mar_aroa.márquez@márquez.mar_aroa@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1301, N'Serrano', N'Cayetana India', 26500014, N'F', CAST(N'1993-01-24' AS Date), N'3368781162', N'cayetana_india.serrano@serrano.cayetana_india@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1302, N'Hidalgo', N'Eva Nour', 26500015, N'F', CAST(N'1993-01-02' AS Date), N'3364178852', N'eva_nour.hidalgo@hidalgo.eva_nour@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1303, N'Muñoz', N'Vega Lina', 26500016, N'F', CAST(N'1993-01-19' AS Date), N'3364157190', N'vega_lina.muñoz@muñoz.vega_lina@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1304, N'Sáez', N'Nora Chloe', 26500017, N'F', CAST(N'1993-01-15' AS Date), N'3367247021', N'nora_chloe.sáez@sáez.nora_chloe@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1305, N'Suárez', N'Aurora Aina', 26500018, N'F', CAST(N'1993-01-01' AS Date), N'3365720830', N'aurora_aina.suárez@suárez.aurora_aina@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1306, N'Alonso', N'Sara Marina', 26500019, N'F', CAST(N'1993-01-20' AS Date), N'3368332084', N'sara_marina.alonso@alonso.sara_marina@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1307, N'Vargas', N'Daniel Esteban', 26500020, N'M', CAST(N'1993-01-11' AS Date), N'3364917308', N'daniel_esteban.vargas@vargas.daniel_esteban@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1308, N'Rojas', N'Aroa Celia', 26500021, N'F', CAST(N'1993-01-26' AS Date), N'3367866743', N'aroa_celia.rojas@rojas.aroa_celia@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1309, N'Gallardo', N'Ángela Iria', 26500022, N'F', CAST(N'1993-01-21' AS Date), N'3366809390', N'Ángela_iria.gallardo@gallardo.ángela_iria@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1310, N'Benitez', N'Baltasar Homero', 26500023, N'M', CAST(N'1993-01-15' AS Date), N'3364408083', N'baltasar_homero.benitez@benitez.baltasar_homero@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1311, N'Martínez', N'Leire Alejandra', 26500024, N'F', CAST(N'1993-01-07' AS Date), N'3369617359', N'leire_alejandra.martínez@martínez.leire_alejandra@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1312, N'Bravo', N'Abimael Bartolomé', 26500025, N'M', CAST(N'1993-01-02' AS Date), N'3367709265', N'abimael_bartolomé.bravo@bravo.abimael_bartolomé@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1313, N'Díaz', N'Lia Isabel', 26500026, N'F', CAST(N'1993-01-10' AS Date), N'3365592306', N'lia_isabel.díaz@díaz.lia_isabel@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1314, N'Pérez', N'Dámaso Isaías', 26500027, N'M', CAST(N'1993-01-01' AS Date), N'3366826491', N'dámaso_isaías.pérez@pérez.dámaso_isaías@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1315, N'Méndez', N'Zoe Lola', 26500028, N'F', CAST(N'1993-01-20' AS Date), N'3363768810', N'zoe_lola.méndez@méndez.zoe_lola@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1316, N'Díaz', N'Lemuel Abimael', 26500029, N'M', CAST(N'1993-01-23' AS Date), N'3366995786', N'lemuel_abimael.díaz@díaz.lemuel_abimael@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1317, N'Hidalgo', N'Elías Édgar', 26500030, N'M', CAST(N'1993-01-21' AS Date), N'3367619803', N'elías_Édgar.hidalgo@hidalgo.elías_édgar@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1318, N'Cabrera', N'Helena Sofía', 26500031, N'F', CAST(N'1993-01-08' AS Date), N'3368688237', N'helena_sofía.cabrera@cabrera.helena_sofía@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1319, N'Marin', N'Zoe India', 26500032, N'F', CAST(N'1993-01-30' AS Date), N'3364116132', N'zoe_india.marin@marin.zoe_india@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1320, N'Pascual', N'Ainhoa Noa', 26500033, N'F', CAST(N'1993-01-08' AS Date), N'3363118066', N'ainhoa_noa.pascual@pascual.ainhoa_noa@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1321, N'Prieto', N'Aurora Triana', 26500034, N'F', CAST(N'1993-01-17' AS Date), N'3365738797', N'aurora_triana.prieto@prieto.aurora_triana@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1322, N'Cortés', N'Ona Iria', 26500035, N'F', CAST(N'1993-01-14' AS Date), N'3366057403', N'ona_iria.cortés@cortés.ona_iria@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1323, N'Fuentes', N'Clara Irene', 26500036, N'F', CAST(N'1993-01-18' AS Date), N'3364617418', N'clara_irene.fuentes@fuentes.clara_irene@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1324, N'Nuñez', N'Beltrán Jairo', 26500037, N'M', CAST(N'1993-01-16' AS Date), N'3368875856', N'beltrán_jairo.nuñez@nuñez.beltrán_jairo@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1325, N'León', N'Leví Julio', 26500038, N'M', CAST(N'1993-01-14' AS Date), N'3368598764', N'leví_julio.león@león.leví_julio@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1326, N'Herrero', N'Cristina Vera', 26500039, N'F', CAST(N'1993-01-12' AS Date), N'3368872987', N'cristina_vera.herrero@herrero.cristina_vera@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1327, N'Sáez', N'Paula Alma', 26500040, N'F', CAST(N'1993-01-17' AS Date), N'3366599579', N'paula_alma.sáez@sáez.paula_alma@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1328, N'Soler', N'Ezequiel Lucas', 26500041, N'M', CAST(N'1993-01-05' AS Date), N'3364803714', N'ezequiel_lucas.soler@soler.ezequiel_lucas@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1329, N'Benitez', N'Jeremías Jonás', 26500042, N'M', CAST(N'1993-01-17' AS Date), N'3368721723', N'jeremías_jonás.benitez@benitez.jeremías_jonás@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1330, N'Álvarez', N'Baltasar Abdiel', 26500043, N'M', CAST(N'1993-01-15' AS Date), N'3365393034', N'baltasar_abdiel.Álvarez@álvarez.baltasar_abdiel@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1331, N'Diez', N'Ona Naia', 26500044, N'F', CAST(N'1993-01-20' AS Date), N'3367264115', N'ona_naia.diez@diez.ona_naia@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1332, N'Cruz', N'Sergio Neftalí', 26500045, N'M', CAST(N'1993-01-15' AS Date), N'3366111460', N'sergio_neftalí.cruz@cruz.sergio_neftalí@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1333, N'Reyes', N'Rafael Miguel', 26500046, N'M', CAST(N'1993-01-01' AS Date), N'3368672653', N'rafael_miguel.reyes@reyes.rafael_miguel@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1334, N'Santiago', N'Joanix Mateo', 26500047, N'M', CAST(N'1993-01-12' AS Date), N'3366884026', N'joanix_mateo.santiago@santiago.joanix_mateo@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1335, N'Moreno', N'Laura Azahara', 26500048, N'F', CAST(N'1993-01-29' AS Date), N'3364623699', N'laura_azahara.moreno@moreno.laura_azahara@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1336, N'Lorenzo', N'África India', 26500049, N'F', CAST(N'1993-01-26' AS Date), N'3368891944', N'África_india.lorenzo@lorenzo.áfrica_india@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1337, N'Roman', N'Valeria Gala', 26500050, N'F', CAST(N'1993-01-13' AS Date), N'3363679644', N'valeria_gala.roman@roman.valeria_gala@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1338, N'Castillo', N'Efraín Jared', 26500051, N'M', CAST(N'1993-01-23' AS Date), N'3366019342', N'efraín_jared.castillo@castillo.efraín_jared@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1339, N'Ibáñez', N'Félix Moisés', 26500052, N'M', CAST(N'1993-01-23' AS Date), N'3364228483', N'félix_moisés.ibáñez@ibáñez.félix_moisés@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1340, N'León', N'Aroa Chloe', 26500053, N'F', CAST(N'1993-01-15' AS Date), N'3368894994', N'aroa_chloe.león@león.aroa_chloe@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1341, N'Ortega', N'Daniela India', 26500054, N'F', CAST(N'1993-01-01' AS Date), N'3364960646', N'daniela_india.ortega@ortega.daniela_india@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1342, N'Soto', N'Omar Caín', 26500055, N'M', CAST(N'1993-01-26' AS Date), N'3364786443', N'omar_caín.soto@soto.omar_caín@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1343, N'Fuentes', N'Isabel Elena', 26500056, N'F', CAST(N'1993-01-16' AS Date), N'3366501557', N'isabel_elena.fuentes@fuentes.isabel_elena@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1344, N'Prieto', N'Julieta Isabel', 26500057, N'F', CAST(N'1993-01-11' AS Date), N'3364933122', N'julieta_isabel.prieto@prieto.julieta_isabel@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1345, N'Castillo', N'Ahzià Édgar', 26500058, N'M', CAST(N'1993-01-17' AS Date), N'3367255519', N'ahzià_Édgar.castillo@castillo.ahzià_édgar@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1346, N'Medina', N'Cayetana Mara', 26500059, N'F', CAST(N'1993-01-03' AS Date), N'3363541129', N'cayetana_mara.medina@medina.cayetana_mara@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1347, N'Benitez', N'Gala Vega', 26500060, N'F', CAST(N'1993-01-14' AS Date), N'3368269177', N'gala_vega.benitez@benitez.gala_vega@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1348, N'Guerrero', N'Alejandro Lucas', 26500061, N'M', CAST(N'1993-01-27' AS Date), N'3366130243', N'alejandro_lucas.guerrero@guerrero.alejandro_lucas@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1349, N'Prieto', N'África Isabella', 26500062, N'F', CAST(N'1993-01-11' AS Date), N'3363759791', N'África_isabella.prieto@prieto.áfrica_isabella@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1350, N'Cano', N'Eva Ana', 26500063, N'F', CAST(N'1993-01-29' AS Date), N'3365794425', N'eva_ana.cano@cano.eva_ana@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1351, N'Alonso', N'Ainara María', 26500064, N'F', CAST(N'1993-01-07' AS Date), N'3364667535', N'ainara_maría.alonso@alonso.ainara_maría@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1352, N'Santana', N'Hugo Herodes', 26500065, N'M', CAST(N'1993-01-12' AS Date), N'3366269024', N'hugo_herodes.santana@santana.hugo_herodes@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1353, N'Iglesias', N'Dámaso Aarón', 26500066, N'M', CAST(N'1993-01-20' AS Date), N'3364037544', N'dámaso_aarón.iglesias@iglesias.dámaso_aarón@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1354, N'Rubio', N'Gaspar Joanix', 26500067, N'M', CAST(N'1993-01-15' AS Date), N'3368102597', N'gaspar_joanix.rubio@rubio.gaspar_joanix@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1355, N'Hidalgo', N'Cloe Vera', 26500068, N'F', CAST(N'1993-01-05' AS Date), N'3366153154', N'cloe_vera.hidalgo@hidalgo.cloe_vera@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1356, N'Gutiérrez', N'Yasmín ', 26500069, N'F', CAST(N'1993-01-06' AS Date), N'3366537134', N'yasmín_.gutiérrez@gutiérrez.yasmín_@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1357, N'Caballero', N'Israel Guido', 26500070, N'M', CAST(N'1993-01-30' AS Date), N'3364971469', N'israel_guido.caballero@caballero.israel_guido@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1358, N'Vega', N'Martina Naia', 26500071, N'F', CAST(N'1993-01-18' AS Date), N'3368050934', N'martina_naia.vega@vega.martina_naia@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1359, N'Díaz', N'Naia Malak', 26500072, N'F', CAST(N'1993-01-21' AS Date), N'3368423181', N'naia_malak.díaz@díaz.naia_malak@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1360, N'Cabrera', N'Alicia Lola', 26500073, N'F', CAST(N'1993-01-15' AS Date), N'3368394412', N'alicia_lola.cabrera@cabrera.alicia_lola@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1361, N'Santana', N'Renato', 26500074, N'M', CAST(N'1993-01-09' AS Date), N'3363252713', N'renato.santana@santana.renato@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1362, N'Santana', N'Josué Édgar', 26500075, N'M', CAST(N'1993-01-16' AS Date), N'3368582999', N'josué_Édgar.santana@santana.josué_édgar@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1363, N'Vázquez', N'María Berta', 26500076, N'F', CAST(N'1993-01-12' AS Date), N'3367948291', N'maría_berta.vázquez@vázquez.maría_berta@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1364, N'Ferrer', N'Ana Gala', 26500077, N'F', CAST(N'1993-01-22' AS Date), N'3366933957', N'ana_gala.ferrer@ferrer.ana_gala@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1365, N'Soto', N'Eliseo Marduk', 26500078, N'M', CAST(N'1993-01-29' AS Date), N'3367970478', N'eliseo_marduk.soto@soto.eliseo_marduk@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1366, N'Parra', N'Caleb Eliel', 26500079, N'M', CAST(N'1993-01-22' AS Date), N'3364813362', N'caleb_eliel.parra@parra.caleb_eliel@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1367, N'Nuñez', N'Naia Cristina', 26500080, N'F', CAST(N'1993-01-20' AS Date), N'3363918239', N'naia_cristina.nuñez@nuñez.naia_cristina@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1368, N'Vega', N'Jaír de Galaad Aram', 26500081, N'M', CAST(N'1993-01-26' AS Date), N'3364446559', N'jaír_de_galaad_aram.vega@vega.jaír_de_galaad_aram@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1369, N'Mora', N'Lina Elena', 26500082, N'F', CAST(N'1993-01-10' AS Date), N'3363243576', N'lina_elena.mora@mora.lina_elena@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1370, N'Nuñez', N'Leví Labán', 26500083, N'M', CAST(N'1993-01-21' AS Date), N'3369679377', N'leví_labán.nuñez@nuñez.leví_labán@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1371, N'Pastor', N'Pablo Rubén', 26500084, N'M', CAST(N'1993-01-05' AS Date), N'3364341373', N'pablo_rubén.pastor@pastor.pablo_rubén@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1372, N'Vargas', N'Jehoram Jiram', 26500085, N'M', CAST(N'1993-01-05' AS Date), N'3364326475', N'jehoram_jiram.vargas@vargas.jehoram_jiram@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1373, N'Sanz', N'Elí Isaías', 26500086, N'M', CAST(N'1993-01-01' AS Date), N'3366476787', N'elí_isaías.sanz@sanz.elí_isaías@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1374, N'Cabrera', N'Ainhoa Yasmín', 26500087, N'F', CAST(N'1993-01-28' AS Date), N'3366814937', N'ainhoa_yasmín.cabrera@cabrera.ainhoa_yasmín@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1375, N'Martín', N'Iria Aroa', 26500088, N'F', CAST(N'1993-01-05' AS Date), N'3364978931', N'iria_aroa.martín@martín.iria_aroa@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1376, N'Mora', N'Jesús Labán', 26500089, N'M', CAST(N'1993-01-17' AS Date), N'3367925390', N'jesús_labán.mora@mora.jesús_labán@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1377, N'Vargas', N'Iria Ainara', 26500090, N'F', CAST(N'1993-01-04' AS Date), N'3364675515', N'iria_ainara.vargas@vargas.iria_ainara@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1378, N'Cortés', N'Édgar Hugo', 26500091, N'M', CAST(N'1993-01-08' AS Date), N'3367193984', N'Édgar_hugo.cortés@cortés.édgar_hugo@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1379, N'Parra', N'Candela Blanca', 26500092, N'F', CAST(N'1993-01-08' AS Date), N'3369127604', N'candela_blanca.parra@parra.candela_blanca@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1380, N'Rivera', N'Baltasar Abel', 26500093, N'M', CAST(N'1993-01-20' AS Date), N'3365565507', N'baltasar_abel.rivera@rivera.baltasar_abel@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1381, N'Sanz', N'Nora Amira', 26500094, N'F', CAST(N'1993-01-15' AS Date), N'3364463725', N'nora_amira.sanz@sanz.nora_amira@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1382, N'Gallardo', N'África Carla', 26500095, N'F', CAST(N'1993-01-05' AS Date), N'3364859882', N'África_carla.gallardo@gallardo.áfrica_carla@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1383, N'Serrano', N'Isabella Gabriela', 26500096, N'F', CAST(N'1993-01-02' AS Date), N'3363965453', N'isabella_gabriela.serrano@serrano.isabella_gabriela@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1384, N'Nieto', N'Lola Irene', 26500097, N'F', CAST(N'1993-01-01' AS Date), N'3367481243', N'lola_irene.nieto@nieto.lola_irene@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1385, N'Márquez', N'Tobías Noé', 26500098, N'M', CAST(N'1993-01-15' AS Date), N'3363099097', N'tobías_noé.márquez@márquez.tobías_noé@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1386, N'González', N'Jana Daniela', 26500099, N'F', CAST(N'1993-01-13' AS Date), N'3364682016', N'jana_daniela.gonzález@gonzález.jana_daniela@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1387, N'Vargas', N'Isaías Herodes', 27000001, N'M', CAST(N'1994-01-13' AS Date), N'3369024312', N'isaías_herodes.vargas@vargas.isaías_herodes@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1388, N'Vargas', N'Acab Joanix', 27000002, N'M', CAST(N'1994-01-12' AS Date), N'3369736771', N'acab_joanix.vargas@vargas.acab_joanix@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1389, N'Duran', N'Olivia India', 27000003, N'F', CAST(N'1994-01-17' AS Date), N'3369041469', N'olivia_india.duran@duran.olivia_india@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1390, N'Giménez', N'Alma Leyre', 27000004, N'F', CAST(N'1994-01-07' AS Date), N'3366504918', N'alma_leyre.giménez@giménez.alma_leyre@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1391, N'Ramírez', N'Jana Clara', 27000005, N'F', CAST(N'1994-01-06' AS Date), N'3366116072', N'jana_clara.ramírez@ramírez.jana_clara@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1392, N'Santos', N'Neftalí Matías', 27000006, N'M', CAST(N'1994-01-02' AS Date), N'3367767779', N'neftalí_matías.santos@santos.neftalí_matías@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1393, N'Campos', N'Luna Leyre', 27000007, N'F', CAST(N'1994-01-23' AS Date), N'3369622058', N'luna_leyre.campos@campos.luna_leyre@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1394, N'Ruiz', N'Noé Ciro', 27000008, N'M', CAST(N'1994-01-13' AS Date), N'3367818518', N'noé_ciro.ruiz@ruiz.noé_ciro@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1395, N'Vicente', N'Nahia Carla', 27000009, N'F', CAST(N'1994-01-03' AS Date), N'3367723913', N'nahia_carla.vicente@vicente.nahia_carla@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1396, N'Suárez', N'Dámaso José', 27000010, N'M', CAST(N'1994-01-08' AS Date), N'3364304483', N'dámaso_josé.suárez@suárez.dámaso_josé@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1397, N'Mora', N'Édgar Jairo', 27000011, N'M', CAST(N'1994-01-19' AS Date), N'3369595839', N'Édgar_jairo.mora@mora.édgar_jairo@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1398, N'Calvo', N'Ainhoa Eva', 27000012, N'F', CAST(N'1994-01-10' AS Date), N'3364485252', N'ainhoa_eva.calvo@calvo.ainhoa_eva@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1399, N'Ferrer', N'Fabián Ciro', 27000013, N'M', CAST(N'1994-01-25' AS Date), N'3368629278', N'fabián_ciro.ferrer@ferrer.fabián_ciro@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1400, N'Ramos', N'Zoe Candela', 27000014, N'F', CAST(N'1994-01-03' AS Date), N'3364983076', N'zoe_candela.ramos@ramos.zoe_candela@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1401, N'Roman', N'Mar Candela', 27000015, N'F', CAST(N'1994-01-12' AS Date), N'3369569370', N'mar_candela.roman@roman.mar_candela@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1402, N'Torres', N' Ainara', 27000016, N'F', CAST(N'1994-01-25' AS Date), N'3365010663', N'_ainara.torres@torres._ainara@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1403, N'Ramos', N'Malak Aurora', 27000017, N'F', CAST(N'1994-01-03' AS Date), N'3369624551', N'malak_aurora.ramos@ramos.malak_aurora@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1404, N'Garrido', N'Isabella Claudia', 27000018, N'F', CAST(N'1994-01-04' AS Date), N'3364667536', N'isabella_claudia.garrido@garrido.isabella_claudia@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1405, N'Moya', N'Mia Natalia', 27000019, N'F', CAST(N'1994-01-18' AS Date), N'3368088053', N'mia_natalia.moya@moya.mia_natalia@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1406, N'Santiago', N'Guido Jesús', 27000020, N'M', CAST(N'1994-01-13' AS Date), N'3364056231', N'guido_jesús.santiago@santiago.guido_jesús@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1407, N'Vázquez', N'Mara Julieta', 27000021, N'F', CAST(N'1994-01-16' AS Date), N'3364869550', N'mara_julieta.vázquez@vázquez.mara_julieta@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1408, N'Arias', N'Malak Ona', 27000022, N'F', CAST(N'1994-01-25' AS Date), N'3364455918', N'malak_ona.arias@arias.malak_ona@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1409, N'Ortega', N'Ainhoa Leyre', 27000023, N'F', CAST(N'1994-01-24' AS Date), N'3363786878', N'ainhoa_leyre.ortega@ortega.ainhoa_leyre@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1410, N'Reyes', N'María Aroa', 27000024, N'F', CAST(N'1994-01-11' AS Date), N'3368099074', N'maría_aroa.reyes@reyes.maría_aroa@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1411, N'Moreno', N'Eva Ona', 27000025, N'F', CAST(N'1994-01-29' AS Date), N'3368665860', N'eva_ona.moreno@moreno.eva_ona@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1412, N'Peña', N'Rafael Dámaso', 27000026, N'M', CAST(N'1994-01-18' AS Date), N'3365255964', N'rafael_dámaso.peña@peña.rafael_dámaso@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1413, N'Mora', N'Joaquín Agustín', 27000027, N'M', CAST(N'1994-01-23' AS Date), N'3369102554', N'joaquín_agustín.mora@mora.joaquín_agustín@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1414, N'Márquez', N'Moisés Guido', 27000028, N'M', CAST(N'1994-01-19' AS Date), N'3366375266', N'moisés_guido.márquez@márquez.moisés_guido@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1415, N'Duran', N'Zacarías Uzías', 27000029, N'M', CAST(N'1994-01-10' AS Date), N'3363261394', N'zacarías_uzías.duran@duran.zacarías_uzías@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1416, N'Hernández', N'Ana Noa', 27000030, N'F', CAST(N'1994-01-16' AS Date), N'3364339043', N'ana_noa.hernández@hernández.ana_noa@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1417, N'Herrera', N'Abraham Marcos', 27000031, N'M', CAST(N'1994-01-30' AS Date), N'3368152691', N'abraham_marcos.herrera@herrera.abraham_marcos@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1418, N'Parra', N'Tobías Nicolás', 27000032, N'M', CAST(N'1994-01-08' AS Date), N'3365373716', N'tobías_nicolás.parra@parra.tobías_nicolás@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1419, N'Rubio', N'Germán Dámaso', 27000033, N'M', CAST(N'1994-01-23' AS Date), N'3369242003', N'germán_dámaso.rubio@rubio.germán_dámaso@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1420, N'Reyes', N'Clara Elena', 27000034, N'F', CAST(N'1994-01-06' AS Date), N'3364763786', N'clara_elena.reyes@reyes.clara_elena@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1421, N'Fuentes', N'Cloe Iria', 27000035, N'F', CAST(N'1994-01-07' AS Date), N'3365327913', N'cloe_iria.fuentes@fuentes.cloe_iria@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1422, N'Álvarez', N'Arlet Lara', 27000036, N'F', CAST(N'1994-01-08' AS Date), N'3363606716', N'arlet_lara.Álvarez@álvarez.arlet_lara@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1423, N'Gómez', N'Jacob Saúl', 27000037, N'M', CAST(N'1994-01-04' AS Date), N'3365111433', N'jacob_saúl.gómez@gómez.jacob_saúl@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1424, N'Giménez', N'Isaías Baltasar', 27000038, N'M', CAST(N'1994-01-20' AS Date), N'3365912665', N'isaías_baltasar.giménez@giménez.isaías_baltasar@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1425, N'Cano', N'Joanix Omar', 27000039, N'M', CAST(N'1994-01-18' AS Date), N'3367461419', N'joanix_omar.cano@cano.joanix_omar@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1426, N'Rojas', N'Alejandra Vera', 27000040, N'F', CAST(N'1994-01-02' AS Date), N'3364460615', N'alejandra_vera.rojas@rojas.alejandra_vera@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1427, N'Roman', N'Simón Marduk', 27000041, N'M', CAST(N'1994-01-26' AS Date), N'3364280673', N'simón_marduk.roman@roman.simón_marduk@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1428, N'Ortega', N'Isabella Chloe', 27000042, N'F', CAST(N'1994-01-01' AS Date), N'3365546460', N'isabella_chloe.ortega@ortega.isabella_chloe@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1429, N'Ferrer', N'Francisco Neftalí', 27000043, N'M', CAST(N'1994-01-13' AS Date), N'3363542670', N'francisco_neftalí.ferrer@ferrer.francisco_neftalí@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1430, N'Flores', N'Jana Lina', 27000044, N'F', CAST(N'1994-01-29' AS Date), N'3365328938', N'jana_lina.flores@flores.jana_lina@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1431, N'Soto', N'Amira Isabella', 27000045, N'F', CAST(N'1994-01-09' AS Date), N'3365049644', N'amira_isabella.soto@soto.amira_isabella@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1432, N'Marin', N'María Paula', 27000046, N'F', CAST(N'1994-01-24' AS Date), N'3366974489', N'maría_paula.marin@marin.maría_paula@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1433, N'Gallardo', N'Simón Nicolás', 27000047, N'M', CAST(N'1994-01-27' AS Date), N'3369532451', N'simón_nicolás.gallardo@gallardo.simón_nicolás@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1434, N'Suárez', N'Leire Aina', 27000048, N'F', CAST(N'1994-01-05' AS Date), N'3368977793', N'leire_aina.suárez@suárez.leire_aina@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1435, N'Iglesias', N'Neftalí Samuel', 27000049, N'M', CAST(N'1994-01-01' AS Date), N'3366570832', N'neftalí_samuel.iglesias@iglesias.neftalí_samuel@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1436, N'Castillo', N'Caleb Gadiel', 27000050, N'M', CAST(N'1994-01-21' AS Date), N'3367143186', N'caleb_gadiel.castillo@castillo.caleb_gadiel@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1437, N'Gallardo', N'Gabriela Elsa', 27000051, N'F', CAST(N'1994-01-06' AS Date), N'3365358026', N'gabriela_elsa.gallardo@gallardo.gabriela_elsa@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1438, N'Navarro', N'Lina Valeria', 27000052, N'F', CAST(N'1994-01-11' AS Date), N'3365125553', N'lina_valeria.navarro@navarro.lina_valeria@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1439, N'Vega', N'Emma África', 27000053, N'F', CAST(N'1994-01-16' AS Date), N'3367347019', N'emma_África.vega@vega.emma_áfrica@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1440, N'Ibáñez', N'Lola Nora', 27000054, N'F', CAST(N'1994-01-11' AS Date), N'3369793760', N'lola_nora.ibáñez@ibáñez.lola_nora@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1441, N'Iglesias', N'Adara Valentina', 27000055, N'F', CAST(N'1994-01-13' AS Date), N'3367040490', N'adara_valentina.iglesias@iglesias.adara_valentina@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1442, N'Gómez', N'Mar Cloe', 27000056, N'F', CAST(N'1994-01-01' AS Date), N'3368557784', N'mar_cloe.gómez@gómez.mar_cloe@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1443, N'Álvarez', N'Hugo Acab', 27000057, N'M', CAST(N'1994-01-29' AS Date), N'3367480389', N'hugo_acab.Álvarez@álvarez.hugo_acab@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1444, N'Moreno', N'Isaac Fabián', 27000058, N'M', CAST(N'1994-01-03' AS Date), N'3368917409', N'isaac_fabián.moreno@moreno.isaac_fabián@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1445, N'Santana', N'Ismael Herodes', 27000059, N'M', CAST(N'1994-01-21' AS Date), N'3369395277', N'ismael_herodes.santana@santana.ismael_herodes@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1446, N'Nuñez', N'Renato Neftalí', 27000060, N'M', CAST(N'1994-01-04' AS Date), N'3367723614', N'renato_neftalí.nuñez@nuñez.renato_neftalí@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1447, N'Cruz', N'Ángela Candela', 27000061, N'F', CAST(N'1994-01-23' AS Date), N'3365459772', N'Ángela_candela.cruz@cruz.ángela_candela@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1448, N'Aguilar', N'Demócrito Naín', 27000062, N'M', CAST(N'1994-01-24' AS Date), N'3364281156', N'demócrito_naín.aguilar@aguilar.demócrito_naín@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1449, N'Gallego', N'Carlota Lina', 27000063, N'F', CAST(N'1994-01-26' AS Date), N'3369221708', N'carlota_lina.gallego@gallego.carlota_lina@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1450, N'Lorenzo', N'Julio Abel', 27000064, N'M', CAST(N'1994-01-02' AS Date), N'3364266538', N'julio_abel.lorenzo@lorenzo.julio_abel@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1451, N'Molina', N'Victoria India', 27000065, N'F', CAST(N'1994-01-17' AS Date), N'3366621677', N'victoria_india.molina@molina.victoria_india@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1452, N'Gallardo', N'Joanix Salomón', 27000066, N'M', CAST(N'1994-01-02' AS Date), N'3365276622', N'joanix_salomón.gallardo@gallardo.joanix_salomón@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1453, N'Gallego', N'Emma Ainhoa', 27000067, N'F', CAST(N'1994-01-05' AS Date), N'3368533271', N'emma_ainhoa.gallego@gallego.emma_ainhoa@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1454, N'Navarro', N'Aitana Amaia', 27000068, N'F', CAST(N'1994-01-19' AS Date), N'3366278850', N'aitana_amaia.navarro@navarro.aitana_amaia@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1455, N'Ruiz', N'Joanix Agustín', 27000069, N'M', CAST(N'1994-01-26' AS Date), N'3363508082', N'joanix_agustín.ruiz@ruiz.joanix_agustín@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1456, N'Vargas', N'Ainara Jimena', 27000070, N'F', CAST(N'1994-01-03' AS Date), N'3367837754', N'ainara_jimena.vargas@vargas.ainara_jimena@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1457, N'Romero', N'Lara Clara', 27000071, N'F', CAST(N'1994-01-26' AS Date), N'3364454088', N'lara_clara.romero@romero.lara_clara@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1458, N'Sanz', N'Celia Valentina', 27000072, N'F', CAST(N'1994-01-06' AS Date), N'3366296870', N'celia_valentina.sanz@sanz.celia_valentina@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1459, N'Arias', N'Luna Nerea', 27000073, N'F', CAST(N'1994-01-29' AS Date), N'3364943641', N'luna_nerea.arias@arias.luna_nerea@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1460, N'Duran', N'Vera Malak', 27000074, N'F', CAST(N'1994-01-18' AS Date), N'3365697570', N'vera_malak.duran@duran.vera_malak@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1461, N'Morales', N'Lemuel Gabriel', 27000075, N'M', CAST(N'1994-01-07' AS Date), N'3364908619', N'lemuel_gabriel.morales@morales.lemuel_gabriel@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1462, N'Campos', N'Herodes Elías', 27000076, N'M', CAST(N'1994-01-08' AS Date), N'3365318118', N'herodes_elías.campos@campos.herodes_elías@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1463, N'Méndez', N'Germán Zacarías', 27000077, N'M', CAST(N'1994-01-14' AS Date), N'3365834477', N'germán_zacarías.méndez@méndez.germán_zacarías@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1464, N'Rojas', N'Alba Aina', 27000078, N'F', CAST(N'1994-01-06' AS Date), N'3363872961', N'alba_aina.rojas@rojas.alba_aina@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1465, N'Moya', N'Jana María', 27000079, N'F', CAST(N'1994-01-26' AS Date), N'3363735469', N'jana_maría.moya@moya.jana_maría@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1466, N'Ibáñez', N'Gadiel Aarón', 27000080, N'M', CAST(N'1994-01-21' AS Date), N'3369463073', N'gadiel_aarón.ibáñez@ibáñez.gadiel_aarón@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1467, N'Ramírez', N'Chloe Irene', 27000081, N'F', CAST(N'1994-01-11' AS Date), N'3364573106', N'chloe_irene.ramírez@ramírez.chloe_irene@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1468, N'Iglesias', N'Elsa Rocío', 27000082, N'F', CAST(N'1994-01-27' AS Date), N'3365112871', N'elsa_rocío.iglesias@iglesias.elsa_rocío@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1469, N'Díaz', N'Alma Lara', 27000083, N'F', CAST(N'1994-01-20' AS Date), N'3365549492', N'alma_lara.díaz@díaz.alma_lara@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1470, N'Herrera', N'Gabriela Elsa', 27000084, N'F', CAST(N'1994-01-02' AS Date), N'3366894059', N'gabriela_elsa.herrera@herrera.gabriela_elsa@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1471, N'Sánchez', N'Eliel Saúl', 27000085, N'M', CAST(N'1994-01-03' AS Date), N'3369578997', N'eliel_saúl.sánchez@sánchez.eliel_saúl@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1472, N'Mora', N'Jesús Adán', 27000086, N'M', CAST(N'1994-01-09' AS Date), N'3366556703', N'jesús_adán.mora@mora.jesús_adán@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1473, N'Moreno', N'Efraín Renato', 27000087, N'M', CAST(N'1994-01-06' AS Date), N'3368306517', N'efraín_renato.moreno@moreno.efraín_renato@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1474, N'Santiago', N'Cloe Daniela', 27000088, N'F', CAST(N'1994-01-28' AS Date), N'3367582677', N'cloe_daniela.santiago@santiago.cloe_daniela@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1475, N'Velasco', N'Samuel Jairo', 27000089, N'M', CAST(N'1994-01-23' AS Date), N'3366334034', N'samuel_jairo.velasco@velasco.samuel_jairo@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1476, N'Vidal', N' Alba', 27000090, N'F', CAST(N'1994-01-13' AS Date), N'3363039234', N'_alba.vidal@vidal._alba@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1477, N'Caballero', N'Manuela Nuria', 27000091, N'F', CAST(N'1994-01-06' AS Date), N'3367352959', N'manuela_nuria.caballero@caballero.manuela_nuria@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1478, N'Diez', N'Elena Eva', 27000092, N'F', CAST(N'1994-01-01' AS Date), N'3365804702', N'elena_eva.diez@diez.elena_eva@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1479, N'Diez', N'Isaías Lemuel', 27000093, N'M', CAST(N'1994-01-28' AS Date), N'3367967394', N'isaías_lemuel.diez@diez.isaías_lemuel@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1480, N'Prieto', N'Julieta Aitana', 27000094, N'F', CAST(N'1994-01-05' AS Date), N'3364576977', N'julieta_aitana.prieto@prieto.julieta_aitana@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1481, N'Jimenez', N'Julia Ona', 27000095, N'F', CAST(N'1994-01-06' AS Date), N'3364708015', N'julia_ona.jimenez@jimenez.julia_ona@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1482, N'Domínguez', N'Josué Abdiel', 27000096, N'M', CAST(N'1994-01-29' AS Date), N'3365251892', N'josué_abdiel.domínguez@domínguez.josué_abdiel@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1483, N'Montero', N'Eliseo Pablo', 27000097, N'M', CAST(N'1994-01-15' AS Date), N'3364405864', N'eliseo_pablo.montero@montero.eliseo_pablo@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1484, N'Vargas', N'Naia Emma', 27000098, N'F', CAST(N'1994-01-01' AS Date), N'3365551155', N'naia_emma.vargas@vargas.naia_emma@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1485, N'Gutiérrez', N'Naia Leyre', 27000099, N'F', CAST(N'1994-01-29' AS Date), N'3364417091', N'naia_leyre.gutiérrez@gutiérrez.naia_leyre@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1486, N'Blanco', N'Carolina Alba', 27500001, N'F', CAST(N'1995-01-14' AS Date), N'3366503471', N'carolina_alba.blanco@blanco.carolina_alba@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1487, N'Jimenez', N'Abimael Gaspar', 27500002, N'M', CAST(N'1995-01-10' AS Date), N'3368118099', N'abimael_gaspar.jimenez@jimenez.abimael_gaspar@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1488, N'Jimenez', N'Caín Esteban', 27500003, N'M', CAST(N'1995-01-15' AS Date), N'3363835353', N'caín_esteban.jimenez@jimenez.caín_esteban@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1489, N'Bravo', N'Nour Cayetana', 27500004, N'F', CAST(N'1995-01-05' AS Date), N'3365229293', N'nour_cayetana.bravo@bravo.nour_cayetana@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1490, N'Lorenzo', N'Jiram Germán', 27500005, N'M', CAST(N'1995-01-19' AS Date), N'3364989780', N'jiram_germán.lorenzo@lorenzo.jiram_germán@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1491, N'Sáez', N'Clara Marina', 27500006, N'F', CAST(N'1995-01-30' AS Date), N'3368844955', N'clara_marina.sáez@sáez.clara_marina@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1492, N'Arias', N'Hugo Édgar', 27500007, N'M', CAST(N'1995-01-19' AS Date), N'3366118698', N'hugo_Édgar.arias@arias.hugo_édgar@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1493, N'López', N'Abdiel', 27500008, N'M', CAST(N'1995-01-01' AS Date), N'3368190952', N'abdiel.lópez@lópez.abdiel@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1494, N'Rodríguez', N'Yasmín Alma', 27500009, N'F', CAST(N'1995-01-09' AS Date), N'3365261306', N'yasmín_alma.rodríguez@rodríguez.yasmín_alma@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1495, N'Gutiérrez', N'Lucas Elí', 27500010, N'M', CAST(N'1995-01-13' AS Date), N'3366150927', N'lucas_elí.gutiérrez@gutiérrez.lucas_elí@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1496, N'Vidal', N'Valentina Gala', 27500011, N'F', CAST(N'1995-01-11' AS Date), N'3368574433', N'valentina_gala.vidal@vidal.valentina_gala@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1497, N'Reyes', N'Lola Nuria', 27500012, N'F', CAST(N'1995-01-12' AS Date), N'3363410256', N'lola_nuria.reyes@reyes.lola_nuria@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1498, N'Serrano', N'Rocío Ángela', 27500013, N'F', CAST(N'1995-01-04' AS Date), N'3364482185', N'rocío_Ángela.serrano@serrano.rocío_ángela@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1499, N'Herrera', N'Jacob Demócrito', 27500014, N'M', CAST(N'1995-01-29' AS Date), N'3369018750', N'jacob_demócrito.herrera@herrera.jacob_demócrito@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1500, N'Crespo', N'Elia Rocío', 27500015, N'F', CAST(N'1995-01-04' AS Date), N'3365276495', N'elia_rocío.crespo@crespo.elia_rocío@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1501, N'Nuñez', N'Mateo Caleb', 27500016, N'M', CAST(N'1995-01-04' AS Date), N'3364061471', N'mateo_caleb.nuñez@nuñez.mateo_caleb@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1502, N'León', N'Omar David', 27500017, N'M', CAST(N'1995-01-09' AS Date), N'3368742579', N'omar_david.león@león.omar_david@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1503, N'Díaz', N'Leví Nicolás', 27500018, N'M', CAST(N'1995-01-06' AS Date), N'3367661751', N'leví_nicolás.díaz@díaz.leví_nicolás@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1504, N'Castro', N'Isabel Naia', 27500019, N'F', CAST(N'1995-01-27' AS Date), N'3369469442', N'isabel_naia.castro@castro.isabel_naia@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1505, N'Herrero', N'Fabián Jonás', 27500020, N'M', CAST(N'1995-01-11' AS Date), N'3364108297', N'fabián_jonás.herrero@herrero.fabián_jonás@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1506, N'Márquez', N'Jimena Alicia', 27500021, N'F', CAST(N'1995-01-06' AS Date), N'3366034139', N'jimena_alicia.márquez@márquez.jimena_alicia@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1507, N'Roman', N'Lia Alicia', 27500022, N'F', CAST(N'1995-01-25' AS Date), N'3363127887', N'lia_alicia.roman@roman.lia_alicia@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1508, N'Guerrero', N'Set Eliel', 27500023, N'M', CAST(N'1995-01-19' AS Date), N'3369283590', N'set_eliel.guerrero@guerrero.set_eliel@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1509, N'Nieto', N'Clara Julia', 27500024, N'F', CAST(N'1995-01-23' AS Date), N'3363591994', N'clara_julia.nieto@nieto.clara_julia@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1510, N'Martín', N'Helena Mara', 27500025, N'F', CAST(N'1995-01-01' AS Date), N'3365604318', N'helena_mara.martín@martín.helena_mara@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1511, N'Diez', N'Ana Marta', 27500026, N'F', CAST(N'1995-01-15' AS Date), N'3367038683', N'ana_marta.diez@diez.ana_marta@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1512, N'Carmona', N'Victoria Fátima', 27500027, N'F', CAST(N'1995-01-05' AS Date), N'3369507432', N'victoria_fátima.carmona@carmona.victoria_fátima@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1513, N'Vázquez', N'Marta Aurora', 27500028, N'F', CAST(N'1995-01-27' AS Date), N'3368945520', N'marta_aurora.vázquez@vázquez.marta_aurora@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1514, N'Fernández', N'Andrea Zoe', 27500029, N'F', CAST(N'1995-01-06' AS Date), N'3364369155', N'andrea_zoe.fernández@fernández.andrea_zoe@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1515, N'Calvo', N'Aitana María', 27500030, N'F', CAST(N'1995-01-26' AS Date), N'3363222492', N'aitana_maría.calvo@calvo.aitana_maría@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1516, N'Castillo', N'Daniela ', 27500031, N'F', CAST(N'1995-01-19' AS Date), N'3366229756', N'daniela_.castillo@castillo.daniela_@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1517, N'Hernández', N'Candela Noa', 27500032, N'F', CAST(N'1995-01-20' AS Date), N'3368480228', N'candela_noa.hernández@hernández.candela_noa@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1518, N'Vargas', N'Aina Valeria', 27500033, N'F', CAST(N'1995-01-03' AS Date), N'3363578828', N'aina_valeria.vargas@vargas.aina_valeria@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1519, N'Rojas', N'Elena Zoe', 27500034, N'F', CAST(N'1995-01-25' AS Date), N'3364684989', N'elena_zoe.rojas@rojas.elena_zoe@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1520, N'Giménez', N'Efraín Ahzià', 27500035, N'M', CAST(N'1995-01-30' AS Date), N'3365323999', N'efraín_ahzià.giménez@giménez.efraín_ahzià@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1521, N'Sanz', N'Alejandro Francisco', 27500036, N'M', CAST(N'1995-01-25' AS Date), N'3369299014', N'alejandro_francisco.sanz@sanz.alejandro_francisco@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1522, N'Soler', N'Paula Naia', 27500037, N'F', CAST(N'1995-01-17' AS Date), N'3369873303', N'paula_naia.soler@soler.paula_naia@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1523, N'León', N'Andrés Lemuel', 27500038, N'M', CAST(N'1995-01-08' AS Date), N'3368353005', N'andrés_lemuel.león@león.andrés_lemuel@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1524, N'Pérez', N'Acab Eliseo', 27500039, N'M', CAST(N'1995-01-05' AS Date), N'3364528471', N'acab_eliseo.pérez@pérez.acab_eliseo@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1525, N'Roman', N'Helena Cayetana', 27500040, N'F', CAST(N'1995-01-20' AS Date), N'3366254943', N'helena_cayetana.roman@roman.helena_cayetana@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1526, N'Hernández', N'Renato Mateo', 27500041, N'M', CAST(N'1995-01-16' AS Date), N'3369187783', N'renato_mateo.hernández@hernández.renato_mateo@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1527, N'Cortés', N'Ana Celia', 27500042, N'F', CAST(N'1995-01-21' AS Date), N'3368333916', N'ana_celia.cortés@cortés.ana_celia@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1528, N'Pascual', N'Sofía India', 27500043, N'F', CAST(N'1995-01-23' AS Date), N'3367337244', N'sofía_india.pascual@pascual.sofía_india@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1529, N'Pascual', N'Set Benjamín', 27500044, N'M', CAST(N'1995-01-24' AS Date), N'3368344024', N'set_benjamín.pascual@pascual.set_benjamín@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1530, N'Diez', N'Uzías Fabián', 27500045, N'M', CAST(N'1995-01-22' AS Date), N'3368901911', N'uzías_fabián.diez@diez.uzías_fabián@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1531, N'Torres', N'Cayetana Macarena', 27500046, N'F', CAST(N'1995-01-05' AS Date), N'3368354367', N'cayetana_macarena.torres@torres.cayetana_macarena@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1532, N'Nuñez', N'Olivia Carlota', 27500047, N'F', CAST(N'1995-01-29' AS Date), N'3364580672', N'olivia_carlota.nuñez@nuñez.olivia_carlota@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1533, N'Vázquez', N'Laia Olivia', 27500048, N'F', CAST(N'1995-01-07' AS Date), N'3368111058', N'laia_olivia.vázquez@vázquez.laia_olivia@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1534, N'Sánchez', N'Jimena Aurora', 27500049, N'F', CAST(N'1995-01-30' AS Date), N'3368166358', N'jimena_aurora.sánchez@sánchez.jimena_aurora@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1535, N'Guerrero', N'Claudia Luna', 27500050, N'F', CAST(N'1995-01-20' AS Date), N'3369174496', N'claudia_luna.guerrero@guerrero.claudia_luna@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1536, N'Ruiz', N'Fabián Ahzià', 27500051, N'M', CAST(N'1995-01-19' AS Date), N'3369907157', N'fabián_ahzià.ruiz@ruiz.fabián_ahzià@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1537, N'Gutiérrez', N'Nerea Leire', 27500052, N'F', CAST(N'1995-01-18' AS Date), N'3368454359', N'nerea_leire.gutiérrez@gutiérrez.nerea_leire@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1538, N'Prieto', N'Leví Neftalí', 27500053, N'M', CAST(N'1995-01-04' AS Date), N'3364292194', N'leví_neftalí.prieto@prieto.leví_neftalí@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1539, N'Velasco', N'África Cayetana', 27500054, N'F', CAST(N'1995-01-16' AS Date), N'3366556080', N'África_cayetana.velasco@velasco.áfrica_cayetana@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1540, N'Carrasco', N'Beltrán Francisco', 27500055, N'M', CAST(N'1995-01-08' AS Date), N'3364506969', N'beltrán_francisco.carrasco@carrasco.beltrán_francisco@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1541, N'Pérez', N'Uzías Daniel', 27500056, N'M', CAST(N'1995-01-12' AS Date), N'3364300572', N'uzías_daniel.pérez@pérez.uzías_daniel@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1542, N'Ruiz', N'Tobías Saúl', 27500057, N'M', CAST(N'1995-01-16' AS Date), N'3367286409', N'tobías_saúl.ruiz@ruiz.tobías_saúl@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1543, N'Pascual', N'Chloe Aina', 27500058, N'F', CAST(N'1995-01-12' AS Date), N'3368058930', N'chloe_aina.pascual@pascual.chloe_aina@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1544, N'Blanco', N'Manuela Lia', 27500059, N'F', CAST(N'1995-01-05' AS Date), N'3366116891', N'manuela_lia.blanco@blanco.manuela_lia@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1545, N'Rubio', N'Marta Rocío', 27500060, N'F', CAST(N'1995-01-01' AS Date), N'3368946466', N'marta_rocío.rubio@rubio.marta_rocío@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1546, N'Flores', N'Ismael Josué', 27500061, N'M', CAST(N'1995-01-16' AS Date), N'3363600502', N'ismael_josué.flores@flores.ismael_josué@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1547, N'Peña', N'Rocío Chloe', 27500062, N'F', CAST(N'1995-01-13' AS Date), N'3363207481', N'rocío_chloe.peña@peña.rocío_chloe@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1548, N'López', N'Diana Aroa', 27500063, N'F', CAST(N'1995-01-14' AS Date), N'3366539533', N'diana_aroa.lópez@lópez.diana_aroa@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1549, N'Hernández', N'Hugo Lemuel', 27500064, N'M', CAST(N'1995-01-10' AS Date), N'3365817211', N'hugo_lemuel.hernández@hernández.hugo_lemuel@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1550, N'Hidalgo', N'Marina Ana', 27500065, N'F', CAST(N'1995-01-15' AS Date), N'3366085302', N'marina_ana.hidalgo@hidalgo.marina_ana@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1551, N'Ortega', N'Bartolomé Édgar', 27500066, N'M', CAST(N'1995-01-23' AS Date), N'3369010889', N'bartolomé_Édgar.ortega@ortega.bartolomé_édgar@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1552, N'Soler', N'Saúl Esteban', 27500067, N'M', CAST(N'1995-01-01' AS Date), N'3364943989', N'saúl_esteban.soler@soler.saúl_esteban@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1553, N'Campos', N'Naín Aarón', 27500068, N'M', CAST(N'1995-01-28' AS Date), N'3367000158', N'naín_aarón.campos@campos.naín_aarón@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1554, N'Aguilar', N'Elia Carmen', 27500069, N'F', CAST(N'1995-01-22' AS Date), N'3363385279', N'elia_carmen.aguilar@aguilar.elia_carmen@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1555, N'Navarro', N'Dámaso Sergio', 27500070, N'M', CAST(N'1995-01-05' AS Date), N'3369074715', N'dámaso_sergio.navarro@navarro.dámaso_sergio@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1556, N'Flores', N'Daniela Mara', 27500071, N'F', CAST(N'1995-01-03' AS Date), N'3367547877', N'daniela_mara.flores@flores.daniela_mara@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1557, N'Soler', N'Miguel Benjamín', 27500072, N'M', CAST(N'1995-01-28' AS Date), N'3368973425', N'miguel_benjamín.soler@soler.miguel_benjamín@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1558, N'Crespo', N'Joaquín Beltrán', 27500073, N'M', CAST(N'1995-01-04' AS Date), N'3365898368', N'joaquín_beltrán.crespo@crespo.joaquín_beltrán@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1559, N'Gallego', N'Lucas Pablo', 27500074, N'M', CAST(N'1995-01-08' AS Date), N'3366914664', N'lucas_pablo.gallego@gallego.lucas_pablo@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1560, N'López', N'Jared Darío', 27500075, N'M', CAST(N'1995-01-06' AS Date), N'3364493937', N'jared_darío.lópez@lópez.jared_darío@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1561, N'Prieto', N'Caín Salomón', 27500076, N'M', CAST(N'1995-01-25' AS Date), N'3369517875', N'caín_salomón.prieto@prieto.caín_salomón@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1562, N'Garrido', N'Ángela Alejandra', 27500077, N'F', CAST(N'1995-01-08' AS Date), N'3369551972', N'Ángela_alejandra.garrido@garrido.ángela_alejandra@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1563, N'Soler', N'Elsa Diana', 27500078, N'F', CAST(N'1995-01-17' AS Date), N'3368613512', N'elsa_diana.soler@soler.elsa_diana@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1564, N'Soto', N'Adriana', 27500079, N'F', CAST(N'1995-01-01' AS Date), N'3369902394', N'adriana.soto@soto.adriana@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1565, N'Fuentes', N'Valentina Nuria', 27500080, N'F', CAST(N'1995-01-22' AS Date), N'3366606353', N'valentina_nuria.fuentes@fuentes.valentina_nuria@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1566, N'Carmona', N'Azahara Celia', 27500081, N'F', CAST(N'1995-01-17' AS Date), N'3363204384', N'azahara_celia.carmona@carmona.azahara_celia@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1567, N'Santos', N'Uzías Jehoram', 27500082, N'M', CAST(N'1995-01-06' AS Date), N'3369092394', N'uzías_jehoram.santos@santos.uzías_jehoram@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1568, N'Moreno', N'Ahzià Jonás', 27500083, N'M', CAST(N'1995-01-21' AS Date), N'3365494002', N'ahzià_jonás.moreno@moreno.ahzià_jonás@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1569, N'Soler', N'Aurora Nora', 27500084, N'F', CAST(N'1995-01-05' AS Date), N'3365131592', N'aurora_nora.soler@soler.aurora_nora@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1570, N'Cortés', N'Inés Chloe', 27500085, N'F', CAST(N'1995-01-13' AS Date), N'3369906954', N'inés_chloe.cortés@cortés.inés_chloe@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1571, N'Flores', N'Yasmín Chloe', 27500086, N'F', CAST(N'1995-01-08' AS Date), N'3367909938', N'yasmín_chloe.flores@flores.yasmín_chloe@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1572, N'Castro', N'Matías Germán', 27500087, N'M', CAST(N'1995-01-06' AS Date), N'3367646832', N'matías_germán.castro@castro.matías_germán@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1573, N'Giménez', N'Eva Lucía', 27500088, N'F', CAST(N'1995-01-06' AS Date), N'3365305629', N'eva_lucía.giménez@giménez.eva_lucía@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1574, N'Cano', N'Aurora Malak', 27500089, N'F', CAST(N'1995-01-13' AS Date), N'3369077966', N'aurora_malak.cano@cano.aurora_malak@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1575, N'Molina', N'Jairo Esteban', 27500090, N'M', CAST(N'1995-01-17' AS Date), N'3363062093', N'jairo_esteban.molina@molina.jairo_esteban@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1576, N'Vega', N'Jana Leyre', 27500091, N'F', CAST(N'1995-01-22' AS Date), N'3367366630', N'jana_leyre.vega@vega.jana_leyre@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1577, N'Iglesias', N'María Sara', 27500092, N'F', CAST(N'1995-01-09' AS Date), N'3368130984', N'maría_sara.iglesias@iglesias.maría_sara@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1578, N'Díaz', N'Aurora Ana', 27500093, N'F', CAST(N'1995-01-04' AS Date), N'3368928671', N'aurora_ana.díaz@díaz.aurora_ana@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1579, N'Santiago', N'Victoria Inés', 27500094, N'F', CAST(N'1995-01-22' AS Date), N'3363826080', N'victoria_inés.santiago@santiago.victoria_inés@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1580, N'Vega', N'Jehoram Elías', 27500095, N'M', CAST(N'1995-01-17' AS Date), N'3364218044', N'jehoram_elías.vega@vega.jehoram_elías@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1581, N'Alonso', N'Elsa Diana', 27500096, N'F', CAST(N'1995-01-17' AS Date), N'3365480314', N'elsa_diana.alonso@alonso.elsa_diana@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1582, N'Vázquez', N'Jimena Elena', 27500097, N'F', CAST(N'1995-01-10' AS Date), N'3365832158', N'jimena_elena.vázquez@vázquez.jimena_elena@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1583, N'Moreno', N'Jesús Neftalí', 27500098, N'M', CAST(N'1995-01-07' AS Date), N'3363235425', N'jesús_neftalí.moreno@moreno.jesús_neftalí@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1584, N'Sánchez', N'Alejandra Andrea', 27500099, N'F', CAST(N'1995-01-16' AS Date), N'3363521459', N'alejandra_andrea.sánchez@sánchez.alejandra_andrea@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1585, N'Martínez', N'Elsa Isabel', 28000001, N'F', CAST(N'1996-01-27' AS Date), N'3369112826', N'elsa_isabel.martínez@martínez.elsa_isabel@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1586, N'Flores', N'Victoria Laia', 28000002, N'F', CAST(N'1996-01-10' AS Date), N'3365460726', N'victoria_laia.flores@flores.victoria_laia@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1587, N'García', N'Aram Eliel', 28000003, N'M', CAST(N'1996-01-25' AS Date), N'3369410161', N'aram_eliel.garcía@garcía.aram_eliel@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1588, N'Ortega', N'Aina María', 28000004, N'F', CAST(N'1996-01-28' AS Date), N'3364744640', N'aina_maría.ortega@ortega.aina_maría@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1589, N'Flores', N'Lemuel Abraham', 28000005, N'M', CAST(N'1996-01-21' AS Date), N'3365166624', N'lemuel_abraham.flores@flores.lemuel_abraham@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1590, N'López', N'Cristina Valentina', 28000006, N'F', CAST(N'1996-01-01' AS Date), N'3364506657', N'cristina_valentina.lópez@lópez.cristina_valentina@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1591, N'Morales', N'Francisco Elías', 28000007, N'M', CAST(N'1996-01-11' AS Date), N'3367245806', N'francisco_elías.morales@morales.francisco_elías@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1592, N'Montero', N'Gadiel Jeremías', 28000008, N'M', CAST(N'1996-01-09' AS Date), N'3364125571', N'gadiel_jeremías.montero@montero.gadiel_jeremías@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1593, N'Fernández', N'Jesús Sergio', 28000009, N'M', CAST(N'1996-01-25' AS Date), N'3364039163', N'jesús_sergio.fernández@fernández.jesús_sergio@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1594, N'Crespo', N'Valentina Lia', 28000010, N'F', CAST(N'1996-01-16' AS Date), N'3369330616', N'valentina_lia.crespo@crespo.valentina_lia@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1595, N'Rivera', N'Ismael Bartolomé', 28000011, N'M', CAST(N'1996-01-19' AS Date), N'3364839703', N'ismael_bartolomé.rivera@rivera.ismael_bartolomé@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1596, N'Muñoz', N'Adán Noé', 28000012, N'M', CAST(N'1996-01-01' AS Date), N'3368347270', N'adán_noé.muñoz@muñoz.adán_noé@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1597, N'Muñoz', N'Ezequiel Lucas', 28000013, N'M', CAST(N'1996-01-14' AS Date), N'3363739358', N'ezequiel_lucas.muñoz@muñoz.ezequiel_lucas@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1598, N'Cruz', N'Elia Lina', 28000014, N'F', CAST(N'1996-01-05' AS Date), N'3367539209', N'elia_lina.cruz@cruz.elia_lina@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1599, N'Campos', N'Gabriela Irene', 28000015, N'F', CAST(N'1996-01-17' AS Date), N'3363467356', N'gabriela_irene.campos@campos.gabriela_irene@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1600, N'Fernández', N'Rocío Jana', 28000016, N'F', CAST(N'1996-01-23' AS Date), N'3365017177', N'rocío_jana.fernández@fernández.rocío_jana@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1601, N'Pérez', N'Andrés Demócrito', 28000017, N'M', CAST(N'1996-01-26' AS Date), N'3366231601', N'andrés_demócrito.pérez@pérez.andrés_demócrito@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1602, N'Soto', N'Laia Rocío', 28000018, N'F', CAST(N'1996-01-29' AS Date), N'3366440733', N'laia_rocío.soto@soto.laia_rocío@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1603, N'Muñoz', N'Macarena Aitana', 28000019, N'F', CAST(N'1996-01-21' AS Date), N'3363516655', N'macarena_aitana.muñoz@muñoz.macarena_aitana@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1604, N'Martín', N'Tobías Rafael', 28000020, N'M', CAST(N'1996-01-02' AS Date), N'3367544404', N'tobías_rafael.martín@martín.tobías_rafael@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1605, N'Campos', N'Inés Ana', 28000021, N'F', CAST(N'1996-01-04' AS Date), N'3365550906', N'inés_ana.campos@campos.inés_ana@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1606, N'Soler', N'Josué Naín', 28000022, N'M', CAST(N'1996-01-01' AS Date), N'3366257334', N'josué_naín.soler@soler.josué_naín@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1607, N'Romero', N'Ona Ainara', 28000023, N'F', CAST(N'1996-01-14' AS Date), N'3364394148', N'ona_ainara.romero@romero.ona_ainara@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1608, N'García', N'Gabriel Neftalí', 28000024, N'M', CAST(N'1996-01-27' AS Date), N'3365460022', N'gabriel_neftalí.garcía@garcía.gabriel_neftalí@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1609, N'Lorenzo', N'Lemuel Esteban', 28000025, N'M', CAST(N'1996-01-10' AS Date), N'3364666372', N'lemuel_esteban.lorenzo@lorenzo.lemuel_esteban@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1610, N'López', N'Caín', 28000026, N'M', CAST(N'1996-01-14' AS Date), N'3365161043', N'caín.lópez@lópez.caín@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1611, N'Jimenez', N'Helena Gala', 28000027, N'F', CAST(N'1996-01-22' AS Date), N'3367291964', N'helena_gala.jimenez@jimenez.helena_gala@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1612, N'Sáez', N'Adriana Lina', 28000028, N'F', CAST(N'1996-01-08' AS Date), N'3369246969', N'adriana_lina.sáez@sáez.adriana_lina@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1613, N'Campos', N'Jimena Valeria', 28000029, N'F', CAST(N'1996-01-17' AS Date), N'3368605168', N'jimena_valeria.campos@campos.jimena_valeria@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1614, N'Pastor', N'Zoe Alba', 28000030, N'F', CAST(N'1996-01-12' AS Date), N'3363390721', N'zoe_alba.pastor@pastor.zoe_alba@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1615, N'Cano', N'Jimena Ainhoa', 28000031, N'F', CAST(N'1996-01-19' AS Date), N'3369363969', N'jimena_ainhoa.cano@cano.jimena_ainhoa@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1616, N'Guerrero', N'Vega Isabel', 28000032, N'F', CAST(N'1996-01-04' AS Date), N'3366029308', N'vega_isabel.guerrero@guerrero.vega_isabel@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1617, N'Vargas', N'Cloe Ana', 28000033, N'F', CAST(N'1996-01-17' AS Date), N'3365770837', N'cloe_ana.vargas@vargas.cloe_ana@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1618, N'Cabrera', N'Sofía Naia', 28000034, N'F', CAST(N'1996-01-20' AS Date), N'3364825086', N'sofía_naia.cabrera@cabrera.sofía_naia@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1619, N'Cabrera', N'Leire Irene', 28000035, N'F', CAST(N'1996-01-21' AS Date), N'3364651582', N'leire_irene.cabrera@cabrera.leire_irene@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1620, N'Diez', N'Laia Iria', 28000036, N'F', CAST(N'1996-01-28' AS Date), N'3364478920', N'laia_iria.diez@diez.laia_iria@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1621, N'Morales', N'Baltasar Labán', 28000037, N'M', CAST(N'1996-01-06' AS Date), N'3368458586', N'baltasar_labán.morales@morales.baltasar_labán@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1622, N'Ferrer', N'Naín Rafael', 28000038, N'M', CAST(N'1996-01-12' AS Date), N'3367605251', N'naín_rafael.ferrer@ferrer.naín_rafael@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1623, N'González', N'Saúl Salomón', 28000039, N'M', CAST(N'1996-01-27' AS Date), N'3368106592', N'saúl_salomón.gonzález@gonzález.saúl_salomón@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1624, N'Caballero', N'Valentina Amira', 28000040, N'F', CAST(N'1996-01-16' AS Date), N'3363446222', N'valentina_amira.caballero@caballero.valentina_amira@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1625, N'Carmona', N'Iris Rocío', 28000041, N'F', CAST(N'1996-01-28' AS Date), N'3368295450', N'iris_rocío.carmona@carmona.iris_rocío@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1626, N'Ferrer', N'Jiram Joanix', 28000042, N'M', CAST(N'1996-01-28' AS Date), N'3364203358', N'jiram_joanix.ferrer@ferrer.jiram_joanix@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1627, N'Carrasco', N'Germán Marduk', 28000043, N'M', CAST(N'1996-01-13' AS Date), N'3365327003', N'germán_marduk.carrasco@carrasco.germán_marduk@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1628, N'Caballero', N'Valentina Leire', 28000044, N'F', CAST(N'1996-01-25' AS Date), N'3366758532', N'valentina_leire.caballero@caballero.valentina_leire@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1629, N'Medina', N'Julia Laia', 28000045, N'F', CAST(N'1996-01-16' AS Date), N'3363208380', N'julia_laia.medina@medina.julia_laia@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1630, N'Jimenez', N'José Jaír de Galaad', 28000046, N'M', CAST(N'1996-01-13' AS Date), N'3366872397', N'josé_jaír_de_galaad.jimenez@jimenez.josé_jaír_de_galaad@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1631, N'Domínguez', N'Aina África', 28000047, N'F', CAST(N'1996-01-02' AS Date), N'3367602386', N'aina_África.domínguez@domínguez.aina_áfrica@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1632, N'Rivera', N'Ciro Alejandro', 28000048, N'M', CAST(N'1996-01-07' AS Date), N'3367862359', N'ciro_alejandro.rivera@rivera.ciro_alejandro@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1633, N'Gutiérrez', N'Darío Ismael', 28000049, N'M', CAST(N'1996-01-07' AS Date), N'3368175053', N'darío_ismael.gutiérrez@gutiérrez.darío_ismael@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1634, N'Rodríguez', N'Alicia Amaia', 28000050, N'F', CAST(N'1996-01-30' AS Date), N'3365061634', N'alicia_amaia.rodríguez@rodríguez.alicia_amaia@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1635, N'Diez', N'Set Neftalí', 28000051, N'M', CAST(N'1996-01-26' AS Date), N'3368858737', N'set_neftalí.diez@diez.set_neftalí@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1636, N'Benitez', N'Lola Amaia', 28000052, N'F', CAST(N'1996-01-08' AS Date), N'3369475769', N'lola_amaia.benitez@benitez.lola_amaia@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1637, N'Castillo', N'Inés Carlota', 28000053, N'F', CAST(N'1996-01-08' AS Date), N'3363062324', N'inés_carlota.castillo@castillo.inés_carlota@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1638, N'Vázquez', N'Aina Macarena', 28000054, N'F', CAST(N'1996-01-09' AS Date), N'3364095354', N'aina_macarena.vázquez@vázquez.aina_macarena@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1639, N'Romero', N'Darío Bartolomé', 28000055, N'M', CAST(N'1996-01-19' AS Date), N'3367005887', N'darío_bartolomé.romero@romero.darío_bartolomé@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1640, N'Calvo', N'Carlota Paula', 28000056, N'F', CAST(N'1996-01-16' AS Date), N'3368255526', N'carlota_paula.calvo@calvo.carlota_paula@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1641, N'Castillo', N'Mia Alba', 28000057, N'F', CAST(N'1996-01-01' AS Date), N'3363696168', N'mia_alba.castillo@castillo.mia_alba@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1642, N'Garrido', N'Cayetana', 28000058, N'F', CAST(N'1996-01-01' AS Date), N'3365550197', N'cayetana.garrido@garrido.cayetana@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1643, N'Díaz', N'Esteban Eneas', 28000059, N'M', CAST(N'1996-01-13' AS Date), N'3363294928', N'esteban_eneas.díaz@díaz.esteban_eneas@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1644, N'Blanco', N'Azahara India', 28000060, N'F', CAST(N'1996-01-03' AS Date), N'3366369305', N'azahara_india.blanco@blanco.azahara_india@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1645, N'García', N'Caín Félix', 28000061, N'M', CAST(N'1996-01-20' AS Date), N'3365179254', N'caín_félix.garcía@garcía.caín_félix@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1646, N'Caballero', N'Gabriel Fabián', 28000062, N'M', CAST(N'1996-01-08' AS Date), N'3366895240', N'gabriel_fabián.caballero@caballero.gabriel_fabián@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1647, N'Ramos', N'Ainhoa Blanca', 28000063, N'F', CAST(N'1996-01-26' AS Date), N'3368371184', N'ainhoa_blanca.ramos@ramos.ainhoa_blanca@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1648, N'Ortega', N'Abril Chloe', 28000064, N'F', CAST(N'1996-01-10' AS Date), N'3364733476', N'abril_chloe.ortega@ortega.abril_chloe@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1649, N'Domínguez', N'Caín Aarón', 28000065, N'M', CAST(N'1996-01-06' AS Date), N'3364203179', N'caín_aarón.domínguez@domínguez.caín_aarón@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1650, N'Castillo', N'Carmen Marta', 28000066, N'F', CAST(N'1996-01-15' AS Date), N'3367370210', N'carmen_marta.castillo@castillo.carmen_marta@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1651, N'Diez', N'Abimael Rubén', 28000067, N'M', CAST(N'1996-01-05' AS Date), N'3368574320', N'abimael_rubén.diez@diez.abimael_rubén@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1652, N'Suárez', N'Abril África', 28000068, N'F', CAST(N'1996-01-24' AS Date), N'3363524067', N'abril_África.suárez@suárez.abril_áfrica@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1653, N'Cruz', N'Aram Herodes', 28000069, N'M', CAST(N'1996-01-01' AS Date), N'3366487359', N'aram_herodes.cruz@cruz.aram_herodes@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1654, N'Rivera', N'Eliel Rafael', 28000070, N'M', CAST(N'1996-01-03' AS Date), N'3367293634', N'eliel_rafael.rivera@rivera.eliel_rafael@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1655, N'Morales', N'Germán Marcos', 28000071, N'M', CAST(N'1996-01-15' AS Date), N'3369806583', N'germán_marcos.morales@morales.germán_marcos@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1656, N'Pastor', N'Gabriel Efraín', 28000072, N'M', CAST(N'1996-01-11' AS Date), N'3364522592', N'gabriel_efraín.pastor@pastor.gabriel_efraín@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1657, N'Carrasco', N'Martina Irene', 28000073, N'F', CAST(N'1996-01-28' AS Date), N'3367377407', N'martina_irene.carrasco@carrasco.martina_irene@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1658, N'Calvo', N'Berta Claudia', 28000074, N'F', CAST(N'1996-01-05' AS Date), N'3367675012', N'berta_claudia.calvo@calvo.berta_claudia@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1659, N'López', N'Claudia Adara', 28000075, N'F', CAST(N'1996-01-13' AS Date), N'3363494728', N'claudia_adara.lópez@lópez.claudia_adara@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1660, N'Cruz', N'Amaia Carla', 28000076, N'F', CAST(N'1996-01-04' AS Date), N'3369578642', N'amaia_carla.cruz@cruz.amaia_carla@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1661, N'Lorenzo', N'Cayetana Lucía', 28000077, N'F', CAST(N'1996-01-17' AS Date), N'3363854280', N'cayetana_lucía.lorenzo@lorenzo.cayetana_lucía@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1662, N'Carmona', N'Mateo Simón', 28000078, N'M', CAST(N'1996-01-23' AS Date), N'3368066252', N'mateo_simón.carmona@carmona.mateo_simón@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1663, N'Iglesias', N'Dámaso Ismael', 28000079, N'M', CAST(N'1996-01-29' AS Date), N'3364209680', N'dámaso_ismael.iglesias@iglesias.dámaso_ismael@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1664, N'Duran', N'Carmen Claudia', 28000080, N'F', CAST(N'1996-01-14' AS Date), N'3367275517', N'carmen_claudia.duran@duran.carmen_claudia@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1665, N'Pastor', N'Naia Alicia', 28000081, N'F', CAST(N'1996-01-24' AS Date), N'3369519232', N'naia_alicia.pastor@pastor.naia_alicia@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1666, N'Rubio', N'Luna Natalia', 28000082, N'F', CAST(N'1996-01-06' AS Date), N'3364347101', N'luna_natalia.rubio@rubio.luna_natalia@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1667, N'Parra', N'Arlet Luna', 28000083, N'F', CAST(N'1996-01-15' AS Date), N'3368208841', N'arlet_luna.parra@parra.arlet_luna@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1668, N'Gómez', N'Ana Valeria', 28000084, N'F', CAST(N'1996-01-15' AS Date), N'3367810735', N'ana_valeria.gómez@gómez.ana_valeria@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1669, N'Caballero', N'Chloe Abril', 28000085, N'F', CAST(N'1996-01-16' AS Date), N'3364420221', N'chloe_abril.caballero@caballero.chloe_abril@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1670, N'Pascual', N'Paula Azahara', 28000086, N'F', CAST(N'1996-01-19' AS Date), N'3367918685', N'paula_azahara.pascual@pascual.paula_azahara@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1671, N'Sánchez', N'Ahzià Jonás', 28000087, N'M', CAST(N'1996-01-12' AS Date), N'3365570630', N'ahzià_jonás.sánchez@sánchez.ahzià_jonás@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1672, N'Cano', N'Manuela Elena', 28000088, N'F', CAST(N'1996-01-26' AS Date), N'3368157312', N'manuela_elena.cano@cano.manuela_elena@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1673, N'Cano', N'Carlota ', 28000089, N'F', CAST(N'1996-01-21' AS Date), N'3363855022', N'carlota_.cano@cano.carlota_@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1674, N'Pastor', N'Valentina Mara', 28000090, N'F', CAST(N'1996-01-22' AS Date), N'3365804501', N'valentina_mara.pastor@pastor.valentina_mara@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1675, N'Ortega', N'Jimena Nora', 28000091, N'F', CAST(N'1996-01-18' AS Date), N'3363693486', N'jimena_nora.ortega@ortega.jimena_nora@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1676, N'Gutiérrez', N'Labán Eliel', 28000092, N'M', CAST(N'1996-01-16' AS Date), N'3369433067', N'labán_eliel.gutiérrez@gutiérrez.labán_eliel@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1677, N'Martínez', N'Victoria Alicia', 28000093, N'F', CAST(N'1996-01-22' AS Date), N'3367562381', N'victoria_alicia.martínez@martínez.victoria_alicia@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1678, N'Ferrer', N'Elena Abril', 28000094, N'F', CAST(N'1996-01-18' AS Date), N'3365765867', N'elena_abril.ferrer@ferrer.elena_abril@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1679, N'Ramos', N'Iris Ainhoa', 28000095, N'F', CAST(N'1996-01-25' AS Date), N'3368849632', N'iris_ainhoa.ramos@ramos.iris_ainhoa@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1680, N'Ramírez', N'Julio Jairo', 28000096, N'M', CAST(N'1996-01-25' AS Date), N'3364197857', N'julio_jairo.ramírez@ramírez.julio_jairo@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1681, N'Domínguez', N'Mara Mar', 28000097, N'F', CAST(N'1996-01-11' AS Date), N'3367274850', N'mara_mar.domínguez@domínguez.mara_mar@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1682, N'Velasco', N'Irene Inés', 28000098, N'F', CAST(N'1996-01-27' AS Date), N'3365613340', N'irene_inés.velasco@velasco.irene_inés@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1683, N'Aguilar', N'Andrés Moisés', 28000099, N'M', CAST(N'1996-01-03' AS Date), N'3368395370', N'andrés_moisés.aguilar@aguilar.andrés_moisés@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1684, N'Campos', N'Sergio Dámaso', 28500001, N'M', CAST(N'1997-01-24' AS Date), N'3369108291', N'sergio_dámaso.campos@campos.sergio_dámaso@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1685, N'Méndez', N'Ahzià Fabián', 28500002, N'M', CAST(N'1997-01-07' AS Date), N'3365571593', N'ahzià_fabián.méndez@méndez.ahzià_fabián@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1686, N'Nieto', N'Efraín Rafael', 28500003, N'M', CAST(N'1997-01-23' AS Date), N'3364581923', N'efraín_rafael.nieto@nieto.efraín_rafael@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1687, N'Bravo', N'Jeremías Zacarías', 28500004, N'M', CAST(N'1997-01-12' AS Date), N'3368515924', N'jeremías_zacarías.bravo@bravo.jeremías_zacarías@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1688, N'Santiago', N'Neftalí Francisco', 28500005, N'M', CAST(N'1997-01-08' AS Date), N'3364915986', N'neftalí_francisco.santiago@santiago.neftalí_francisco@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1689, N'Vicente', N'Julieta Lina', 28500006, N'F', CAST(N'1997-01-16' AS Date), N'3369195709', N'julieta_lina.vicente@vicente.julieta_lina@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1690, N'Herrero', N'Uzías Esteban', 28500007, N'M', CAST(N'1997-01-14' AS Date), N'3369963781', N'uzías_esteban.herrero@herrero.uzías_esteban@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1691, N'Campos', N'Eliseo Ashur', 28500008, N'M', CAST(N'1997-01-27' AS Date), N'3365532707', N'eliseo_ashur.campos@campos.eliseo_ashur@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1692, N'Soler', N'Fátima Daniela', 28500009, N'F', CAST(N'1997-01-21' AS Date), N'3363079271', N'fátima_daniela.soler@soler.fátima_daniela@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1693, N'Santana', N'Guido Noé', 28500010, N'M', CAST(N'1997-01-17' AS Date), N'3366073179', N'guido_noé.santana@santana.guido_noé@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1694, N'Sanz', N'Macarena Isabel', 28500011, N'F', CAST(N'1997-01-06' AS Date), N'3369538547', N'macarena_isabel.sanz@sanz.macarena_isabel@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1695, N'Cano', N'Josué Gadiel', 28500012, N'M', CAST(N'1997-01-17' AS Date), N'3368774883', N'josué_gadiel.cano@cano.josué_gadiel@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1696, N'Carrasco', N'Noa Iria', 28500013, N'F', CAST(N'1997-01-03' AS Date), N'3366685496', N'noa_iria.carrasco@carrasco.noa_iria@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1697, N'Pastor', N'Caín Eliseo', 28500014, N'M', CAST(N'1997-01-01' AS Date), N'3367226348', N'caín_eliseo.pastor@pastor.caín_eliseo@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1698, N'Santos', N'Isaac Mateo', 28500015, N'M', CAST(N'1997-01-13' AS Date), N'3364981122', N'isaac_mateo.santos@santos.isaac_mateo@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1699, N'Duran', N'Ciro Darío', 28500016, N'M', CAST(N'1997-01-20' AS Date), N'3369806224', N'ciro_darío.duran@duran.ciro_darío@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1700, N'Giménez', N'Abril Mia', 28500017, N'F', CAST(N'1997-01-27' AS Date), N'3366490493', N'abril_mia.giménez@giménez.abril_mia@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1701, N'Soto', N'Abdiel Fabián', 28500018, N'M', CAST(N'1997-01-18' AS Date), N'3366886421', N'abdiel_fabián.soto@soto.abdiel_fabián@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1702, N'Muñoz', N'Vera Nora', 28500019, N'F', CAST(N'1997-01-02' AS Date), N'3366970892', N'vera_nora.muñoz@muñoz.vera_nora@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1703, N'Rivera', N'Cristina Julieta', 28500020, N'F', CAST(N'1997-01-30' AS Date), N'3365805472', N'cristina_julieta.rivera@rivera.cristina_julieta@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1704, N'Cabrera', N'Abimael Esteban', 28500021, N'M', CAST(N'1997-01-24' AS Date), N'3366925381', N'abimael_esteban.cabrera@cabrera.abimael_esteban@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1705, N'Fuentes', N'Matías Baltasar', 28500022, N'M', CAST(N'1997-01-07' AS Date), N'3369026403', N'matías_baltasar.fuentes@fuentes.matías_baltasar@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1706, N'Vega', N'Fabián Ciro', 28500023, N'M', CAST(N'1997-01-19' AS Date), N'3367802594', N'fabián_ciro.vega@vega.fabián_ciro@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1707, N'Carrasco', N'Uzías David', 28500024, N'M', CAST(N'1997-01-29' AS Date), N'3363937968', N'uzías_david.carrasco@carrasco.uzías_david@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1708, N'Arias', N'Iris Ana', 28500025, N'F', CAST(N'1997-01-14' AS Date), N'3368606804', N'iris_ana.arias@arias.iris_ana@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1709, N'Cortés', N'Simón Andrés', 28500026, N'M', CAST(N'1997-01-17' AS Date), N'3365181320', N'simón_andrés.cortés@cortés.simón_andrés@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1710, N'Díaz', N'Ona Adriana', 28500027, N'F', CAST(N'1997-01-03' AS Date), N'3363162692', N'ona_adriana.díaz@díaz.ona_adriana@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1711, N'León', N'Aram Mateo', 28500028, N'M', CAST(N'1997-01-24' AS Date), N'3369007595', N'aram_mateo.león@león.aram_mateo@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1712, N'Martín', N'Zacarías Jehoram', 28500029, N'M', CAST(N'1997-01-01' AS Date), N'3365367176', N'zacarías_jehoram.martín@martín.zacarías_jehoram@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1713, N'Álvarez', N'María Vera', 28500030, N'F', CAST(N'1997-01-11' AS Date), N'3363191803', N'maría_vera.Álvarez@álvarez.maría_vera@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1714, N'Carrasco', N'Homero Caín', 28500031, N'M', CAST(N'1997-01-17' AS Date), N'3364146507', N'homero_caín.carrasco@carrasco.homero_caín@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1715, N'González', N'Juan Israel', 28500032, N'M', CAST(N'1997-01-15' AS Date), N'3367878783', N'juan_israel.gonzález@gonzález.juan_israel@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1716, N'Vargas', N'Agustín Jaír de Galaad', 28500033, N'M', CAST(N'1997-01-25' AS Date), N'3369286330', N'agustín_jaír_de_galaad.vargas@vargas.agustín_jaír_de_galaad@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1717, N'Hernández', N'Fátima Chloe', 28500034, N'F', CAST(N'1997-01-13' AS Date), N'3364642776', N'fátima_chloe.hernández@hernández.fátima_chloe@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1718, N'Guerrero', N'Aitana Alicia', 28500035, N'F', CAST(N'1997-01-29' AS Date), N'3365490629', N'aitana_alicia.guerrero@guerrero.aitana_alicia@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1719, N'Flores', N'Cloe Adara', 28500036, N'F', CAST(N'1997-01-07' AS Date), N'3369703535', N'cloe_adara.flores@flores.cloe_adara@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1720, N'Santana', N'Candela Arlet', 28500037, N'F', CAST(N'1997-01-18' AS Date), N'3365475103', N'candela_arlet.santana@santana.candela_arlet@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1721, N'Lorenzo', N'Leví Ashur', 28500038, N'M', CAST(N'1997-01-07' AS Date), N'3368152432', N'leví_ashur.lorenzo@lorenzo.leví_ashur@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1722, N'Ramos', N'Nahia Carlota', 28500039, N'F', CAST(N'1997-01-11' AS Date), N'3366846777', N'nahia_carlota.ramos@ramos.nahia_carlota@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1723, N'Gallardo', N'Berta Chloe', 28500040, N'F', CAST(N'1997-01-19' AS Date), N'3368486954', N'berta_chloe.gallardo@gallardo.berta_chloe@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1724, N'Gil', N'Victoria María', 28500041, N'F', CAST(N'1997-01-20' AS Date), N'3364664913', N'victoria_maría.gil@gil.victoria_maría@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1725, N'Castro', N'Acab Caín', 28500042, N'M', CAST(N'1997-01-05' AS Date), N'3364898889', N'acab_caín.castro@castro.acab_caín@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1726, N'Navarro', N'Eneas Gadiel', 28500043, N'M', CAST(N'1997-01-06' AS Date), N'3363622431', N'eneas_gadiel.navarro@navarro.eneas_gadiel@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1727, N'Ramos', N'Chloe Zoe', 28500044, N'F', CAST(N'1997-01-01' AS Date), N'3368039218', N'chloe_zoe.ramos@ramos.chloe_zoe@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1728, N'Benitez', N'Mar Nahia', 28500045, N'F', CAST(N'1997-01-25' AS Date), N'3366406826', N'mar_nahia.benitez@benitez.mar_nahia@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1729, N'Iglesias', N'Adriana Elena', 28500046, N'F', CAST(N'1997-01-03' AS Date), N'3365830504', N'adriana_elena.iglesias@iglesias.adriana_elena@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1730, N'Muñoz', N'Set Miguel', 28500047, N'M', CAST(N'1997-01-27' AS Date), N'3368952669', N'set_miguel.muñoz@muñoz.set_miguel@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1731, N'Gallego', N'Josué Hugo', 28500048, N'M', CAST(N'1997-01-07' AS Date), N'3364297135', N'josué_hugo.gallego@gallego.josué_hugo@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1732, N'Reyes', N'María Ana', 28500049, N'F', CAST(N'1997-01-27' AS Date), N'3364600411', N'maría_ana.reyes@reyes.maría_ana@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1733, N'Méndez', N'Laia Gala', 28500050, N'F', CAST(N'1997-01-20' AS Date), N'3365420572', N'laia_gala.méndez@méndez.laia_gala@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1734, N'Castro', N'Alma Triana', 28500051, N'F', CAST(N'1997-01-21' AS Date), N'3366320241', N'alma_triana.castro@castro.alma_triana@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1735, N'Campos', N'Isaías Beltrán', 28500052, N'M', CAST(N'1997-01-16' AS Date), N'3369229335', N'isaías_beltrán.campos@campos.isaías_beltrán@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1736, N'Arias', N'Laura Ángela', 28500053, N'F', CAST(N'1997-01-06' AS Date), N'3369269104', N'laura_Ángela.arias@arias.laura_ángela@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1737, N'Suárez', N'Azahara Diana', 28500054, N'F', CAST(N'1997-01-03' AS Date), N'3368023312', N'azahara_diana.suárez@suárez.azahara_diana@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1738, N'Martínez', N'Inés Fátima', 28500055, N'F', CAST(N'1997-01-23' AS Date), N'3364740022', N'inés_fátima.martínez@martínez.inés_fátima@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1739, N'Márquez', N'Sara Clara', 28500056, N'F', CAST(N'1997-01-23' AS Date), N'3367704527', N'sara_clara.márquez@márquez.sara_clara@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1740, N'Duran', N'Lucía Marina', 28500057, N'F', CAST(N'1997-01-20' AS Date), N'3368508922', N'lucía_marina.duran@duran.lucía_marina@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1741, N'Giménez', N'Olivia África', 28500058, N'F', CAST(N'1997-01-14' AS Date), N'3367119158', N'olivia_África.giménez@giménez.olivia_áfrica@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1742, N'Cortés', N'Gabriela Nour', 28500059, N'F', CAST(N'1997-01-20' AS Date), N'3368076480', N'gabriela_nour.cortés@cortés.gabriela_nour@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1743, N'Gutiérrez', N'Mara Laura', 28500060, N'F', CAST(N'1997-01-07' AS Date), N'3366487117', N'mara_laura.gutiérrez@gutiérrez.mara_laura@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1744, N'Roman', N'Triana Leyre', 28500061, N'F', CAST(N'1997-01-18' AS Date), N'3365845033', N'triana_leyre.roman@roman.triana_leyre@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1745, N'Giménez', N'Alma Blanca', 28500062, N'F', CAST(N'1997-01-22' AS Date), N'3364523332', N'alma_blanca.giménez@giménez.alma_blanca@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1746, N'Prieto', N'Baltasar Ashur', 28500063, N'M', CAST(N'1997-01-21' AS Date), N'3369241005', N'baltasar_ashur.prieto@prieto.baltasar_ashur@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1747, N'Flores', N'Neftalí Beltrán', 28500064, N'M', CAST(N'1997-01-17' AS Date), N'3369141715', N'neftalí_beltrán.flores@flores.neftalí_beltrán@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1748, N'Martínez', N'Abel Baltasar', 28500065, N'M', CAST(N'1997-01-25' AS Date), N'3367378732', N'abel_baltasar.martínez@martínez.abel_baltasar@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1749, N'Martín', N'Renato', 28500066, N'M', CAST(N'1997-01-15' AS Date), N'3367966759', N'renato.martín@martín.renato@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1750, N'Soto', N'Malak Triana', 28500067, N'F', CAST(N'1997-01-11' AS Date), N'3369054865', N'malak_triana.soto@soto.malak_triana@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1751, N'Serrano', N'Francisco Darío', 28500068, N'M', CAST(N'1997-01-21' AS Date), N'3364539867', N'francisco_darío.serrano@serrano.francisco_darío@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1752, N'Aguilar', N'Sofía Mar', 28500069, N'F', CAST(N'1997-01-10' AS Date), N'3366107197', N'sofía_mar.aguilar@aguilar.sofía_mar@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1753, N'Fernández', N'Malak Adriana', 28500070, N'F', CAST(N'1997-01-22' AS Date), N'3366576458', N'malak_adriana.fernández@fernández.malak_adriana@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1754, N'Caballero', N'Cloe Carlota', 28500071, N'F', CAST(N'1997-01-08' AS Date), N'3365011488', N'cloe_carlota.caballero@caballero.cloe_carlota@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1755, N'Vega', N'Iria Ona', 28500072, N'F', CAST(N'1997-01-26' AS Date), N'3364486147', N'iria_ona.vega@vega.iria_ona@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1756, N'Moreno', N'Jonás Mateo', 28500073, N'M', CAST(N'1997-01-23' AS Date), N'3366400749', N'jonás_mateo.moreno@moreno.jonás_mateo@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1757, N'Crespo', N'Amira Aroa', 28500074, N'F', CAST(N'1997-01-22' AS Date), N'3366523327', N'amira_aroa.crespo@crespo.amira_aroa@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1758, N'Bravo', N'Carla Lina', 28500075, N'F', CAST(N'1997-01-15' AS Date), N'3368577889', N'carla_lina.bravo@bravo.carla_lina@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1759, N'Pastor', N'Alejandro Gadiel', 28500076, N'M', CAST(N'1997-01-15' AS Date), N'3365216999', N'alejandro_gadiel.pastor@pastor.alejandro_gadiel@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1760, N'Nieto', N'Naín José', 28500077, N'M', CAST(N'1997-01-12' AS Date), N'3363878087', N'naín_josé.nieto@nieto.naín_josé@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1761, N'Márquez', N'Alma Amira', 28500078, N'F', CAST(N'1997-01-15' AS Date), N'3365227484', N'alma_amira.márquez@márquez.alma_amira@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1762, N'Peña', N'Samuel Dámaso', 28500079, N'M', CAST(N'1997-01-29' AS Date), N'3369353118', N'samuel_dámaso.peña@peña.samuel_dámaso@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1763, N'Molina', N'Noa Isabel', 28500080, N'F', CAST(N'1997-01-18' AS Date), N'3366415480', N'noa_isabel.molina@molina.noa_isabel@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1764, N'Caballero', N'Azahara Fátima', 28500081, N'F', CAST(N'1997-01-02' AS Date), N'3369006212', N'azahara_fátima.caballero@caballero.azahara_fátima@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1765, N'Moreno', N'Moisés Isaías', 28500082, N'M', CAST(N'1997-01-09' AS Date), N'3364943761', N'moisés_isaías.moreno@moreno.moisés_isaías@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1766, N'Flores', N'Leire Leyre', 28500083, N'F', CAST(N'1997-01-20' AS Date), N'3364597525', N'leire_leyre.flores@flores.leire_leyre@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1767, N'Flores', N'Marina Ariadna', 28500084, N'F', CAST(N'1997-01-26' AS Date), N'3365519916', N'marina_ariadna.flores@flores.marina_ariadna@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1768, N'Mora', N'Cristina Olivia', 28500085, N'F', CAST(N'1997-01-18' AS Date), N'3364593359', N'cristina_olivia.mora@mora.cristina_olivia@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1769, N'Herrera', N'Lucas Neftalí', 28500086, N'M', CAST(N'1997-01-14' AS Date), N'3364392212', N'lucas_neftalí.herrera@herrera.lucas_neftalí@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1770, N'Vidal', N'Juan', 28500087, N'M', CAST(N'1997-01-01' AS Date), N'3367887751', N'juan.vidal@vidal.juan@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1771, N'Méndez', N'Efraín Sergio', 28500088, N'M', CAST(N'1997-01-01' AS Date), N'3363371254', N'efraín_sergio.méndez@méndez.efraín_sergio@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1772, N'Soler', N'Gadiel Lucas', 28500089, N'M', CAST(N'1997-01-19' AS Date), N'3364958139', N'gadiel_lucas.soler@soler.gadiel_lucas@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1773, N'Carrasco', N'Abel Caleb', 28500090, N'M', CAST(N'1997-01-03' AS Date), N'3368046712', N'abel_caleb.carrasco@carrasco.abel_caleb@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1774, N'Gallego', N'Lucas Isaías', 28500091, N'M', CAST(N'1997-01-25' AS Date), N'3364771109', N'lucas_isaías.gallego@gallego.lucas_isaías@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1775, N'Ruiz', N'Malak Leire', 28500092, N'F', CAST(N'1997-01-24' AS Date), N'3368757067', N'malak_leire.ruiz@ruiz.malak_leire@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1776, N'Santiago', N'Hugo Darío', 28500093, N'M', CAST(N'1997-01-04' AS Date), N'3367497467', N'hugo_darío.santiago@santiago.hugo_darío@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1777, N'Sáez', N'Gala Julia', 28500094, N'F', CAST(N'1997-01-12' AS Date), N'3365914482', N'gala_julia.sáez@sáez.gala_julia@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1778, N'Fuentes', N'Claudia Arlet', 28500095, N'F', CAST(N'1997-01-06' AS Date), N'3368249023', N'claudia_arlet.fuentes@fuentes.claudia_arlet@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1779, N'Márquez', N'Aarón Rafael', 28500096, N'M', CAST(N'1997-01-17' AS Date), N'3367289110', N'aarón_rafael.márquez@márquez.aarón_rafael@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1780, N'Cortés', N'Neftalí Ashur', 28500097, N'M', CAST(N'1997-01-22' AS Date), N'3363333079', N'neftalí_ashur.cortés@cortés.neftalí_ashur@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1781, N'Carrasco', N'Ismael Eliel', 28500098, N'M', CAST(N'1997-01-20' AS Date), N'3363816762', N'ismael_eliel.carrasco@carrasco.ismael_eliel@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1782, N'Ramos', N'Uzías Salomón', 28500099, N'M', CAST(N'1997-01-17' AS Date), N'3364505181', N'uzías_salomón.ramos@ramos.uzías_salomón@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1783, N'Hernández', N'Olivia Carla', 29000001, N'F', CAST(N'1998-01-27' AS Date), N'3364473509', N'olivia_carla.hernández@hernández.olivia_carla@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1784, N'Calvo', N'Lara Diana', 29000002, N'F', CAST(N'1998-01-05' AS Date), N'3368208024', N'lara_diana.calvo@calvo.lara_diana@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1785, N'Lorenzo', N'Agustín Jiram', 29000003, N'M', CAST(N'1998-01-07' AS Date), N'3367230278', N'agustín_jiram.lorenzo@lorenzo.agustín_jiram@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1786, N'Campos', N'Adán Esteban', 29000004, N'M', CAST(N'1998-01-18' AS Date), N'3364195236', N'adán_esteban.campos@campos.adán_esteban@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1787, N'Suárez', N'Olivia Victoria', 29000005, N'F', CAST(N'1998-01-27' AS Date), N'3368930154', N'olivia_victoria.suárez@suárez.olivia_victoria@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1788, N'Caballero', N'Sofía Vega', 29000006, N'F', CAST(N'1998-01-22' AS Date), N'3366721644', N'sofía_vega.caballero@caballero.sofía_vega@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1789, N'Santana', N'África Ainara', 29000007, N'F', CAST(N'1998-01-17' AS Date), N'3367129168', N'África_ainara.santana@santana.áfrica_ainara@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1790, N'Campos', N' Ángela', 29000008, N'F', CAST(N'1998-01-23' AS Date), N'3363709272', N'_Ángela.campos@campos._ángela@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1791, N'Cano', N'Blanca Gabriela', 29000009, N'F', CAST(N'1998-01-19' AS Date), N'3366657999', N'blanca_gabriela.cano@cano.blanca_gabriela@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1792, N'Santiago', N'Vega Cristina', 29000010, N'F', CAST(N'1998-01-11' AS Date), N'3363689362', N'vega_cristina.santiago@santiago.vega_cristina@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1793, N'Pascual', N'Leví Marduk', 29000011, N'M', CAST(N'1998-01-16' AS Date), N'3369783370', N'leví_marduk.pascual@pascual.leví_marduk@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1794, N'Ruiz', N'Félix Esteban', 29000012, N'M', CAST(N'1998-01-06' AS Date), N'3367545651', N'félix_esteban.ruiz@ruiz.félix_esteban@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1795, N'Lozano', N'Mateo Abimael', 29000013, N'M', CAST(N'1998-01-19' AS Date), N'3365158480', N'mateo_abimael.lozano@lozano.mateo_abimael@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1796, N'Benitez', N'Aitana Isabella', 29000014, N'F', CAST(N'1998-01-02' AS Date), N'3366850899', N'aitana_isabella.benitez@benitez.aitana_isabella@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1797, N'Álvarez', N'Martina Berta', 29000015, N'F', CAST(N'1998-01-24' AS Date), N'3366693932', N'martina_berta.Álvarez@álvarez.martina_berta@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1798, N'Roman', N'Rubén Abdiel', 29000016, N'M', CAST(N'1998-01-29' AS Date), N'3369841680', N'rubén_abdiel.roman@roman.rubén_abdiel@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1799, N'García', N'Ana Alicia', 29000017, N'F', CAST(N'1998-01-23' AS Date), N'3368226869', N'ana_alicia.garcía@garcía.ana_alicia@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1800, N'Gallardo', N'Gala Eva', 29000018, N'F', CAST(N'1998-01-26' AS Date), N'3368602277', N'gala_eva.gallardo@gallardo.gala_eva@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1801, N'Gallardo', N'Joanix Elí', 29000019, N'M', CAST(N'1998-01-01' AS Date), N'3366245464', N'joanix_elí.gallardo@gallardo.joanix_elí@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1802, N'Castillo', N'Malak Victoria', 29000020, N'F', CAST(N'1998-01-03' AS Date), N'3363689032', N'malak_victoria.castillo@castillo.malak_victoria@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1803, N'Marin', N'Laia Chloe', 29000021, N'F', CAST(N'1998-01-17' AS Date), N'3368607435', N'laia_chloe.marin@marin.laia_chloe@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1804, N'Díaz', N'Manuela Azahara', 29000022, N'F', CAST(N'1998-01-02' AS Date), N'3365218109', N'manuela_azahara.díaz@díaz.manuela_azahara@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1805, N'Medina', N'Valentina Aurora', 29000023, N'F', CAST(N'1998-01-15' AS Date), N'3369362014', N'valentina_aurora.medina@medina.valentina_aurora@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1806, N'Domínguez', N'Mara Manuela', 29000024, N'F', CAST(N'1998-01-19' AS Date), N'3367844336', N'mara_manuela.domínguez@domínguez.mara_manuela@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1807, N'Lorenzo', N'Labán Rafael', 29000025, N'M', CAST(N'1998-01-19' AS Date), N'3367357743', N'labán_rafael.lorenzo@lorenzo.labán_rafael@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1808, N'Caballero', N'Ashur Simón', 29000026, N'M', CAST(N'1998-01-29' AS Date), N'3367615725', N'ashur_simón.caballero@caballero.ashur_simón@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1809, N'Guerrero', N'Tobías Mateo', 29000027, N'M', CAST(N'1998-01-18' AS Date), N'3367939030', N'tobías_mateo.guerrero@guerrero.tobías_mateo@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1810, N'Moya', N'Lina Nerea', 29000028, N'F', CAST(N'1998-01-23' AS Date), N'3363002038', N'lina_nerea.moya@moya.lina_nerea@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1811, N'Giménez', N'Alejandra Carmen', 29000029, N'F', CAST(N'1998-01-14' AS Date), N'3364042714', N'alejandra_carmen.giménez@giménez.alejandra_carmen@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1812, N'Herrera', N'Chloe Ainara', 29000030, N'F', CAST(N'1998-01-29' AS Date), N'3367574687', N'chloe_ainara.herrera@herrera.chloe_ainara@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1813, N'Muñoz', N'Jairo Hugo', 29000031, N'M', CAST(N'1998-01-22' AS Date), N'3369239496', N'jairo_hugo.muñoz@muñoz.jairo_hugo@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1814, N'Pastor', N'Iria Mia', 29000032, N'F', CAST(N'1998-01-09' AS Date), N'3363582689', N'iria_mia.pastor@pastor.iria_mia@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1815, N'Hidalgo', N'Alba Alejandra', 29000033, N'F', CAST(N'1998-01-15' AS Date), N'3364153186', N'alba_alejandra.hidalgo@hidalgo.alba_alejandra@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1816, N'Herrera', N'Nour Laia', 29000034, N'F', CAST(N'1998-01-08' AS Date), N'3366400024', N'nour_laia.herrera@herrera.nour_laia@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1817, N'Sáez', N'Ainara Ainhoa', 29000035, N'F', CAST(N'1998-01-03' AS Date), N'3366115910', N'ainara_ainhoa.sáez@sáez.ainara_ainhoa@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1818, N'Vicente', N'Isabel Adriana', 29000036, N'F', CAST(N'1998-01-21' AS Date), N'3363489682', N'isabel_adriana.vicente@vicente.isabel_adriana@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1819, N'Soler', N'Ona Candela', 29000037, N'F', CAST(N'1998-01-04' AS Date), N'3363093609', N'ona_candela.soler@soler.ona_candela@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1820, N'Ferrer', N'Beltrán Aram', 29000038, N'M', CAST(N'1998-01-10' AS Date), N'3363978754', N'beltrán_aram.ferrer@ferrer.beltrán_aram@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1821, N'Vázquez', N'Paula Julieta', 29000039, N'F', CAST(N'1998-01-16' AS Date), N'3368981323', N'paula_julieta.vázquez@vázquez.paula_julieta@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1822, N'Mora', N'Felipe Nicolás', 29000040, N'M', CAST(N'1998-01-04' AS Date), N'3368931464', N'felipe_nicolás.mora@mora.felipe_nicolás@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1823, N'Cano', N'Felipe Elías', 29000041, N'M', CAST(N'1998-01-25' AS Date), N'3365480239', N'felipe_elías.cano@cano.felipe_elías@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1824, N'Vázquez', N'Hugo Ismael', 29000042, N'M', CAST(N'1998-01-24' AS Date), N'3367068547', N'hugo_ismael.vázquez@vázquez.hugo_ismael@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1825, N'Ferrer', N'Sara Aurora', 29000043, N'F', CAST(N'1998-01-19' AS Date), N'3367754817', N'sara_aurora.ferrer@ferrer.sara_aurora@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1826, N'Moreno', N'Andrea Natalia', 29000044, N'F', CAST(N'1998-01-12' AS Date), N'3369228419', N'andrea_natalia.moreno@moreno.andrea_natalia@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1827, N'Cruz', N'Leyre Nora', 29000045, N'F', CAST(N'1998-01-09' AS Date), N'3368599464', N'leyre_nora.cruz@cruz.leyre_nora@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1828, N'Navarro', N'Matías Labán', 29000046, N'M', CAST(N'1998-01-20' AS Date), N'3366595885', N'matías_labán.navarro@navarro.matías_labán@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1829, N'Gutiérrez', N'Carlota Ángela', 29000047, N'F', CAST(N'1998-01-18' AS Date), N'3369583477', N'carlota_Ángela.gutiérrez@gutiérrez.carlota_ángela@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1830, N'Nieto', N'Gabriel Naín', 29000048, N'M', CAST(N'1998-01-28' AS Date), N'3366837190', N'gabriel_naín.nieto@nieto.gabriel_naín@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1831, N'Cruz', N'Isaías Gabriel', 29000049, N'M', CAST(N'1998-01-10' AS Date), N'3365209106', N'isaías_gabriel.cruz@cruz.isaías_gabriel@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1832, N'Giménez', N'Nahia Zoe', 29000050, N'F', CAST(N'1998-01-16' AS Date), N'3364262293', N'nahia_zoe.giménez@giménez.nahia_zoe@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1833, N'Romero', N'Valentina Iris', 29000051, N'F', CAST(N'1998-01-23' AS Date), N'3363426732', N'valentina_iris.romero@romero.valentina_iris@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1834, N'Molina', N'Baltasar Abdiel', 29000052, N'M', CAST(N'1998-01-21' AS Date), N'3365111455', N'baltasar_abdiel.molina@molina.baltasar_abdiel@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1835, N'Rojas', N'Jimena Fátima', 29000053, N'F', CAST(N'1998-01-21' AS Date), N'3367345443', N'jimena_fátima.rojas@rojas.jimena_fátima@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1836, N'Fuentes', N'Dámaso Sergio', 29000054, N'M', CAST(N'1998-01-29' AS Date), N'3366948262', N'dámaso_sergio.fuentes@fuentes.dámaso_sergio@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1837, N'Soler', N'Nerea Elsa', 29000055, N'F', CAST(N'1998-01-23' AS Date), N'3366434981', N'nerea_elsa.soler@soler.nerea_elsa@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1838, N'Cruz', N'Isaías Eneas', 29000056, N'M', CAST(N'1998-01-16' AS Date), N'3367463504', N'isaías_eneas.cruz@cruz.isaías_eneas@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1839, N'Santana', N'Alicia Luna', 29000057, N'F', CAST(N'1998-01-08' AS Date), N'3369915576', N'alicia_luna.santana@santana.alicia_luna@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1840, N'Rojas', N'Gaspar Uzías', 29000058, N'M', CAST(N'1998-01-10' AS Date), N'3367101026', N'gaspar_uzías.rojas@rojas.gaspar_uzías@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1841, N'Cortés', N'Jimena Nora', 29000059, N'F', CAST(N'1998-01-07' AS Date), N'3369978707', N'jimena_nora.cortés@cortés.jimena_nora@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1842, N'Gómez', N'Mar Leire', 29000060, N'F', CAST(N'1998-01-28' AS Date), N'3367984602', N'mar_leire.gómez@gómez.mar_leire@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1843, N'Muñoz', N'Esteban David', 29000061, N'M', CAST(N'1998-01-09' AS Date), N'3363422538', N'esteban_david.muñoz@muñoz.esteban_david@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1844, N'Rojas', N'Gaspar Fabián', 29000062, N'M', CAST(N'1998-01-11' AS Date), N'3364174808', N'gaspar_fabián.rojas@rojas.gaspar_fabián@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1845, N'Suárez', N'Germán Salomón', 29000063, N'M', CAST(N'1998-01-13' AS Date), N'3364133291', N'germán_salomón.suárez@suárez.germán_salomón@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1846, N'Nieto', N'Nour Alma', 29000064, N'F', CAST(N'1998-01-05' AS Date), N'3363707369', N'nour_alma.nieto@nieto.nour_alma@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1847, N'Martínez', N'Jesús Ismael', 29000065, N'M', CAST(N'1998-01-05' AS Date), N'3369986678', N'jesús_ismael.martínez@martínez.jesús_ismael@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1848, N'García', N'Luna Blanca', 29000066, N'F', CAST(N'1998-01-06' AS Date), N'3363949868', N'luna_blanca.garcía@garcía.luna_blanca@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1849, N'Márquez', N'Jimena Abril', 29000067, N'F', CAST(N'1998-01-22' AS Date), N'3368764895', N'jimena_abril.márquez@márquez.jimena_abril@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1850, N'Arias', N'Luna Andrea', 29000068, N'F', CAST(N'1998-01-19' AS Date), N'3363698829', N'luna_andrea.arias@arias.luna_andrea@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1851, N'García', N'Azahara María', 29000069, N'F', CAST(N'1998-01-10' AS Date), N'3363550713', N'azahara_maría.garcía@garcía.azahara_maría@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1852, N'Álvarez', N'Efraín Aarón', 29000070, N'M', CAST(N'1998-01-28' AS Date), N'3368942820', N'efraín_aarón.Álvarez@álvarez.efraín_aarón@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1853, N'Díaz', N'Laia Aina', 29000071, N'F', CAST(N'1998-01-20' AS Date), N'3363438229', N'laia_aina.díaz@díaz.laia_aina@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1854, N'González', N'Carmen Emma', 29000072, N'F', CAST(N'1998-01-23' AS Date), N'3363767963', N'carmen_emma.gonzález@gonzález.carmen_emma@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1855, N'Vázquez', N'Azahara Lara', 29000073, N'F', CAST(N'1998-01-28' AS Date), N'3365449416', N'azahara_lara.vázquez@vázquez.azahara_lara@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1856, N'Cortés', N'Jana Ona', 29000074, N'F', CAST(N'1998-01-15' AS Date), N'3364661414', N'jana_ona.cortés@cortés.jana_ona@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1857, N'Suárez', N'Amaia Vega', 29000075, N'F', CAST(N'1998-01-03' AS Date), N'3364396901', N'amaia_vega.suárez@suárez.amaia_vega@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1858, N'Cortés', N'Eliel Jacob', 29000076, N'M', CAST(N'1998-01-26' AS Date), N'3364072717', N'eliel_jacob.cortés@cortés.eliel_jacob@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1859, N'Gómez', N'Yasmín Cayetana', 29000077, N'F', CAST(N'1998-01-14' AS Date), N'3366243928', N'yasmín_cayetana.gómez@gómez.yasmín_cayetana@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1860, N'Vidal', N'Aina Candela', 29000078, N'F', CAST(N'1998-01-11' AS Date), N'3364733948', N'aina_candela.vidal@vidal.aina_candela@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1861, N'Martínez', N'Marcos Elías', 29000079, N'M', CAST(N'1998-01-02' AS Date), N'3367575864', N'marcos_elías.martínez@martínez.marcos_elías@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1862, N'Delgado', N'Tobías Neftalí', 29000080, N'M', CAST(N'1998-01-04' AS Date), N'3365907056', N'tobías_neftalí.delgado@delgado.tobías_neftalí@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1863, N'Martín', N'Elías Gaspar', 29000081, N'M', CAST(N'1998-01-01' AS Date), N'3365835067', N'elías_gaspar.martín@martín.elías_gaspar@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1864, N'Cano', N'Julio Matías', 29000082, N'M', CAST(N'1998-01-10' AS Date), N'3369857925', N'julio_matías.cano@cano.julio_matías@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1865, N'Rivera', N'Manuela Alma', 29000083, N'F', CAST(N'1998-01-01' AS Date), N'3363606765', N'manuela_alma.rivera@rivera.manuela_alma@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1866, N'Aguilar', N' Alba', 29000084, N'F', CAST(N'1998-01-13' AS Date), N'3369612269', N'_alba.aguilar@aguilar._alba@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1867, N'Cruz', N'Natalia Isabel', 29000085, N'F', CAST(N'1998-01-19' AS Date), N'3367202997', N'natalia_isabel.cruz@cruz.natalia_isabel@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1868, N'Montero', N'Abdiel Germán', 29000086, N'M', CAST(N'1998-01-27' AS Date), N'3367488411', N'abdiel_germán.montero@montero.abdiel_germán@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1869, N'Fernández', N'Ana Abril', 29000087, N'F', CAST(N'1998-01-10' AS Date), N'3368153558', N'ana_abril.fernández@fernández.ana_abril@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1870, N'Peña', N'José Francisco', 29000088, N'M', CAST(N'1998-01-28' AS Date), N'3364948895', N'josé_francisco.peña@peña.josé_francisco@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1871, N'Sánchez', N'Uzías Lucas', 29000089, N'M', CAST(N'1998-01-22' AS Date), N'3367522341', N'uzías_lucas.sánchez@sánchez.uzías_lucas@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1872, N'Aguilar', N'Marta Inés', 29000090, N'F', CAST(N'1998-01-14' AS Date), N'3364684174', N'marta_inés.aguilar@aguilar.marta_inés@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1873, N'Molina', N'Eliel Eneas', 29000091, N'M', CAST(N'1998-01-10' AS Date), N'3365484726', N'eliel_eneas.molina@molina.eliel_eneas@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1874, N'Rubio', N'Ángela Ainhoa', 29000092, N'F', CAST(N'1998-01-27' AS Date), N'3368272595', N'Ángela_ainhoa.rubio@rubio.ángela_ainhoa@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1875, N'Moya', N'Elena Adara', 29000093, N'F', CAST(N'1998-01-28' AS Date), N'3369535560', N'elena_adara.moya@moya.elena_adara@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1876, N'Iglesias', N'Mar Nuria', 29000094, N'F', CAST(N'1998-01-28' AS Date), N'3368546112', N'mar_nuria.iglesias@iglesias.mar_nuria@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1877, N'Guerrero', N'Carla Elsa', 29000095, N'F', CAST(N'1998-01-12' AS Date), N'3366408355', N'carla_elsa.guerrero@guerrero.carla_elsa@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1878, N'Crespo', N'Lucía Paula', 29000096, N'F', CAST(N'1998-01-06' AS Date), N'3364287607', N'lucía_paula.crespo@crespo.lucía_paula@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1879, N'Castro', N'Iris India', 29000097, N'F', CAST(N'1998-01-25' AS Date), N'3365533595', N'iris_india.castro@castro.iris_india@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1880, N'Vicente', N'Caín Agustín', 29000098, N'M', CAST(N'1998-01-13' AS Date), N'3369782883', N'caín_agustín.vicente@vicente.caín_agustín@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1881, N'Garrido', N'Abdiel Ismael', 29000099, N'M', CAST(N'1998-01-05' AS Date), N'3367999293', N'abdiel_ismael.garrido@garrido.abdiel_ismael@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1882, N'Cruz', N'Helena Nuria', 29500001, N'F', CAST(N'1999-01-10' AS Date), N'3363350361', N'helena_nuria.cruz@cruz.helena_nuria@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1883, N'Hidalgo', N'Carmen Elsa', 29500002, N'F', CAST(N'1999-01-16' AS Date), N'3369509859', N'carmen_elsa.hidalgo@hidalgo.carmen_elsa@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1884, N'Cruz', N'Gala Laura', 29500003, N'F', CAST(N'1999-01-09' AS Date), N'3367989989', N'gala_laura.cruz@cruz.gala_laura@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1885, N'Arias', N'Malak Daniela', 29500004, N'F', CAST(N'1999-01-24' AS Date), N'3366903825', N'malak_daniela.arias@arias.malak_daniela@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1886, N'Suárez', N'Caleb José', 29500005, N'M', CAST(N'1999-01-27' AS Date), N'3369353278', N'caleb_josé.suárez@suárez.caleb_josé@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1887, N'Peña', N'Natalia Daniela', 29500006, N'F', CAST(N'1999-01-06' AS Date), N'3363004964', N'natalia_daniela.peña@peña.natalia_daniela@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1888, N'González', N'Samuel Bartolomé', 29500007, N'M', CAST(N'1999-01-25' AS Date), N'3363867143', N'samuel_bartolomé.gonzález@gonzález.samuel_bartolomé@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1889, N'Soto', N'Candela Paula', 29500008, N'F', CAST(N'1999-01-11' AS Date), N'3364242698', N'candela_paula.soto@soto.candela_paula@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1890, N'Cabrera', N'Uzías Neftalí', 29500009, N'M', CAST(N'1999-01-26' AS Date), N'3367641953', N'uzías_neftalí.cabrera@cabrera.uzías_neftalí@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1891, N'Duran', N'Elsa María', 29500010, N'F', CAST(N'1999-01-13' AS Date), N'3363356241', N'elsa_maría.duran@duran.elsa_maría@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1892, N'Flores', N'Martina Noa', 29500011, N'F', CAST(N'1999-01-05' AS Date), N'3369429336', N'martina_noa.flores@flores.martina_noa@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1893, N'Alonso', N'Rafael Uzías', 29500012, N'M', CAST(N'1999-01-01' AS Date), N'3368355287', N'rafael_uzías.alonso@alonso.rafael_uzías@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1894, N'Domínguez', N'Martina Ona', 29500013, N'F', CAST(N'1999-01-22' AS Date), N'3363384360', N'martina_ona.domínguez@domínguez.martina_ona@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1895, N'León', N'Elena Nuria', 29500014, N'F', CAST(N'1999-01-18' AS Date), N'3364977195', N'elena_nuria.león@león.elena_nuria@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1896, N'León', N'Nour Lara', 29500015, N'F', CAST(N'1999-01-18' AS Date), N'3364498605', N'nour_lara.león@león.nour_lara@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1897, N'Gutiérrez', N'Caleb Ismael', 29500016, N'M', CAST(N'1999-01-18' AS Date), N'3366644777', N'caleb_ismael.gutiérrez@gutiérrez.caleb_ismael@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1898, N'Ortega', N'Moisés Rafael', 29500017, N'M', CAST(N'1999-01-24' AS Date), N'3365425666', N'moisés_rafael.ortega@ortega.moisés_rafael@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1899, N'Gallego', N'Berta Alejandra', 29500018, N'F', CAST(N'1999-01-23' AS Date), N'3364463190', N'berta_alejandra.gallego@gallego.berta_alejandra@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1900, N'Gallego', N'Andrea Clara', 29500019, N'F', CAST(N'1999-01-22' AS Date), N'3365614631', N'andrea_clara.gallego@gallego.andrea_clara@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1901, N'Benitez', N'Jacob Ashur', 29500020, N'M', CAST(N'1999-01-09' AS Date), N'3365468140', N'jacob_ashur.benitez@benitez.jacob_ashur@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1902, N'Ferrer', N'Jacob Pablo', 29500021, N'M', CAST(N'1999-01-15' AS Date), N'3369409256', N'jacob_pablo.ferrer@ferrer.jacob_pablo@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1903, N'Benitez', N'Esteban Mateo', 29500022, N'M', CAST(N'1999-01-06' AS Date), N'3366893437', N'esteban_mateo.benitez@benitez.esteban_mateo@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1904, N'Delgado', N'Aroa Vega', 29500023, N'F', CAST(N'1999-01-14' AS Date), N'3367909603', N'aroa_vega.delgado@delgado.aroa_vega@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1905, N'Aguilar', N'Victoria Lola', 29500024, N'F', CAST(N'1999-01-30' AS Date), N'3363402831', N'victoria_lola.aguilar@aguilar.victoria_lola@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1906, N'Reyes', N'Carla Elena', 29500025, N'F', CAST(N'1999-01-30' AS Date), N'3367616335', N'carla_elena.reyes@reyes.carla_elena@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1907, N'Bravo', N'Mia Leire', 29500026, N'F', CAST(N'1999-01-01' AS Date), N'3369173576', N'mia_leire.bravo@bravo.mia_leire@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1908, N'Álvarez', N'Baltasar Rafael', 29500027, N'M', CAST(N'1999-01-04' AS Date), N'3368996786', N'baltasar_rafael.Álvarez@álvarez.baltasar_rafael@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1909, N'Garrido', N'Blanca Celia', 29500028, N'F', CAST(N'1999-01-01' AS Date), N'3367322364', N'blanca_celia.garrido@garrido.blanca_celia@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1910, N'Herrera', N'Homero Germán', 29500029, N'M', CAST(N'1999-01-14' AS Date), N'3365768226', N'homero_germán.herrera@herrera.homero_germán@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1911, N'Molina', N'Leire África', 29500030, N'F', CAST(N'1999-01-15' AS Date), N'3367183594', N'leire_África.molina@molina.leire_áfrica@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1912, N'Lorenzo', N' Julieta', 29500031, N'F', CAST(N'1999-01-02' AS Date), N'3363009324', N'_julieta.lorenzo@lorenzo._julieta@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1913, N'Peña', N'Martina Cayetana', 29500032, N'F', CAST(N'1999-01-22' AS Date), N'3364492671', N'martina_cayetana.peña@peña.martina_cayetana@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1914, N'Alonso', N'Gala Elsa', 29500033, N'F', CAST(N'1999-01-03' AS Date), N'3368675646', N'gala_elsa.alonso@alonso.gala_elsa@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1915, N'Molina', N'Joaquín Hugo', 29500034, N'M', CAST(N'1999-01-27' AS Date), N'3363927556', N'joaquín_hugo.molina@molina.joaquín_hugo@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1916, N'Garrido', N'Hugo Ahzià', 29500035, N'M', CAST(N'1999-01-25' AS Date), N'3369316011', N'hugo_ahzià.garrido@garrido.hugo_ahzià@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1917, N'Rodríguez', N'Abimael Baltasar', 29500036, N'M', CAST(N'1999-01-03' AS Date), N'3365465326', N'abimael_baltasar.rodríguez@rodríguez.abimael_baltasar@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1918, N'Guerrero', N'Elí Jacob', 29500037, N'M', CAST(N'1999-01-21' AS Date), N'3366496440', N'elí_jacob.guerrero@guerrero.elí_jacob@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1919, N'Arias', N'Fabián Elías', 29500038, N'M', CAST(N'1999-01-05' AS Date), N'3368572382', N'fabián_elías.arias@arias.fabián_elías@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1920, N'Martínez', N'Eva Cayetana', 29500039, N'F', CAST(N'1999-01-20' AS Date), N'3366753707', N'eva_cayetana.martínez@martínez.eva_cayetana@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1921, N'Roman', N'Agustín Noé', 29500040, N'M', CAST(N'1999-01-26' AS Date), N'3366611541', N'agustín_noé.roman@roman.agustín_noé@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1922, N'Cano', N'Ainhoa Alba', 29500041, N'F', CAST(N'1999-01-29' AS Date), N'3365683806', N'ainhoa_alba.cano@cano.ainhoa_alba@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1923, N'Giménez', N'Elia Jana', 29500042, N'F', CAST(N'1999-01-23' AS Date), N'3366085155', N'elia_jana.giménez@giménez.elia_jana@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1924, N'Herrero', N'Vera Emma', 29500043, N'F', CAST(N'1999-01-04' AS Date), N'3369571362', N'vera_emma.herrero@herrero.vera_emma@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1925, N'Cruz', N'Ciro Jesús', 29500044, N'M', CAST(N'1999-01-11' AS Date), N'3364961403', N'ciro_jesús.cruz@cruz.ciro_jesús@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1926, N'Caballero', N'Leire Isabel', 29500045, N'F', CAST(N'1999-01-09' AS Date), N'3363059573', N'leire_isabel.caballero@caballero.leire_isabel@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1927, N'Calvo', N'Carmen Aroa', 29500046, N'F', CAST(N'1999-01-11' AS Date), N'3369748867', N'carmen_aroa.calvo@calvo.carmen_aroa@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1928, N'Gil', N'Irene Ona', 29500047, N'F', CAST(N'1999-01-11' AS Date), N'3369704731', N'irene_ona.gil@gil.irene_ona@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1929, N'Rubio', N'Vega Natalia', 29500048, N'F', CAST(N'1999-01-12' AS Date), N'3364906070', N'vega_natalia.rubio@rubio.vega_natalia@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1930, N'Vidal', N'Fátima África', 29500049, N'F', CAST(N'1999-01-30' AS Date), N'3365159399', N'fátima_África.vidal@vidal.fátima_áfrica@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1931, N'Medina', N'Lemuel Fabián', 29500050, N'M', CAST(N'1999-01-17' AS Date), N'3364168871', N'lemuel_fabián.medina@medina.lemuel_fabián@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1932, N'Gallardo', N'Rafael Simón', 29500051, N'M', CAST(N'1999-01-05' AS Date), N'3364572323', N'rafael_simón.gallardo@gallardo.rafael_simón@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1933, N'Duran', N'Iria Sara', 29500052, N'F', CAST(N'1999-01-28' AS Date), N'3367946236', N'iria_sara.duran@duran.iria_sara@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1934, N'Torres', N'Demócrito Juan', 29500053, N'M', CAST(N'1999-01-07' AS Date), N'3363726521', N'demócrito_juan.torres@torres.demócrito_juan@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1935, N'Campos', N'Rafael Ahzià', 29500054, N'M', CAST(N'1999-01-29' AS Date), N'3368893635', N'rafael_ahzià.campos@campos.rafael_ahzià@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1936, N'Ramírez', N' Laura', 29500055, N'F', CAST(N'1999-01-09' AS Date), N'3365168723', N'_laura.ramírez@ramírez._laura@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1937, N'Castro', N'Arlet Marta', 29500056, N'F', CAST(N'1999-01-02' AS Date), N'3369529044', N'arlet_marta.castro@castro.arlet_marta@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1938, N'Nuñez', N'Beltrán Felipe', 29500057, N'M', CAST(N'1999-01-13' AS Date), N'3368570132', N'beltrán_felipe.nuñez@nuñez.beltrán_felipe@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1939, N'Guerrero', N'Jared Lucas', 29500058, N'M', CAST(N'1999-01-13' AS Date), N'3366884780', N'jared_lucas.guerrero@guerrero.jared_lucas@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1940, N'Blanco', N'África Lola', 29500059, N'F', CAST(N'1999-01-14' AS Date), N'3367545156', N'África_lola.blanco@blanco.áfrica_lola@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1941, N'Álvarez', N'Ainara Inés', 29500060, N'F', CAST(N'1999-01-21' AS Date), N'3368170236', N'ainara_inés.Álvarez@álvarez.ainara_inés@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1942, N'Fuentes', N'Caleb Saúl', 29500061, N'M', CAST(N'1999-01-10' AS Date), N'3365613316', N'caleb_saúl.fuentes@fuentes.caleb_saúl@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1943, N'Martín', N'Gabriela Sofía', 29500062, N'F', CAST(N'1999-01-23' AS Date), N'3364529193', N'gabriela_sofía.martín@martín.gabriela_sofía@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1944, N'Gutiérrez', N'Dámaso Isaías', 29500063, N'M', CAST(N'1999-01-04' AS Date), N'3369629463', N'dámaso_isaías.gutiérrez@gutiérrez.dámaso_isaías@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1945, N'Santana', N'Naia Emma', 29500064, N'F', CAST(N'1999-01-09' AS Date), N'3369984655', N'naia_emma.santana@santana.naia_emma@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1946, N'León', N'Eva Lara', 29500065, N'F', CAST(N'1999-01-26' AS Date), N'3367219164', N'eva_lara.león@león.eva_lara@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1947, N'Cortés', N'Édgar Jared', 29500066, N'M', CAST(N'1999-01-25' AS Date), N'3368303737', N'Édgar_jared.cortés@cortés.édgar_jared@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1948, N'Parra', N'Lara Aurora', 29500067, N'F', CAST(N'1999-01-08' AS Date), N'3366339306', N'lara_aurora.parra@parra.lara_aurora@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1949, N'García', N'Carla Lia', 29500068, N'F', CAST(N'1999-01-29' AS Date), N'3366294848', N'carla_lia.garcía@garcía.carla_lia@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1950, N'Ortega', N'Caín Neftalí', 29500069, N'M', CAST(N'1999-01-09' AS Date), N'3364432587', N'caín_neftalí.ortega@ortega.caín_neftalí@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1951, N'Rodríguez', N'Elías Caín', 29500070, N'M', CAST(N'1999-01-15' AS Date), N'3366120497', N'elías_caín.rodríguez@rodríguez.elías_caín@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1952, N'Hidalgo', N'Isaías Beltrán', 29500071, N'M', CAST(N'1999-01-08' AS Date), N'3368779138', N'isaías_beltrán.hidalgo@hidalgo.isaías_beltrán@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1953, N'López', N'Jeremías Saúl', 29500072, N'M', CAST(N'1999-01-16' AS Date), N'3369111598', N'jeremías_saúl.lópez@lópez.jeremías_saúl@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1954, N'Ferrer', N'Andrés Abel', 29500073, N'M', CAST(N'1999-01-19' AS Date), N'3365149732', N'andrés_abel.ferrer@ferrer.andrés_abel@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1955, N'Rodríguez', N'Adán Herodes', 29500074, N'M', CAST(N'1999-01-24' AS Date), N'3365728895', N'adán_herodes.rodríguez@rodríguez.adán_herodes@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1956, N'Jimenez', N'Neftalí David', 29500075, N'M', CAST(N'1999-01-21' AS Date), N'3368473412', N'neftalí_david.jimenez@jimenez.neftalí_david@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1957, N'Carmona', N'Tobías Neftalí', 29500076, N'M', CAST(N'1999-01-08' AS Date), N'3364695388', N'tobías_neftalí.carmona@carmona.tobías_neftalí@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1958, N'Gallardo', N' Abril', 29500077, N'F', CAST(N'1999-01-07' AS Date), N'3368728367', N'_abril.gallardo@gallardo._abril@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1959, N'Castillo', N'Lara Olivia', 29500078, N'F', CAST(N'1999-01-17' AS Date), N'3368067930', N'lara_olivia.castillo@castillo.lara_olivia@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1960, N'Soto', N'Laura Victoria', 29500079, N'F', CAST(N'1999-01-06' AS Date), N'3363563385', N'laura_victoria.soto@soto.laura_victoria@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1961, N'Ramírez', N'Noé Jaír de Galaad', 29500080, N'M', CAST(N'1999-01-19' AS Date), N'3369100246', N'noé_jaír_de_galaad.ramírez@ramírez.noé_jaír_de_galaad@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1962, N'Nieto', N'Jimena Luna', 29500081, N'F', CAST(N'1999-01-15' AS Date), N'3368938409', N'jimena_luna.nieto@nieto.jimena_luna@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1963, N'Arias', N'Omar Samuel', 29500082, N'M', CAST(N'1999-01-30' AS Date), N'3366430619', N'omar_samuel.arias@arias.omar_samuel@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1964, N'Santos', N'Irene Mara', 29500083, N'F', CAST(N'1999-01-21' AS Date), N'3365789662', N'irene_mara.santos@santos.irene_mara@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1965, N'Hernández', N'Julieta Lucía', 29500084, N'F', CAST(N'1999-01-27' AS Date), N'3365778197', N'julieta_lucía.hernández@hernández.julieta_lucía@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1966, N'Mora', N'Demócrito Elí', 29500085, N'M', CAST(N'1999-01-27' AS Date), N'3369101625', N'demócrito_elí.mora@mora.demócrito_elí@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1967, N'Muñoz', N'Chloe Iria', 29500086, N'F', CAST(N'1999-01-04' AS Date), N'3363134258', N'chloe_iria.muñoz@muñoz.chloe_iria@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1968, N'Calvo', N'Renato Ashur', 29500087, N'M', CAST(N'1999-01-15' AS Date), N'3369194791', N'renato_ashur.calvo@calvo.renato_ashur@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1969, N'Nieto', N'Salomón Eneas', 29500088, N'M', CAST(N'1999-01-18' AS Date), N'3366189621', N'salomón_eneas.nieto@nieto.salomón_eneas@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1970, N'Gutiérrez', N'Eneas Simón', 29500089, N'M', CAST(N'1999-01-10' AS Date), N'3367474779', N'eneas_simón.gutiérrez@gutiérrez.eneas_simón@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1971, N'Muñoz', N'Joanix Juan', 29500090, N'M', CAST(N'1999-01-13' AS Date), N'3366985497', N'joanix_juan.muñoz@muñoz.joanix_juan@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1972, N'Prieto', N'Adán Isaías', 29500091, N'M', CAST(N'1999-01-02' AS Date), N'3369975061', N'adán_isaías.prieto@prieto.adán_isaías@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1973, N'Sáez', N'Adara Ainhoa', 29500092, N'F', CAST(N'1999-01-26' AS Date), N'3363527061', N'adara_ainhoa.sáez@sáez.adara_ainhoa@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1974, N'Calvo', N'Jared Leví', 29500093, N'M', CAST(N'1999-01-30' AS Date), N'3363448244', N'jared_leví.calvo@calvo.jared_leví@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1975, N'Serrano', N'Agustín Ashur', 29500094, N'M', CAST(N'1999-01-07' AS Date), N'3364266009', N'agustín_ashur.serrano@serrano.agustín_ashur@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1976, N'Iglesias', N'Matías Bartolomé', 29500095, N'M', CAST(N'1999-01-09' AS Date), N'3367875524', N'matías_bartolomé.iglesias@iglesias.matías_bartolomé@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1977, N'López', N'Aarón Adán', 29500096, N'M', CAST(N'1999-01-04' AS Date), N'3369348559', N'aarón_adán.lópez@lópez.aarón_adán@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1978, N'Prieto', N'José Josué', 29500097, N'M', CAST(N'1999-01-10' AS Date), N'3368311866', N'josé_josué.prieto@prieto.josé_josué@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1979, N'Peña', N'Labán Noé', 29500098, N'M', CAST(N'1999-01-01' AS Date), N'3369425068', N'labán_noé.peña@peña.labán_noé@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1980, N'Mora', N'Renato Pablo', 29500099, N'M', CAST(N'1999-01-06' AS Date), N'3364907632', N'renato_pablo.mora@mora.renato_pablo@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1981, N'Ramos', N'Isaías Herodes', 30000001, N'M', CAST(N'2000-01-08' AS Date), N'3367537400', N'isaías_herodes.ramos@ramos.isaías_herodes@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1982, N'Vega', N'Adriana Diana', 30000002, N'F', CAST(N'2000-01-22' AS Date), N'3369214827', N'adriana_diana.vega@vega.adriana_diana@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1983, N'Pascual', N'Aina Lina', 30000003, N'F', CAST(N'2000-01-16' AS Date), N'3363196403', N'aina_lina.pascual@pascual.aina_lina@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1984, N'Cano', N'Triana Blanca', 30000004, N'F', CAST(N'2000-01-06' AS Date), N'3369541167', N'triana_blanca.cano@cano.triana_blanca@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1985, N'Alonso', N'Ezequiel Samuel', 30000005, N'M', CAST(N'2000-01-07' AS Date), N'3364470185', N'ezequiel_samuel.alonso@alonso.ezequiel_samuel@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1986, N'Gallardo', N'Ángela Chloe', 30000006, N'F', CAST(N'2000-01-28' AS Date), N'3364528057', N'Ángela_chloe.gallardo@gallardo.ángela_chloe@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1987, N'Herrera', N'Paula Nora', 30000007, N'F', CAST(N'2000-01-15' AS Date), N'3365505552', N'paula_nora.herrera@herrera.paula_nora@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1988, N'Giménez', N'Eliseo Ahzià', 30000008, N'M', CAST(N'2000-01-10' AS Date), N'3366633126', N'eliseo_ahzià.giménez@giménez.eliseo_ahzià@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1989, N'Vargas', N'Félix Isaac', 30000009, N'M', CAST(N'2000-01-27' AS Date), N'3363716203', N'félix_isaac.vargas@vargas.félix_isaac@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1990, N'Roman', N'Celia Eva', 30000010, N'F', CAST(N'2000-01-30' AS Date), N'3364719237', N'celia_eva.roman@roman.celia_eva@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1991, N'Fernández', N'Lucas Sergio', 30000011, N'M', CAST(N'2000-01-02' AS Date), N'3369814091', N'lucas_sergio.fernández@fernández.lucas_sergio@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1992, N'Rivera', N'Vega Naia', 30000012, N'F', CAST(N'2000-01-09' AS Date), N'3368246063', N'vega_naia.rivera@rivera.vega_naia@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1993, N'Alonso', N'Emma Cloe', 30000013, N'F', CAST(N'2000-01-01' AS Date), N'3367948062', N'emma_cloe.alonso@alonso.emma_cloe@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1994, N'Carmona', N'Gadiel Darío', 30000014, N'M', CAST(N'2000-01-16' AS Date), N'3367021046', N'gadiel_darío.carmona@carmona.gadiel_darío@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1995, N'Reyes', N'Berta Naia', 30000015, N'F', CAST(N'2000-01-06' AS Date), N'3366455351', N'berta_naia.reyes@reyes.berta_naia@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1996, N'Herrero', N'Sara Laura', 30000016, N'F', CAST(N'2000-01-12' AS Date), N'3367580055', N'sara_laura.herrero@herrero.sara_laura@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1997, N'Peña', N'Yasmín Andrea', 30000017, N'F', CAST(N'2000-01-03' AS Date), N'3369879083', N'yasmín_andrea.peña@peña.yasmín_andrea@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1998, N'Torres', N'Jaír de Galaad Rubén', 30000018, N'M', CAST(N'2000-01-11' AS Date), N'3366005293', N'jaír_de_galaad_rubén.torres@torres.jaír_de_galaad_rubén@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (1999, N'Hernández', N'Isaías Sergio', 30000019, N'M', CAST(N'2000-01-23' AS Date), N'3364413956', N'isaías_sergio.hernández@hernández.isaías_sergio@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2000, N'Nieto', N'Édgar Félix', 30000020, N'M', CAST(N'2000-01-22' AS Date), N'3367405795', N'Édgar_félix.nieto@nieto.édgar_félix@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2001, N'Santana', N'Moisés Isaac', 30000021, N'M', CAST(N'2000-01-18' AS Date), N'3363765742', N'moisés_isaac.santana@santana.moisés_isaac@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2002, N'Velasco', N'Candela Cristina', 30000022, N'F', CAST(N'2000-01-04' AS Date), N'3367679934', N'candela_cristina.velasco@velasco.candela_cristina@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2003, N'Suárez', N'Elías Jiram', 30000023, N'M', CAST(N'2000-01-20' AS Date), N'3369828982', N'elías_jiram.suárez@suárez.elías_jiram@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2004, N'Vargas', N'Samuel Daniel', 30000024, N'M', CAST(N'2000-01-28' AS Date), N'3366691906', N'samuel_daniel.vargas@vargas.samuel_daniel@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2005, N'Méndez', N'Diana Alba', 30000025, N'F', CAST(N'2000-01-22' AS Date), N'3364625369', N'diana_alba.méndez@méndez.diana_alba@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2006, N'Rubio', N'Naín Marduk', 30000026, N'M', CAST(N'2000-01-11' AS Date), N'3369382321', N'naín_marduk.rubio@rubio.naín_marduk@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2007, N'Velasco', N'Berta Natalia', 30000027, N'F', CAST(N'2000-01-06' AS Date), N'3363034169', N'berta_natalia.velasco@velasco.berta_natalia@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2008, N'Gutiérrez', N'Joanix Alejandro', 30000028, N'M', CAST(N'2000-01-02' AS Date), N'3365443633', N'joanix_alejandro.gutiérrez@gutiérrez.joanix_alejandro@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2009, N'Calvo', N'Jaír de Galaad Josué', 30000029, N'M', CAST(N'2000-01-04' AS Date), N'3364629776', N'jaír_de_galaad_josué.calvo@calvo.jaír_de_galaad_josué@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2010, N'Gómez', N'Naín Isaac', 30000030, N'M', CAST(N'2000-01-01' AS Date), N'3365109532', N'naín_isaac.gómez@gómez.naín_isaac@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2011, N'Suárez', N'Cayetana Diana', 30000031, N'F', CAST(N'2000-01-13' AS Date), N'3364748657', N'cayetana_diana.suárez@suárez.cayetana_diana@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2012, N'Sánchez', N'Cloe Nahia', 30000032, N'F', CAST(N'2000-01-10' AS Date), N'3363407165', N'cloe_nahia.sánchez@sánchez.cloe_nahia@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2013, N'Rivera', N'Adara Sofía', 30000033, N'F', CAST(N'2000-01-19' AS Date), N'3367445556', N'adara_sofía.rivera@rivera.adara_sofía@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2014, N'Martínez', N'Abraham Hugo', 30000034, N'M', CAST(N'2000-01-08' AS Date), N'3368386216', N'abraham_hugo.martínez@martínez.abraham_hugo@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2015, N'Cabrera', N'Sofía Paula', 30000035, N'F', CAST(N'2000-01-21' AS Date), N'3366448549', N'sofía_paula.cabrera@cabrera.sofía_paula@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2016, N'Diez', N'Valentina Ainhoa', 30000036, N'F', CAST(N'2000-01-27' AS Date), N'3369069559', N'valentina_ainhoa.diez@diez.valentina_ainhoa@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2017, N'Reyes', N'María Andrea', 30000037, N'F', CAST(N'2000-01-04' AS Date), N'3368965252', N'maría_andrea.reyes@reyes.maría_andrea@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2018, N'Lozano', N'Emma África', 30000038, N'F', CAST(N'2000-01-05' AS Date), N'3367973092', N'emma_África.lozano@lozano.emma_áfrica@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2019, N'Soto', N'Naín Aarón', 30000039, N'M', CAST(N'2000-01-25' AS Date), N'3369832669', N'naín_aarón.soto@soto.naín_aarón@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2020, N'Diez', N'Gala Julia', 30000040, N'F', CAST(N'2000-01-02' AS Date), N'3364585772', N'gala_julia.diez@diez.gala_julia@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2021, N'Muñoz', N'Lucas Guido', 30000041, N'M', CAST(N'2000-01-01' AS Date), N'3363493637', N'lucas_guido.muñoz@muñoz.lucas_guido@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2022, N'Prieto', N'Gadiel Demócrito', 30000042, N'M', CAST(N'2000-01-21' AS Date), N'3368589280', N'gadiel_demócrito.prieto@prieto.gadiel_demócrito@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2023, N'Moya', N'Pablo Felipe', 30000043, N'M', CAST(N'2000-01-09' AS Date), N'3363719553', N'pablo_felipe.moya@moya.pablo_felipe@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2024, N'Fernández', N'Lola Candela', 30000044, N'F', CAST(N'2000-01-03' AS Date), N'3367351747', N'lola_candela.fernández@fernández.lola_candela@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2025, N'Ferrer', N'Elia Chloe', 30000045, N'F', CAST(N'2000-01-24' AS Date), N'3368235468', N'elia_chloe.ferrer@ferrer.elia_chloe@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2026, N'Rubio', N'Mateo Matías', 30000046, N'M', CAST(N'2000-01-29' AS Date), N'3368404259', N'mateo_matías.rubio@rubio.mateo_matías@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2027, N'Hidalgo', N'Nour Leyre', 30000047, N'F', CAST(N'2000-01-28' AS Date), N'3367696672', N'nour_leyre.hidalgo@hidalgo.nour_leyre@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2028, N'Calvo', N'Agustín Ezequiel', 30000048, N'M', CAST(N'2000-01-04' AS Date), N'3369499697', N'agustín_ezequiel.calvo@calvo.agustín_ezequiel@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2029, N'Garrido', N'Naia Candela', 30000049, N'F', CAST(N'2000-01-29' AS Date), N'3365977305', N'naia_candela.garrido@garrido.naia_candela@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2030, N'Carmona', N'Isabel Blanca', 30000050, N'F', CAST(N'2000-01-07' AS Date), N'3366013880', N'isabel_blanca.carmona@carmona.isabel_blanca@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2031, N'Herrero', N'Beltrán Fabián', 30000051, N'M', CAST(N'2000-01-18' AS Date), N'3365434609', N'beltrán_fabián.herrero@herrero.beltrán_fabián@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2032, N'García', N'María Laia', 30000052, N'F', CAST(N'2000-01-06' AS Date), N'3368533843', N'maría_laia.garcía@garcía.maría_laia@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2033, N'Gallardo', N'Abril Amira', 30000053, N'F', CAST(N'2000-01-13' AS Date), N'3367650857', N'abril_amira.gallardo@gallardo.abril_amira@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2034, N'Mora', N'Arlet Macarena', 30000054, N'F', CAST(N'2000-01-14' AS Date), N'3368554755', N'arlet_macarena.mora@mora.arlet_macarena@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2035, N'Parra', N'Arlet Berta', 30000055, N'F', CAST(N'2000-01-19' AS Date), N'3368543147', N'arlet_berta.parra@parra.arlet_berta@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2036, N'Diez', N'Zoe Victoria', 30000056, N'F', CAST(N'2000-01-12' AS Date), N'3366539666', N'zoe_victoria.diez@diez.zoe_victoria@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2037, N'Martínez', N'Abimael Caín', 30000057, N'M', CAST(N'2000-01-21' AS Date), N'3365552222', N'abimael_caín.martínez@martínez.abimael_caín@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2038, N'Marin', N'Alejandra Aroa', 30000058, N'F', CAST(N'2000-01-29' AS Date), N'3367776439', N'alejandra_aroa.marin@marin.alejandra_aroa@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2039, N'Molina', N'Fátima Marina', 30000059, N'F', CAST(N'2000-01-10' AS Date), N'3363020091', N'fátima_marina.molina@molina.fátima_marina@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2040, N'Suárez', N'Nuria Mara', 30000060, N'F', CAST(N'2000-01-14' AS Date), N'3369947980', N'nuria_mara.suárez@suárez.nuria_mara@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2041, N'Rivera', N'Martina Naia', 30000061, N'F', CAST(N'2000-01-13' AS Date), N'3363056910', N'martina_naia.rivera@rivera.martina_naia@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2042, N'Santiago', N'Iris Gabriela', 30000062, N'F', CAST(N'2000-01-07' AS Date), N'3365958970', N'iris_gabriela.santiago@santiago.iris_gabriela@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2043, N'López', N'Simón Gaspar', 30000063, N'M', CAST(N'2000-01-13' AS Date), N'3369926136', N'simón_gaspar.lópez@lópez.simón_gaspar@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2044, N'Herrero', N'Leire Valeria', 30000064, N'F', CAST(N'2000-01-30' AS Date), N'3364809608', N'leire_valeria.herrero@herrero.leire_valeria@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2045, N'Martínez', N'Alma Sara', 30000065, N'F', CAST(N'2000-01-24' AS Date), N'3364442411', N'alma_sara.martínez@martínez.alma_sara@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2046, N'Morales', N'Iris Diana', 30000066, N'F', CAST(N'2000-01-30' AS Date), N'3369572592', N'iris_diana.morales@morales.iris_diana@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2047, N'Vega', N'Ahzià Efraín', 30000067, N'M', CAST(N'2000-01-23' AS Date), N'3366527023', N'ahzià_efraín.vega@vega.ahzià_efraín@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2048, N'Carmona', N'Arlet Isabella', 30000068, N'F', CAST(N'2000-01-16' AS Date), N'3369879746', N'arlet_isabella.carmona@carmona.arlet_isabella@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2049, N'Pérez', N'Marina María', 30000069, N'F', CAST(N'2000-01-28' AS Date), N'3367969193', N'marina_maría.pérez@pérez.marina_maría@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2050, N'Castillo', N'Claudia Jana', 30000070, N'F', CAST(N'2000-01-19' AS Date), N'3365507710', N'claudia_jana.castillo@castillo.claudia_jana@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2051, N'Domínguez', N'Isaac Omar', 30000071, N'M', CAST(N'2000-01-11' AS Date), N'3366815075', N'isaac_omar.domínguez@domínguez.isaac_omar@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2052, N'Delgado', N'Jaír de Galaad Darío', 30000072, N'M', CAST(N'2000-01-16' AS Date), N'3364513120', N'jaír_de_galaad_darío.delgado@delgado.jaír_de_galaad_darío@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2053, N'Rojas', N'Israel Germán', 30000073, N'M', CAST(N'2000-01-26' AS Date), N'3366608530', N'israel_germán.rojas@rojas.israel_germán@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2054, N'Crespo', N'Carla Triana', 30000074, N'F', CAST(N'2000-01-19' AS Date), N'3369143949', N'carla_triana.crespo@crespo.carla_triana@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2055, N'Santiago', N'Rafael Jesús', 30000075, N'M', CAST(N'2000-01-03' AS Date), N'3363424434', N'rafael_jesús.santiago@santiago.rafael_jesús@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2056, N'Hidalgo', N'Moisés Eneas', 30000076, N'M', CAST(N'2000-01-26' AS Date), N'3368883976', N'moisés_eneas.hidalgo@hidalgo.moisés_eneas@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2057, N'Ortiz', N'Vega Alejandra', 30000077, N'F', CAST(N'2000-01-13' AS Date), N'3368483938', N'vega_alejandra.ortiz@ortiz.vega_alejandra@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2058, N'Giménez', N'Inés Leyre', 30000078, N'F', CAST(N'2000-01-05' AS Date), N'3366406400', N'inés_leyre.giménez@giménez.inés_leyre@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2059, N'Romero', N'Inés Luna', 30000079, N'F', CAST(N'2000-01-28' AS Date), N'3366086753', N'inés_luna.romero@romero.inés_luna@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2060, N'Rubio', N'Alejandra Sofía', 30000080, N'F', CAST(N'2000-01-14' AS Date), N'3364556260', N'alejandra_sofía.rubio@rubio.alejandra_sofía@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2061, N'Cortés', N'Herodes Andrés', 30000081, N'M', CAST(N'2000-01-22' AS Date), N'3365417432', N'herodes_andrés.cortés@cortés.herodes_andrés@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2062, N'Molina', N'Julio Ezequiel', 30000082, N'M', CAST(N'2000-01-02' AS Date), N'3366023042', N'julio_ezequiel.molina@molina.julio_ezequiel@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2063, N'Rivera', N'Ángela Isabel', 30000083, N'F', CAST(N'2000-01-07' AS Date), N'3366592018', N'Ángela_isabel.rivera@rivera.ángela_isabel@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2064, N'Rubio', N'Renato Hugo', 30000084, N'M', CAST(N'2000-01-29' AS Date), N'3364995888', N'renato_hugo.rubio@rubio.renato_hugo@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2065, N'Castillo', N'Luna Martina', 30000085, N'F', CAST(N'2000-01-20' AS Date), N'3363990791', N'luna_martina.castillo@castillo.luna_martina@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2066, N'Giménez', N'Andrea Marta', 30000086, N'F', CAST(N'2000-01-16' AS Date), N'3368283946', N'andrea_marta.giménez@giménez.andrea_marta@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2067, N'Hernández', N'Josué Gadiel', 30000087, N'M', CAST(N'2000-01-30' AS Date), N'3365796550', N'josué_gadiel.hernández@hernández.josué_gadiel@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2068, N'Delgado', N'Salomón Leví', 30000088, N'M', CAST(N'2000-01-18' AS Date), N'3368802502', N'salomón_leví.delgado@delgado.salomón_leví@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2069, N'Guerrero', N'Caín Elías', 30000089, N'M', CAST(N'2000-01-04' AS Date), N'3367190165', N'caín_elías.guerrero@guerrero.caín_elías@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2070, N'Prieto', N'Jacob Herodes', 30000090, N'M', CAST(N'2000-01-08' AS Date), N'3367094264', N'jacob_herodes.prieto@prieto.jacob_herodes@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2071, N'León', N'Fátima Jana', 30000091, N'F', CAST(N'2000-01-27' AS Date), N'3364070842', N'fátima_jana.león@león.fátima_jana@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2072, N'Aguilar', N'Elí Caleb', 30000092, N'M', CAST(N'2000-01-02' AS Date), N'3369220910', N'elí_caleb.aguilar@aguilar.elí_caleb@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2073, N'Cortés', N'Luna Marta', 30000093, N'F', CAST(N'2000-01-09' AS Date), N'3367225816', N'luna_marta.cortés@cortés.luna_marta@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2074, N'Ibáñez', N'Jiram Julio', 30000094, N'M', CAST(N'2000-01-18' AS Date), N'3366123650', N'jiram_julio.ibáñez@ibáñez.jiram_julio@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2075, N'Gil', N'Eliseo Jeremías', 30000095, N'M', CAST(N'2000-01-09' AS Date), N'3365056819', N'eliseo_jeremías.gil@gil.eliseo_jeremías@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2076, N'Carrasco', N'Hugo Ashur', 30000096, N'M', CAST(N'2000-01-18' AS Date), N'3363707656', N'hugo_ashur.carrasco@carrasco.hugo_ashur@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2077, N'Medina', N'Felipe Ezequiel', 30000097, N'M', CAST(N'2000-01-26' AS Date), N'3365335308', N'felipe_ezequiel.medina@medina.felipe_ezequiel@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2078, N'Jimenez', N'Elena Mar', 30000098, N'F', CAST(N'2000-01-23' AS Date), N'3368573259', N'elena_mar.jimenez@jimenez.elena_mar@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2079, N'Gallardo', N'Ainhoa Irene', 30000099, N'F', CAST(N'2000-01-08' AS Date), N'3367740947', N'ainhoa_irene.gallardo@gallardo.ainhoa_irene@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2080, N'Mora', N'Josué Salomón', 30500001, N'M', CAST(N'2001-01-02' AS Date), N'3364303832', N'josué_salomón.mora@mora.josué_salomón@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2081, N'Ramos', N'Celia Jimena', 30500002, N'F', CAST(N'2001-01-08' AS Date), N'3363782800', N'celia_jimena.ramos@ramos.celia_jimena@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2082, N'Pérez', N'Leyre Azahara', 30500003, N'F', CAST(N'2001-01-11' AS Date), N'3364160708', N'leyre_azahara.pérez@pérez.leyre_azahara@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2083, N'Fuentes', N'Paula Clara', 30500004, N'F', CAST(N'2001-01-24' AS Date), N'3363285969', N'paula_clara.fuentes@fuentes.paula_clara@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2084, N'Parra', N'África Carmen', 30500005, N'F', CAST(N'2001-01-29' AS Date), N'3366440760', N'África_carmen.parra@parra.áfrica_carmen@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2085, N'Santana', N'Cristina Manuela', 30500006, N'F', CAST(N'2001-01-05' AS Date), N'3364833498', N'cristina_manuela.santana@santana.cristina_manuela@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2086, N'Soto', N'Julieta Azahara', 30500007, N'F', CAST(N'2001-01-03' AS Date), N'3363549604', N'julieta_azahara.soto@soto.julieta_azahara@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2087, N'García', N'Abril Carolina', 30500008, N'F', CAST(N'2001-01-05' AS Date), N'3365143114', N'abril_carolina.garcía@garcía.abril_carolina@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2088, N'Hernández', N'Claudia Amaia', 30500009, N'F', CAST(N'2001-01-18' AS Date), N'3364637474', N'claudia_amaia.hernández@hernández.claudia_amaia@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2089, N'Garrido', N'África Inés', 30500010, N'F', CAST(N'2001-01-06' AS Date), N'3368220463', N'África_inés.garrido@garrido.áfrica_inés@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2090, N'Montero', N'Eliel Marduk', 30500011, N'M', CAST(N'2001-01-22' AS Date), N'3367058398', N'eliel_marduk.montero@montero.eliel_marduk@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2091, N'Moya', N'Lina ', 30500012, N'F', CAST(N'2001-01-01' AS Date), N'3368907402', N'lina_.moya@moya.lina_@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2092, N'Bravo', N'Irene Valentina', 30500013, N'F', CAST(N'2001-01-17' AS Date), N'3365667325', N'irene_valentina.bravo@bravo.irene_valentina@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2093, N'Duran', N'Eneas Mateo', 30500014, N'M', CAST(N'2001-01-10' AS Date), N'3366020791', N'eneas_mateo.duran@duran.eneas_mateo@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2094, N'Aguilar', N'Félix Set', 30500015, N'M', CAST(N'2001-01-04' AS Date), N'3364528021', N'félix_set.aguilar@aguilar.félix_set@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2095, N'Lozano', N'Nour Lola', 30500016, N'F', CAST(N'2001-01-01' AS Date), N'3369776088', N'nour_lola.lozano@lozano.nour_lola@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2096, N'Sáez', N'Jairo Eliel', 30500017, N'M', CAST(N'2001-01-21' AS Date), N'3367640523', N'jairo_eliel.sáez@sáez.jairo_eliel@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2097, N'Pascual', N'Gabriel Jehoram', 30500018, N'M', CAST(N'2001-01-30' AS Date), N'3367391368', N'gabriel_jehoram.pascual@pascual.gabriel_jehoram@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2098, N'Romero', N'Lucía Laura', 30500019, N'F', CAST(N'2001-01-29' AS Date), N'3367506999', N'lucía_laura.romero@romero.lucía_laura@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2099, N'Lozano', N'Elí Zacarías', 30500020, N'M', CAST(N'2001-01-12' AS Date), N'3369144988', N'elí_zacarías.lozano@lozano.elí_zacarías@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2100, N'Soto', N'Adán Felipe', 30500021, N'M', CAST(N'2001-01-23' AS Date), N'3364326911', N'adán_felipe.soto@soto.adán_felipe@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2101, N'Castillo', N'Cayetana Luna', 30500022, N'F', CAST(N'2001-01-08' AS Date), N'3364959387', N'cayetana_luna.castillo@castillo.cayetana_luna@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2102, N'Castro', N'Felipe Samuel', 30500023, N'M', CAST(N'2001-01-07' AS Date), N'3369608434', N'felipe_samuel.castro@castro.felipe_samuel@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2103, N'Prieto', N'Set Jacob', 30500024, N'M', CAST(N'2001-01-20' AS Date), N'3366964248', N'set_jacob.prieto@prieto.set_jacob@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2104, N'Sánchez', N'Sofía Aroa', 30500025, N'F', CAST(N'2001-01-13' AS Date), N'3363314836', N'sofía_aroa.sánchez@sánchez.sofía_aroa@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2105, N'Domínguez', N'Julia Carlota', 30500026, N'F', CAST(N'2001-01-30' AS Date), N'3368428653', N'julia_carlota.domínguez@domínguez.julia_carlota@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2106, N'Soler', N'Joaquín Ezequiel', 30500027, N'M', CAST(N'2001-01-04' AS Date), N'3365520701', N'joaquín_ezequiel.soler@soler.joaquín_ezequiel@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2107, N'Flores', N'Darío Felipe', 30500028, N'M', CAST(N'2001-01-08' AS Date), N'3368041797', N'darío_felipe.flores@flores.darío_felipe@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2108, N'Mora', N'Alba Clara', 30500029, N'F', CAST(N'2001-01-24' AS Date), N'3368708683', N'alba_clara.mora@mora.alba_clara@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2109, N'Vázquez', N'Eva Jana', 30500030, N'F', CAST(N'2001-01-30' AS Date), N'3369107490', N'eva_jana.vázquez@vázquez.eva_jana@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2110, N'Peña', N'Lucía Ainhoa', 30500031, N'F', CAST(N'2001-01-16' AS Date), N'3363104987', N'lucía_ainhoa.peña@peña.lucía_ainhoa@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2111, N'Vargas', N'Germán Jesús', 30500032, N'M', CAST(N'2001-01-10' AS Date), N'3364420514', N'germán_jesús.vargas@vargas.germán_jesús@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2112, N'Diez', N'Gabriela Gala', 30500033, N'F', CAST(N'2001-01-17' AS Date), N'3369377960', N'gabriela_gala.diez@diez.gabriela_gala@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2113, N'Fernández', N'Mia Ana', 30500034, N'F', CAST(N'2001-01-17' AS Date), N'3369666391', N'mia_ana.fernández@fernández.mia_ana@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2114, N'Prieto', N'Ariadna Cayetana', 30500035, N'F', CAST(N'2001-01-23' AS Date), N'3366037714', N'ariadna_cayetana.prieto@prieto.ariadna_cayetana@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2115, N'Castillo', N'Julia Luna', 30500036, N'F', CAST(N'2001-01-05' AS Date), N'3367031596', N'julia_luna.castillo@castillo.julia_luna@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2116, N'Gallego', N'Isabella Clara', 30500037, N'F', CAST(N'2001-01-12' AS Date), N'3365578100', N'isabella_clara.gallego@gallego.isabella_clara@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2117, N'Vázquez', N'Acab Baltasar', 30500038, N'M', CAST(N'2001-01-02' AS Date), N'3368758183', N'acab_baltasar.vázquez@vázquez.acab_baltasar@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2118, N'Fuentes', N'Naia Isabel', 30500039, N'F', CAST(N'2001-01-25' AS Date), N'3365636685', N'naia_isabel.fuentes@fuentes.naia_isabel@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2119, N'Castro', N'Aarón Saúl', 30500040, N'M', CAST(N'2001-01-04' AS Date), N'3369118118', N'aarón_saúl.castro@castro.aarón_saúl@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2120, N'Díaz', N'Amira Mar', 30500041, N'F', CAST(N'2001-01-11' AS Date), N'3367128148', N'amira_mar.díaz@díaz.amira_mar@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2121, N'Fernández', N'Hugo Acab', 30500042, N'M', CAST(N'2001-01-09' AS Date), N'3364952084', N'hugo_acab.fernández@fernández.hugo_acab@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2122, N'Velasco', N'Adán Elías', 30500043, N'M', CAST(N'2001-01-29' AS Date), N'3365392614', N'adán_elías.velasco@velasco.adán_elías@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2123, N'Fuentes', N'Jimena Fátima', 30500044, N'F', CAST(N'2001-01-13' AS Date), N'3363018173', N'jimena_fátima.fuentes@fuentes.jimena_fátima@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2124, N'Cortés', N'Berta Ainara', 30500045, N'F', CAST(N'2001-01-17' AS Date), N'3365211716', N'berta_ainara.cortés@cortés.berta_ainara@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2125, N'García', N'Nuria Adriana', 30500046, N'F', CAST(N'2001-01-23' AS Date), N'3363397484', N'nuria_adriana.garcía@garcía.nuria_adriana@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2126, N'Suárez', N'Ángela Gabriela', 30500047, N'F', CAST(N'2001-01-27' AS Date), N'3365272320', N'Ángela_gabriela.suárez@suárez.ángela_gabriela@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2127, N'Soler', N'Andrés Esteban', 30500048, N'M', CAST(N'2001-01-16' AS Date), N'3366618905', N'andrés_esteban.soler@soler.andrés_esteban@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2128, N'Iglesias', N'Andrés Joaquín', 30500049, N'M', CAST(N'2001-01-22' AS Date), N'3365528973', N'andrés_joaquín.iglesias@iglesias.andrés_joaquín@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2129, N'Flores', N'Ana Candela', 30500050, N'F', CAST(N'2001-01-02' AS Date), N'3369176031', N'ana_candela.flores@flores.ana_candela@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2130, N'Cruz', N'Isaac Neftalí', 30500051, N'M', CAST(N'2001-01-15' AS Date), N'3364805133', N'isaac_neftalí.cruz@cruz.isaac_neftalí@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2131, N'Méndez', N'Lucía Paula', 30500052, N'F', CAST(N'2001-01-30' AS Date), N'3363136467', N'lucía_paula.méndez@méndez.lucía_paula@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2132, N'Gil', N'Blanca Eva', 30500053, N'F', CAST(N'2001-01-23' AS Date), N'3369751336', N'blanca_eva.gil@gil.blanca_eva@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2133, N'Duran', N'Baltasar Aarón', 30500054, N'M', CAST(N'2001-01-28' AS Date), N'3365218861', N'baltasar_aarón.duran@duran.baltasar_aarón@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2134, N'Cortés', N'Amaia Blanca', 30500055, N'F', CAST(N'2001-01-21' AS Date), N'3369630340', N'amaia_blanca.cortés@cortés.amaia_blanca@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2135, N'Duran', N'Mia Eva', 30500056, N'F', CAST(N'2001-01-24' AS Date), N'3368092297', N'mia_eva.duran@duran.mia_eva@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2136, N'Herrera', N'Vega Claudia', 30500057, N'F', CAST(N'2001-01-17' AS Date), N'3369125388', N'vega_claudia.herrera@herrera.vega_claudia@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2137, N'Castro', N'Jared Guido', 30500058, N'M', CAST(N'2001-01-09' AS Date), N'3366787158', N'jared_guido.castro@castro.jared_guido@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2138, N'Pastor', N'Gadiel Alejandro', 30500059, N'M', CAST(N'2001-01-02' AS Date), N'3368948905', N'gadiel_alejandro.pastor@pastor.gadiel_alejandro@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2139, N'Navarro', N'Leví Sergio', 30500060, N'M', CAST(N'2001-01-17' AS Date), N'3369026707', N'leví_sergio.navarro@navarro.leví_sergio@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2140, N'Navarro', N'Abril Leyre', 30500061, N'F', CAST(N'2001-01-14' AS Date), N'3369950752', N'abril_leyre.navarro@navarro.abril_leyre@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2141, N'Rivera', N'Lina Luna', 30500062, N'F', CAST(N'2001-01-22' AS Date), N'3369093324', N'lina_luna.rivera@rivera.lina_luna@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2142, N'Diez', N'Rocío Paula', 30500063, N'F', CAST(N'2001-01-02' AS Date), N'3367537390', N'rocío_paula.diez@diez.rocío_paula@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2143, N'Rivera', N'Julieta Nora', 30500064, N'F', CAST(N'2001-01-09' AS Date), N'3366288532', N'julieta_nora.rivera@rivera.julieta_nora@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2144, N'Giménez', N'Vega Ariadna', 30500065, N'F', CAST(N'2001-01-20' AS Date), N'3369838861', N'vega_ariadna.giménez@giménez.vega_ariadna@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2145, N'Lozano', N'Mar Julieta', 30500066, N'F', CAST(N'2001-01-02' AS Date), N'3365251716', N'mar_julieta.lozano@lozano.mar_julieta@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2146, N'Roman', N'Félix Ashur', 30500067, N'M', CAST(N'2001-01-02' AS Date), N'3367129668', N'félix_ashur.roman@roman.félix_ashur@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2147, N'Fernández', N'Ashur Tobías', 30500068, N'M', CAST(N'2001-01-04' AS Date), N'3369677793', N'ashur_tobías.fernández@fernández.ashur_tobías@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2148, N'Duran', N'Laia Fátima', 30500069, N'F', CAST(N'2001-01-14' AS Date), N'3364495948', N'laia_fátima.duran@duran.laia_fátima@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2149, N'Lozano', N'Nour Ona', 30500070, N'F', CAST(N'2001-01-22' AS Date), N'3363145270', N'nour_ona.lozano@lozano.nour_ona@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2150, N'García', N'Daniela Jana', 30500071, N'F', CAST(N'2001-01-13' AS Date), N'3366570543', N'daniela_jana.garcía@garcía.daniela_jana@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2151, N'Benitez', N'India Iris', 30500072, N'F', CAST(N'2001-01-28' AS Date), N'3368259396', N'india_iris.benitez@benitez.india_iris@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2152, N'Carrasco', N'Ainhoa Valeria', 30500073, N'F', CAST(N'2001-01-20' AS Date), N'3369602539', N'ainhoa_valeria.carrasco@carrasco.ainhoa_valeria@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2153, N'Hernández', N'Daniel Jaír de Galaad', 30500074, N'M', CAST(N'2001-01-14' AS Date), N'3369602948', N'daniel_jaír_de_galaad.hernández@hernández.daniel_jaír_de_galaad@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2154, N'Lozano', N'Ona Isabella', 30500075, N'F', CAST(N'2001-01-03' AS Date), N'3365978450', N'ona_isabella.lozano@lozano.ona_isabella@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2155, N'Moya', N'Isabella Valeria', 30500076, N'F', CAST(N'2001-01-12' AS Date), N'3369981647', N'isabella_valeria.moya@moya.isabella_valeria@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2156, N'Ortiz', N'Manuela Aurora', 30500077, N'F', CAST(N'2001-01-30' AS Date), N'3367383889', N'manuela_aurora.ortiz@ortiz.manuela_aurora@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2157, N'Cruz', N'Ona Gala', 30500078, N'F', CAST(N'2001-01-03' AS Date), N'3365903705', N'ona_gala.cruz@cruz.ona_gala@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2158, N'Méndez', N'Ainhoa Nahia', 30500079, N'F', CAST(N'2001-01-30' AS Date), N'3364997927', N'ainhoa_nahia.méndez@méndez.ainhoa_nahia@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2159, N'Gil', N'Ona Aroa', 30500080, N'F', CAST(N'2001-01-16' AS Date), N'3365780651', N'ona_aroa.gil@gil.ona_aroa@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2160, N'Navarro', N'Macarena Iria', 30500081, N'F', CAST(N'2001-01-26' AS Date), N'3366137300', N'macarena_iria.navarro@navarro.macarena_iria@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2161, N'Nieto', N'Zacarías Esteban', 30500082, N'M', CAST(N'2001-01-03' AS Date), N'3364496545', N'zacarías_esteban.nieto@nieto.zacarías_esteban@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2162, N'Vázquez', N'Isabella Sofía', 30500083, N'F', CAST(N'2001-01-27' AS Date), N'3367073986', N'isabella_sofía.vázquez@vázquez.isabella_sofía@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2163, N'Navarro', N'Carla Lola', 30500084, N'F', CAST(N'2001-01-18' AS Date), N'3369628032', N'carla_lola.navarro@navarro.carla_lola@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2164, N'Gutiérrez', N'Diana Jimena', 30500085, N'F', CAST(N'2001-01-08' AS Date), N'3365602084', N'diana_jimena.gutiérrez@gutiérrez.diana_jimena@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2165, N'Ruiz', N'Esteban Zacarías', 30500086, N'M', CAST(N'2001-01-08' AS Date), N'3366044229', N'esteban_zacarías.ruiz@ruiz.esteban_zacarías@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2166, N'Ramírez', N'Lia', 30500087, N'F', CAST(N'2001-01-10' AS Date), N'3367494861', N'lia.ramírez@ramírez.lia@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2167, N'Peña', N'Alba Cayetana', 30500088, N'F', CAST(N'2001-01-12' AS Date), N'3368473278', N'alba_cayetana.peña@peña.alba_cayetana@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2168, N'Soto', N'Ona Carolina', 30500089, N'F', CAST(N'2001-01-16' AS Date), N'3363200258', N'ona_carolina.soto@soto.ona_carolina@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2169, N'Domínguez', N'Cloe Leire', 30500090, N'F', CAST(N'2001-01-10' AS Date), N'3364926222', N'cloe_leire.domínguez@domínguez.cloe_leire@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2170, N'López', N'Jairo Herodes', 30500091, N'M', CAST(N'2001-01-11' AS Date), N'3369424907', N'jairo_herodes.lópez@lópez.jairo_herodes@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2171, N'Cabrera', N'Mara Malak', 30500092, N'F', CAST(N'2001-01-15' AS Date), N'3364032388', N'mara_malak.cabrera@cabrera.mara_malak@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2172, N'Suárez', N'Abdiel Uzías', 30500093, N'M', CAST(N'2001-01-13' AS Date), N'3364471185', N'abdiel_uzías.suárez@suárez.abdiel_uzías@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2173, N'Peña', N'Renato Herodes', 30500094, N'M', CAST(N'2001-01-13' AS Date), N'3364514542', N'renato_herodes.peña@peña.renato_herodes@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2174, N'Carmona', N'Lucas Nicolás', 30500095, N'M', CAST(N'2001-01-10' AS Date), N'3368936603', N'lucas_nicolás.carmona@carmona.lucas_nicolás@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2175, N'Prieto', N'Alejandro Aram', 30500096, N'M', CAST(N'2001-01-16' AS Date), N'3366468895', N'alejandro_aram.prieto@prieto.alejandro_aram@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2176, N'Gutiérrez', N'María África', 30500097, N'F', CAST(N'2001-01-21' AS Date), N'3367965040', N'maría_África.gutiérrez@gutiérrez.maría_áfrica@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2177, N'Álvarez', N'Carolina Abril', 30500098, N'F', CAST(N'2001-01-28' AS Date), N'3363339462', N'carolina_abril.Álvarez@álvarez.carolina_abril@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2178, N'Romero', N'Natalia Adara', 30500099, N'F', CAST(N'2001-01-10' AS Date), N'3367323510', N'natalia_adara.romero@romero.natalia_adara@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2179, N'González', N'Laia Isabel', 31000001, N'F', CAST(N'2002-01-05' AS Date), N'3364609815', N'laia_isabel.gonzález@gonzález.laia_isabel@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2180, N'Rubio', N'Demócrito Isaías', 31000002, N'M', CAST(N'2002-01-05' AS Date), N'3366899465', N'demócrito_isaías.rubio@rubio.demócrito_isaías@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2181, N'Santana', N'Leví Beltrán', 31000003, N'M', CAST(N'2002-01-26' AS Date), N'3365008189', N'leví_beltrán.santana@santana.leví_beltrán@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2182, N'Márquez', N'Olivia Carlota', 31000004, N'F', CAST(N'2002-01-09' AS Date), N'3363308898', N'olivia_carlota.márquez@márquez.olivia_carlota@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2183, N'Peña', N'Jana Laura', 31000005, N'F', CAST(N'2002-01-01' AS Date), N'3369368603', N'jana_laura.peña@peña.jana_laura@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2184, N'Benitez', N'Aitana Aurora', 31000006, N'F', CAST(N'2002-01-29' AS Date), N'3366728546', N'aitana_aurora.benitez@benitez.aitana_aurora@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2185, N'Montero', N'Valeria María', 31000007, N'F', CAST(N'2002-01-27' AS Date), N'3367768929', N'valeria_maría.montero@montero.valeria_maría@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2186, N'Sáez', N'Ismael Set', 31000008, N'M', CAST(N'2002-01-25' AS Date), N'3368096060', N'ismael_set.sáez@sáez.ismael_set@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2187, N'Gil', N'India Irene', 31000009, N'F', CAST(N'2002-01-08' AS Date), N'3364656958', N'india_irene.gil@gil.india_irene@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2188, N'Montero', N'Laura Mia', 31000010, N'F', CAST(N'2002-01-05' AS Date), N'3363193920', N'laura_mia.montero@montero.laura_mia@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2189, N'Rodríguez', N'África Cayetana', 31000011, N'F', CAST(N'2002-01-04' AS Date), N'3368250850', N'África_cayetana.rodríguez@rodríguez.áfrica_cayetana@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2190, N'Muñoz', N'Benjamín Zacarías', 31000012, N'M', CAST(N'2002-01-25' AS Date), N'3363349068', N'benjamín_zacarías.muñoz@muñoz.benjamín_zacarías@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2191, N'Fuentes', N'Irene Andrea', 31000013, N'F', CAST(N'2002-01-03' AS Date), N'3367369791', N'irene_andrea.fuentes@fuentes.irene_andrea@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2192, N'Arias', N'Elia Abril', 31000014, N'F', CAST(N'2002-01-14' AS Date), N'3369687288', N'elia_abril.arias@arias.elia_abril@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2193, N'Nieto', N'Marta Ainara', 31000015, N'F', CAST(N'2002-01-21' AS Date), N'3365745994', N'marta_ainara.nieto@nieto.marta_ainara@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2194, N'Sáez', N'Irene Aitana', 31000016, N'F', CAST(N'2002-01-14' AS Date), N'3364834625', N'irene_aitana.sáez@sáez.irene_aitana@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2195, N'Jimenez', N'Nahia Aurora', 31000017, N'F', CAST(N'2002-01-27' AS Date), N'3366841053', N'nahia_aurora.jimenez@jimenez.nahia_aurora@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2196, N'Mora', N'Félix Demócrito', 31000018, N'M', CAST(N'2002-01-20' AS Date), N'3365022305', N'félix_demócrito.mora@mora.félix_demócrito@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2197, N'Garrido', N'Elena Blanca', 31000019, N'F', CAST(N'2002-01-09' AS Date), N'3368924222', N'elena_blanca.garrido@garrido.elena_blanca@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2198, N'Guerrero', N'Alejandro Lucas', 31000020, N'M', CAST(N'2002-01-05' AS Date), N'3368622323', N'alejandro_lucas.guerrero@guerrero.alejandro_lucas@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2199, N'Velasco', N'Rocío Ángela', 31000021, N'F', CAST(N'2002-01-29' AS Date), N'3366016810', N'rocío_Ángela.velasco@velasco.rocío_ángela@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2200, N'Cruz', N'Naín Leví', 31000022, N'M', CAST(N'2002-01-26' AS Date), N'3369377571', N'naín_leví.cruz@cruz.naín_leví@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2201, N'Méndez', N'Alba Azahara', 31000023, N'F', CAST(N'2002-01-06' AS Date), N'3363033619', N'alba_azahara.méndez@méndez.alba_azahara@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2202, N'Duran', N'Paula Lola', 31000024, N'F', CAST(N'2002-01-21' AS Date), N'3365682688', N'paula_lola.duran@duran.paula_lola@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2203, N'Hidalgo', N'Helena Iris', 31000025, N'F', CAST(N'2002-01-18' AS Date), N'3368837249', N'helena_iris.hidalgo@hidalgo.helena_iris@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2204, N'Rivera', N'Isabel Irene', 31000026, N'F', CAST(N'2002-01-08' AS Date), N'3368418366', N'isabel_irene.rivera@rivera.isabel_irene@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2205, N'Vázquez', N'Joanix Eliel', 31000027, N'M', CAST(N'2002-01-09' AS Date), N'3366625107', N'joanix_eliel.vázquez@vázquez.joanix_eliel@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2206, N'Nuñez', N'Carolina Diana', 31000028, N'F', CAST(N'2002-01-02' AS Date), N'3363248315', N'carolina_diana.nuñez@nuñez.carolina_diana@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2207, N'Morales', N'Naín Lucas', 31000029, N'M', CAST(N'2002-01-23' AS Date), N'3363113681', N'naín_lucas.morales@morales.naín_lucas@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2208, N'Vega', N'Jesús Juan', 31000030, N'M', CAST(N'2002-01-12' AS Date), N'3368879146', N'jesús_juan.vega@vega.jesús_juan@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2209, N'Santana', N'Acab Marduk', 31000031, N'M', CAST(N'2002-01-08' AS Date), N'3366266273', N'acab_marduk.santana@santana.acab_marduk@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2210, N'Jimenez', N'Helena Adara', 31000032, N'F', CAST(N'2002-01-06' AS Date), N'3369260292', N'helena_adara.jimenez@jimenez.helena_adara@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2211, N'Gómez', N'Abdiel Benjamín', 31000033, N'M', CAST(N'2002-01-22' AS Date), N'3363321959', N'abdiel_benjamín.gómez@gómez.abdiel_benjamín@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2212, N'Sánchez', N'Alejandra Ainara', 31000034, N'F', CAST(N'2002-01-16' AS Date), N'3365303790', N'alejandra_ainara.sánchez@sánchez.alejandra_ainara@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2213, N'Sáez', N'Noa Claudia', 31000035, N'F', CAST(N'2002-01-10' AS Date), N'3365409922', N'noa_claudia.sáez@sáez.noa_claudia@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2214, N'Fernández', N'Aitana Eva', 31000036, N'F', CAST(N'2002-01-27' AS Date), N'3368783932', N'aitana_eva.fernández@fernández.aitana_eva@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2215, N'Bravo', N'Carmen Nuria', 31000037, N'F', CAST(N'2002-01-19' AS Date), N'3368772387', N'carmen_nuria.bravo@bravo.carmen_nuria@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2216, N'Alonso', N'Amira Chloe', 31000038, N'F', CAST(N'2002-01-02' AS Date), N'3367600600', N'amira_chloe.alonso@alonso.amira_chloe@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2217, N'Domínguez', N'Lucas Elías', 31000039, N'M', CAST(N'2002-01-13' AS Date), N'3363307549', N'lucas_elías.domínguez@domínguez.lucas_elías@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2218, N'Lorenzo', N'Cristina Valentina', 31000040, N'F', CAST(N'2002-01-24' AS Date), N'3363690664', N'cristina_valentina.lorenzo@lorenzo.cristina_valentina@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2219, N'Alonso', N'Jeremías Jairo', 31000041, N'M', CAST(N'2002-01-18' AS Date), N'3367850594', N'jeremías_jairo.alonso@alonso.jeremías_jairo@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2220, N'Nieto', N'Édgar Naín', 31000042, N'M', CAST(N'2002-01-28' AS Date), N'3366088149', N'Édgar_naín.nieto@nieto.édgar_naín@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2221, N'Suárez', N'Guido Demócrito', 31000043, N'M', CAST(N'2002-01-16' AS Date), N'3366690972', N'guido_demócrito.suárez@suárez.guido_demócrito@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2222, N'Fuentes', N'Natalia Andrea', 31000044, N'F', CAST(N'2002-01-16' AS Date), N'3366797689', N'natalia_andrea.fuentes@fuentes.natalia_andrea@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2223, N'Peña', N'Vega Adara', 31000045, N'F', CAST(N'2002-01-08' AS Date), N'3364185879', N'vega_adara.peña@peña.vega_adara@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2224, N'Sáez', N'Jonás Leví', 31000046, N'M', CAST(N'2002-01-21' AS Date), N'3365654715', N'jonás_leví.sáez@sáez.jonás_leví@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2225, N'Domínguez', N'Cloe Ángela', 31000047, N'F', CAST(N'2002-01-29' AS Date), N'3368795609', N'cloe_Ángela.domínguez@domínguez.cloe_ángela@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2226, N'Ramírez', N'Sara Celia', 31000048, N'F', CAST(N'2002-01-05' AS Date), N'3368703051', N'sara_celia.ramírez@ramírez.sara_celia@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2227, N'Martín', N'Saúl Isaías', 31000049, N'M', CAST(N'2002-01-19' AS Date), N'3368070657', N'saúl_isaías.martín@martín.saúl_isaías@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2228, N'Hidalgo', N'Blanca ', 31000050, N'F', CAST(N'2002-01-15' AS Date), N'3363853800', N'blanca_.hidalgo@hidalgo.blanca_@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2229, N'Caballero', N'Eliel Abraham', 31000051, N'M', CAST(N'2002-01-19' AS Date), N'3368477237', N'eliel_abraham.caballero@caballero.eliel_abraham@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2230, N'Lozano', N'Marcos Jairo', 31000052, N'M', CAST(N'2002-01-25' AS Date), N'3369504525', N'marcos_jairo.lozano@lozano.marcos_jairo@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2231, N'Suárez', N'Clara Carmen', 31000053, N'F', CAST(N'2002-01-02' AS Date), N'3365691073', N'clara_carmen.suárez@suárez.clara_carmen@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2232, N'González', N'Gabriela ', 31000054, N'F', CAST(N'2002-01-28' AS Date), N'3368727310', N'gabriela_.gonzález@gonzález.gabriela_@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2233, N'Ramos', N'Sergio Hugo', 31000055, N'M', CAST(N'2002-01-24' AS Date), N'3365910788', N'sergio_hugo.ramos@ramos.sergio_hugo@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2234, N'Fernández', N'Aram Ahzià', 31000056, N'M', CAST(N'2002-01-16' AS Date), N'3369089211', N'aram_ahzià.fernández@fernández.aram_ahzià@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2235, N'Caballero', N'Mara Amira', 31000057, N'F', CAST(N'2002-01-25' AS Date), N'3369217355', N'mara_amira.caballero@caballero.mara_amira@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2236, N'Flores', N'Carla Marina', 31000058, N'F', CAST(N'2002-01-20' AS Date), N'3366174435', N'carla_marina.flores@flores.carla_marina@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2237, N'Ruiz', N'Matías Bartolomé', 31000059, N'M', CAST(N'2002-01-13' AS Date), N'3363677131', N'matías_bartolomé.ruiz@ruiz.matías_bartolomé@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2238, N'Moreno', N'Bartolomé Ciro', 31000060, N'M', CAST(N'2002-01-08' AS Date), N'3364721056', N'bartolomé_ciro.moreno@moreno.bartolomé_ciro@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2239, N'Velasco', N'Lola Marina', 31000061, N'F', CAST(N'2002-01-23' AS Date), N'3368385348', N'lola_marina.velasco@velasco.lola_marina@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2240, N'Domínguez', N'Iria Claudia', 31000062, N'F', CAST(N'2002-01-13' AS Date), N'3368226660', N'iria_claudia.domínguez@domínguez.iria_claudia@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2241, N'Carmona', N'Jimena Gala', 31000063, N'F', CAST(N'2002-01-13' AS Date), N'3368185649', N'jimena_gala.carmona@carmona.jimena_gala@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2242, N'Moreno', N'Ahzià Gadiel', 31000064, N'M', CAST(N'2002-01-09' AS Date), N'3368737572', N'ahzià_gadiel.moreno@moreno.ahzià_gadiel@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2243, N'Gallardo', N'Moisés Juan', 31000065, N'M', CAST(N'2002-01-22' AS Date), N'3368625006', N'moisés_juan.gallardo@gallardo.moisés_juan@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2244, N'Pérez', N'Joanix José', 31000066, N'M', CAST(N'2002-01-12' AS Date), N'3363808192', N'joanix_josé.pérez@pérez.joanix_josé@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2245, N'Prieto', N'Carla Celia', 31000067, N'F', CAST(N'2002-01-18' AS Date), N'3369386223', N'carla_celia.prieto@prieto.carla_celia@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2246, N'Castillo', N'Lemuel David', 31000068, N'M', CAST(N'2002-01-05' AS Date), N'3365292062', N'lemuel_david.castillo@castillo.lemuel_david@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2247, N'Gutiérrez', N'Uzías Set', 31000069, N'M', CAST(N'2002-01-18' AS Date), N'3367433565', N'uzías_set.gutiérrez@gutiérrez.uzías_set@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2248, N'Duran', N'Ángela Elsa', 31000070, N'F', CAST(N'2002-01-19' AS Date), N'3366713346', N'Ángela_elsa.duran@duran.ángela_elsa@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2249, N'Montero', N'Gabriel Herodes', 31000071, N'M', CAST(N'2002-01-21' AS Date), N'3363919423', N'gabriel_herodes.montero@montero.gabriel_herodes@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2250, N'Ramos', N'Mia Elia', 31000072, N'F', CAST(N'2002-01-17' AS Date), N'3368064917', N'mia_elia.ramos@ramos.mia_elia@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2251, N'Rivera', N'Malak Isabella', 31000073, N'F', CAST(N'2002-01-23' AS Date), N'3365864446', N'malak_isabella.rivera@rivera.malak_isabella@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2252, N'Herrera', N'Isabella Lina', 31000074, N'F', CAST(N'2002-01-23' AS Date), N'3365109129', N'isabella_lina.herrera@herrera.isabella_lina@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2253, N'Pascual', N'Mateo Édgar', 31000075, N'M', CAST(N'2002-01-03' AS Date), N'3367030806', N'mateo_Édgar.pascual@pascual.mateo_édgar@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2254, N'Fuentes', N'Tobías Israel', 31000076, N'M', CAST(N'2002-01-24' AS Date), N'3367795719', N'tobías_israel.fuentes@fuentes.tobías_israel@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2255, N'Fuentes', N'Irene Yasmín', 31000077, N'F', CAST(N'2002-01-27' AS Date), N'3363302454', N'irene_yasmín.fuentes@fuentes.irene_yasmín@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2256, N'Álvarez', N'Jared Lucas', 31000078, N'M', CAST(N'2002-01-22' AS Date), N'3366839435', N'jared_lucas.Álvarez@álvarez.jared_lucas@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2257, N'Pérez', N'Arlet Malak', 31000079, N'F', CAST(N'2002-01-02' AS Date), N'3364347277', N'arlet_malak.pérez@pérez.arlet_malak@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2258, N'Flores', N'Caleb Joaquín', 31000080, N'M', CAST(N'2002-01-30' AS Date), N'3366888565', N'caleb_joaquín.flores@flores.caleb_joaquín@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2259, N'Pérez', N'Elsa Candela', 31000081, N'F', CAST(N'2002-01-17' AS Date), N'3363597964', N'elsa_candela.pérez@pérez.elsa_candela@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2260, N'Lorenzo', N'Noa Luna', 31000082, N'F', CAST(N'2002-01-09' AS Date), N'3364877515', N'noa_luna.lorenzo@lorenzo.noa_luna@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2261, N'Carrasco', N'Marina Triana', 31000083, N'F', CAST(N'2002-01-04' AS Date), N'3367441372', N'marina_triana.carrasco@carrasco.marina_triana@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2262, N'Gallardo', N'Marcos Jared', 31000084, N'M', CAST(N'2002-01-01' AS Date), N'3366426091', N'marcos_jared.gallardo@gallardo.marcos_jared@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2263, N'Rodríguez', N'David Ismael', 31000085, N'M', CAST(N'2002-01-24' AS Date), N'3367863209', N'david_ismael.rodríguez@rodríguez.david_ismael@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2264, N'Benitez', N'Carlota Carolina', 31000086, N'F', CAST(N'2002-01-16' AS Date), N'3369177823', N'carlota_carolina.benitez@benitez.carlota_carolina@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2265, N'Pérez', N'Inés Triana', 31000087, N'F', CAST(N'2002-01-14' AS Date), N'3369871051', N'inés_triana.pérez@pérez.inés_triana@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2266, N'Díaz', N'Hugo Édgar', 31000088, N'M', CAST(N'2002-01-04' AS Date), N'3367974486', N'hugo_Édgar.díaz@díaz.hugo_édgar@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2267, N'Gutiérrez', N'Andrea Helena', 31000089, N'F', CAST(N'2002-01-05' AS Date), N'3369308232', N'andrea_helena.gutiérrez@gutiérrez.andrea_helena@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2268, N'Suárez', N'Guido Gadiel', 31000090, N'M', CAST(N'2002-01-24' AS Date), N'3369361063', N'guido_gadiel.suárez@suárez.guido_gadiel@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2269, N'Parra', N'Eneas Mateo', 31000091, N'M', CAST(N'2002-01-05' AS Date), N'3368310338', N'eneas_mateo.parra@parra.eneas_mateo@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2270, N'Pastor', N'Carolina Julia', 31000092, N'F', CAST(N'2002-01-30' AS Date), N'3366750041', N'carolina_julia.pastor@pastor.carolina_julia@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2271, N'Gallardo', N'África Isabel', 31000093, N'F', CAST(N'2002-01-02' AS Date), N'3369732646', N'África_isabel.gallardo@gallardo.áfrica_isabel@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2272, N'Torres', N'Rocío Manuela', 31000094, N'F', CAST(N'2002-01-25' AS Date), N'3365198473', N'rocío_manuela.torres@torres.rocío_manuela@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2273, N'Suárez', N'Irene Ángela', 31000095, N'F', CAST(N'2002-01-01' AS Date), N'3368707400', N'irene_Ángela.suárez@suárez.irene_ángela@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2274, N'Jimenez', N'Julieta Victoria', 31000096, N'F', CAST(N'2002-01-17' AS Date), N'3366894395', N'julieta_victoria.jimenez@jimenez.julieta_victoria@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2275, N'Guerrero', N'Sofía Chloe', 31000097, N'F', CAST(N'2002-01-28' AS Date), N'3369243682', N'sofía_chloe.guerrero@guerrero.sofía_chloe@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2276, N'López', N'Rocío Aina', 31000098, N'F', CAST(N'2002-01-25' AS Date), N'3364833746', N'rocío_aina.lópez@lópez.rocío_aina@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2277, N'Hernández', N'Nahia Ona', 31000099, N'F', CAST(N'2002-01-25' AS Date), N'3363202200', N'nahia_ona.hernández@hernández.nahia_ona@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2278, N'Velasco', N'Neftalí Édgar', 31500001, N'M', CAST(N'2003-01-05' AS Date), N'3366133878', N'neftalí_Édgar.velasco@velasco.neftalí_édgar@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2279, N'Moya', N'Blanca Eva', 31500002, N'F', CAST(N'2003-01-02' AS Date), N'3367111303', N'blanca_eva.moya@moya.blanca_eva@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2280, N'Garrido', N'Vega Manuela', 31500003, N'F', CAST(N'2003-01-21' AS Date), N'3366434473', N'vega_manuela.garrido@garrido.vega_manuela@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2281, N'Marin', N'Inés Ariadna', 31500004, N'F', CAST(N'2003-01-02' AS Date), N'3366335671', N'inés_ariadna.marin@marin.inés_ariadna@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2282, N'Sanz', N'Irene Nerea', 31500005, N'F', CAST(N'2003-01-22' AS Date), N'3366225065', N'irene_nerea.sanz@sanz.irene_nerea@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2283, N'Suárez', N'Lola Claudia', 31500006, N'F', CAST(N'2003-01-09' AS Date), N'3365961152', N'lola_claudia.suárez@suárez.lola_claudia@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2284, N'Cabrera', N'Isabel Arlet', 31500007, N'F', CAST(N'2003-01-03' AS Date), N'3364733776', N'isabel_arlet.cabrera@cabrera.isabel_arlet@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2285, N'Ruiz', N'Marcos Ezequiel', 31500008, N'M', CAST(N'2003-01-30' AS Date), N'3369409806', N'marcos_ezequiel.ruiz@ruiz.marcos_ezequiel@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2286, N'Crespo', N'Ángela Julia', 31500009, N'F', CAST(N'2003-01-12' AS Date), N'3363073884', N'Ángela_julia.crespo@crespo.ángela_julia@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2287, N'Vega', N'Celia África', 31500010, N'F', CAST(N'2003-01-14' AS Date), N'3363357839', N'celia_África.vega@vega.celia_áfrica@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2288, N'Arias', N'Olivia María', 31500011, N'F', CAST(N'2003-01-20' AS Date), N'3364558044', N'olivia_maría.arias@arias.olivia_maría@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2289, N'López', N'Germán Isaías', 31500012, N'M', CAST(N'2003-01-08' AS Date), N'3366108675', N'germán_isaías.lópez@lópez.germán_isaías@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2290, N'Hernández', N'Sergio Jacob', 31500013, N'M', CAST(N'2003-01-22' AS Date), N'3366514994', N'sergio_jacob.hernández@hernández.sergio_jacob@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2291, N'Castro', N'Lucas Miguel', 31500014, N'M', CAST(N'2003-01-21' AS Date), N'3365429821', N'lucas_miguel.castro@castro.lucas_miguel@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2292, N'Lozano', N'Isaías Ahzià', 31500015, N'M', CAST(N'2003-01-30' AS Date), N'3368946695', N'isaías_ahzià.lozano@lozano.isaías_ahzià@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2293, N'López', N'Nicolás Israel', 31500016, N'M', CAST(N'2003-01-16' AS Date), N'3367137439', N'nicolás_israel.lópez@lópez.nicolás_israel@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2294, N'Pérez', N'Dámaso Jehoram', 31500017, N'M', CAST(N'2003-01-24' AS Date), N'3368477807', N'dámaso_jehoram.pérez@pérez.dámaso_jehoram@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2295, N'Gallego', N'Gadiel Samuel', 31500018, N'M', CAST(N'2003-01-26' AS Date), N'3365127553', N'gadiel_samuel.gallego@gallego.gadiel_samuel@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2296, N'Santiago', N'Chloe Valentina', 31500019, N'F', CAST(N'2003-01-09' AS Date), N'3367040410', N'chloe_valentina.santiago@santiago.chloe_valentina@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2297, N'Prieto', N'Demócrito Simón', 31500020, N'M', CAST(N'2003-01-23' AS Date), N'3365408880', N'demócrito_simón.prieto@prieto.demócrito_simón@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2298, N'Serrano', N'Inés Cristina', 31500021, N'F', CAST(N'2003-01-19' AS Date), N'3366592166', N'inés_cristina.serrano@serrano.inés_cristina@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2299, N'Fuentes', N'Samuel Noé', 31500022, N'M', CAST(N'2003-01-22' AS Date), N'3366833811', N'samuel_noé.fuentes@fuentes.samuel_noé@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2300, N'Delgado', N'Jeremías Francisco', 31500023, N'M', CAST(N'2003-01-19' AS Date), N'3367122319', N'jeremías_francisco.delgado@delgado.jeremías_francisco@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2301, N'Cano', N'Jeremías Andrés', 31500024, N'M', CAST(N'2003-01-04' AS Date), N'3365789941', N'jeremías_andrés.cano@cano.jeremías_andrés@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2302, N'Ortiz', N'Carlota Elsa', 31500025, N'F', CAST(N'2003-01-23' AS Date), N'3363705836', N'carlota_elsa.ortiz@ortiz.carlota_elsa@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2303, N'Cano', N'Labán Isaías', 31500026, N'M', CAST(N'2003-01-11' AS Date), N'3365919810', N'labán_isaías.cano@cano.labán_isaías@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2304, N'Ramírez', N'Isaac Dámaso', 31500027, N'M', CAST(N'2003-01-14' AS Date), N'3368293693', N'isaac_dámaso.ramírez@ramírez.isaac_dámaso@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2305, N'Sanz', N'Blanca Clara', 31500028, N'F', CAST(N'2003-01-28' AS Date), N'3363590064', N'blanca_clara.sanz@sanz.blanca_clara@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2306, N'Castro', N'Laia Berta', 31500029, N'F', CAST(N'2003-01-08' AS Date), N'3366059481', N'laia_berta.castro@castro.laia_berta@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2307, N'Hernández', N'Esteban Aarón', 31500030, N'M', CAST(N'2003-01-27' AS Date), N'3366783274', N'esteban_aarón.hernández@hernández.esteban_aarón@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2308, N'León', N'Beltrán Eneas', 31500031, N'M', CAST(N'2003-01-20' AS Date), N'3365584023', N'beltrán_eneas.león@león.beltrán_eneas@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2309, N'Arias', N'Mia Alba', 31500032, N'F', CAST(N'2003-01-25' AS Date), N'3366545582', N'mia_alba.arias@arias.mia_alba@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2310, N'Herrero', N'Baltasar Demócrito', 31500033, N'M', CAST(N'2003-01-25' AS Date), N'3367556749', N'baltasar_demócrito.herrero@herrero.baltasar_demócrito@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2311, N'Castro', N'Blanca Nora', 31500034, N'F', CAST(N'2003-01-05' AS Date), N'3369428917', N'blanca_nora.castro@castro.blanca_nora@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2312, N'Castro', N'Azahara Alejandra', 31500035, N'F', CAST(N'2003-01-28' AS Date), N'3369394784', N'azahara_alejandra.castro@castro.azahara_alejandra@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2313, N'Vidal', N'Aina Irene', 31500036, N'F', CAST(N'2003-01-26' AS Date), N'3368432404', N'aina_irene.vidal@vidal.aina_irene@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2314, N'Vega', N'Acab Jesús', 31500037, N'M', CAST(N'2003-01-10' AS Date), N'3365253523', N'acab_jesús.vega@vega.acab_jesús@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2315, N'Gallego', N'Valeria Natalia', 31500038, N'F', CAST(N'2003-01-10' AS Date), N'3369821355', N'valeria_natalia.gallego@gallego.valeria_natalia@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2316, N'Castro', N'Valentina Isabella', 31500039, N'F', CAST(N'2003-01-08' AS Date), N'3364821011', N'valentina_isabella.castro@castro.valentina_isabella@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2317, N'Calvo', N'Alba Daniela', 31500040, N'F', CAST(N'2003-01-16' AS Date), N'3369522670', N'alba_daniela.calvo@calvo.alba_daniela@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2318, N'Delgado', N'Jimena Vega', 31500041, N'F', CAST(N'2003-01-03' AS Date), N'3369020661', N'jimena_vega.delgado@delgado.jimena_vega@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2319, N'Lorenzo', N'Alma Elia', 31500042, N'F', CAST(N'2003-01-30' AS Date), N'3368983340', N'alma_elia.lorenzo@lorenzo.alma_elia@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2320, N'Cruz', N'Lucía Nour', 31500043, N'F', CAST(N'2003-01-22' AS Date), N'3364796785', N'lucía_nour.cruz@cruz.lucía_nour@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2321, N'Herrero', N'Isabel Amira', 31500044, N'F', CAST(N'2003-01-27' AS Date), N'3366122678', N'isabel_amira.herrero@herrero.isabel_amira@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2322, N'Mora', N'Valeria María', 31500045, N'F', CAST(N'2003-01-01' AS Date), N'3368212896', N'valeria_maría.mora@mora.valeria_maría@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2323, N'Ibáñez', N'Malak Jana', 31500046, N'F', CAST(N'2003-01-05' AS Date), N'3368295731', N'malak_jana.ibáñez@ibáñez.malak_jana@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2324, N'Guerrero', N'Yasmín Marina', 31500047, N'F', CAST(N'2003-01-06' AS Date), N'3364179688', N'yasmín_marina.guerrero@guerrero.yasmín_marina@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2325, N'Benitez', N'Luna Macarena', 31500048, N'F', CAST(N'2003-01-18' AS Date), N'3364550947', N'luna_macarena.benitez@benitez.luna_macarena@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2326, N'Martínez', N'Nicolás Abimael', 31500049, N'M', CAST(N'2003-01-05' AS Date), N'3368892124', N'nicolás_abimael.martínez@martínez.nicolás_abimael@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2327, N'Cabrera', N'Ahzià Fabián', 31500050, N'M', CAST(N'2003-01-29' AS Date), N'3363361437', N'ahzià_fabián.cabrera@cabrera.ahzià_fabián@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2328, N'Santana', N'Irene Elena', 31500051, N'F', CAST(N'2003-01-13' AS Date), N'3364848651', N'irene_elena.santana@santana.irene_elena@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2329, N'Vidal', N'Abril Alejandra', 31500052, N'F', CAST(N'2003-01-02' AS Date), N'3365207466', N'abril_alejandra.vidal@vidal.abril_alejandra@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2330, N'Domínguez', N'Aroa Cloe', 31500053, N'F', CAST(N'2003-01-04' AS Date), N'3366602127', N'aroa_cloe.domínguez@domínguez.aroa_cloe@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2331, N'Rojas', N'Leyre Ainhoa', 31500054, N'F', CAST(N'2003-01-02' AS Date), N'3367174899', N'leyre_ainhoa.rojas@rojas.leyre_ainhoa@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2332, N'Sáez', N'Rafael Renato', 31500055, N'M', CAST(N'2003-01-19' AS Date), N'3363777677', N'rafael_renato.sáez@sáez.rafael_renato@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2333, N'Pastor', N'Clara Natalia', 31500056, N'F', CAST(N'2003-01-12' AS Date), N'3366475499', N'clara_natalia.pastor@pastor.clara_natalia@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2334, N'González', N'Saúl Labán', 31500057, N'M', CAST(N'2003-01-14' AS Date), N'3369672247', N'saúl_labán.gonzález@gonzález.saúl_labán@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2335, N'Vidal', N'Andrés Gadiel', 31500058, N'M', CAST(N'2003-01-27' AS Date), N'3363293051', N'andrés_gadiel.vidal@vidal.andrés_gadiel@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2336, N'García', N'Francisco Homero', 31500059, N'M', CAST(N'2003-01-13' AS Date), N'3367688518', N'francisco_homero.garcía@garcía.francisco_homero@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2337, N'Cabrera', N'Agustín Julio', 31500060, N'M', CAST(N'2003-01-02' AS Date), N'3364521804', N'agustín_julio.cabrera@cabrera.agustín_julio@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2338, N'Rivera', N'Alejandra Carmen', 31500061, N'F', CAST(N'2003-01-24' AS Date), N'3368250067', N'alejandra_carmen.rivera@rivera.alejandra_carmen@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2339, N'Carmona', N'Darío Isaías', 31500062, N'M', CAST(N'2003-01-28' AS Date), N'3369844381', N'darío_isaías.carmona@carmona.darío_isaías@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2340, N'Carmona', N'Triana Laura', 31500063, N'F', CAST(N'2003-01-09' AS Date), N'3363221816', N'triana_laura.carmona@carmona.triana_laura@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2341, N'Soto', N'Omar Esteban', 31500064, N'M', CAST(N'2003-01-13' AS Date), N'3363952322', N'omar_esteban.soto@soto.omar_esteban@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2342, N'Castillo', N'Daniela Berta', 31500065, N'F', CAST(N'2003-01-22' AS Date), N'3363597671', N'daniela_berta.castillo@castillo.daniela_berta@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2343, N'Álvarez', N'Natalia Aurora', 31500066, N'F', CAST(N'2003-01-16' AS Date), N'3366785648', N'natalia_aurora.Álvarez@álvarez.natalia_aurora@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2344, N'Jimenez', N'Jesús Gabriel', 31500067, N'M', CAST(N'2003-01-27' AS Date), N'3363835718', N'jesús_gabriel.jimenez@jimenez.jesús_gabriel@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2345, N'Vidal', N'Moisés Zacarías', 31500068, N'M', CAST(N'2003-01-28' AS Date), N'3367294623', N'moisés_zacarías.vidal@vidal.moisés_zacarías@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2346, N'Soto', N'Ciro Gaspar', 31500069, N'M', CAST(N'2003-01-27' AS Date), N'3365082790', N'ciro_gaspar.soto@soto.ciro_gaspar@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2347, N'Campos', N'Nahia Elsa', 31500070, N'F', CAST(N'2003-01-07' AS Date), N'3366469769', N'nahia_elsa.campos@campos.nahia_elsa@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2348, N'Carrasco', N'Aurora Abril', 31500071, N'F', CAST(N'2003-01-23' AS Date), N'3363093522', N'aurora_abril.carrasco@carrasco.aurora_abril@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2349, N'Ramos', N'Blanca Amaia', 31500072, N'F', CAST(N'2003-01-25' AS Date), N'3367303032', N'blanca_amaia.ramos@ramos.blanca_amaia@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2350, N'Santos', N'Alicia Sara', 31500073, N'F', CAST(N'2003-01-23' AS Date), N'3369382752', N'alicia_sara.santos@santos.alicia_sara@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2351, N'Pastor', N'Jeremías Homero', 31500074, N'M', CAST(N'2003-01-04' AS Date), N'3364052004', N'jeremías_homero.pastor@pastor.jeremías_homero@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2352, N'Guerrero', N'Iris Lucía', 31500075, N'F', CAST(N'2003-01-20' AS Date), N'3364717189', N'iris_lucía.guerrero@guerrero.iris_lucía@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2353, N'Rubio', N'Berta Nuria', 31500076, N'F', CAST(N'2003-01-01' AS Date), N'3366982933', N'berta_nuria.rubio@rubio.berta_nuria@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2354, N'Morales', N'Jimena Elia', 31500077, N'F', CAST(N'2003-01-23' AS Date), N'3368628475', N'jimena_elia.morales@morales.jimena_elia@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2355, N'Prieto', N'Lia Marina', 31500078, N'F', CAST(N'2003-01-25' AS Date), N'3365495751', N'lia_marina.prieto@prieto.lia_marina@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2356, N'Cabrera', N'Macarena Blanca', 31500079, N'F', CAST(N'2003-01-27' AS Date), N'3368994134', N'macarena_blanca.cabrera@cabrera.macarena_blanca@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2357, N'Romero', N'India Chloe', 31500080, N'F', CAST(N'2003-01-04' AS Date), N'3368078038', N'india_chloe.romero@romero.india_chloe@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2358, N'Soler', N'Matías Nicolás', 31500081, N'M', CAST(N'2003-01-24' AS Date), N'3364365478', N'matías_nicolás.soler@soler.matías_nicolás@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2359, N'Carrasco', N'Set Esteban', 31500082, N'M', CAST(N'2003-01-10' AS Date), N'3364630190', N'set_esteban.carrasco@carrasco.set_esteban@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2360, N'Prieto', N'Ahzià Dámaso', 31500083, N'M', CAST(N'2003-01-20' AS Date), N'3365487555', N'ahzià_dámaso.prieto@prieto.ahzià_dámaso@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2361, N'Morales', N'Paula Arlet', 31500084, N'F', CAST(N'2003-01-15' AS Date), N'3366524298', N'paula_arlet.morales@morales.paula_arlet@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2362, N'Molina', N'Germán Renato', 31500085, N'M', CAST(N'2003-01-12' AS Date), N'3367752341', N'germán_renato.molina@molina.germán_renato@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2363, N'Ramírez', N'Alejandra Triana', 31500086, N'F', CAST(N'2003-01-28' AS Date), N'3368059223', N'alejandra_triana.ramírez@ramírez.alejandra_triana@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2364, N'Vargas', N'Elías Aarón', 31500087, N'M', CAST(N'2003-01-27' AS Date), N'3366947000', N'elías_aarón.vargas@vargas.elías_aarón@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2365, N'Castro', N'Marta Lola', 31500088, N'F', CAST(N'2003-01-22' AS Date), N'3366282648', N'marta_lola.castro@castro.marta_lola@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2366, N'Bravo', N'Sergio Gaspar', 31500089, N'M', CAST(N'2003-01-10' AS Date), N'3364118474', N'sergio_gaspar.bravo@bravo.sergio_gaspar@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2367, N'Navarro', N'Elí Omar', 31500090, N'M', CAST(N'2003-01-29' AS Date), N'3369064669', N'elí_omar.navarro@navarro.elí_omar@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2368, N'Martín', N'Nicolás Renato', 31500091, N'M', CAST(N'2003-01-21' AS Date), N'3363939386', N'nicolás_renato.martín@martín.nicolás_renato@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2369, N'Arias', N'Berta Lina', 31500092, N'F', CAST(N'2003-01-21' AS Date), N'3365933073', N'berta_lina.arias@arias.berta_lina@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2370, N'Gómez', N'David Guido', 31500093, N'M', CAST(N'2003-01-22' AS Date), N'3364847943', N'david_guido.gómez@gómez.david_guido@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2371, N'Hidalgo', N'Bartolomé Labán', 31500094, N'M', CAST(N'2003-01-30' AS Date), N'3369449525', N'bartolomé_labán.hidalgo@hidalgo.bartolomé_labán@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2372, N'Cabrera', N'Jairo Beltrán', 31500095, N'M', CAST(N'2003-01-01' AS Date), N'3366625819', N'jairo_beltrán.cabrera@cabrera.jairo_beltrán@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2373, N'Carmona', N'Abril Julieta', 31500096, N'F', CAST(N'2003-01-25' AS Date), N'3364135360', N'abril_julieta.carmona@carmona.abril_julieta@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2374, N'Molina', N'Caín Bartolomé', 31500097, N'M', CAST(N'2003-01-24' AS Date), N'3368218517', N'caín_bartolomé.molina@molina.caín_bartolomé@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2375, N'Nieto', N'África Lucía', 31500098, N'F', CAST(N'2003-01-08' AS Date), N'3363391533', N'África_lucía.nieto@nieto.áfrica_lucía@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2376, N'Ortega', N'Andrés Aarón', 31500099, N'M', CAST(N'2003-01-03' AS Date), N'3365879898', N'andrés_aarón.ortega@ortega.andrés_aarón@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2377, N'Bravo', N'Caleb Herodes', 32000001, N'M', CAST(N'2004-01-25' AS Date), N'3364462730', N'caleb_herodes.bravo@bravo.caleb_herodes@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2378, N'Guerrero', N'Victoria Lara', 32000002, N'F', CAST(N'2004-01-08' AS Date), N'3363004791', N'victoria_lara.guerrero@guerrero.victoria_lara@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2379, N'Santos', N'Marta Lucía', 32000003, N'F', CAST(N'2004-01-13' AS Date), N'3369866845', N'marta_lucía.santos@santos.marta_lucía@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2380, N'Flores', N'Andrea Blanca', 32000004, N'F', CAST(N'2004-01-04' AS Date), N'3367235970', N'andrea_blanca.flores@flores.andrea_blanca@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2381, N'Gallardo', N'Eliseo Set', 32000005, N'M', CAST(N'2004-01-10' AS Date), N'3368344119', N'eliseo_set.gallardo@gallardo.eliseo_set@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2382, N'Fuentes', N'Andrés Francisco', 32000006, N'M', CAST(N'2004-01-22' AS Date), N'3368926177', N'andrés_francisco.fuentes@fuentes.andrés_francisco@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2383, N'Rivera', N'Josué Saúl', 32000007, N'M', CAST(N'2004-01-07' AS Date), N'3364170772', N'josué_saúl.rivera@rivera.josué_saúl@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2384, N'Santos', N'Elías Jeremías', 32000008, N'M', CAST(N'2004-01-24' AS Date), N'3365133870', N'elías_jeremías.santos@santos.elías_jeremías@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2385, N'Bravo', N'Aroa Aina', 32000009, N'F', CAST(N'2004-01-01' AS Date), N'3369834842', N'aroa_aina.bravo@bravo.aroa_aina@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2386, N'Soto', N'Zacarías Baltasar', 32000010, N'M', CAST(N'2004-01-20' AS Date), N'3368337404', N'zacarías_baltasar.soto@soto.zacarías_baltasar@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2387, N'Carrasco', N'Juan Miguel', 32000011, N'M', CAST(N'2004-01-02' AS Date), N'3363222498', N'juan_miguel.carrasco@carrasco.juan_miguel@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2388, N'Muñoz', N'Vega Lola', 32000012, N'F', CAST(N'2004-01-24' AS Date), N'3368756046', N'vega_lola.muñoz@muñoz.vega_lola@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2389, N'Rubio', N'Joaquín', 32000013, N'M', CAST(N'2004-01-12' AS Date), N'3367422252', N'joaquín.rubio@rubio.joaquín@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2390, N'Romero', N'Efraín Moisés', 32000014, N'M', CAST(N'2004-01-23' AS Date), N'3364331733', N'efraín_moisés.romero@romero.efraín_moisés@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2391, N'Vega', N'Édgar Herodes', 32000015, N'M', CAST(N'2004-01-16' AS Date), N'3366368803', N'Édgar_herodes.vega@vega.édgar_herodes@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2392, N'Romero', N'Adán Marcos', 32000016, N'M', CAST(N'2004-01-29' AS Date), N'3364630069', N'adán_marcos.romero@romero.adán_marcos@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2393, N'Flores', N'Arlet Valentina', 32000017, N'F', CAST(N'2004-01-17' AS Date), N'3368483030', N'arlet_valentina.flores@flores.arlet_valentina@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2394, N'González', N'Carlota Naia', 32000018, N'F', CAST(N'2004-01-03' AS Date), N'3368057022', N'carlota_naia.gonzález@gonzález.carlota_naia@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2395, N'Jimenez', N'Gala Valentina', 32000019, N'F', CAST(N'2004-01-20' AS Date), N'3363761300', N'gala_valentina.jimenez@jimenez.gala_valentina@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2396, N'Vargas', N'Mia Emma', 32000020, N'F', CAST(N'2004-01-02' AS Date), N'3363117091', N'mia_emma.vargas@vargas.mia_emma@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2397, N'Prieto', N'Claudia Aroa', 32000021, N'F', CAST(N'2004-01-05' AS Date), N'3364940627', N'claudia_aroa.prieto@prieto.claudia_aroa@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2398, N'Ruiz', N'Germán Fabián', 32000022, N'M', CAST(N'2004-01-22' AS Date), N'3368505030', N'germán_fabián.ruiz@ruiz.germán_fabián@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2399, N'Duran', N'Ahzià Jehoram', 32000023, N'M', CAST(N'2004-01-01' AS Date), N'3363373039', N'ahzià_jehoram.duran@duran.ahzià_jehoram@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2400, N'Pastor', N'Paula Gabriela', 32000024, N'F', CAST(N'2004-01-03' AS Date), N'3363701182', N'paula_gabriela.pastor@pastor.paula_gabriela@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2401, N'Muñoz', N'Leire África', 32000025, N'F', CAST(N'2004-01-05' AS Date), N'3369561517', N'leire_África.muñoz@muñoz.leire_áfrica@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2402, N'García', N'Daniela Cristina', 32000026, N'F', CAST(N'2004-01-26' AS Date), N'3367217451', N'daniela_cristina.garcía@garcía.daniela_cristina@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2403, N'Crespo', N'Jimena Noa', 32000027, N'F', CAST(N'2004-01-11' AS Date), N'3366936799', N'jimena_noa.crespo@crespo.jimena_noa@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2404, N'Sánchez', N'Renato Aarón', 32000028, N'M', CAST(N'2004-01-05' AS Date), N'3369681636', N'renato_aarón.sánchez@sánchez.renato_aarón@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2405, N'Gutiérrez', N'Iria Aina', 32000029, N'F', CAST(N'2004-01-26' AS Date), N'3363380345', N'iria_aina.gutiérrez@gutiérrez.iria_aina@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2406, N'Muñoz', N'Cloe Mia', 32000030, N'F', CAST(N'2004-01-05' AS Date), N'3368058026', N'cloe_mia.muñoz@muñoz.cloe_mia@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2407, N'Parra', N'Ainhoa Olivia', 32000031, N'F', CAST(N'2004-01-06' AS Date), N'3363268281', N'ainhoa_olivia.parra@parra.ainhoa_olivia@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2408, N'Herrera', N'Ana Luna', 32000032, N'F', CAST(N'2004-01-13' AS Date), N'3369982126', N'ana_luna.herrera@herrera.ana_luna@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2409, N'Garrido', N'Baltasar Jairo', 32000033, N'M', CAST(N'2004-01-04' AS Date), N'3367622889', N'baltasar_jairo.garrido@garrido.baltasar_jairo@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2410, N'Navarro', N'Inés Carmen', 32000034, N'F', CAST(N'2004-01-03' AS Date), N'3368498180', N'inés_carmen.navarro@navarro.inés_carmen@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2411, N'Roman', N'Abdiel Agustín', 32000035, N'M', CAST(N'2004-01-11' AS Date), N'3363139627', N'abdiel_agustín.roman@roman.abdiel_agustín@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2412, N'Santana', N'Claudia Mia', 32000036, N'F', CAST(N'2004-01-23' AS Date), N'3366341855', N'claudia_mia.santana@santana.claudia_mia@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2413, N'Medina', N'Ismael Ezequiel', 32000037, N'M', CAST(N'2004-01-07' AS Date), N'3368229019', N'ismael_ezequiel.medina@medina.ismael_ezequiel@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2414, N'Roman', N'Gabriela Ainhoa', 32000038, N'F', CAST(N'2004-01-13' AS Date), N'3366627030', N'gabriela_ainhoa.roman@roman.gabriela_ainhoa@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2415, N'Cortés', N'Israel Joaquín', 32000039, N'M', CAST(N'2004-01-04' AS Date), N'3368627366', N'israel_joaquín.cortés@cortés.israel_joaquín@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2416, N'Pérez', N'Adara India', 32000040, N'F', CAST(N'2004-01-21' AS Date), N'3364477794', N'adara_india.pérez@pérez.adara_india@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2417, N'Fernández', N'Josué Jiram', 32000041, N'M', CAST(N'2004-01-11' AS Date), N'3363053344', N'josué_jiram.fernández@fernández.josué_jiram@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2418, N'Díaz', N'Natalia Rocío', 32000042, N'F', CAST(N'2004-01-19' AS Date), N'3368269056', N'natalia_rocío.díaz@díaz.natalia_rocío@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2419, N'Lorenzo', N'Victoria Berta', 32000043, N'F', CAST(N'2004-01-26' AS Date), N'3364527852', N'victoria_berta.lorenzo@lorenzo.victoria_berta@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2420, N'Cabrera', N'Lina Julieta', 32000044, N'F', CAST(N'2004-01-02' AS Date), N'3368432853', N'lina_julieta.cabrera@cabrera.lina_julieta@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2421, N'Soler', N'Sergio Lucas', 32000045, N'M', CAST(N'2004-01-20' AS Date), N'3363331521', N'sergio_lucas.soler@soler.sergio_lucas@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2422, N'Calvo', N'India Elia', 32000046, N'F', CAST(N'2004-01-22' AS Date), N'3364036417', N'india_elia.calvo@calvo.india_elia@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2423, N'Iglesias', N'Martina Carlota', 32000047, N'F', CAST(N'2004-01-12' AS Date), N'3367349837', N'martina_carlota.iglesias@iglesias.martina_carlota@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2424, N'Mora', N'Ana Elena', 32000048, N'F', CAST(N'2004-01-16' AS Date), N'3368464414', N'ana_elena.mora@mora.ana_elena@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2425, N'Aguilar', N'Jeremías Rubén', 32000049, N'M', CAST(N'2004-01-01' AS Date), N'3368729836', N'jeremías_rubén.aguilar@aguilar.jeremías_rubén@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2426, N'Martínez', N'Gala Marina', 32000050, N'F', CAST(N'2004-01-07' AS Date), N'3364128670', N'gala_marina.martínez@martínez.gala_marina@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2427, N'Vázquez', N'Azahara Cayetana', 32000051, N'F', CAST(N'2004-01-19' AS Date), N'3367189240', N'azahara_cayetana.vázquez@vázquez.azahara_cayetana@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2428, N'Gallardo', N'Marcos Noé', 32000052, N'M', CAST(N'2004-01-09' AS Date), N'3366659910', N'marcos_noé.gallardo@gallardo.marcos_noé@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2429, N'León', N'Ainara Cristina', 32000053, N'F', CAST(N'2004-01-01' AS Date), N'3364082806', N'ainara_cristina.león@león.ainara_cristina@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2430, N'Gil', N'Jiram Pablo', 32000054, N'M', CAST(N'2004-01-03' AS Date), N'3363204187', N'jiram_pablo.gil@gil.jiram_pablo@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2431, N'Vázquez', N'Laia Lola', 32000055, N'F', CAST(N'2004-01-18' AS Date), N'3368191930', N'laia_lola.vázquez@vázquez.laia_lola@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2432, N'Vargas', N'Andrea Triana', 32000056, N'F', CAST(N'2004-01-14' AS Date), N'3365063461', N'andrea_triana.vargas@vargas.andrea_triana@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2433, N'Soto', N'Omar Israel', 32000057, N'M', CAST(N'2004-01-07' AS Date), N'3369238486', N'omar_israel.soto@soto.omar_israel@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2434, N'Alonso', N'Olivia Blanca', 32000058, N'F', CAST(N'2004-01-18' AS Date), N'3366733611', N'olivia_blanca.alonso@alonso.olivia_blanca@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2435, N'Suárez', N'Carlota Macarena', 32000059, N'F', CAST(N'2004-01-11' AS Date), N'3364334123', N'carlota_macarena.suárez@suárez.carlota_macarena@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2436, N'Crespo', N'Alma Alejandra', 32000060, N'F', CAST(N'2004-01-06' AS Date), N'3369166425', N'alma_alejandra.crespo@crespo.alma_alejandra@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2437, N'Gutiérrez', N'Marina Carlota', 32000061, N'F', CAST(N'2004-01-21' AS Date), N'3367128334', N'marina_carlota.gutiérrez@gutiérrez.marina_carlota@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2438, N'Caballero', N'Adriana Ana', 32000062, N'F', CAST(N'2004-01-22' AS Date), N'3366239012', N'adriana_ana.caballero@caballero.adriana_ana@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2439, N'Garrido', N'Jaír de Galaad Gaspar', 32000063, N'M', CAST(N'2004-01-17' AS Date), N'3365739325', N'jaír_de_galaad_gaspar.garrido@garrido.jaír_de_galaad_gaspar@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2440, N'Guerrero', N'Lucas Adán', 32000064, N'M', CAST(N'2004-01-26' AS Date), N'3367145429', N'lucas_adán.guerrero@guerrero.lucas_adán@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2441, N'González', N'Abdiel Ismael', 32000065, N'M', CAST(N'2004-01-01' AS Date), N'3363532223', N'abdiel_ismael.gonzález@gonzález.abdiel_ismael@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2442, N'Sanz', N'Macarena Lola', 32000066, N'F', CAST(N'2004-01-19' AS Date), N'3364552353', N'macarena_lola.sanz@sanz.macarena_lola@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2443, N'Soto', N'Gabriela Alicia', 32000067, N'F', CAST(N'2004-01-09' AS Date), N'3365199266', N'gabriela_alicia.soto@soto.gabriela_alicia@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2444, N'González', N'Benjamín Jiram', 32000068, N'M', CAST(N'2004-01-16' AS Date), N'3365597919', N'benjamín_jiram.gonzález@gonzález.benjamín_jiram@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2445, N'Roman', N'Renato Isaías', 32000069, N'M', CAST(N'2004-01-06' AS Date), N'3364936692', N'renato_isaías.roman@roman.renato_isaías@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2446, N'León', N'Helena Aitana', 32000070, N'F', CAST(N'2004-01-03' AS Date), N'3364798735', N'helena_aitana.león@león.helena_aitana@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2447, N'Díaz', N'Natalia Amira', 32000071, N'F', CAST(N'2004-01-09' AS Date), N'3364152348', N'natalia_amira.díaz@díaz.natalia_amira@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2448, N'Gallardo', N'Cloe Clara', 32000072, N'F', CAST(N'2004-01-08' AS Date), N'3365366354', N'cloe_clara.gallardo@gallardo.cloe_clara@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2449, N'Carrasco', N'Gala Clara', 32000073, N'F', CAST(N'2004-01-23' AS Date), N'3369637911', N'gala_clara.carrasco@carrasco.gala_clara@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2450, N'Vidal', N'Zacarías Jehoram', 32000074, N'M', CAST(N'2004-01-19' AS Date), N'3368446723', N'zacarías_jehoram.vidal@vidal.zacarías_jehoram@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2451, N'Diez', N'Gabriel Lemuel', 32000075, N'M', CAST(N'2004-01-10' AS Date), N'3365656136', N'gabriel_lemuel.diez@diez.gabriel_lemuel@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2452, N'Ramírez', N'Nuria India', 32000076, N'F', CAST(N'2004-01-03' AS Date), N'3365066126', N'nuria_india.ramírez@ramírez.nuria_india@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2453, N'Parra', N'Zoe Valentina', 32000077, N'F', CAST(N'2004-01-24' AS Date), N'3367822331', N'zoe_valentina.parra@parra.zoe_valentina@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2454, N'Santos', N'Elsa Aurora', 32000078, N'F', CAST(N'2004-01-06' AS Date), N'3368992663', N'elsa_aurora.santos@santos.elsa_aurora@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2455, N'Carmona', N'Arlet Yasmín', 32000079, N'F', CAST(N'2004-01-21' AS Date), N'3363501282', N'arlet_yasmín.carmona@carmona.arlet_yasmín@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2456, N'Aguilar', N'Marcos Adán', 32000080, N'M', CAST(N'2004-01-28' AS Date), N'3366815544', N'marcos_adán.aguilar@aguilar.marcos_adán@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2457, N'Sánchez', N'Cristina Ainhoa', 32000081, N'F', CAST(N'2004-01-26' AS Date), N'3365627180', N'cristina_ainhoa.sánchez@sánchez.cristina_ainhoa@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2458, N'Soler', N'Aurora Irene', 32000082, N'F', CAST(N'2004-01-05' AS Date), N'3363086424', N'aurora_irene.soler@soler.aurora_irene@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2459, N'Soto', N'Rafael Lucas', 32000083, N'M', CAST(N'2004-01-12' AS Date), N'3366067338', N'rafael_lucas.soto@soto.rafael_lucas@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2460, N'Castro', N'Acab Saúl', 32000084, N'M', CAST(N'2004-01-27' AS Date), N'3369140348', N'acab_saúl.castro@castro.acab_saúl@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2461, N'León', N'Azahara Alicia', 32000085, N'F', CAST(N'2004-01-01' AS Date), N'3364028586', N'azahara_alicia.león@león.azahara_alicia@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2462, N'Arias', N'Diana Macarena', 32000086, N'F', CAST(N'2004-01-03' AS Date), N'3367024484', N'diana_macarena.arias@arias.diana_macarena@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2463, N'Campos', N'Jaír de Galaad Leví', 32000087, N'M', CAST(N'2004-01-26' AS Date), N'3369401831', N'jaír_de_galaad_leví.campos@campos.jaír_de_galaad_leví@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2464, N'Rivera', N'Sofía Carlota', 32000088, N'F', CAST(N'2004-01-16' AS Date), N'3365482471', N'sofía_carlota.rivera@rivera.sofía_carlota@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2465, N'Jimenez', N'Ismael Abdiel', 32000089, N'M', CAST(N'2004-01-09' AS Date), N'3365031267', N'ismael_abdiel.jimenez@jimenez.ismael_abdiel@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2466, N'Gil', N'Lia Alma', 32000090, N'F', CAST(N'2004-01-02' AS Date), N'3369821338', N'lia_alma.gil@gil.lia_alma@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2467, N'Roman', N'Gala Vega', 32000091, N'F', CAST(N'2004-01-05' AS Date), N'3368953408', N'gala_vega.roman@roman.gala_vega@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2468, N'Castillo', N'Lucas Neftalí', 32000092, N'M', CAST(N'2004-01-01' AS Date), N'3367127199', N'lucas_neftalí.castillo@castillo.lucas_neftalí@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2469, N'Garrido', N'Juan Bartolomé', 32000093, N'M', CAST(N'2004-01-27' AS Date), N'3369925360', N'juan_bartolomé.garrido@garrido.juan_bartolomé@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2470, N'Sánchez', N'Carolina Julieta', 32000094, N'F', CAST(N'2004-01-12' AS Date), N'3369271265', N'carolina_julieta.sánchez@sánchez.carolina_julieta@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2471, N'Ortiz', N'Elías Joanix', 32000095, N'M', CAST(N'2004-01-07' AS Date), N'3369000982', N'elías_joanix.ortiz@ortiz.elías_joanix@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2472, N'Moya', N'Darío Juan', 32000096, N'M', CAST(N'2004-01-14' AS Date), N'3369385567', N'darío_juan.moya@moya.darío_juan@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2473, N'Vázquez', N'Darío Aram', 32000097, N'M', CAST(N'2004-01-12' AS Date), N'3365020707', N'darío_aram.vázquez@vázquez.darío_aram@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2474, N'Vargas', N'María Mar', 32000098, N'F', CAST(N'2004-01-27' AS Date), N'3368556253', N'maría_mar.vargas@vargas.maría_mar@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2475, N'Rodríguez', N'Aina Azahara', 32000099, N'F', CAST(N'2004-01-17' AS Date), N'3366693920', N'aina_azahara.rodríguez@rodríguez.aina_azahara@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2476, N'Vidal', N'Gabriela Nora', 32500001, N'F', CAST(N'2005-01-07' AS Date), N'3368502486', N'gabriela_nora.vidal@vidal.gabriela_nora@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2477, N'Herrera', N'Adán Isaías', 32500002, N'M', CAST(N'2005-01-29' AS Date), N'3367721241', N'adán_isaías.herrera@herrera.adán_isaías@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2478, N'Giménez', N'Aitana Vera', 32500003, N'F', CAST(N'2005-01-10' AS Date), N'3365258704', N'aitana_vera.giménez@giménez.aitana_vera@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2479, N'Ibáñez', N'Caleb Jacob', 32500004, N'M', CAST(N'2005-01-15' AS Date), N'3367196860', N'caleb_jacob.ibáñez@ibáñez.caleb_jacob@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2480, N'Carrasco', N'Julio Lucas', 32500005, N'M', CAST(N'2005-01-29' AS Date), N'3365001456', N'julio_lucas.carrasco@carrasco.julio_lucas@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2481, N'Ortiz', N'Arlet Mara', 32500006, N'F', CAST(N'2005-01-08' AS Date), N'3363901767', N'arlet_mara.ortiz@ortiz.arlet_mara@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2482, N'Álvarez', N'Jeremías Eneas', 32500007, N'M', CAST(N'2005-01-11' AS Date), N'3366468508', N'jeremías_eneas.Álvarez@álvarez.jeremías_eneas@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2483, N'Domínguez', N'Beltrán Aarón', 32500008, N'M', CAST(N'2005-01-25' AS Date), N'3367537079', N'beltrán_aarón.domínguez@domínguez.beltrán_aarón@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2484, N'Blanco', N'Alma Valentina', 32500009, N'F', CAST(N'2005-01-16' AS Date), N'3365158828', N'alma_valentina.blanco@blanco.alma_valentina@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2485, N'Gutiérrez', N'Labán Ismael', 32500010, N'M', CAST(N'2005-01-21' AS Date), N'3368730196', N'labán_ismael.gutiérrez@gutiérrez.labán_ismael@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2486, N'González', N'Alma Aitana', 32500011, N'F', CAST(N'2005-01-14' AS Date), N'3364669872', N'alma_aitana.gonzález@gonzález.alma_aitana@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2487, N'Álvarez', N'Triana Elia', 32500012, N'F', CAST(N'2005-01-11' AS Date), N'3368017290', N'triana_elia.Álvarez@álvarez.triana_elia@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2488, N'Morales', N'Laura Amaia', 32500013, N'F', CAST(N'2005-01-22' AS Date), N'3366916022', N'laura_amaia.morales@morales.laura_amaia@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2489, N'Santana', N'Gabriela Vega', 32500014, N'F', CAST(N'2005-01-05' AS Date), N'3365857254', N'gabriela_vega.santana@santana.gabriela_vega@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2490, N'Medina', N'Simón Rafael', 32500015, N'M', CAST(N'2005-01-11' AS Date), N'3367010631', N'simón_rafael.medina@medina.simón_rafael@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2491, N'Santos', N'Jiram Abel', 32500016, N'M', CAST(N'2005-01-29' AS Date), N'3364837149', N'jiram_abel.santos@santos.jiram_abel@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2492, N'Flores', N'Triana Sofía', 32500017, N'F', CAST(N'2005-01-26' AS Date), N'3366272047', N'triana_sofía.flores@flores.triana_sofía@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2493, N'Sánchez', N'Jaír de Galaad Gabriel', 32500018, N'M', CAST(N'2005-01-10' AS Date), N'3368892361', N'jaír_de_galaad_gabriel.sánchez@sánchez.jaír_de_galaad_gabriel@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2494, N'Hidalgo', N'Agustín Esteban', 32500019, N'M', CAST(N'2005-01-24' AS Date), N'3367322562', N'agustín_esteban.hidalgo@hidalgo.agustín_esteban@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2495, N'Ortega', N'Leví Demócrito', 32500020, N'M', CAST(N'2005-01-13' AS Date), N'3369611737', N'leví_demócrito.ortega@ortega.leví_demócrito@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2496, N'Reyes', N'Gala Helena', 32500021, N'F', CAST(N'2005-01-18' AS Date), N'3365084979', N'gala_helena.reyes@reyes.gala_helena@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2497, N'Ferrer', N'Ariadna Clara', 32500022, N'F', CAST(N'2005-01-28' AS Date), N'3368980289', N'ariadna_clara.ferrer@ferrer.ariadna_clara@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2498, N'Gil', N'Amaia Macarena', 32500023, N'F', CAST(N'2005-01-18' AS Date), N'3369146618', N'amaia_macarena.gil@gil.amaia_macarena@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2499, N'Aguilar', N'Matías Neftalí', 32500024, N'M', CAST(N'2005-01-04' AS Date), N'3365178097', N'matías_neftalí.aguilar@aguilar.matías_neftalí@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2500, N'Medina', N'Eliseo Herodes', 32500025, N'M', CAST(N'2005-01-29' AS Date), N'3366941473', N'eliseo_herodes.medina@medina.eliseo_herodes@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2501, N'Domínguez', N'Marta Andrea', 32500026, N'F', CAST(N'2005-01-24' AS Date), N'3364164601', N'marta_andrea.domínguez@domínguez.marta_andrea@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2502, N'Moya', N'Josué Caleb', 32500027, N'M', CAST(N'2005-01-09' AS Date), N'3366664150', N'josué_caleb.moya@moya.josué_caleb@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2503, N'López', N'Lola Nuria', 32500028, N'F', CAST(N'2005-01-01' AS Date), N'3369161473', N'lola_nuria.lópez@lópez.lola_nuria@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2504, N'Hernández', N'Gadiel Juan', 32500029, N'M', CAST(N'2005-01-16' AS Date), N'3364880659', N'gadiel_juan.hernández@hernández.gadiel_juan@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2505, N'Delgado', N'Gala Laura', 32500030, N'F', CAST(N'2005-01-30' AS Date), N'3369951636', N'gala_laura.delgado@delgado.gala_laura@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2506, N'Cabrera', N'Esteban Lucas', 32500031, N'M', CAST(N'2005-01-04' AS Date), N'3369141681', N'esteban_lucas.cabrera@cabrera.esteban_lucas@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2507, N'Álvarez', N'Cloe Carolina', 32500032, N'F', CAST(N'2005-01-27' AS Date), N'3365168369', N'cloe_carolina.Álvarez@álvarez.cloe_carolina@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2508, N'Soto', N'Diana Naia', 32500033, N'F', CAST(N'2005-01-22' AS Date), N'3366031004', N'diana_naia.soto@soto.diana_naia@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2509, N'González', N'Lia Nahia', 32500034, N'F', CAST(N'2005-01-17' AS Date), N'3363491233', N'lia_nahia.gonzález@gonzález.lia_nahia@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2510, N'Lozano', N'Guido Caleb', 32500035, N'M', CAST(N'2005-01-26' AS Date), N'3367461651', N'guido_caleb.lozano@lozano.guido_caleb@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2511, N'Sáez', N'Marta Laia', 32500036, N'F', CAST(N'2005-01-20' AS Date), N'3366612495', N'marta_laia.sáez@sáez.marta_laia@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2512, N'Velasco', N'Alejandra Sofía', 32500037, N'F', CAST(N'2005-01-15' AS Date), N'3363915193', N'alejandra_sofía.velasco@velasco.alejandra_sofía@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2513, N'Díaz', N'Sofía Malak', 32500038, N'F', CAST(N'2005-01-12' AS Date), N'3364005080', N'sofía_malak.díaz@díaz.sofía_malak@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2514, N'Herrero', N'Noa Berta', 32500039, N'F', CAST(N'2005-01-03' AS Date), N'3365275562', N'noa_berta.herrero@herrero.noa_berta@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2515, N'Domínguez', N'Yasmín Rocío', 32500040, N'F', CAST(N'2005-01-08' AS Date), N'3369927190', N'yasmín_rocío.domínguez@domínguez.yasmín_rocío@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2516, N'Cano', N'Juan Lucas', 32500041, N'M', CAST(N'2005-01-15' AS Date), N'3364395702', N'juan_lucas.cano@cano.juan_lucas@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2517, N'Soto', N'Julia Ainara', 32500042, N'F', CAST(N'2005-01-23' AS Date), N'3364047461', N'julia_ainara.soto@soto.julia_ainara@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2518, N'Suárez', N'Fabián Caleb', 32500043, N'M', CAST(N'2005-01-12' AS Date), N'3367532252', N'fabián_caleb.suárez@suárez.fabián_caleb@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2519, N'Pascual', N'Cloe Mia', 32500044, N'F', CAST(N'2005-01-30' AS Date), N'3366109957', N'cloe_mia.pascual@pascual.cloe_mia@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2520, N'Duran', N'Aarón Ezequiel', 32500045, N'M', CAST(N'2005-01-01' AS Date), N'3363308337', N'aarón_ezequiel.duran@duran.aarón_ezequiel@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2521, N'Blanco', N'Lola Paula', 32500046, N'F', CAST(N'2005-01-29' AS Date), N'3367836476', N'lola_paula.blanco@blanco.lola_paula@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2522, N'Ferrer', N'Aram Set', 32500047, N'M', CAST(N'2005-01-27' AS Date), N'3367795726', N'aram_set.ferrer@ferrer.aram_set@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2523, N'Reyes', N'Ángela Vega', 32500048, N'F', CAST(N'2005-01-13' AS Date), N'3369411666', N'Ángela_vega.reyes@reyes.ángela_vega@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2524, N'Ibáñez', N'Claudia Abril', 32500049, N'F', CAST(N'2005-01-03' AS Date), N'3368575849', N'claudia_abril.ibáñez@ibáñez.claudia_abril@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2525, N'Marin', N'Jeremías Israel', 32500050, N'M', CAST(N'2005-01-23' AS Date), N'3366208467', N'jeremías_israel.marin@marin.jeremías_israel@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2526, N'Cortés', N'Nuria Sofía', 32500051, N'F', CAST(N'2005-01-30' AS Date), N'3366804419', N'nuria_sofía.cortés@cortés.nuria_sofía@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2527, N'Calvo', N'Irene Julia', 32500052, N'F', CAST(N'2005-01-17' AS Date), N'3364584614', N'irene_julia.calvo@calvo.irene_julia@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2528, N'Díaz', N'Uzías Neftalí', 32500053, N'M', CAST(N'2005-01-23' AS Date), N'3366788610', N'uzías_neftalí.díaz@díaz.uzías_neftalí@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2529, N'Roman', N'Elena Alejandra', 32500054, N'F', CAST(N'2005-01-17' AS Date), N'3368202223', N'elena_alejandra.roman@roman.elena_alejandra@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2530, N'Serrano', N'Victoria', 32500055, N'F', CAST(N'2005-01-17' AS Date), N'3367082169', N'victoria.serrano@serrano.victoria@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2531, N'Jimenez', N'Jana Nerea', 32500056, N'F', CAST(N'2005-01-19' AS Date), N'3364978921', N'jana_nerea.jimenez@jimenez.jana_nerea@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2532, N'Ferrer', N'Luna África', 32500057, N'F', CAST(N'2005-01-22' AS Date), N'3369760453', N'luna_África.ferrer@ferrer.luna_áfrica@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2533, N'Santos', N'Triana Gabriela', 32500058, N'F', CAST(N'2005-01-16' AS Date), N'3363508667', N'triana_gabriela.santos@santos.triana_gabriela@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2534, N'Lorenzo', N'Julio Juan', 32500059, N'M', CAST(N'2005-01-16' AS Date), N'3369570258', N'julio_juan.lorenzo@lorenzo.julio_juan@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2535, N'Sanz', N'Valentina Carolina', 32500060, N'F', CAST(N'2005-01-10' AS Date), N'3367791027', N'valentina_carolina.sanz@sanz.valentina_carolina@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2536, N'Caballero', N'Yasmín Mar', 32500061, N'F', CAST(N'2005-01-24' AS Date), N'3366767220', N'yasmín_mar.caballero@caballero.yasmín_mar@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2537, N'Lorenzo', N'Carla Arlet', 32500062, N'F', CAST(N'2005-01-04' AS Date), N'3363197859', N'carla_arlet.lorenzo@lorenzo.carla_arlet@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2538, N'García', N'Zoe Ángela', 32500063, N'F', CAST(N'2005-01-03' AS Date), N'3369490100', N'zoe_Ángela.garcía@garcía.zoe_ángela@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2539, N'Gil', N'Jimena Alma', 32500064, N'F', CAST(N'2005-01-28' AS Date), N'3367694900', N'jimena_alma.gil@gil.jimena_alma@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2540, N'Hidalgo', N'Gabriel Neftalí', 32500065, N'M', CAST(N'2005-01-30' AS Date), N'3369519794', N'gabriel_neftalí.hidalgo@hidalgo.gabriel_neftalí@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2541, N'Fernández', N'Ciro Jared', 32500066, N'M', CAST(N'2005-01-12' AS Date), N'3368948002', N'ciro_jared.fernández@fernández.ciro_jared@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2542, N'Caballero', N'Abimael Demócrito', 32500067, N'M', CAST(N'2005-01-14' AS Date), N'3364544987', N'abimael_demócrito.caballero@caballero.abimael_demócrito@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2543, N'Fuentes', N'Uzías Agustín', 32500068, N'M', CAST(N'2005-01-10' AS Date), N'3369336522', N'uzías_agustín.fuentes@fuentes.uzías_agustín@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2544, N'Moya', N'Sara Elena', 32500069, N'F', CAST(N'2005-01-17' AS Date), N'3367758886', N'sara_elena.moya@moya.sara_elena@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2545, N'Ramos', N'Celia Manuela', 32500070, N'F', CAST(N'2005-01-16' AS Date), N'3364967482', N'celia_manuela.ramos@ramos.celia_manuela@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2546, N'Duran', N'Ismael Jeremías', 32500071, N'M', CAST(N'2005-01-28' AS Date), N'3369928316', N'ismael_jeremías.duran@duran.ismael_jeremías@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2547, N'Medina', N'Jesús Isaías', 32500072, N'M', CAST(N'2005-01-11' AS Date), N'3363802848', N'jesús_isaías.medina@medina.jesús_isaías@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2548, N'Calvo', N'Cayetana Julia', 32500073, N'F', CAST(N'2005-01-16' AS Date), N'3368941733', N'cayetana_julia.calvo@calvo.cayetana_julia@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2549, N'Sánchez', N'María Jana', 32500074, N'F', CAST(N'2005-01-14' AS Date), N'3368650837', N'maría_jana.sánchez@sánchez.maría_jana@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2550, N'Suárez', N'Abdiel Alejandro', 32500075, N'M', CAST(N'2005-01-25' AS Date), N'3363275641', N'abdiel_alejandro.suárez@suárez.abdiel_alejandro@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2551, N'Ibáñez', N'Herodes Simón', 32500076, N'M', CAST(N'2005-01-29' AS Date), N'3363474468', N'herodes_simón.ibáñez@ibáñez.herodes_simón@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2552, N'Santiago', N'Paula África', 32500077, N'F', CAST(N'2005-01-17' AS Date), N'3363426553', N'paula_África.santiago@santiago.paula_áfrica@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2553, N'Ferrer', N'Nicolás Aram', 32500078, N'M', CAST(N'2005-01-14' AS Date), N'3367348595', N'nicolás_aram.ferrer@ferrer.nicolás_aram@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2554, N'Moreno', N'Ahzià Omar', 32500079, N'M', CAST(N'2005-01-07' AS Date), N'3364498994', N'ahzià_omar.moreno@moreno.ahzià_omar@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2555, N'Molina', N'Ahzià Jacob', 32500080, N'M', CAST(N'2005-01-09' AS Date), N'3368667132', N'ahzià_jacob.molina@molina.ahzià_jacob@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2556, N'Fuentes', N'Beltrán Neftalí', 32500081, N'M', CAST(N'2005-01-16' AS Date), N'3363700940', N'beltrán_neftalí.fuentes@fuentes.beltrán_neftalí@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2557, N'Domínguez', N'Paula Valeria', 32500082, N'F', CAST(N'2005-01-07' AS Date), N'3365052578', N'paula_valeria.domínguez@domínguez.paula_valeria@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2558, N'Ortega', N'Marcos David', 32500083, N'M', CAST(N'2005-01-08' AS Date), N'3366703459', N'marcos_david.ortega@ortega.marcos_david@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2559, N'Montero', N'Noa Adriana', 32500084, N'F', CAST(N'2005-01-25' AS Date), N'3366094932', N'noa_adriana.montero@montero.noa_adriana@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2560, N'Nieto', N'José Isaías', 32500085, N'M', CAST(N'2005-01-11' AS Date), N'3369457597', N'josé_isaías.nieto@nieto.josé_isaías@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2561, N'Herrero', N'Lemuel Labán', 32500086, N'M', CAST(N'2005-01-29' AS Date), N'3365735786', N'lemuel_labán.herrero@herrero.lemuel_labán@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2562, N'Cortés', N'Zacarías Saúl', 32500087, N'M', CAST(N'2005-01-29' AS Date), N'3364268010', N'zacarías_saúl.cortés@cortés.zacarías_saúl@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2563, N'Sáez', N'Lara Laura', 32500088, N'F', CAST(N'2005-01-14' AS Date), N'3363594774', N'lara_laura.sáez@sáez.lara_laura@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2564, N'Soto', N'Alma Arlet', 32500089, N'F', CAST(N'2005-01-18' AS Date), N'3364940652', N'alma_arlet.soto@soto.alma_arlet@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2565, N'Santana', N'Gala Triana', 32500090, N'F', CAST(N'2005-01-02' AS Date), N'3366235105', N'gala_triana.santana@santana.gala_triana@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2566, N'Martínez', N'Aitana Nour', 32500091, N'F', CAST(N'2005-01-24' AS Date), N'3366656076', N'aitana_nour.martínez@martínez.aitana_nour@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2567, N'Vicente', N'Cristina Manuela', 32500092, N'F', CAST(N'2005-01-14' AS Date), N'3363918079', N'cristina_manuela.vicente@vicente.cristina_manuela@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2568, N'Suárez', N'Rocío Cloe', 32500093, N'F', CAST(N'2005-01-06' AS Date), N'3368410209', N'rocío_cloe.suárez@suárez.rocío_cloe@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2569, N'Sáez', N'Fátima Malak', 32500094, N'F', CAST(N'2005-01-14' AS Date), N'3365378623', N'fátima_malak.sáez@sáez.fátima_malak@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2570, N'Cruz', N'Rafael Leví', 32500095, N'M', CAST(N'2005-01-28' AS Date), N'3368520585', N'rafael_leví.cruz@cruz.rafael_leví@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2571, N'Ortega', N'Naín Daniel', 32500096, N'M', CAST(N'2005-01-02' AS Date), N'3364137889', N'naín_daniel.ortega@ortega.naín_daniel@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2572, N'Vargas', N'Elí Felipe', 32500097, N'M', CAST(N'2005-01-06' AS Date), N'3367373010', N'elí_felipe.vargas@vargas.elí_felipe@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2573, N'Sánchez', N'Claudia Eva', 32500098, N'F', CAST(N'2005-01-02' AS Date), N'3367218495', N'claudia_eva.sánchez@sánchez.claudia_eva@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2574, N'Márquez', N'Olivia Lola', 32500099, N'F', CAST(N'2005-01-27' AS Date), N'3364685457', N'olivia_lola.márquez@márquez.olivia_lola@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2575, N'Méndez', N'África Carla', 33000001, N'F', CAST(N'2006-01-23' AS Date), N'3365682779', N'África_carla.méndez@méndez.áfrica_carla@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2576, N'Carmona', N'Fabián Bartolomé', 33000002, N'M', CAST(N'2006-01-23' AS Date), N'3364518825', N'fabián_bartolomé.carmona@carmona.fabián_bartolomé@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2577, N'Vargas', N'Mia Candela', 33000003, N'F', CAST(N'2006-01-04' AS Date), N'3367545893', N'mia_candela.vargas@vargas.mia_candela@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2578, N'Gil', N'Lucía', 33000004, N'F', CAST(N'2006-01-13' AS Date), N'3368859068', N'lucía.gil@gil.lucía@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2579, N'Flores', N'Beltrán Mateo', 33000005, N'M', CAST(N'2006-01-22' AS Date), N'3368738529', N'beltrán_mateo.flores@flores.beltrán_mateo@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2580, N'Medina', N'Uzías Guido', 33000006, N'M', CAST(N'2006-01-06' AS Date), N'3366018548', N'uzías_guido.medina@medina.uzías_guido@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2581, N'Herrero', N'Marina Carlota', 33000007, N'F', CAST(N'2006-01-13' AS Date), N'3364373313', N'marina_carlota.herrero@herrero.marina_carlota@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2582, N'Moreno', N'Leire Alba', 33000008, N'F', CAST(N'2006-01-11' AS Date), N'3367153228', N'leire_alba.moreno@moreno.leire_alba@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2583, N'Muñoz', N'Efraín Omar', 33000009, N'M', CAST(N'2006-01-13' AS Date), N'3364200693', N'efraín_omar.muñoz@muñoz.efraín_omar@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2584, N'León', N'Salomón Acab', 33000010, N'M', CAST(N'2006-01-08' AS Date), N'3366133593', N'salomón_acab.león@león.salomón_acab@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2585, N'Pastor', N'Beltrán Ashur', 33000011, N'M', CAST(N'2006-01-21' AS Date), N'3369828995', N'beltrán_ashur.pastor@pastor.beltrán_ashur@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2586, N'Parra', N'Aina Aroa', 33000012, N'F', CAST(N'2006-01-25' AS Date), N'3367087615', N'aina_aroa.parra@parra.aina_aroa@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2587, N'Hernández', N'Baltasar Leví', 33000013, N'M', CAST(N'2006-01-30' AS Date), N'3365397646', N'baltasar_leví.hernández@hernández.baltasar_leví@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2588, N'Montero', N'Daniel Abdiel', 33000014, N'M', CAST(N'2006-01-25' AS Date), N'3366922541', N'daniel_abdiel.montero@montero.daniel_abdiel@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2589, N'Roman', N'Eliel Jacob', 33000015, N'M', CAST(N'2006-01-24' AS Date), N'3368889886', N'eliel_jacob.roman@roman.eliel_jacob@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2590, N'González', N'Ainara Zoe', 33000016, N'F', CAST(N'2006-01-27' AS Date), N'3363934339', N'ainara_zoe.gonzález@gonzález.ainara_zoe@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2591, N'Moya', N'Alejandra Aroa', 33000017, N'F', CAST(N'2006-01-27' AS Date), N'3368832388', N'alejandra_aroa.moya@moya.alejandra_aroa@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2592, N'Guerrero', N'Ciro Abraham', 33000018, N'M', CAST(N'2006-01-19' AS Date), N'3368487070', N'ciro_abraham.guerrero@guerrero.ciro_abraham@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2593, N'Morales', N'Joaquín Jared', 33000019, N'M', CAST(N'2006-01-18' AS Date), N'3365336147', N'joaquín_jared.morales@morales.joaquín_jared@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2594, N'Ibáñez', N'Marduk Beltrán', 33000020, N'M', CAST(N'2006-01-26' AS Date), N'3363678480', N'marduk_beltrán.ibáñez@ibáñez.marduk_beltrán@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2595, N'Sánchez', N'Lia Marina', 33000021, N'F', CAST(N'2006-01-09' AS Date), N'3365722717', N'lia_marina.sánchez@sánchez.lia_marina@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2596, N'Ramos', N'Miguel Leví', 33000022, N'M', CAST(N'2006-01-04' AS Date), N'3365883905', N'miguel_leví.ramos@ramos.miguel_leví@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2597, N'Santos', N'Alba Nour', 33000023, N'F', CAST(N'2006-01-14' AS Date), N'3366276290', N'alba_nour.santos@santos.alba_nour@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2598, N'Flores', N'Bartolomé Daniel', 33000024, N'M', CAST(N'2006-01-24' AS Date), N'3365988629', N'bartolomé_daniel.flores@flores.bartolomé_daniel@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2599, N'Ferrer', N'Marcos Abimael', 33000025, N'M', CAST(N'2006-01-28' AS Date), N'3363808573', N'marcos_abimael.ferrer@ferrer.marcos_abimael@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2600, N'Ferrer', N'Caín Ciro', 33000026, N'M', CAST(N'2006-01-08' AS Date), N'3365643515', N'caín_ciro.ferrer@ferrer.caín_ciro@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2601, N'Pérez', N'Eliel Labán', 33000027, N'M', CAST(N'2006-01-03' AS Date), N'3364332870', N'eliel_labán.pérez@pérez.eliel_labán@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2602, N'Aguilar', N'Elías Ciro', 33000028, N'M', CAST(N'2006-01-23' AS Date), N'3363560281', N'elías_ciro.aguilar@aguilar.elías_ciro@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2603, N'Reyes', N'Abraham Caín', 33000029, N'M', CAST(N'2006-01-15' AS Date), N'3369792865', N'abraham_caín.reyes@reyes.abraham_caín@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2604, N'Moya', N'Germán Jiram', 33000030, N'M', CAST(N'2006-01-02' AS Date), N'3368885363', N'germán_jiram.moya@moya.germán_jiram@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2605, N'Moya', N'Caín Ahzià', 33000031, N'M', CAST(N'2006-01-25' AS Date), N'3364449605', N'caín_ahzià.moya@moya.caín_ahzià@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2606, N'Sánchez', N'Ashur David', 33000032, N'M', CAST(N'2006-01-08' AS Date), N'3367650676', N'ashur_david.sánchez@sánchez.ashur_david@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2607, N'Moreno', N'Francisco Félix', 33000033, N'M', CAST(N'2006-01-11' AS Date), N'3367522648', N'francisco_félix.moreno@moreno.francisco_félix@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2608, N'Ortega', N'Jeremías Simón', 33000034, N'M', CAST(N'2006-01-03' AS Date), N'3364044198', N'jeremías_simón.ortega@ortega.jeremías_simón@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2609, N'Moreno', N'Ismael Esteban', 33000035, N'M', CAST(N'2006-01-04' AS Date), N'3369697774', N'ismael_esteban.moreno@moreno.ismael_esteban@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2610, N'Vázquez', N'María Carlota', 33000036, N'F', CAST(N'2006-01-02' AS Date), N'3368846371', N'maría_carlota.vázquez@vázquez.maría_carlota@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2611, N'Santana', N'Adriana Gala', 33000037, N'F', CAST(N'2006-01-30' AS Date), N'3368324382', N'adriana_gala.santana@santana.adriana_gala@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2612, N'Caballero', N'Mara Victoria', 33000038, N'F', CAST(N'2006-01-21' AS Date), N'3365495322', N'mara_victoria.caballero@caballero.mara_victoria@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2613, N'Hidalgo', N'Naín Germán', 33000039, N'M', CAST(N'2006-01-24' AS Date), N'3365496831', N'naín_germán.hidalgo@hidalgo.naín_germán@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2614, N'Vidal', N'Ainara África', 33000040, N'F', CAST(N'2006-01-27' AS Date), N'3363998907', N'ainara_África.vidal@vidal.ainara_áfrica@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2615, N'Herrero', N'India Carla', 33000041, N'F', CAST(N'2006-01-26' AS Date), N'3365009771', N'india_carla.herrero@herrero.india_carla@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2616, N'Carmona', N'Isabella África', 33000042, N'F', CAST(N'2006-01-24' AS Date), N'3369437741', N'isabella_África.carmona@carmona.isabella_áfrica@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2617, N'Muñoz', N'Esteban Set', 33000043, N'M', CAST(N'2006-01-18' AS Date), N'3365875730', N'esteban_set.muñoz@muñoz.esteban_set@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2618, N'Ruiz', N'Azahara Luna', 33000044, N'F', CAST(N'2006-01-15' AS Date), N'3363727119', N'azahara_luna.ruiz@ruiz.azahara_luna@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2619, N'Cruz', N'Baltasar Jehoram', 33000045, N'M', CAST(N'2006-01-01' AS Date), N'3369560528', N'baltasar_jehoram.cruz@cruz.baltasar_jehoram@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2620, N'Romero', N'Irene Aitana', 33000046, N'F', CAST(N'2006-01-06' AS Date), N'3368355148', N'irene_aitana.romero@romero.irene_aitana@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2621, N'Rubio', N'Aina Malak', 33000047, N'F', CAST(N'2006-01-01' AS Date), N'3369249937', N'aina_malak.rubio@rubio.aina_malak@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2622, N'Castro', N'Guido Gadiel', 33000048, N'M', CAST(N'2006-01-04' AS Date), N'3365472906', N'guido_gadiel.castro@castro.guido_gadiel@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2623, N'Moya', N'Salomón Alejandro', 33000049, N'M', CAST(N'2006-01-30' AS Date), N'3365826956', N'salomón_alejandro.moya@moya.salomón_alejandro@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2624, N'Díaz', N'Andrea Sara', 33000050, N'F', CAST(N'2006-01-14' AS Date), N'3364914844', N'andrea_sara.díaz@díaz.andrea_sara@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2625, N'Soler', N'Cristina Nahia', 33000051, N'F', CAST(N'2006-01-09' AS Date), N'3363675596', N'cristina_nahia.soler@soler.cristina_nahia@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2626, N'Guerrero', N'Tobías Rubén', 33000052, N'M', CAST(N'2006-01-19' AS Date), N'3367772643', N'tobías_rubén.guerrero@guerrero.tobías_rubén@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2627, N'Castillo', N'Triana Cloe', 33000053, N'F', CAST(N'2006-01-01' AS Date), N'3364622864', N'triana_cloe.castillo@castillo.triana_cloe@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2628, N'Molina', N'Martina Vega', 33000054, N'F', CAST(N'2006-01-09' AS Date), N'3363899111', N'martina_vega.molina@molina.martina_vega@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2629, N'Rojas', N'Demócrito Jehoram', 33000055, N'M', CAST(N'2006-01-11' AS Date), N'3365652084', N'demócrito_jehoram.rojas@rojas.demócrito_jehoram@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2630, N'Medina', N'Ainhoa Aitana', 33000056, N'F', CAST(N'2006-01-04' AS Date), N'3363108226', N'ainhoa_aitana.medina@medina.ainhoa_aitana@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2631, N'Lorenzo', N'Azahara Nuria', 33000057, N'F', CAST(N'2006-01-16' AS Date), N'3367433454', N'azahara_nuria.lorenzo@lorenzo.azahara_nuria@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2632, N'López', N'Luna Carlota', 33000058, N'F', CAST(N'2006-01-13' AS Date), N'3367419147', N'luna_carlota.lópez@lópez.luna_carlota@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2633, N'Medina', N'Cloe Luna', 33000059, N'F', CAST(N'2006-01-04' AS Date), N'3366465961', N'cloe_luna.medina@medina.cloe_luna@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2634, N'Rubio', N'Rocío Julieta', 33000060, N'F', CAST(N'2006-01-28' AS Date), N'3365770995', N'rocío_julieta.rubio@rubio.rocío_julieta@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2635, N'Delgado', N'Luna Lina', 33000061, N'F', CAST(N'2006-01-04' AS Date), N'3363627762', N'luna_lina.delgado@delgado.luna_lina@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2636, N'Navarro', N'Marta África', 33000062, N'F', CAST(N'2006-01-19' AS Date), N'3368756804', N'marta_África.navarro@navarro.marta_áfrica@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2637, N'Herrera', N'Fátima Jana', 33000063, N'F', CAST(N'2006-01-14' AS Date), N'3368126606', N'fátima_jana.herrera@herrera.fátima_jana@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2638, N'González', N'Azahara Adriana', 33000064, N'F', CAST(N'2006-01-19' AS Date), N'3368189010', N'azahara_adriana.gonzález@gonzález.azahara_adriana@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2639, N'Vargas', N'Mateo Ismael', 33000065, N'M', CAST(N'2006-01-02' AS Date), N'3365140958', N'mateo_ismael.vargas@vargas.mateo_ismael@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2640, N'Carrasco', N'Bartolomé Zacarías', 33000066, N'M', CAST(N'2006-01-20' AS Date), N'3369404171', N'bartolomé_zacarías.carrasco@carrasco.bartolomé_zacarías@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2641, N'Nuñez', N'Azahara Cayetana', 33000067, N'F', CAST(N'2006-01-01' AS Date), N'3366584068', N'azahara_cayetana.nuñez@nuñez.azahara_cayetana@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2642, N'Parra', N'Rafael Adán', 33000068, N'M', CAST(N'2006-01-14' AS Date), N'3365503804', N'rafael_adán.parra@parra.rafael_adán@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2643, N'Delgado', N'Andrés Baltasar', 33000069, N'M', CAST(N'2006-01-04' AS Date), N'3369781746', N'andrés_baltasar.delgado@delgado.andrés_baltasar@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2644, N'Soler', N'Macarena Luna', 33000070, N'F', CAST(N'2006-01-28' AS Date), N'3369903123', N'macarena_luna.soler@soler.macarena_luna@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2645, N'Sanz', N'Mara Malak', 33000071, N'F', CAST(N'2006-01-05' AS Date), N'3365362679', N'mara_malak.sanz@sanz.mara_malak@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2646, N'Gallardo', N'Homero Bartolomé', 33000072, N'M', CAST(N'2006-01-09' AS Date), N'3363699424', N'homero_bartolomé.gallardo@gallardo.homero_bartolomé@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2647, N'Mora', N'Set Andrés', 33000073, N'M', CAST(N'2006-01-24' AS Date), N'3367659075', N'set_andrés.mora@mora.set_andrés@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2648, N'Velasco', N' Rocío', 33000074, N'F', CAST(N'2006-01-20' AS Date), N'3363919163', N'_rocío.velasco@velasco._rocío@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2649, N'Carrasco', N'Nerea Valeria', 33000075, N'F', CAST(N'2006-01-06' AS Date), N'3368644962', N'nerea_valeria.carrasco@carrasco.nerea_valeria@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2650, N'Molina', N'Josué Esteban', 33000076, N'M', CAST(N'2006-01-12' AS Date), N'3367061783', N'josué_esteban.molina@molina.josué_esteban@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2651, N'Flores', N'Jairo Abraham', 33000077, N'M', CAST(N'2006-01-12' AS Date), N'3368378167', N'jairo_abraham.flores@flores.jairo_abraham@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2652, N'Serrano', N'Valeria Laura', 33000078, N'F', CAST(N'2006-01-17' AS Date), N'3369009454', N'valeria_laura.serrano@serrano.valeria_laura@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2653, N'Diez', N'Rafael Eliseo', 33000079, N'M', CAST(N'2006-01-01' AS Date), N'3368955602', N'rafael_eliseo.diez@diez.rafael_eliseo@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2654, N'Soler', N'Caín Eliseo', 33000080, N'M', CAST(N'2006-01-13' AS Date), N'3369794184', N'caín_eliseo.soler@soler.caín_eliseo@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2655, N'León', N'Gala Martina', 33000081, N'F', CAST(N'2006-01-01' AS Date), N'3366010279', N'gala_martina.león@león.gala_martina@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2656, N'Lozano', N'Nahia Lara', 33000082, N'F', CAST(N'2006-01-06' AS Date), N'3366796001', N'nahia_lara.lozano@lozano.nahia_lara@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2657, N'Cabrera', N'Laia Zoe', 33000083, N'F', CAST(N'2006-01-04' AS Date), N'3363842229', N'laia_zoe.cabrera@cabrera.laia_zoe@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2658, N'Campos', N'Paula Sara', 33000084, N'F', CAST(N'2006-01-12' AS Date), N'3365049919', N'paula_sara.campos@campos.paula_sara@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2659, N'Peña', N'Elsa Carla', 33000085, N'F', CAST(N'2006-01-07' AS Date), N'3366794543', N'elsa_carla.peña@peña.elsa_carla@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2660, N'Santiago', N'Ainara Inés', 33000086, N'F', CAST(N'2006-01-03' AS Date), N'3367060537', N'ainara_inés.santiago@santiago.ainara_inés@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2661, N'Ruiz', N'Helena Amaia', 33000087, N'F', CAST(N'2006-01-29' AS Date), N'3366325221', N'helena_amaia.ruiz@ruiz.helena_amaia@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2662, N'Vega', N'Homero Efraín', 33000088, N'M', CAST(N'2006-01-19' AS Date), N'3363608203', N'homero_efraín.vega@vega.homero_efraín@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2663, N'Gil', N'Abril Daniela', 33000089, N'F', CAST(N'2006-01-08' AS Date), N'3369589678', N'abril_daniela.gil@gil.abril_daniela@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2664, N'Hidalgo', N'Carmen Helena', 33000090, N'F', CAST(N'2006-01-30' AS Date), N'3369204256', N'carmen_helena.hidalgo@hidalgo.carmen_helena@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2665, N'Delgado', N'Nahia Carmen', 33000091, N'F', CAST(N'2006-01-08' AS Date), N'3363047169', N'nahia_carmen.delgado@delgado.nahia_carmen@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2666, N'Domínguez', N'Herodes Nicolás', 33000092, N'M', CAST(N'2006-01-09' AS Date), N'3363479218', N'herodes_nicolás.domínguez@domínguez.herodes_nicolás@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2667, N'Soler', N'Aurora Ainara', 33000093, N'F', CAST(N'2006-01-29' AS Date), N'3363814800', N'aurora_ainara.soler@soler.aurora_ainara@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2668, N'Carmona', N'Mia Lina', 33000094, N'F', CAST(N'2006-01-22' AS Date), N'3364987392', N'mia_lina.carmona@carmona.mia_lina@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2669, N'Gómez', N'Ahzià Isaías', 33000095, N'M', CAST(N'2006-01-17' AS Date), N'3369447762', N'ahzià_isaías.gómez@gómez.ahzià_isaías@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2670, N'Gutiérrez', N'Gabriela Lola', 33000096, N'F', CAST(N'2006-01-07' AS Date), N'3368429637', N'gabriela_lola.gutiérrez@gutiérrez.gabriela_lola@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2671, N'Aguilar', N'Ainhoa Andrea', 33000097, N'F', CAST(N'2006-01-08' AS Date), N'3368628902', N'ainhoa_andrea.aguilar@aguilar.ainhoa_andrea@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2672, N'Molina', N'Aina Nerea', 33000098, N'F', CAST(N'2006-01-28' AS Date), N'3364892505', N'aina_nerea.molina@molina.aina_nerea@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2673, N'Pastor', N'Mar Naia', 33000099, N'F', CAST(N'2006-01-11' AS Date), N'3366871382', N'mar_naia.pastor@pastor.mar_naia@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2674, N'Nuñez', N'Isaías Caín', 33500001, N'M', CAST(N'2007-01-11' AS Date), N'3369140268', N'isaías_caín.nuñez@nuñez.isaías_caín@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2675, N'Herrero', N'Alba Berta', 33500002, N'F', CAST(N'2007-01-23' AS Date), N'3367016546', N'alba_berta.herrero@herrero.alba_berta@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2676, N'Pérez', N'Baltasar Labán', 33500003, N'M', CAST(N'2007-01-10' AS Date), N'3368300467', N'baltasar_labán.pérez@pérez.baltasar_labán@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2677, N'Sáez', N'Iris Valentina', 33500004, N'F', CAST(N'2007-01-10' AS Date), N'3363829451', N'iris_valentina.sáez@sáez.iris_valentina@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2678, N'Garrido', N'Andrea Rocío', 33500005, N'F', CAST(N'2007-01-03' AS Date), N'3364204473', N'andrea_rocío.garrido@garrido.andrea_rocío@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2679, N'Rojas', N'Mar Iris', 33500006, N'F', CAST(N'2007-01-16' AS Date), N'3365429268', N'mar_iris.rojas@rojas.mar_iris@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2680, N'Castro', N'Sara Laia', 33500007, N'F', CAST(N'2007-01-25' AS Date), N'3365405086', N'sara_laia.castro@castro.sara_laia@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2681, N'Delgado', N'Lola Alejandra', 33500008, N'F', CAST(N'2007-01-20' AS Date), N'3368149070', N'lola_alejandra.delgado@delgado.lola_alejandra@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2682, N'Gallego', N'Lemuel Baltasar', 33500009, N'M', CAST(N'2007-01-01' AS Date), N'3363051679', N'lemuel_baltasar.gallego@gallego.lemuel_baltasar@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2683, N'Pérez', N'Simón Acab', 33500010, N'M', CAST(N'2007-01-02' AS Date), N'3369903529', N'simón_acab.pérez@pérez.simón_acab@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2684, N'Rodríguez', N'Neftalí David', 33500011, N'M', CAST(N'2007-01-12' AS Date), N'3364187237', N'neftalí_david.rodríguez@rodríguez.neftalí_david@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2685, N'Suárez', N'Nicolás Josué', 33500012, N'M', CAST(N'2007-01-21' AS Date), N'3368493921', N'nicolás_josué.suárez@suárez.nicolás_josué@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2686, N'Méndez', N'Abimael Ashur', 33500013, N'M', CAST(N'2007-01-26' AS Date), N'3363087296', N'abimael_ashur.méndez@méndez.abimael_ashur@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2687, N'Gutiérrez', N'Darío Jared', 33500014, N'M', CAST(N'2007-01-13' AS Date), N'3364944181', N'darío_jared.gutiérrez@gutiérrez.darío_jared@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2688, N'Giménez', N'Gala Candela', 33500015, N'F', CAST(N'2007-01-11' AS Date), N'3366822454', N'gala_candela.giménez@giménez.gala_candela@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2689, N'Martín', N'Ariadna Natalia', 33500016, N'F', CAST(N'2007-01-27' AS Date), N'3366163250', N'ariadna_natalia.martín@martín.ariadna_natalia@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2690, N'Mora', N'Gaspar Jared', 33500017, N'M', CAST(N'2007-01-04' AS Date), N'3363813664', N'gaspar_jared.mora@mora.gaspar_jared@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2691, N'Gallardo', N'Zacarías Simón', 33500018, N'M', CAST(N'2007-01-11' AS Date), N'3367913799', N'zacarías_simón.gallardo@gallardo.zacarías_simón@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2692, N'Garrido', N'Irene Naia', 33500019, N'F', CAST(N'2007-01-03' AS Date), N'3364500897', N'irene_naia.garrido@garrido.irene_naia@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2693, N'Domínguez', N'Beltrán Leví', 33500020, N'M', CAST(N'2007-01-22' AS Date), N'3369105090', N'beltrán_leví.domínguez@domínguez.beltrán_leví@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2694, N'Marin', N'Azahara Lia', 33500021, N'F', CAST(N'2007-01-17' AS Date), N'3369340110', N'azahara_lia.marin@marin.azahara_lia@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2695, N'Rodríguez', N'Ana Jana', 33500022, N'F', CAST(N'2007-01-09' AS Date), N'3368430345', N'ana_jana.rodríguez@rodríguez.ana_jana@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2696, N'Cruz', N'Benjamín Félix', 33500023, N'M', CAST(N'2007-01-26' AS Date), N'3364566203', N'benjamín_félix.cruz@cruz.benjamín_félix@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2697, N'Prieto', N'Amaia Laura', 33500024, N'F', CAST(N'2007-01-04' AS Date), N'3363186065', N'amaia_laura.prieto@prieto.amaia_laura@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2698, N'Ruiz', N'Sara Blanca', 33500025, N'F', CAST(N'2007-01-27' AS Date), N'3367548868', N'sara_blanca.ruiz@ruiz.sara_blanca@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2699, N'Carrasco', N'Sofía Mia', 33500026, N'F', CAST(N'2007-01-01' AS Date), N'3366998217', N'sofía_mia.carrasco@carrasco.sofía_mia@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2700, N'Gutiérrez', N'Carla Lina', 33500027, N'F', CAST(N'2007-01-25' AS Date), N'3367215114', N'carla_lina.gutiérrez@gutiérrez.carla_lina@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2701, N'Herrero', N'Malak Amira', 33500028, N'F', CAST(N'2007-01-22' AS Date), N'3368117388', N'malak_amira.herrero@herrero.malak_amira@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2702, N'Bravo', N'Neftalí Gaspar', 33500029, N'M', CAST(N'2007-01-05' AS Date), N'3365625901', N'neftalí_gaspar.bravo@bravo.neftalí_gaspar@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2703, N'Ramírez', N'Dámaso Zacarías', 33500030, N'M', CAST(N'2007-01-25' AS Date), N'3369035620', N'dámaso_zacarías.ramírez@ramírez.dámaso_zacarías@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2704, N'Ibáñez', N'Valentina Azahara', 33500031, N'F', CAST(N'2007-01-18' AS Date), N'3366792157', N'valentina_azahara.ibáñez@ibáñez.valentina_azahara@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2705, N'Rojas', N'Aurora Candela', 33500032, N'F', CAST(N'2007-01-03' AS Date), N'3368208915', N'aurora_candela.rojas@rojas.aurora_candela@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2706, N'Sanz', N'Alba Carlota', 33500033, N'F', CAST(N'2007-01-25' AS Date), N'3369779607', N'alba_carlota.sanz@sanz.alba_carlota@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2707, N'Santana', N'Caín Miguel', 33500034, N'M', CAST(N'2007-01-10' AS Date), N'3365651367', N'caín_miguel.santana@santana.caín_miguel@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2708, N'Aguilar', N'Mara Carolina', 33500035, N'F', CAST(N'2007-01-06' AS Date), N'3364822998', N'mara_carolina.aguilar@aguilar.mara_carolina@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2709, N'Iglesias', N'Isaías Neftalí', 33500036, N'M', CAST(N'2007-01-18' AS Date), N'3366575460', N'isaías_neftalí.iglesias@iglesias.isaías_neftalí@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2710, N'Álvarez', N'Lemuel Jonás', 33500037, N'M', CAST(N'2007-01-13' AS Date), N'3364436609', N'lemuel_jonás.Álvarez@álvarez.lemuel_jonás@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2711, N'Gómez', N'Lucía Yasmín', 33500038, N'F', CAST(N'2007-01-07' AS Date), N'3363399305', N'lucía_yasmín.gómez@gómez.lucía_yasmín@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2712, N'Álvarez', N'Jana Aitana', 33500039, N'F', CAST(N'2007-01-02' AS Date), N'3363743332', N'jana_aitana.Álvarez@álvarez.jana_aitana@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2713, N'Arias', N'Rafael Caín', 33500040, N'M', CAST(N'2007-01-24' AS Date), N'3366802186', N'rafael_caín.arias@arias.rafael_caín@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2714, N'Fernández', N'Eva Lina', 33500041, N'F', CAST(N'2007-01-02' AS Date), N'3366325017', N'eva_lina.fernández@fernández.eva_lina@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2715, N'Reyes', N'Marduk Agustín', 33500042, N'M', CAST(N'2007-01-18' AS Date), N'3363010089', N'marduk_agustín.reyes@reyes.marduk_agustín@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2716, N'García', N'Baltasar Eliel', 33500043, N'M', CAST(N'2007-01-26' AS Date), N'3364013861', N'baltasar_eliel.garcía@garcía.baltasar_eliel@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2717, N'Santiago', N'Juan Omar', 33500044, N'M', CAST(N'2007-01-05' AS Date), N'3367635412', N'juan_omar.santiago@santiago.juan_omar@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2718, N'Gómez', N'Baltasar Ashur', 33500045, N'M', CAST(N'2007-01-05' AS Date), N'3365058679', N'baltasar_ashur.gómez@gómez.baltasar_ashur@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2719, N'Carmona', N'Set Mateo', 33500046, N'M', CAST(N'2007-01-27' AS Date), N'3363044279', N'set_mateo.carmona@carmona.set_mateo@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2720, N'Morales', N'Alejandra Nerea', 33500047, N'F', CAST(N'2007-01-17' AS Date), N'3366200326', N'alejandra_nerea.morales@morales.alejandra_nerea@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2721, N'Iglesias', N'Gadiel Alejandro', 33500048, N'M', CAST(N'2007-01-02' AS Date), N'3363741394', N'gadiel_alejandro.iglesias@iglesias.gadiel_alejandro@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2722, N'Campos', N'Rocío Nour', 33500049, N'F', CAST(N'2007-01-06' AS Date), N'3364780271', N'rocío_nour.campos@campos.rocío_nour@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2723, N'Lozano', N'Ciro Hugo', 33500050, N'M', CAST(N'2007-01-06' AS Date), N'3368595988', N'ciro_hugo.lozano@lozano.ciro_hugo@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2724, N'Cano', N'Félix Eliseo', 33500051, N'M', CAST(N'2007-01-23' AS Date), N'3365592289', N'félix_eliseo.cano@cano.félix_eliseo@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2725, N'Carmona', N'Pablo Abimael', 33500052, N'M', CAST(N'2007-01-02' AS Date), N'3363902723', N'pablo_abimael.carmona@carmona.pablo_abimael@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2726, N'Rodríguez', N'Lucía Manuela', 33500053, N'F', CAST(N'2007-01-02' AS Date), N'3363300207', N'lucía_manuela.rodríguez@rodríguez.lucía_manuela@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2727, N'Márquez', N'Olivia María', 33500054, N'F', CAST(N'2007-01-11' AS Date), N'3363078640', N'olivia_maría.márquez@márquez.olivia_maría@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2728, N'Reyes', N'Sofía María', 33500055, N'F', CAST(N'2007-01-17' AS Date), N'3367800454', N'sofía_maría.reyes@reyes.sofía_maría@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2729, N'Carrasco', N'Lia Nuria', 33500056, N'F', CAST(N'2007-01-19' AS Date), N'3369033455', N'lia_nuria.carrasco@carrasco.lia_nuria@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2730, N'Castro', N'Lara Aitana', 33500057, N'F', CAST(N'2007-01-18' AS Date), N'3365430097', N'lara_aitana.castro@castro.lara_aitana@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2731, N'Calvo', N'Paula Vega', 33500058, N'F', CAST(N'2007-01-21' AS Date), N'3367893201', N'paula_vega.calvo@calvo.paula_vega@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2732, N'Martínez', N'Julia Carolina', 33500059, N'F', CAST(N'2007-01-06' AS Date), N'3364966478', N'julia_carolina.martínez@martínez.julia_carolina@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2733, N'Ferrer', N'Joaquín Samuel', 33500060, N'M', CAST(N'2007-01-14' AS Date), N'3367053338', N'joaquín_samuel.ferrer@ferrer.joaquín_samuel@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2734, N'Díaz', N'Ezequiel Aram', 33500061, N'M', CAST(N'2007-01-26' AS Date), N'3368753789', N'ezequiel_aram.díaz@díaz.ezequiel_aram@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2735, N'Gutiérrez', N'Mia Andrea', 33500062, N'F', CAST(N'2007-01-04' AS Date), N'3364187571', N'mia_andrea.gutiérrez@gutiérrez.mia_andrea@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2736, N'Vega', N'Carolina Macarena', 33500063, N'F', CAST(N'2007-01-28' AS Date), N'3364015124', N'carolina_macarena.vega@vega.carolina_macarena@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2737, N'Lozano', N'Laura Julia', 33500064, N'F', CAST(N'2007-01-15' AS Date), N'3366931265', N'laura_julia.lozano@lozano.laura_julia@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2738, N'Fuentes', N'Ciro Set', 33500065, N'M', CAST(N'2007-01-12' AS Date), N'3368265375', N'ciro_set.fuentes@fuentes.ciro_set@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2739, N'Ibáñez', N'Emma Marta', 33500066, N'F', CAST(N'2007-01-29' AS Date), N'3367965055', N'emma_marta.ibáñez@ibáñez.emma_marta@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2740, N'Aguilar', N'Gadiel Neftalí', 33500067, N'M', CAST(N'2007-01-04' AS Date), N'3366040115', N'gadiel_neftalí.aguilar@aguilar.gadiel_neftalí@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2741, N'Romero', N'Helena Amira', 33500068, N'F', CAST(N'2007-01-21' AS Date), N'3367059351', N'helena_amira.romero@romero.helena_amira@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2742, N'Ortega', N'María Martina', 33500069, N'F', CAST(N'2007-01-27' AS Date), N'3365362590', N'maría_martina.ortega@ortega.maría_martina@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2743, N'Vázquez', N'Alejandra Gala', 33500070, N'F', CAST(N'2007-01-11' AS Date), N'3363749005', N'alejandra_gala.vázquez@vázquez.alejandra_gala@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2744, N'Blanco', N'Elías Caín', 33500071, N'M', CAST(N'2007-01-19' AS Date), N'3364006493', N'elías_caín.blanco@blanco.elías_caín@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2745, N'Ramírez', N'Abel Jacob', 33500072, N'M', CAST(N'2007-01-01' AS Date), N'3365095212', N'abel_jacob.ramírez@ramírez.abel_jacob@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2746, N'García', N'Lucas Set', 33500073, N'M', CAST(N'2007-01-22' AS Date), N'3365301532', N'lucas_set.garcía@garcía.lucas_set@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2747, N'Vega', N'Jana Emma', 33500074, N'F', CAST(N'2007-01-29' AS Date), N'3367122557', N'jana_emma.vega@vega.jana_emma@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2748, N'Fernández', N'Jonás Gadiel', 33500075, N'M', CAST(N'2007-01-14' AS Date), N'3365248477', N'jonás_gadiel.fernández@fernández.jonás_gadiel@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2749, N'Castillo', N'Nerea Mara', 33500076, N'F', CAST(N'2007-01-11' AS Date), N'3369671990', N'nerea_mara.castillo@castillo.nerea_mara@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2750, N'Prieto', N'Alicia Jana', 33500077, N'F', CAST(N'2007-01-07' AS Date), N'3364852219', N'alicia_jana.prieto@prieto.alicia_jana@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2751, N'Santiago', N'José Hugo', 33500078, N'M', CAST(N'2007-01-12' AS Date), N'3366084586', N'josé_hugo.santiago@santiago.josé_hugo@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2752, N'Santiago', N'Olivia Amira', 33500079, N'F', CAST(N'2007-01-14' AS Date), N'3366130314', N'olivia_amira.santiago@santiago.olivia_amira@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2753, N'Santiago', N'José Aram', 33500080, N'M', CAST(N'2007-01-17' AS Date), N'3363485932', N'josé_aram.santiago@santiago.josé_aram@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2754, N'Hernández', N'Abraham Tobías', 33500081, N'M', CAST(N'2007-01-30' AS Date), N'3364290795', N'abraham_tobías.hernández@hernández.abraham_tobías@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2755, N'Giménez', N'Alejandro Set', 33500082, N'M', CAST(N'2007-01-10' AS Date), N'3363087557', N'alejandro_set.giménez@giménez.alejandro_set@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2756, N'Bravo', N'Adán Isaías', 33500083, N'M', CAST(N'2007-01-03' AS Date), N'3368752800', N'adán_isaías.bravo@bravo.adán_isaías@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2757, N'Méndez', N'Candela Noa', 33500084, N'F', CAST(N'2007-01-10' AS Date), N'3367237766', N'candela_noa.méndez@méndez.candela_noa@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2758, N'Prieto', N'Abril Martina', 33500085, N'F', CAST(N'2007-01-20' AS Date), N'3368291834', N'abril_martina.prieto@prieto.abril_martina@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2759, N'Ortiz', N'Ahzià Andrés', 33500086, N'M', CAST(N'2007-01-15' AS Date), N'3365140987', N'ahzià_andrés.ortiz@ortiz.ahzià_andrés@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2760, N'Moya', N'Clara Lia', 33500087, N'F', CAST(N'2007-01-11' AS Date), N'3365697371', N'clara_lia.moya@moya.clara_lia@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2761, N'Vega', N'Nour Lucía', 33500088, N'F', CAST(N'2007-01-23' AS Date), N'3365048552', N'nour_lucía.vega@vega.nour_lucía@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2762, N'León', N'Nahia Iria', 33500089, N'F', CAST(N'2007-01-23' AS Date), N'3364055192', N'nahia_iria.león@león.nahia_iria@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2763, N'Díaz', N'Marta Arlet', 33500090, N'F', CAST(N'2007-01-02' AS Date), N'3367368954', N'marta_arlet.díaz@díaz.marta_arlet@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2764, N'Moreno', N'Abraham Félix', 33500091, N'M', CAST(N'2007-01-17' AS Date), N'3366281859', N'abraham_félix.moreno@moreno.abraham_félix@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2765, N'Fernández', N'Inés Martina', 33500092, N'F', CAST(N'2007-01-22' AS Date), N'3363913870', N'inés_martina.fernández@fernández.inés_martina@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2766, N'Gallego', N'Arlet Sara', 33500093, N'F', CAST(N'2007-01-01' AS Date), N'3366526493', N'arlet_sara.gallego@gallego.arlet_sara@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2767, N'Gallardo', N'Esteban Julio', 33500094, N'M', CAST(N'2007-01-01' AS Date), N'3366328633', N'esteban_julio.gallardo@gallardo.esteban_julio@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2768, N'Rivera', N'Demócrito Lucas', 33500095, N'M', CAST(N'2007-01-30' AS Date), N'3369479767', N'demócrito_lucas.rivera@rivera.demócrito_lucas@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2769, N'Blanco', N'Lucas Neftalí', 33500096, N'M', CAST(N'2007-01-30' AS Date), N'3365568855', N'lucas_neftalí.blanco@blanco.lucas_neftalí@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2770, N'Gallego', N'Gaspar Ismael', 33500097, N'M', CAST(N'2007-01-05' AS Date), N'3366689270', N'gaspar_ismael.gallego@gallego.gaspar_ismael@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2771, N'Serrano', N'Irene Alba', 33500098, N'F', CAST(N'2007-01-11' AS Date), N'3369811763', N'irene_alba.serrano@serrano.irene_alba@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2772, N'Navarro', N'Leví Neftalí', 33500099, N'M', CAST(N'2007-01-05' AS Date), N'3369238209', N'leví_neftalí.navarro@navarro.leví_neftalí@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2773, N'Navarro', N'Carmen Emma', 34000001, N'F', CAST(N'2008-01-08' AS Date), N'3368414179', N'carmen_emma.navarro@navarro.carmen_emma@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2774, N'Herrero', N'Neftalí Félix', 34000002, N'M', CAST(N'2008-01-25' AS Date), N'3364962955', N'neftalí_félix.herrero@herrero.neftalí_félix@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2775, N'Vargas', N'Elí Germán', 34000003, N'M', CAST(N'2008-01-11' AS Date), N'3366634328', N'elí_germán.vargas@vargas.elí_germán@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2776, N'Nuñez', N'Adara Sara', 34000004, N'F', CAST(N'2008-01-30' AS Date), N'3365964336', N'adara_sara.nuñez@nuñez.adara_sara@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2777, N'Vázquez', N'Rubén Jacob', 34000005, N'M', CAST(N'2008-01-05' AS Date), N'3365617919', N'rubén_jacob.vázquez@vázquez.rubén_jacob@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2778, N'Roman', N'Guido Ezequiel', 34000006, N'M', CAST(N'2008-01-09' AS Date), N'3366768544', N'guido_ezequiel.roman@roman.guido_ezequiel@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2779, N'Montero', N'Gaspar Alejandro', 34000007, N'M', CAST(N'2008-01-27' AS Date), N'3365889737', N'gaspar_alejandro.montero@montero.gaspar_alejandro@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2780, N'Hernández', N'Iria Abril', 34000008, N'F', CAST(N'2008-01-07' AS Date), N'3365686542', N'iria_abril.hernández@hernández.iria_abril@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2781, N'Blanco', N'Abel Aram', 34000009, N'M', CAST(N'2008-01-08' AS Date), N'3367882611', N'abel_aram.blanco@blanco.abel_aram@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2782, N'Delgado', N'Adriana Laia', 34000010, N'F', CAST(N'2008-01-27' AS Date), N'3367093148', N'adriana_laia.delgado@delgado.adriana_laia@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2783, N'Gutiérrez', N'Demócrito Dámaso', 34000011, N'M', CAST(N'2008-01-12' AS Date), N'3367555305', N'demócrito_dámaso.gutiérrez@gutiérrez.demócrito_dámaso@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2784, N'Díaz', N'Berta Sofía', 34000012, N'F', CAST(N'2008-01-29' AS Date), N'3364167584', N'berta_sofía.díaz@díaz.berta_sofía@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2785, N'Calvo', N'Joanix Naín', 34000013, N'M', CAST(N'2008-01-23' AS Date), N'3364808877', N'joanix_naín.calvo@calvo.joanix_naín@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2786, N'Alonso', N'Demócrito Omar', 34000014, N'M', CAST(N'2008-01-10' AS Date), N'3365717243', N'demócrito_omar.alonso@alonso.demócrito_omar@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2787, N'Calvo', N'Macarena Lina', 34000015, N'F', CAST(N'2008-01-13' AS Date), N'3365363797', N'macarena_lina.calvo@calvo.macarena_lina@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2788, N'Nuñez', N'Naín Bartolomé', 34000016, N'M', CAST(N'2008-01-06' AS Date), N'3366514365', N'naín_bartolomé.nuñez@nuñez.naín_bartolomé@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2789, N'Méndez', N'Zoe Helena', 34000017, N'F', CAST(N'2008-01-04' AS Date), N'3368201284', N'zoe_helena.méndez@méndez.zoe_helena@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2790, N'Bravo', N'Agustín Beltrán', 34000018, N'M', CAST(N'2008-01-02' AS Date), N'3363080936', N'agustín_beltrán.bravo@bravo.agustín_beltrán@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2791, N'Vázquez', N'Felipe Isaías', 34000019, N'M', CAST(N'2008-01-06' AS Date), N'3368644336', N'felipe_isaías.vázquez@vázquez.felipe_isaías@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2792, N'Blanco', N'Felipe Simón', 34000020, N'M', CAST(N'2008-01-13' AS Date), N'3365413782', N'felipe_simón.blanco@blanco.felipe_simón@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2793, N'Carrasco', N'Natalia Sofía', 34000021, N'F', CAST(N'2008-01-03' AS Date), N'3365684553', N'natalia_sofía.carrasco@carrasco.natalia_sofía@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2794, N'Sánchez', N'Josué Édgar', 34000022, N'M', CAST(N'2008-01-01' AS Date), N'3364010784', N'josué_Édgar.sánchez@sánchez.josué_édgar@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2795, N'Álvarez', N'Homero Efraín', 34000023, N'M', CAST(N'2008-01-24' AS Date), N'3368599277', N'homero_efraín.Álvarez@álvarez.homero_efraín@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2796, N'Ibáñez', N'Nora Cayetana', 34000024, N'F', CAST(N'2008-01-19' AS Date), N'3369286228', N'nora_cayetana.ibáñez@ibáñez.nora_cayetana@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2797, N'Serrano', N'Ahzià Neftalí', 34000025, N'M', CAST(N'2008-01-14' AS Date), N'3366337816', N'ahzià_neftalí.serrano@serrano.ahzià_neftalí@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2798, N'Vidal', N'Aroa Elena', 34000026, N'F', CAST(N'2008-01-25' AS Date), N'3367818724', N'aroa_elena.vidal@vidal.aroa_elena@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2799, N'Vázquez', N'Macarena Yasmín', 34000027, N'F', CAST(N'2008-01-14' AS Date), N'3365377944', N'macarena_yasmín.vázquez@vázquez.macarena_yasmín@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2800, N'Hernández', N'Lemuel Agustín', 34000028, N'M', CAST(N'2008-01-27' AS Date), N'3365749291', N'lemuel_agustín.hernández@hernández.lemuel_agustín@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2801, N'Márquez', N'Helena Marta', 34000029, N'F', CAST(N'2008-01-30' AS Date), N'3363409788', N'helena_marta.márquez@márquez.helena_marta@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2802, N'Herrera', N'Gaspar Gadiel', 34000030, N'M', CAST(N'2008-01-24' AS Date), N'3369019525', N'gaspar_gadiel.herrera@herrera.gaspar_gadiel@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2803, N'Santiago', N'Daniela Triana', 34000031, N'F', CAST(N'2008-01-10' AS Date), N'3367166272', N'daniela_triana.santiago@santiago.daniela_triana@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2804, N'Peña', N'Andrés Germán', 34000032, N'M', CAST(N'2008-01-01' AS Date), N'3364957802', N'andrés_germán.peña@peña.andrés_germán@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2805, N'Soler', N'Sofía Elsa', 34000033, N'F', CAST(N'2008-01-28' AS Date), N'3369349845', N'sofía_elsa.soler@soler.sofía_elsa@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2806, N'Duran', N'Guido Lucas', 34000034, N'M', CAST(N'2008-01-06' AS Date), N'3368180668', N'guido_lucas.duran@duran.guido_lucas@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2807, N'Molina', N'Isaías Fabián', 34000035, N'M', CAST(N'2008-01-01' AS Date), N'3369887733', N'isaías_fabián.molina@molina.isaías_fabián@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2808, N'Rubio', N'Abril Carlota', 34000036, N'F', CAST(N'2008-01-18' AS Date), N'3364457783', N'abril_carlota.rubio@rubio.abril_carlota@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2809, N'Nuñez', N'Jaír de Galaad Abimael', 34000037, N'M', CAST(N'2008-01-17' AS Date), N'3363935716', N'jaír_de_galaad_abimael.nuñez@nuñez.jaír_de_galaad_abimael@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2810, N'Soto', N'Iria Carmen', 34000038, N'F', CAST(N'2008-01-04' AS Date), N'3369411754', N'iria_carmen.soto@soto.iria_carmen@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2811, N'Santos', N'Adán Caín', 34000039, N'M', CAST(N'2008-01-08' AS Date), N'3366982373', N'adán_caín.santos@santos.adán_caín@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2812, N'Suárez', N'Elías Jaír de Galaad', 34000040, N'M', CAST(N'2008-01-25' AS Date), N'3364475557', N'elías_jaír_de_galaad.suárez@suárez.elías_jaír_de_galaad@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2813, N'Fuentes', N'Victoria Olivia', 34000041, N'F', CAST(N'2008-01-27' AS Date), N'3366532172', N'victoria_olivia.fuentes@fuentes.victoria_olivia@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2814, N'Vega', N'Nicolás Andrés', 34000042, N'M', CAST(N'2008-01-14' AS Date), N'3365839965', N'nicolás_andrés.vega@vega.nicolás_andrés@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2815, N'Mora', N' Victoria', 34000043, N'F', CAST(N'2008-01-19' AS Date), N'3365082970', N'_victoria.mora@mora._victoria@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2816, N'Flores', N'Marina Elsa', 34000044, N'F', CAST(N'2008-01-14' AS Date), N'3369497702', N'marina_elsa.flores@flores.marina_elsa@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2817, N'Martínez', N'Alejandro Samuel', 34000045, N'M', CAST(N'2008-01-12' AS Date), N'3363797150', N'alejandro_samuel.martínez@martínez.alejandro_samuel@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2818, N'Serrano', N'Mara Elena', 34000046, N'F', CAST(N'2008-01-30' AS Date), N'3364643345', N'mara_elena.serrano@serrano.mara_elena@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2819, N'Ortega', N'Guido Isaías', 34000047, N'M', CAST(N'2008-01-04' AS Date), N'3363331932', N'guido_isaías.ortega@ortega.guido_isaías@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2820, N'Santos', N'Leyre Lucía', 34000048, N'F', CAST(N'2008-01-10' AS Date), N'3366385762', N'leyre_lucía.santos@santos.leyre_lucía@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2821, N'Suárez', N'Marta Eva', 34000049, N'F', CAST(N'2008-01-23' AS Date), N'3365305040', N'marta_eva.suárez@suárez.marta_eva@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2822, N'Sánchez', N'Caleb Israel', 34000050, N'M', CAST(N'2008-01-10' AS Date), N'3364651876', N'caleb_israel.sánchez@sánchez.caleb_israel@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2823, N'Romero', N'Jared Matías', 34000051, N'M', CAST(N'2008-01-12' AS Date), N'3365440319', N'jared_matías.romero@romero.jared_matías@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2824, N'López', N'Ona Ariadna', 34000052, N'F', CAST(N'2008-01-26' AS Date), N'3363903062', N'ona_ariadna.lópez@lópez.ona_ariadna@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2825, N'Álvarez', N'Lucía Elena', 34000053, N'F', CAST(N'2008-01-11' AS Date), N'3369242017', N'lucía_elena.Álvarez@álvarez.lucía_elena@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2826, N'Herrero', N'Ashur Beltrán', 34000054, N'M', CAST(N'2008-01-25' AS Date), N'3366658865', N'ashur_beltrán.herrero@herrero.ashur_beltrán@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2827, N'Reyes', N'Iria Victoria', 34000055, N'F', CAST(N'2008-01-23' AS Date), N'3363884906', N'iria_victoria.reyes@reyes.iria_victoria@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2828, N'Martínez', N'Marduk Jeremías', 34000056, N'M', CAST(N'2008-01-17' AS Date), N'3363731222', N'marduk_jeremías.martínez@martínez.marduk_jeremías@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2829, N'Montero', N'Nuria Jimena', 34000057, N'F', CAST(N'2008-01-29' AS Date), N'3363439262', N'nuria_jimena.montero@montero.nuria_jimena@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2830, N'Méndez', N'Victoria Valeria', 34000058, N'F', CAST(N'2008-01-18' AS Date), N'3367547937', N'victoria_valeria.méndez@méndez.victoria_valeria@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2831, N'Pérez', N'Lemuel Andrés', 34000059, N'M', CAST(N'2008-01-18' AS Date), N'3365928189', N'lemuel_andrés.pérez@pérez.lemuel_andrés@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2832, N'Delgado', N'Elia Cayetana', 34000060, N'F', CAST(N'2008-01-09' AS Date), N'3365602326', N'elia_cayetana.delgado@delgado.elia_cayetana@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2833, N'Duran', N'Jana Abril', 34000061, N'F', CAST(N'2008-01-28' AS Date), N'3367612677', N'jana_abril.duran@duran.jana_abril@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2834, N'López', N'Clara Andrea', 34000062, N'F', CAST(N'2008-01-25' AS Date), N'3368436952', N'clara_andrea.lópez@lópez.clara_andrea@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2835, N'Carrasco', N'Chloe Sara', 34000063, N'F', CAST(N'2008-01-05' AS Date), N'3363325655', N'chloe_sara.carrasco@carrasco.chloe_sara@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2836, N'León', N'Ashur Dámaso', 34000064, N'M', CAST(N'2008-01-22' AS Date), N'3364987903', N'ashur_dámaso.león@león.ashur_dámaso@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2837, N'Garrido', N'Matías Juan', 34000065, N'M', CAST(N'2008-01-25' AS Date), N'3367398223', N'matías_juan.garrido@garrido.matías_juan@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2838, N'Peña', N'Alicia Lola', 34000066, N'F', CAST(N'2008-01-11' AS Date), N'3366432412', N'alicia_lola.peña@peña.alicia_lola@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2839, N'Suárez', N'Gala Arlet', 34000067, N'F', CAST(N'2008-01-12' AS Date), N'3369532167', N'gala_arlet.suárez@suárez.gala_arlet@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2840, N'Molina', N'Agustín Matías', 34000068, N'M', CAST(N'2008-01-07' AS Date), N'3367899339', N'agustín_matías.molina@molina.agustín_matías@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2841, N'Serrano', N'Ainhoa ', 34000069, N'F', CAST(N'2008-01-27' AS Date), N'3366351874', N'ainhoa_.serrano@serrano.ainhoa_@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2842, N'Martínez', N'Abel Daniel', 34000070, N'M', CAST(N'2008-01-12' AS Date), N'3369042610', N'abel_daniel.martínez@martínez.abel_daniel@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2843, N'Soto', N'Matías Félix', 34000071, N'M', CAST(N'2008-01-28' AS Date), N'3363176365', N'matías_félix.soto@soto.matías_félix@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2844, N'Caballero', N'Neftalí Édgar', 34000072, N'M', CAST(N'2008-01-27' AS Date), N'3364801878', N'neftalí_Édgar.caballero@caballero.neftalí_édgar@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2845, N'Pastor', N'Luna Iris', 34000073, N'F', CAST(N'2008-01-08' AS Date), N'3367766104', N'luna_iris.pastor@pastor.luna_iris@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2846, N'Bravo', N'Ona Alba', 34000074, N'F', CAST(N'2008-01-20' AS Date), N'3369112569', N'ona_alba.bravo@bravo.ona_alba@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2847, N'Lozano', N'Gala Candela', 34000075, N'F', CAST(N'2008-01-29' AS Date), N'3367799988', N'gala_candela.lozano@lozano.gala_candela@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2848, N'Pascual', N'Neftalí Agustín', 34000076, N'M', CAST(N'2008-01-10' AS Date), N'3364624817', N'neftalí_agustín.pascual@pascual.neftalí_agustín@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2849, N'Sáez', N'Cloe Olivia', 34000077, N'F', CAST(N'2008-01-02' AS Date), N'3369584217', N'cloe_olivia.sáez@sáez.cloe_olivia@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2850, N'Vargas', N'Elías Joanix', 34000078, N'M', CAST(N'2008-01-17' AS Date), N'3366908522', N'elías_joanix.vargas@vargas.elías_joanix@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2851, N'Rojas', N'Saúl Samuel', 34000079, N'M', CAST(N'2008-01-05' AS Date), N'3363180190', N'saúl_samuel.rojas@rojas.saúl_samuel@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2852, N'Herrero', N'Mar Isabel', 34000080, N'F', CAST(N'2008-01-12' AS Date), N'3365967974', N'mar_isabel.herrero@herrero.mar_isabel@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2853, N'Blanco', N'Adriana Nour', 34000081, N'F', CAST(N'2008-01-18' AS Date), N'3365861919', N'adriana_nour.blanco@blanco.adriana_nour@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2854, N'Diez', N'Marina Berta', 34000082, N'F', CAST(N'2008-01-29' AS Date), N'3363924347', N'marina_berta.diez@diez.marina_berta@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2855, N'Prieto', N'Jaír de Galaad Neftalí', 34000083, N'M', CAST(N'2008-01-21' AS Date), N'3363156068', N'jaír_de_galaad_neftalí.prieto@prieto.jaír_de_galaad_neftalí@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2856, N'Gallego', N'Nour Valeria', 34000084, N'F', CAST(N'2008-01-26' AS Date), N'3363918556', N'nour_valeria.gallego@gallego.nour_valeria@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2857, N'Mora', N'Nerea Ainhoa', 34000085, N'F', CAST(N'2008-01-05' AS Date), N'3368592052', N'nerea_ainhoa.mora@mora.nerea_ainhoa@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2858, N'Herrero', N'Elías Marcos', 34000086, N'M', CAST(N'2008-01-17' AS Date), N'3364799806', N'elías_marcos.herrero@herrero.elías_marcos@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2859, N'Velasco', N'Jesús Gabriel', 34000087, N'M', CAST(N'2008-01-12' AS Date), N'3368024719', N'jesús_gabriel.velasco@velasco.jesús_gabriel@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2860, N'Romero', N'Berta Elena', 34000088, N'F', CAST(N'2008-01-28' AS Date), N'3369649907', N'berta_elena.romero@romero.berta_elena@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2861, N'Vázquez', N'Nuria Malak', 34000089, N'F', CAST(N'2008-01-11' AS Date), N'3364130933', N'nuria_malak.vázquez@vázquez.nuria_malak@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2862, N'Bravo', N'Mateo Juan', 34000090, N'M', CAST(N'2008-01-20' AS Date), N'3367258160', N'mateo_juan.bravo@bravo.mateo_juan@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2863, N'Nuñez', N'Eliel Abel', 34000091, N'M', CAST(N'2008-01-13' AS Date), N'3369804643', N'eliel_abel.nuñez@nuñez.eliel_abel@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2864, N'Sanz', N'Leire Adriana', 34000092, N'F', CAST(N'2008-01-14' AS Date), N'3368464278', N'leire_adriana.sanz@sanz.leire_adriana@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2865, N'Aguilar', N'Ariadna Alicia', 34000093, N'F', CAST(N'2008-01-09' AS Date), N'3367883406', N'ariadna_alicia.aguilar@aguilar.ariadna_alicia@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2866, N'Díaz', N'Rubén Rafael', 34000094, N'M', CAST(N'2008-01-02' AS Date), N'3367757615', N'rubén_rafael.díaz@díaz.rubén_rafael@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2867, N'Soler', N'Jeremías Agustín', 34000095, N'M', CAST(N'2008-01-18' AS Date), N'3364459122', N'jeremías_agustín.soler@soler.jeremías_agustín@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2868, N'Soto', N'Naia Ana', 34000096, N'F', CAST(N'2008-01-23' AS Date), N'3368041902', N'naia_ana.soto@soto.naia_ana@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2869, N'Hernández', N'Caín Agustín', 34000097, N'M', CAST(N'2008-01-06' AS Date), N'3363551812', N'caín_agustín.hernández@hernández.caín_agustín@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2870, N'Medina', N'Jared Adán', 34000098, N'M', CAST(N'2008-01-03' AS Date), N'3367130698', N'jared_adán.medina@medina.jared_adán@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2871, N'Castro', N'Cristina Nahia', 34000099, N'F', CAST(N'2008-01-20' AS Date), N'3368410373', N'cristina_nahia.castro@castro.cristina_nahia@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2872, N'Vargas', N'Carmen Emma', 34500001, N'F', CAST(N'2009-01-26' AS Date), N'3365790204', N'carmen_emma.vargas@vargas.carmen_emma@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2873, N'Garrido', N'Malak Gabriela', 34500002, N'F', CAST(N'2009-01-24' AS Date), N'3367248261', N'malak_gabriela.garrido@garrido.malak_gabriela@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2874, N'Duran', N'Victoria Abril', 34500003, N'F', CAST(N'2009-01-30' AS Date), N'3364516112', N'victoria_abril.duran@duran.victoria_abril@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2875, N'Pascual', N'Jonás', 34500004, N'M', CAST(N'2009-01-17' AS Date), N'3366422348', N'jonás.pascual@pascual.jonás@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2876, N'Carrasco', N'Amira Mar', 34500005, N'F', CAST(N'2009-01-06' AS Date), N'3363280922', N'amira_mar.carrasco@carrasco.amira_mar@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2877, N'Gómez', N'Sofía Manuela', 34500006, N'F', CAST(N'2009-01-27' AS Date), N'3365145142', N'sofía_manuela.gómez@gómez.sofía_manuela@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2878, N'Gallego', N'Elías Gabriel', 34500007, N'M', CAST(N'2009-01-19' AS Date), N'3369823075', N'elías_gabriel.gallego@gallego.elías_gabriel@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2879, N'Molina', N'Mateo Édgar', 34500008, N'M', CAST(N'2009-01-10' AS Date), N'3368667377', N'mateo_Édgar.molina@molina.mateo_édgar@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2880, N'Arias', N'Sergio', 34500009, N'M', CAST(N'2009-01-23' AS Date), N'3367056336', N'sergio.arias@arias.sergio@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2881, N'Montero', N'Elia Inés', 34500010, N'F', CAST(N'2009-01-01' AS Date), N'3367558857', N'elia_inés.montero@montero.elia_inés@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2882, N'Ramos', N'Inés', 34500011, N'F', CAST(N'2009-01-10' AS Date), N'3365179637', N'inés.ramos@ramos.inés@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2883, N'Nieto', N'Lucas Tobías', 34500012, N'M', CAST(N'2009-01-30' AS Date), N'3367840381', N'lucas_tobías.nieto@nieto.lucas_tobías@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2884, N'Calvo', N'Julio Agustín', 34500013, N'M', CAST(N'2009-01-07' AS Date), N'3365666992', N'julio_agustín.calvo@calvo.julio_agustín@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2885, N'Peña', N'Clara Emma', 34500014, N'F', CAST(N'2009-01-01' AS Date), N'3369759751', N'clara_emma.peña@peña.clara_emma@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2886, N'García', N'Noa Laia', 34500015, N'F', CAST(N'2009-01-01' AS Date), N'3367658481', N'noa_laia.garcía@garcía.noa_laia@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2887, N'Roman', N'Alejandra Malak', 34500016, N'F', CAST(N'2009-01-25' AS Date), N'3366292845', N'alejandra_malak.roman@roman.alejandra_malak@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2888, N'Duran', N'Homero Édgar', 34500017, N'M', CAST(N'2009-01-27' AS Date), N'3364702814', N'homero_Édgar.duran@duran.homero_édgar@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2889, N'Velasco', N'María Blanca', 34500018, N'F', CAST(N'2009-01-09' AS Date), N'3368283268', N'maría_blanca.velasco@velasco.maría_blanca@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2890, N'Díaz', N'Beltrán Labán', 34500019, N'M', CAST(N'2009-01-16' AS Date), N'3367699207', N'beltrán_labán.díaz@díaz.beltrán_labán@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2891, N'García', N'Mateo Dámaso', 34500020, N'M', CAST(N'2009-01-07' AS Date), N'3369215161', N'mateo_dámaso.garcía@garcía.mateo_dámaso@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2892, N'Peña', N'Carla Marta', 34500021, N'F', CAST(N'2009-01-29' AS Date), N'3363363778', N'carla_marta.peña@peña.carla_marta@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2893, N'Serrano', N'Manuela Zoe', 34500022, N'F', CAST(N'2009-01-17' AS Date), N'3369442007', N'manuela_zoe.serrano@serrano.manuela_zoe@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2894, N'Hernández', N'Marcos Juan', 34500023, N'M', CAST(N'2009-01-11' AS Date), N'3367885446', N'marcos_juan.hernández@hernández.marcos_juan@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2895, N'Fuentes', N'Aarón Renato', 34500024, N'M', CAST(N'2009-01-22' AS Date), N'3367413905', N'aarón_renato.fuentes@fuentes.aarón_renato@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2896, N'Serrano', N'Elena Vega', 34500025, N'F', CAST(N'2009-01-11' AS Date), N'3367028566', N'elena_vega.serrano@serrano.elena_vega@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2897, N'Martín', N'Jared Germán', 34500026, N'M', CAST(N'2009-01-24' AS Date), N'3368566850', N'jared_germán.martín@martín.jared_germán@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2898, N'González', N'Rafael Ashur', 34500027, N'M', CAST(N'2009-01-08' AS Date), N'3366599297', N'rafael_ashur.gonzález@gonzález.rafael_ashur@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2899, N'Aguilar', N'Ainara Chloe', 34500028, N'F', CAST(N'2009-01-21' AS Date), N'3368873327', N'ainara_chloe.aguilar@aguilar.ainara_chloe@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2900, N'Sáez', N'Eliseo Miguel', 34500029, N'M', CAST(N'2009-01-09' AS Date), N'3367743472', N'eliseo_miguel.sáez@sáez.eliseo_miguel@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2901, N'Sanz', N'Lina Carolina', 34500030, N'F', CAST(N'2009-01-29' AS Date), N'3367196411', N'lina_carolina.sanz@sanz.lina_carolina@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2902, N'Ramírez', N'Isaac Julio', 34500031, N'M', CAST(N'2009-01-05' AS Date), N'3367138685', N'isaac_julio.ramírez@ramírez.isaac_julio@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2903, N'Castillo', N'Abril Isabella', 34500032, N'F', CAST(N'2009-01-09' AS Date), N'3363734900', N'abril_isabella.castillo@castillo.abril_isabella@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2904, N'Gallego', N'Matías Caleb', 34500033, N'M', CAST(N'2009-01-17' AS Date), N'3369769897', N'matías_caleb.gallego@gallego.matías_caleb@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2905, N'Lozano', N'Mar Eva', 34500034, N'F', CAST(N'2009-01-10' AS Date), N'3369048269', N'mar_eva.lozano@lozano.mar_eva@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2906, N'Vázquez', N'Malak Carmen', 34500035, N'F', CAST(N'2009-01-07' AS Date), N'3368344977', N'malak_carmen.vázquez@vázquez.malak_carmen@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2907, N'Medina', N'Alicia Valentina', 34500036, N'F', CAST(N'2009-01-19' AS Date), N'3365950637', N'alicia_valentina.medina@medina.alicia_valentina@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2908, N'Santos', N'Aina Emma', 34500037, N'F', CAST(N'2009-01-28' AS Date), N'3368447599', N'aina_emma.santos@santos.aina_emma@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2909, N'Muñoz', N'Cristina Rocío', 34500038, N'F', CAST(N'2009-01-13' AS Date), N'3366907613', N'cristina_rocío.muñoz@muñoz.cristina_rocío@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2910, N'Serrano', N'Abimael Lucas', 34500039, N'M', CAST(N'2009-01-10' AS Date), N'3364520485', N'abimael_lucas.serrano@serrano.abimael_lucas@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2911, N'Ortega', N'Andrea Nour', 34500040, N'F', CAST(N'2009-01-30' AS Date), N'3365758048', N'andrea_nour.ortega@ortega.andrea_nour@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2912, N'Torres', N'Sofía Diana', 34500041, N'F', CAST(N'2009-01-04' AS Date), N'3365605731', N'sofía_diana.torres@torres.sofía_diana@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2913, N'Gil', N'Isabella Irene', 34500042, N'F', CAST(N'2009-01-24' AS Date), N'3364712488', N'isabella_irene.gil@gil.isabella_irene@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2914, N'Morales', N'Guido Leví', 34500043, N'M', CAST(N'2009-01-22' AS Date), N'3365037354', N'guido_leví.morales@morales.guido_leví@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2915, N'Suárez', N'Caleb Abdiel', 34500044, N'M', CAST(N'2009-01-19' AS Date), N'3367219462', N'caleb_abdiel.suárez@suárez.caleb_abdiel@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2916, N'Castillo', N'Abdiel Isaías', 34500045, N'M', CAST(N'2009-01-15' AS Date), N'3369295608', N'abdiel_isaías.castillo@castillo.abdiel_isaías@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2917, N'Vargas', N'Isabella Alma', 34500046, N'F', CAST(N'2009-01-02' AS Date), N'3363053136', N'isabella_alma.vargas@vargas.isabella_alma@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2918, N'Mora', N'Emma Malak', 34500047, N'F', CAST(N'2009-01-10' AS Date), N'3366053522', N'emma_malak.mora@mora.emma_malak@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2919, N'Castillo', N'India Elsa', 34500048, N'F', CAST(N'2009-01-07' AS Date), N'3368145062', N'india_elsa.castillo@castillo.india_elsa@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2920, N'Soto', N'Amira Aitana', 34500049, N'F', CAST(N'2009-01-23' AS Date), N'3363036559', N'amira_aitana.soto@soto.amira_aitana@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2921, N'León', N'Adara Vega', 34500050, N'F', CAST(N'2009-01-23' AS Date), N'3366615165', N'adara_vega.león@león.adara_vega@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2922, N'Santana', N'África María', 34500051, N'F', CAST(N'2009-01-28' AS Date), N'3365425750', N'África_maría.santana@santana.áfrica_maría@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2923, N'Aguilar', N'Lara Mar', 34500052, N'F', CAST(N'2009-01-11' AS Date), N'3366635785', N'lara_mar.aguilar@aguilar.lara_mar@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2924, N'Fuentes', N'Aarón Gadiel', 34500053, N'M', CAST(N'2009-01-20' AS Date), N'3368922545', N'aarón_gadiel.fuentes@fuentes.aarón_gadiel@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2925, N'Duran', N'Isabella Diana', 34500054, N'F', CAST(N'2009-01-23' AS Date), N'3369409384', N'isabella_diana.duran@duran.isabella_diana@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2926, N'González', N'Fabián Marcos', 34500055, N'M', CAST(N'2009-01-23' AS Date), N'3368311528', N'fabián_marcos.gonzález@gonzález.fabián_marcos@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2927, N'Romero', N'Laia Gala', 34500056, N'F', CAST(N'2009-01-14' AS Date), N'3365810944', N'laia_gala.romero@romero.laia_gala@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2928, N'Ortiz', N'Matías', 34500057, N'M', CAST(N'2009-01-16' AS Date), N'3364702704', N'matías.ortiz@ortiz.matías@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2929, N'Montero', N'Adara María', 34500058, N'F', CAST(N'2009-01-03' AS Date), N'3366118499', N'adara_maría.montero@montero.adara_maría@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2930, N'Giménez', N'Jared Marduk', 34500059, N'M', CAST(N'2009-01-28' AS Date), N'3364639591', N'jared_marduk.giménez@giménez.jared_marduk@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2931, N'Ferrer', N'Eneas Felipe', 34500060, N'M', CAST(N'2009-01-04' AS Date), N'3367306582', N'eneas_felipe.ferrer@ferrer.eneas_felipe@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2932, N'Soler', N'Martina Nora', 34500061, N'F', CAST(N'2009-01-20' AS Date), N'3365456356', N'martina_nora.soler@soler.martina_nora@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2933, N'González', N'Beltrán Marduk', 34500062, N'M', CAST(N'2009-01-02' AS Date), N'3369584566', N'beltrán_marduk.gonzález@gonzález.beltrán_marduk@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2934, N'Carmona', N'Jana Fátima', 34500063, N'F', CAST(N'2009-01-03' AS Date), N'3365928051', N'jana_fátima.carmona@carmona.jana_fátima@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2935, N'Diez', N'Gabriela Julieta', 34500064, N'F', CAST(N'2009-01-22' AS Date), N'3365739428', N'gabriela_julieta.diez@diez.gabriela_julieta@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2936, N'Domínguez', N'Marta Adriana', 34500065, N'F', CAST(N'2009-01-28' AS Date), N'3366235514', N'marta_adriana.domínguez@domínguez.marta_adriana@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2937, N'Moya', N'Carmen Vega', 34500066, N'F', CAST(N'2009-01-23' AS Date), N'3368565798', N'carmen_vega.moya@moya.carmen_vega@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2938, N'Guerrero', N'Joanix Elías', 34500067, N'M', CAST(N'2009-01-19' AS Date), N'3364335869', N'joanix_elías.guerrero@guerrero.joanix_elías@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2939, N'Alonso', N'Eneas Hugo', 34500068, N'M', CAST(N'2009-01-25' AS Date), N'3364538646', N'eneas_hugo.alonso@alonso.eneas_hugo@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2940, N'Domínguez', N'Abel Jonás', 34500069, N'M', CAST(N'2009-01-01' AS Date), N'3365926496', N'abel_jonás.domínguez@domínguez.abel_jonás@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2941, N'Gallego', N'Olivia Valentina', 34500070, N'F', CAST(N'2009-01-22' AS Date), N'3363727294', N'olivia_valentina.gallego@gallego.olivia_valentina@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2942, N'Lorenzo', N'Sofía', 34500071, N'F', CAST(N'2009-01-13' AS Date), N'3366863088', N'sofía.lorenzo@lorenzo.sofía@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2943, N'Alonso', N'Nahia Lara', 34500072, N'F', CAST(N'2009-01-28' AS Date), N'3364514781', N'nahia_lara.alonso@alonso.nahia_lara@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2944, N'Parra', N'Lucas Daniel', 34500073, N'M', CAST(N'2009-01-06' AS Date), N'3368824382', N'lucas_daniel.parra@parra.lucas_daniel@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2945, N'Velasco', N'Julia Cristina', 34500074, N'F', CAST(N'2009-01-21' AS Date), N'3367724911', N'julia_cristina.velasco@velasco.julia_cristina@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2946, N'León', N'Jeremías Juan', 34500075, N'M', CAST(N'2009-01-19' AS Date), N'3363495927', N'jeremías_juan.león@león.jeremías_juan@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2947, N'Domínguez', N'Julieta Ariadna', 34500076, N'F', CAST(N'2009-01-21' AS Date), N'3368838161', N'julieta_ariadna.domínguez@domínguez.julieta_ariadna@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2948, N'Molina', N'Marduk José', 34500077, N'M', CAST(N'2009-01-02' AS Date), N'3363453668', N'marduk_josé.molina@molina.marduk_josé@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2949, N'Nuñez', N'Samuel Simón', 34500078, N'M', CAST(N'2009-01-27' AS Date), N'3367124886', N'samuel_simón.nuñez@nuñez.samuel_simón@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2950, N'Torres', N'Macarena Aitana', 34500079, N'F', CAST(N'2009-01-28' AS Date), N'3368116255', N'macarena_aitana.torres@torres.macarena_aitana@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2951, N'Gallardo', N'Dámaso Zacarías', 34500080, N'M', CAST(N'2009-01-24' AS Date), N'3367078256', N'dámaso_zacarías.gallardo@gallardo.dámaso_zacarías@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2952, N'Pastor', N'Édgar Gaspar', 34500081, N'M', CAST(N'2009-01-28' AS Date), N'3363824034', N'Édgar_gaspar.pastor@pastor.édgar_gaspar@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2953, N'Ibáñez', N'Esteban Gadiel', 34500082, N'M', CAST(N'2009-01-11' AS Date), N'3366303453', N'esteban_gadiel.ibáñez@ibáñez.esteban_gadiel@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2954, N'Moreno', N'Laura Cayetana', 34500083, N'F', CAST(N'2009-01-14' AS Date), N'3365730791', N'laura_cayetana.moreno@moreno.laura_cayetana@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2955, N'Domínguez', N'Ciro Jehoram', 34500084, N'M', CAST(N'2009-01-17' AS Date), N'3365867528', N'ciro_jehoram.domínguez@domínguez.ciro_jehoram@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2956, N'Cruz', N'Macarena Isabel', 34500085, N'F', CAST(N'2009-01-11' AS Date), N'3366549116', N'macarena_isabel.cruz@cruz.macarena_isabel@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2957, N'Flores', N'Leire Vera', 34500086, N'F', CAST(N'2009-01-08' AS Date), N'3365536214', N'leire_vera.flores@flores.leire_vera@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2958, N'Cortés', N'Demócrito Saúl', 34500087, N'M', CAST(N'2009-01-22' AS Date), N'3366655740', N'demócrito_saúl.cortés@cortés.demócrito_saúl@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2959, N'Aguilar', N'Acab Darío', 34500088, N'M', CAST(N'2009-01-09' AS Date), N'3364085671', N'acab_darío.aguilar@aguilar.acab_darío@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2960, N'Pascual', N'Félix Jeremías', 34500089, N'M', CAST(N'2009-01-12' AS Date), N'3368413676', N'félix_jeremías.pascual@pascual.félix_jeremías@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2961, N'Caballero', N'Dámaso Eliseo', 34500090, N'M', CAST(N'2009-01-13' AS Date), N'3366284089', N'dámaso_eliseo.caballero@caballero.dámaso_eliseo@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2962, N'Molina', N'Marina María', 34500091, N'F', CAST(N'2009-01-27' AS Date), N'3366856964', N'marina_maría.molina@molina.marina_maría@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2963, N'Lozano', N'Baltasar Isaías', 34500092, N'M', CAST(N'2009-01-26' AS Date), N'3365021686', N'baltasar_isaías.lozano@lozano.baltasar_isaías@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2964, N'Delgado', N'Ana Manuela', 34500093, N'F', CAST(N'2009-01-02' AS Date), N'3369879691', N'ana_manuela.delgado@delgado.ana_manuela@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2965, N'Alonso', N'Caín David', 34500094, N'M', CAST(N'2009-01-30' AS Date), N'3367919501', N'caín_david.alonso@alonso.caín_david@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2966, N'Herrero', N'Ciro Agustín', 34500095, N'M', CAST(N'2009-01-30' AS Date), N'3368086631', N'ciro_agustín.herrero@herrero.ciro_agustín@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2967, N'Moya', N'Ana Iria', 34500096, N'F', CAST(N'2009-01-02' AS Date), N'3366780158', N'ana_iria.moya@moya.ana_iria@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2968, N'Moreno', N'Ezequiel Felipe', 34500097, N'M', CAST(N'2009-01-17' AS Date), N'3367392563', N'ezequiel_felipe.moreno@moreno.ezequiel_felipe@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2969, N'Parra', N'Iria Paula', 34500098, N'F', CAST(N'2009-01-28' AS Date), N'3363392469', N'iria_paula.parra@parra.iria_paula@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2970, N'Sáez', N'Laura Carlota', 34500099, N'F', CAST(N'2009-01-07' AS Date), N'3363046806', N'laura_carlota.sáez@sáez.laura_carlota@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2971, N'Sánchez', N'Jiram Herodes', 35000001, N'M', CAST(N'2010-01-17' AS Date), N'3363640261', N'jiram_herodes.sánchez@sánchez.jiram_herodes@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2972, N'Nieto', N'Macarena Celia', 35000002, N'F', CAST(N'2010-01-03' AS Date), N'3364029094', N'macarena_celia.nieto@nieto.macarena_celia@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2973, N'Velasco', N'Mar Valeria', 35000003, N'F', CAST(N'2010-01-30' AS Date), N'3367514632', N'mar_valeria.velasco@velasco.mar_valeria@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2974, N'Herrera', N'Ezequiel Moisés', 35000004, N'M', CAST(N'2010-01-29' AS Date), N'3363969147', N'ezequiel_moisés.herrera@herrera.ezequiel_moisés@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2975, N'Nuñez', N'Paula Julia', 35000005, N'F', CAST(N'2010-01-28' AS Date), N'3366202995', N'paula_julia.nuñez@nuñez.paula_julia@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2976, N'Ramírez', N'Helena Mara', 35000006, N'F', CAST(N'2010-01-01' AS Date), N'3365829905', N'helena_mara.ramírez@ramírez.helena_mara@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2977, N'Nieto', N'Alejandro Acab', 35000007, N'M', CAST(N'2010-01-11' AS Date), N'3363227416', N'alejandro_acab.nieto@nieto.alejandro_acab@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2978, N'Pérez', N'Mar Alma', 35000008, N'F', CAST(N'2010-01-09' AS Date), N'3368580022', N'mar_alma.pérez@pérez.mar_alma@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2979, N'Muñoz', N'Sergio Matías', 35000009, N'M', CAST(N'2010-01-16' AS Date), N'3369289932', N'sergio_matías.muñoz@muñoz.sergio_matías@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2980, N'Molina', N'Renato David', 35000010, N'M', CAST(N'2010-01-16' AS Date), N'3366453232', N'renato_david.molina@molina.renato_david@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2981, N'Álvarez', N'Laia Arlet', 35000011, N'F', CAST(N'2010-01-24' AS Date), N'3367382907', N'laia_arlet.Álvarez@álvarez.laia_arlet@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2982, N'Blanco', N'Jairo Uzías', 35000012, N'M', CAST(N'2010-01-17' AS Date), N'3367005161', N'jairo_uzías.blanco@blanco.jairo_uzías@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2983, N'Ramírez', N'Triana Mia', 35000013, N'F', CAST(N'2010-01-17' AS Date), N'3363357281', N'triana_mia.ramírez@ramírez.triana_mia@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2984, N'Medina', N'Yasmín Elia', 35000014, N'F', CAST(N'2010-01-12' AS Date), N'3369603837', N'yasmín_elia.medina@medina.yasmín_elia@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2985, N'Iglesias', N'Uzías Isaac', 35000015, N'M', CAST(N'2010-01-19' AS Date), N'3368777465', N'uzías_isaac.iglesias@iglesias.uzías_isaac@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2986, N'Vázquez', N'Andrea Isabel', 35000016, N'F', CAST(N'2010-01-14' AS Date), N'3365969059', N'andrea_isabel.vázquez@vázquez.andrea_isabel@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2987, N'Díaz', N'Daniel Josué', 35000017, N'M', CAST(N'2010-01-03' AS Date), N'3364370623', N'daniel_josué.díaz@díaz.daniel_josué@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2988, N'Rodríguez', N'Yasmín Carla', 35000018, N'F', CAST(N'2010-01-09' AS Date), N'3367233893', N'yasmín_carla.rodríguez@rodríguez.yasmín_carla@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2989, N'Díaz', N'Amira Blanca', 35000019, N'F', CAST(N'2010-01-15' AS Date), N'3367111994', N'amira_blanca.díaz@díaz.amira_blanca@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2990, N'Pérez', N'Gabriela Aurora', 35000020, N'F', CAST(N'2010-01-20' AS Date), N'3363901241', N'gabriela_aurora.pérez@pérez.gabriela_aurora@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2991, N'Cruz', N'Jared Jairo', 35000021, N'M', CAST(N'2010-01-13' AS Date), N'3366092095', N'jared_jairo.cruz@cruz.jared_jairo@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2992, N'Muñoz', N'Ahzià Darío', 35000022, N'M', CAST(N'2010-01-01' AS Date), N'3363382761', N'ahzià_darío.muñoz@muñoz.ahzià_darío@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2993, N'Gallardo', N'Juan Isaías', 35000023, N'M', CAST(N'2010-01-12' AS Date), N'3369069770', N'juan_isaías.gallardo@gallardo.juan_isaías@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2994, N'Rivera', N'Aitana Gabriela', 35000024, N'F', CAST(N'2010-01-21' AS Date), N'3364673703', N'aitana_gabriela.rivera@rivera.aitana_gabriela@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2995, N'Cano', N'Joanix Esteban', 35000025, N'M', CAST(N'2010-01-30' AS Date), N'3368234321', N'joanix_esteban.cano@cano.joanix_esteban@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2996, N'Santana', N'Adriana Nuria', 35000026, N'F', CAST(N'2010-01-20' AS Date), N'3366718496', N'adriana_nuria.santana@santana.adriana_nuria@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2997, N'Nieto', N'Sofía Inés', 35000027, N'F', CAST(N'2010-01-04' AS Date), N'3367998205', N'sofía_inés.nieto@nieto.sofía_inés@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2998, N'Martínez', N'Ezequiel José', 35000028, N'M', CAST(N'2010-01-17' AS Date), N'3369142885', N'ezequiel_josé.martínez@martínez.ezequiel_josé@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (2999, N'Ramos', N'Blanca Cayetana', 35000029, N'F', CAST(N'2010-01-17' AS Date), N'3366362876', N'blanca_cayetana.ramos@ramos.blanca_cayetana@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3000, N'Castro', N'Emma Noa', 35000030, N'F', CAST(N'2010-01-06' AS Date), N'3365166560', N'emma_noa.castro@castro.emma_noa@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3001, N'Ortega', N'Claudia Vera', 35000031, N'F', CAST(N'2010-01-25' AS Date), N'3363401400', N'claudia_vera.ortega@ortega.claudia_vera@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3002, N'Santana', N'Efraín Jiram', 35000032, N'M', CAST(N'2010-01-16' AS Date), N'3367997304', N'efraín_jiram.santana@santana.efraín_jiram@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3003, N'Ibáñez', N'Agustín Tobías', 35000033, N'M', CAST(N'2010-01-06' AS Date), N'3363137816', N'agustín_tobías.ibáñez@ibáñez.agustín_tobías@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3004, N'Campos', N'Elías Homero', 35000034, N'M', CAST(N'2010-01-21' AS Date), N'3365151611', N'elías_homero.campos@campos.elías_homero@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3005, N'Rubio', N'Gaspar Sergio', 35000035, N'M', CAST(N'2010-01-10' AS Date), N'3369225851', N'gaspar_sergio.rubio@rubio.gaspar_sergio@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3006, N'Méndez', N'Natalia Triana', 35000036, N'F', CAST(N'2010-01-21' AS Date), N'3369536959', N'natalia_triana.méndez@méndez.natalia_triana@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3007, N'Santiago', N'Alba Naia', 35000037, N'F', CAST(N'2010-01-20' AS Date), N'3365059332', N'alba_naia.santiago@santiago.alba_naia@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3008, N'Prieto', N'Baltasar Mateo', 35000038, N'M', CAST(N'2010-01-17' AS Date), N'3368638422', N'baltasar_mateo.prieto@prieto.baltasar_mateo@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3009, N'Pastor', N'Lemuel Samuel', 35000039, N'M', CAST(N'2010-01-08' AS Date), N'3365898924', N'lemuel_samuel.pastor@pastor.lemuel_samuel@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3010, N'Morales', N'Blanca Irene', 35000040, N'F', CAST(N'2010-01-18' AS Date), N'3367125716', N'blanca_irene.morales@morales.blanca_irene@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3011, N'Rojas', N'Candela Eva', 35000041, N'F', CAST(N'2010-01-19' AS Date), N'3365840469', N'candela_eva.rojas@rojas.candela_eva@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3012, N'Fuentes', N'Aram Francisco', 35000042, N'M', CAST(N'2010-01-23' AS Date), N'3365685943', N'aram_francisco.fuentes@fuentes.aram_francisco@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3013, N'Rubio', N'Arlet Aitana', 35000043, N'F', CAST(N'2010-01-03' AS Date), N'3369958779', N'arlet_aitana.rubio@rubio.arlet_aitana@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3014, N'Santiago', N'Salomón Moisés', 35000044, N'M', CAST(N'2010-01-03' AS Date), N'3366276288', N'salomón_moisés.santiago@santiago.salomón_moisés@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3015, N'Vicente', N'Abel Félix', 35000045, N'M', CAST(N'2010-01-12' AS Date), N'3366380461', N'abel_félix.vicente@vicente.abel_félix@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3016, N'Lozano', N'Ainara Nour', 35000046, N'F', CAST(N'2010-01-06' AS Date), N'3364384165', N'ainara_nour.lozano@lozano.ainara_nour@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3017, N'Parra', N'Marina Yasmín', 35000047, N'F', CAST(N'2010-01-21' AS Date), N'3367963025', N'marina_yasmín.parra@parra.marina_yasmín@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3018, N'Cortés', N'Abel Elí', 35000048, N'M', CAST(N'2010-01-09' AS Date), N'3368215307', N'abel_elí.cortés@cortés.abel_elí@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3019, N'Peña', N'Daniela Isabel', 35000049, N'F', CAST(N'2010-01-17' AS Date), N'3368676608', N'daniela_isabel.peña@peña.daniela_isabel@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3020, N'Bravo', N'Lucía María', 35000050, N'F', CAST(N'2010-01-30' AS Date), N'3365509790', N'lucía_maría.bravo@bravo.lucía_maría@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3021, N'Lozano', N'Dámaso Caín', 35000051, N'M', CAST(N'2010-01-06' AS Date), N'3366074507', N'dámaso_caín.lozano@lozano.dámaso_caín@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3022, N'Aguilar', N'Jaír de Galaad Elí', 35000052, N'M', CAST(N'2010-01-12' AS Date), N'3364223285', N'jaír_de_galaad_elí.aguilar@aguilar.jaír_de_galaad_elí@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3023, N'Ramos', N'Ahzià Baltasar', 35000053, N'M', CAST(N'2010-01-28' AS Date), N'3364402263', N'ahzià_baltasar.ramos@ramos.ahzià_baltasar@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3024, N'Delgado', N'Marduk Jeremías', 35000054, N'M', CAST(N'2010-01-05' AS Date), N'3368564206', N'marduk_jeremías.delgado@delgado.marduk_jeremías@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3025, N'Gil', N'Carla Jana', 35000055, N'F', CAST(N'2010-01-13' AS Date), N'3363723330', N'carla_jana.gil@gil.carla_jana@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3026, N'Vázquez', N'Zoe Marta', 35000056, N'F', CAST(N'2010-01-16' AS Date), N'3367166285', N'zoe_marta.vázquez@vázquez.zoe_marta@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3027, N'Cortés', N'Fabián Miguel', 35000057, N'M', CAST(N'2010-01-21' AS Date), N'3367681512', N'fabián_miguel.cortés@cortés.fabián_miguel@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3028, N'León', N'Natalia ', 35000058, N'F', CAST(N'2010-01-25' AS Date), N'3363116071', N'natalia_.león@león.natalia_@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3029, N'Campos', N'Macarena Yasmín', 35000059, N'F', CAST(N'2010-01-27' AS Date), N'3369142699', N'macarena_yasmín.campos@campos.macarena_yasmín@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3030, N'Vidal', N'Triana Claudia', 35000060, N'F', CAST(N'2010-01-15' AS Date), N'3365329498', N'triana_claudia.vidal@vidal.triana_claudia@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3031, N'Gil', N'Nour Rocío', 35000061, N'F', CAST(N'2010-01-10' AS Date), N'3369713649', N'nour_rocío.gil@gil.nour_rocío@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3032, N'Navarro', N'Aurora Blanca', 35000062, N'F', CAST(N'2010-01-24' AS Date), N'3367985085', N'aurora_blanca.navarro@navarro.aurora_blanca@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3033, N'Pérez', N'Celia María', 35000063, N'F', CAST(N'2010-01-21' AS Date), N'3366515259', N'celia_maría.pérez@pérez.celia_maría@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3034, N'García', N'Marina Cayetana', 35000064, N'F', CAST(N'2010-01-14' AS Date), N'3368074383', N'marina_cayetana.garcía@garcía.marina_cayetana@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3035, N'Pérez', N'Elia Paula', 35000065, N'F', CAST(N'2010-01-28' AS Date), N'3366067381', N'elia_paula.pérez@pérez.elia_paula@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3036, N'Benitez', N'Efraín Lemuel', 35000066, N'M', CAST(N'2010-01-21' AS Date), N'3366991787', N'efraín_lemuel.benitez@benitez.efraín_lemuel@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3037, N'Romero', N'Marina Berta', 35000067, N'F', CAST(N'2010-01-21' AS Date), N'3368349822', N'marina_berta.romero@romero.marina_berta@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3038, N'Fernández', N'Renato Dámaso', 35000068, N'M', CAST(N'2010-01-11' AS Date), N'3365739213', N'renato_dámaso.fernández@fernández.renato_dámaso@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3039, N'Herrero', N'Aroa Amaia', 35000069, N'F', CAST(N'2010-01-19' AS Date), N'3367920482', N'aroa_amaia.herrero@herrero.aroa_amaia@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3040, N'Cruz', N'Andrés Noé', 35000070, N'M', CAST(N'2010-01-29' AS Date), N'3365289844', N'andrés_noé.cruz@cruz.andrés_noé@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3041, N'Moreno', N'Eliseo Moisés', 35000071, N'M', CAST(N'2010-01-17' AS Date), N'3367035915', N'eliseo_moisés.moreno@moreno.eliseo_moisés@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3042, N'Lozano', N'Irene Lara', 35000072, N'F', CAST(N'2010-01-29' AS Date), N'3369375045', N'irene_lara.lozano@lozano.irene_lara@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3043, N'Morales', N'Abel Julio', 35000073, N'M', CAST(N'2010-01-07' AS Date), N'3369889355', N'abel_julio.morales@morales.abel_julio@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3044, N'Romero', N'Elena Alejandra', 35000074, N'F', CAST(N'2010-01-12' AS Date), N'3364278901', N'elena_alejandra.romero@romero.elena_alejandra@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3045, N'López', N'Laura Marina', 35000075, N'F', CAST(N'2010-01-02' AS Date), N'3364347791', N'laura_marina.lópez@lópez.laura_marina@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3046, N'Blanco', N'Irene Iria', 35000076, N'F', CAST(N'2010-01-05' AS Date), N'3369859704', N'irene_iria.blanco@blanco.irene_iria@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3047, N'Delgado', N'Manuela Inés', 35000077, N'F', CAST(N'2010-01-26' AS Date), N'3364561090', N'manuela_inés.delgado@delgado.manuela_inés@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3048, N'Medina', N'Berta Fátima', 35000078, N'F', CAST(N'2010-01-01' AS Date), N'3367673686', N'berta_fátima.medina@medina.berta_fátima@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3049, N'Herrera', N'Aina Lucía', 35000079, N'F', CAST(N'2010-01-24' AS Date), N'3367753535', N'aina_lucía.herrera@herrera.aina_lucía@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3050, N'Ortega', N'Vega Adara', 35000080, N'F', CAST(N'2010-01-16' AS Date), N'3363166912', N'vega_adara.ortega@ortega.vega_adara@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3051, N'Cortés', N'Herodes Jiram', 35000081, N'M', CAST(N'2010-01-09' AS Date), N'3368844874', N'herodes_jiram.cortés@cortés.herodes_jiram@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3052, N'Giménez', N'Matías David', 35000082, N'M', CAST(N'2010-01-23' AS Date), N'3367036511', N'matías_david.giménez@giménez.matías_david@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3053, N'Santos', N'Vera Natalia', 35000083, N'F', CAST(N'2010-01-29' AS Date), N'3367780278', N'vera_natalia.santos@santos.vera_natalia@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3054, N'Vicente', N'Mar Carla', 35000084, N'F', CAST(N'2010-01-29' AS Date), N'3368611535', N'mar_carla.vicente@vicente.mar_carla@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3055, N'Crespo', N'Daniel Isaías', 35000085, N'M', CAST(N'2010-01-12' AS Date), N'3363858397', N'daniel_isaías.crespo@crespo.daniel_isaías@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3056, N'Castillo', N'Sofía Laia', 35000086, N'F', CAST(N'2010-01-12' AS Date), N'3368426526', N'sofía_laia.castillo@castillo.sofía_laia@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3057, N'Méndez', N'Triana Ana', 35000087, N'F', CAST(N'2010-01-09' AS Date), N'3364033742', N'triana_ana.méndez@méndez.triana_ana@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3058, N'Ortiz', N'Ashur Labán', 35000088, N'M', CAST(N'2010-01-22' AS Date), N'3363193836', N'ashur_labán.ortiz@ortiz.ashur_labán@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3059, N'Ibáñez', N'Diana India', 35000089, N'F', CAST(N'2010-01-02' AS Date), N'3363548821', N'diana_india.ibáñez@ibáñez.diana_india@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3060, N'Pascual', N'Carolina Ona', 35000090, N'F', CAST(N'2010-01-22' AS Date), N'3365476523', N'carolina_ona.pascual@pascual.carolina_ona@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3061, N'Fuentes', N'Marcos Set', 35000091, N'M', CAST(N'2010-01-08' AS Date), N'3364321522', N'marcos_set.fuentes@fuentes.marcos_set@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3062, N'Santana', N'Daniela Cayetana', 35000092, N'F', CAST(N'2010-01-11' AS Date), N'3367124136', N'daniela_cayetana.santana@santana.daniela_cayetana@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3063, N'Vega', N'Marta Irene', 35000093, N'F', CAST(N'2010-01-16' AS Date), N'3368441771', N'marta_irene.vega@vega.marta_irene@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3064, N'Soto', N'Cloe Sara', 35000094, N'F', CAST(N'2010-01-29' AS Date), N'3365884016', N'cloe_sara.soto@soto.cloe_sara@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3065, N'Nuñez', N'Leví Pablo', 35000095, N'M', CAST(N'2010-01-27' AS Date), N'3363644009', N'leví_pablo.nuñez@nuñez.leví_pablo@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3066, N'Parra', N'Joaquín Lucas', 35000096, N'M', CAST(N'2010-01-13' AS Date), N'3364606756', N'joaquín_lucas.parra@parra.joaquín_lucas@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3067, N'Pérez', N'Adriana Laia', 35000097, N'F', CAST(N'2010-01-25' AS Date), N'3367005610', N'adriana_laia.pérez@pérez.adriana_laia@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3068, N'Jimenez', N'Neftalí Elí', 35000098, N'M', CAST(N'2010-01-19' AS Date), N'3364116948', N'neftalí_elí.jimenez@jimenez.neftalí_elí@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3069, N'Herrero', N'Manuela Amaia', 35000099, N'F', CAST(N'2010-01-12' AS Date), N'3364648254', N'manuela_amaia.herrero@herrero.manuela_amaia@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3070, N'Aguilar', N'Abril Alejandra', 35500001, N'F', CAST(N'2011-01-23' AS Date), N'3367675638', N'abril_alejandra.aguilar@aguilar.abril_alejandra@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3071, N'Vargas', N'Azahara Ona', 35500002, N'F', CAST(N'2011-01-13' AS Date), N'3369013525', N'azahara_ona.vargas@vargas.azahara_ona@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3072, N'Rojas', N'Mara Victoria', 35500003, N'F', CAST(N'2011-01-23' AS Date), N'3369739563', N'mara_victoria.rojas@rojas.mara_victoria@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3073, N'Hidalgo', N'Amaia Aina', 35500004, N'F', CAST(N'2011-01-28' AS Date), N'3363054519', N'amaia_aina.hidalgo@hidalgo.amaia_aina@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3074, N'Cabrera', N'Guido Mateo', 35500005, N'M', CAST(N'2011-01-05' AS Date), N'3366836068', N'guido_mateo.cabrera@cabrera.guido_mateo@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3075, N'Cortés', N'Nuria Carlota', 35500006, N'F', CAST(N'2011-01-23' AS Date), N'3368611537', N'nuria_carlota.cortés@cortés.nuria_carlota@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3076, N'Gómez', N'Adara Alma', 35500007, N'F', CAST(N'2011-01-11' AS Date), N'3366435702', N'adara_alma.gómez@gómez.adara_alma@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3077, N'Herrera', N'India Carlota', 35500008, N'F', CAST(N'2011-01-06' AS Date), N'3369007695', N'india_carlota.herrera@herrera.india_carlota@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3078, N'Rubio', N'José Abel', 35500009, N'M', CAST(N'2011-01-30' AS Date), N'3366212654', N'josé_abel.rubio@rubio.josé_abel@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3079, N'Caballero', N'Irene Ona', 35500010, N'F', CAST(N'2011-01-26' AS Date), N'3367411665', N'irene_ona.caballero@caballero.irene_ona@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3080, N'Marin', N'Homero Bartolomé', 35500011, N'M', CAST(N'2011-01-06' AS Date), N'3363832371', N'homero_bartolomé.marin@marin.homero_bartolomé@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3081, N'Rubio', N'Ona Valeria', 35500012, N'F', CAST(N'2011-01-07' AS Date), N'3364776894', N'ona_valeria.rubio@rubio.ona_valeria@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3082, N'Navarro', N'Nuria Berta', 35500013, N'F', CAST(N'2011-01-28' AS Date), N'3367096487', N'nuria_berta.navarro@navarro.nuria_berta@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3083, N'Guerrero', N'Ona Arlet', 35500014, N'F', CAST(N'2011-01-09' AS Date), N'3368300654', N'ona_arlet.guerrero@guerrero.ona_arlet@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3084, N'Arias', N'Nahia Ainhoa', 35500015, N'F', CAST(N'2011-01-25' AS Date), N'3364178362', N'nahia_ainhoa.arias@arias.nahia_ainhoa@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3085, N'Cruz', N'Isaías Jeremías', 35500016, N'M', CAST(N'2011-01-15' AS Date), N'3363250532', N'isaías_jeremías.cruz@cruz.isaías_jeremías@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3086, N'Garrido', N'Martina Aroa', 35500017, N'F', CAST(N'2011-01-02' AS Date), N'3364597073', N'martina_aroa.garrido@garrido.martina_aroa@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3087, N'Roman', N'Renato Rubén', 35500018, N'M', CAST(N'2011-01-14' AS Date), N'3363720942', N'renato_rubén.roman@roman.renato_rubén@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3088, N'González', N'Caín Marcos', 35500019, N'M', CAST(N'2011-01-28' AS Date), N'3363436476', N'caín_marcos.gonzález@gonzález.caín_marcos@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3089, N'Herrera', N'Sergio Isaías', 35500020, N'M', CAST(N'2011-01-11' AS Date), N'3367639079', N'sergio_isaías.herrera@herrera.sergio_isaías@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3090, N'Santiago', N'Isaías Darío', 35500021, N'M', CAST(N'2011-01-06' AS Date), N'3364342714', N'isaías_darío.santiago@santiago.isaías_darío@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3091, N'Méndez', N'Moisés Marcos', 35500022, N'M', CAST(N'2011-01-22' AS Date), N'3365302507', N'moisés_marcos.méndez@méndez.moisés_marcos@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3092, N'Carrasco', N'Jaír de Galaad Darío', 35500023, N'M', CAST(N'2011-01-01' AS Date), N'3368243146', N'jaír_de_galaad_darío.carrasco@carrasco.jaír_de_galaad_darío@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3093, N'Rivera', N'Guido Miguel', 35500024, N'M', CAST(N'2011-01-06' AS Date), N'3363818730', N'guido_miguel.rivera@rivera.guido_miguel@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3094, N'Navarro', N'Rafael Abimael', 35500025, N'M', CAST(N'2011-01-15' AS Date), N'3368219155', N'rafael_abimael.navarro@navarro.rafael_abimael@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3095, N'Soto', N'Ahzià Joanix', 35500026, N'M', CAST(N'2011-01-28' AS Date), N'3364709123', N'ahzià_joanix.soto@soto.ahzià_joanix@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3096, N'Santiago', N'Eva Yasmín', 35500027, N'F', CAST(N'2011-01-08' AS Date), N'3365802994', N'eva_yasmín.santiago@santiago.eva_yasmín@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3097, N'Garrido', N'Aitana Lola', 35500028, N'F', CAST(N'2011-01-12' AS Date), N'3368315427', N'aitana_lola.garrido@garrido.aitana_lola@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3098, N'Soto', N'Berta Carmen', 35500029, N'F', CAST(N'2011-01-24' AS Date), N'3366375404', N'berta_carmen.soto@soto.berta_carmen@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3099, N'Navarro', N'Saúl Guido', 35500030, N'M', CAST(N'2011-01-16' AS Date), N'3368181806', N'saúl_guido.navarro@navarro.saúl_guido@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3100, N'Moya', N'Macarena Leyre', 35500031, N'F', CAST(N'2011-01-21' AS Date), N'3369505292', N'macarena_leyre.moya@moya.macarena_leyre@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3101, N'Pascual', N'Sofía Clara', 35500032, N'F', CAST(N'2011-01-07' AS Date), N'3368997556', N'sofía_clara.pascual@pascual.sofía_clara@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3102, N'León', N'Nerea', 35500033, N'F', CAST(N'2011-01-04' AS Date), N'3366218904', N'nerea.león@león.nerea@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3103, N'Moreno', N'Helena Malak', 35500034, N'F', CAST(N'2011-01-06' AS Date), N'3367610442', N'helena_malak.moreno@moreno.helena_malak@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3104, N'Montero', N'Aurora Nahia', 35500035, N'F', CAST(N'2011-01-04' AS Date), N'3364477658', N'aurora_nahia.montero@montero.aurora_nahia@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3105, N'Gallego', N'Adara África', 35500036, N'F', CAST(N'2011-01-16' AS Date), N'3369247201', N'adara_África.gallego@gallego.adara_áfrica@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3106, N'López', N'Arlet Noa', 35500037, N'F', CAST(N'2011-01-06' AS Date), N'3368328564', N'arlet_noa.lópez@lópez.arlet_noa@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3107, N'Hernández', N'Lemuel Aram', 35500038, N'M', CAST(N'2011-01-03' AS Date), N'3369929503', N'lemuel_aram.hernández@hernández.lemuel_aram@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3108, N'Hernández', N'Alba Vega', 35500039, N'F', CAST(N'2011-01-25' AS Date), N'3363410939', N'alba_vega.hernández@hernández.alba_vega@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3109, N'Gallardo', N'Jimena Victoria', 35500040, N'F', CAST(N'2011-01-20' AS Date), N'3369282205', N'jimena_victoria.gallardo@gallardo.jimena_victoria@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3110, N'Herrera', N'Bartolomé Francisco', 35500041, N'M', CAST(N'2011-01-27' AS Date), N'3363681197', N'bartolomé_francisco.herrera@herrera.bartolomé_francisco@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3111, N'Rivera', N'Naia Sara', 35500042, N'F', CAST(N'2011-01-06' AS Date), N'3364272835', N'naia_sara.rivera@rivera.naia_sara@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3112, N'Velasco', N'Omar Jiram', 35500043, N'M', CAST(N'2011-01-14' AS Date), N'3366884301', N'omar_jiram.velasco@velasco.omar_jiram@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3113, N'Márquez', N'Julieta Alejandra', 35500044, N'F', CAST(N'2011-01-04' AS Date), N'3368911580', N'julieta_alejandra.márquez@márquez.julieta_alejandra@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3114, N'Méndez', N'Celia Naia', 35500045, N'F', CAST(N'2011-01-20' AS Date), N'3364437795', N'celia_naia.méndez@méndez.celia_naia@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3115, N'Ferrer', N'Salomón Lucas', 35500046, N'M', CAST(N'2011-01-30' AS Date), N'3368646829', N'salomón_lucas.ferrer@ferrer.salomón_lucas@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3116, N'Moya', N'Yasmín Gabriela', 35500047, N'F', CAST(N'2011-01-30' AS Date), N'3366060300', N'yasmín_gabriela.moya@moya.yasmín_gabriela@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3117, N'Ibáñez', N'Caín Zacarías', 35500048, N'M', CAST(N'2011-01-29' AS Date), N'3365142278', N'caín_zacarías.ibáñez@ibáñez.caín_zacarías@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3118, N'Soler', N'Caleb Saúl', 35500049, N'M', CAST(N'2011-01-13' AS Date), N'3367304082', N'caleb_saúl.soler@soler.caleb_saúl@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3119, N'Jimenez', N'Eneas Guido', 35500050, N'M', CAST(N'2011-01-16' AS Date), N'3364084052', N'eneas_guido.jimenez@jimenez.eneas_guido@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3120, N'Cruz', N'India Cayetana', 35500051, N'F', CAST(N'2011-01-03' AS Date), N'3365290204', N'india_cayetana.cruz@cruz.india_cayetana@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3121, N'Herrera', N'Darío Guido', 35500052, N'M', CAST(N'2011-01-28' AS Date), N'3368749067', N'darío_guido.herrera@herrera.darío_guido@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3122, N'Ferrer', N'Daniela Triana', 35500053, N'F', CAST(N'2011-01-04' AS Date), N'3363316054', N'daniela_triana.ferrer@ferrer.daniela_triana@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3123, N'Vicente', N'Leyre Emma', 35500054, N'F', CAST(N'2011-01-20' AS Date), N'3366924219', N'leyre_emma.vicente@vicente.leyre_emma@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3124, N'Carrasco', N'Adriana Marina', 35500055, N'F', CAST(N'2011-01-23' AS Date), N'3367765962', N'adriana_marina.carrasco@carrasco.adriana_marina@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3125, N'Vázquez', N'Francisco Acab', 35500056, N'M', CAST(N'2011-01-10' AS Date), N'3366921676', N'francisco_acab.vázquez@vázquez.francisco_acab@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3126, N'Blanco', N'Yasmín Luna', 35500057, N'F', CAST(N'2011-01-25' AS Date), N'3363987792', N'yasmín_luna.blanco@blanco.yasmín_luna@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3127, N'Santiago', N'Aurora Berta', 35500058, N'F', CAST(N'2011-01-19' AS Date), N'3367732835', N'aurora_berta.santiago@santiago.aurora_berta@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3128, N'Mora', N'Cayetana Andrea', 35500059, N'F', CAST(N'2011-01-10' AS Date), N'3365512421', N'cayetana_andrea.mora@mora.cayetana_andrea@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3129, N'Ortiz', N'Baltasar Sergio', 35500060, N'M', CAST(N'2011-01-13' AS Date), N'3369037415', N'baltasar_sergio.ortiz@ortiz.baltasar_sergio@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3130, N'Prieto', N'Uzías Mateo', 35500061, N'M', CAST(N'2011-01-01' AS Date), N'3367187917', N'uzías_mateo.prieto@prieto.uzías_mateo@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3131, N'Rubio', N'Zoe Inés', 35500062, N'F', CAST(N'2011-01-16' AS Date), N'3365925997', N'zoe_inés.rubio@rubio.zoe_inés@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3132, N'Guerrero', N'Acab Bartolomé', 35500063, N'M', CAST(N'2011-01-25' AS Date), N'3363690555', N'acab_bartolomé.guerrero@guerrero.acab_bartolomé@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3133, N'Calvo', N'Lucas Adán', 35500064, N'M', CAST(N'2011-01-14' AS Date), N'3367950856', N'lucas_adán.calvo@calvo.lucas_adán@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3134, N'Montero', N'Carlota Nahia', 35500065, N'F', CAST(N'2011-01-12' AS Date), N'3367525719', N'carlota_nahia.montero@montero.carlota_nahia@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3135, N'Morales', N'Samuel Abraham', 35500066, N'M', CAST(N'2011-01-12' AS Date), N'3365117049', N'samuel_abraham.morales@morales.samuel_abraham@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3136, N'Sanz', N'Triana Adriana', 35500067, N'F', CAST(N'2011-01-07' AS Date), N'3366711134', N'triana_adriana.sanz@sanz.triana_adriana@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3137, N'Flores', N'Demócrito Uzías', 35500068, N'M', CAST(N'2011-01-15' AS Date), N'3367519537', N'demócrito_uzías.flores@flores.demócrito_uzías@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3138, N'Arias', N'Carla Vera', 35500069, N'F', CAST(N'2011-01-21' AS Date), N'3367824885', N'carla_vera.arias@arias.carla_vera@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3139, N'Cano', N'Gabriela Arlet', 35500070, N'F', CAST(N'2011-01-07' AS Date), N'3363029238', N'gabriela_arlet.cano@cano.gabriela_arlet@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3140, N'Ibáñez', N'Moisés Marduk', 35500071, N'M', CAST(N'2011-01-30' AS Date), N'3366073407', N'moisés_marduk.ibáñez@ibáñez.moisés_marduk@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3141, N'Rodríguez', N'Fabián Gaspar', 35500072, N'M', CAST(N'2011-01-02' AS Date), N'3364169308', N'fabián_gaspar.rodríguez@rodríguez.fabián_gaspar@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3142, N'Carrasco', N'Isaías Elías', 35500073, N'M', CAST(N'2011-01-17' AS Date), N'3369953200', N'isaías_elías.carrasco@carrasco.isaías_elías@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3143, N'Moya', N'India Manuela', 35500074, N'F', CAST(N'2011-01-06' AS Date), N'3367089227', N'india_manuela.moya@moya.india_manuela@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3144, N'Vargas', N'Noa', 35500075, N'F', CAST(N'2011-01-16' AS Date), N'3367085532', N'noa.vargas@vargas.noa@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3145, N'Pastor', N'Gabriel Elí', 35500076, N'M', CAST(N'2011-01-27' AS Date), N'3366039908', N'gabriel_elí.pastor@pastor.gabriel_elí@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3146, N'Cabrera', N'Gala Mara', 35500077, N'F', CAST(N'2011-01-20' AS Date), N'3368310512', N'gala_mara.cabrera@cabrera.gala_mara@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3147, N'Pastor', N'Carmen Ángela', 35500078, N'F', CAST(N'2011-01-02' AS Date), N'3369465667', N'carmen_Ángela.pastor@pastor.carmen_ángela@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3148, N'Castro', N'Alejandra Manuela', 35500079, N'F', CAST(N'2011-01-23' AS Date), N'3365271480', N'alejandra_manuela.castro@castro.alejandra_manuela@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3149, N'Márquez', N'Elí Josué', 35500080, N'M', CAST(N'2011-01-18' AS Date), N'3364401947', N'elí_josué.márquez@márquez.elí_josué@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3150, N'Nieto', N'Édgar Jeremías', 35500081, N'M', CAST(N'2011-01-28' AS Date), N'3364968849', N'Édgar_jeremías.nieto@nieto.édgar_jeremías@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3151, N'Nieto', N'David Fabián', 35500082, N'M', CAST(N'2011-01-27' AS Date), N'3365816187', N'david_fabián.nieto@nieto.david_fabián@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3152, N'Ramírez', N'Celia Nahia', 35500083, N'F', CAST(N'2011-01-26' AS Date), N'3364506220', N'celia_nahia.ramírez@ramírez.celia_nahia@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3153, N'Rodríguez', N'Abdiel Juan', 35500084, N'M', CAST(N'2011-01-30' AS Date), N'3364551953', N'abdiel_juan.rodríguez@rodríguez.abdiel_juan@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3154, N'Ortega', N'Noé Efraín', 35500085, N'M', CAST(N'2011-01-21' AS Date), N'3367434579', N'noé_efraín.ortega@ortega.noé_efraín@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3155, N'Rojas', N'Inés Iris', 35500086, N'F', CAST(N'2011-01-20' AS Date), N'3369196789', N'inés_iris.rojas@rojas.inés_iris@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3156, N'Roman', N'Bartolomé Andrés', 35500087, N'M', CAST(N'2011-01-06' AS Date), N'3368879789', N'bartolomé_andrés.roman@roman.bartolomé_andrés@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3157, N'Cruz', N'Ainhoa Ariadna', 35500088, N'F', CAST(N'2011-01-16' AS Date), N'3363098192', N'ainhoa_ariadna.cruz@cruz.ainhoa_ariadna@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3158, N'Crespo', N'Acab Jaír de Galaad', 35500089, N'M', CAST(N'2011-01-12' AS Date), N'3369812458', N'acab_jaír_de_galaad.crespo@crespo.acab_jaír_de_galaad@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3159, N'Ferrer', N'Cayetana Malak', 35500090, N'F', CAST(N'2011-01-29' AS Date), N'3366516476', N'cayetana_malak.ferrer@ferrer.cayetana_malak@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3160, N'Alonso', N'Lola Rocío', 35500091, N'F', CAST(N'2011-01-19' AS Date), N'3366249931', N'lola_rocío.alonso@alonso.lola_rocío@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3161, N'Ramírez', N'Caín Rafael', 35500092, N'M', CAST(N'2011-01-04' AS Date), N'3364653951', N'caín_rafael.ramírez@ramírez.caín_rafael@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3162, N'Rivera', N'Leyre Lucía', 35500093, N'F', CAST(N'2011-01-28' AS Date), N'3369539376', N'leyre_lucía.rivera@rivera.leyre_lucía@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3163, N'Ramírez', N'Lola Cristina', 35500094, N'F', CAST(N'2011-01-26' AS Date), N'3366771574', N'lola_cristina.ramírez@ramírez.lola_cristina@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3164, N'Navarro', N'Jeremías Benjamín', 35500095, N'M', CAST(N'2011-01-16' AS Date), N'3368508600', N'jeremías_benjamín.navarro@navarro.jeremías_benjamín@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3165, N'Martínez', N'Marta Gabriela', 35500096, N'F', CAST(N'2011-01-11' AS Date), N'3366900230', N'marta_gabriela.martínez@martínez.marta_gabriela@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3166, N'Martínez', N'Eva Amira', 35500097, N'F', CAST(N'2011-01-30' AS Date), N'3366861866', N'eva_amira.martínez@martínez.eva_amira@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3167, N'Santos', N'Celia Valeria', 35500098, N'F', CAST(N'2011-01-24' AS Date), N'3364299829', N'celia_valeria.santos@santos.celia_valeria@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3168, N'Cabrera', N'Lucas Saúl', 35500099, N'M', CAST(N'2011-01-02' AS Date), N'3363268311', N'lucas_saúl.cabrera@cabrera.lucas_saúl@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3169, N'Pascual', N'Olivia Lina', 36000001, N'F', CAST(N'2012-01-25' AS Date), N'3367164130', N'olivia_lina.pascual@pascual.olivia_lina@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3170, N'Vázquez', N'Aroa Eva', 36000002, N'F', CAST(N'2012-01-08' AS Date), N'3364592140', N'aroa_eva.vázquez@vázquez.aroa_eva@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3171, N'Guerrero', N'Set Mateo', 36000003, N'M', CAST(N'2012-01-20' AS Date), N'3368399437', N'set_mateo.guerrero@guerrero.set_mateo@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3172, N'Suárez', N'Vera María', 36000004, N'F', CAST(N'2012-01-13' AS Date), N'3364329961', N'vera_maría.suárez@suárez.vera_maría@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3173, N'Domínguez', N'Daniel Pablo', 36000005, N'M', CAST(N'2012-01-12' AS Date), N'3364966000', N'daniel_pablo.domínguez@domínguez.daniel_pablo@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3174, N'Guerrero', N'Isaías Lucas', 36000006, N'M', CAST(N'2012-01-07' AS Date), N'3366743635', N'isaías_lucas.guerrero@guerrero.isaías_lucas@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3175, N'Vargas', N'Miguel Jehoram', 36000007, N'M', CAST(N'2012-01-30' AS Date), N'3365011096', N'miguel_jehoram.vargas@vargas.miguel_jehoram@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3176, N'Serrano', N'Carolina Cristina', 36000008, N'F', CAST(N'2012-01-17' AS Date), N'3365651621', N'carolina_cristina.serrano@serrano.carolina_cristina@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3177, N'Sanz', N'Abdiel Naín', 36000009, N'M', CAST(N'2012-01-06' AS Date), N'3365694554', N'abdiel_naín.sanz@sanz.abdiel_naín@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3178, N'Rubio', N'María Sofía', 36000010, N'F', CAST(N'2012-01-12' AS Date), N'3368321956', N'maría_sofía.rubio@rubio.maría_sofía@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3179, N'Domínguez', N'Azahara Aurora', 36000011, N'F', CAST(N'2012-01-20' AS Date), N'3367693608', N'azahara_aurora.domínguez@domínguez.azahara_aurora@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3180, N'Pastor', N'Malak Daniela', 36000012, N'F', CAST(N'2012-01-01' AS Date), N'3365485433', N'malak_daniela.pastor@pastor.malak_daniela@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3181, N'Ramos', N'Esteban Jehoram', 36000013, N'M', CAST(N'2012-01-22' AS Date), N'3366537286', N'esteban_jehoram.ramos@ramos.esteban_jehoram@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3182, N'Rojas', N'Elías Julio', 36000014, N'M', CAST(N'2012-01-15' AS Date), N'3368217823', N'elías_julio.rojas@rojas.elías_julio@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3183, N'Crespo', N'Ezequiel Édgar', 36000015, N'M', CAST(N'2012-01-22' AS Date), N'3369506020', N'ezequiel_Édgar.crespo@crespo.ezequiel_édgar@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3184, N'Márquez', N'Jonás', 36000016, N'M', CAST(N'2012-01-19' AS Date), N'3367310284', N'jonás.márquez@márquez.jonás@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3185, N'Martín', N'Eliel Hugo', 36000017, N'M', CAST(N'2012-01-03' AS Date), N'3364482940', N'eliel_hugo.martín@martín.eliel_hugo@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3186, N'Parra', N'Candela Laia', 36000018, N'F', CAST(N'2012-01-09' AS Date), N'3366810626', N'candela_laia.parra@parra.candela_laia@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3187, N'Delgado', N'Tobías Josué', 36000019, N'M', CAST(N'2012-01-28' AS Date), N'3368929518', N'tobías_josué.delgado@delgado.tobías_josué@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3188, N'Gallego', N'Set Darío', 36000020, N'M', CAST(N'2012-01-16' AS Date), N'3366834172', N'set_darío.gallego@gallego.set_darío@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3189, N'Álvarez', N'Benjamín Noé', 36000021, N'M', CAST(N'2012-01-26' AS Date), N'3366539761', N'benjamín_noé.Álvarez@álvarez.benjamín_noé@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3190, N'Blanco', N'Nahia Triana', 36000022, N'F', CAST(N'2012-01-22' AS Date), N'3368718557', N'nahia_triana.blanco@blanco.nahia_triana@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3191, N'Herrera', N'Gaspar Caleb', 36000023, N'M', CAST(N'2012-01-22' AS Date), N'3368242373', N'gaspar_caleb.herrera@herrera.gaspar_caleb@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3192, N'Gutiérrez', N'Moisés Ezequiel', 36000024, N'M', CAST(N'2012-01-28' AS Date), N'3364591188', N'moisés_ezequiel.gutiérrez@gutiérrez.moisés_ezequiel@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3193, N'Ramírez', N'Victoria Ona', 36000025, N'F', CAST(N'2012-01-25' AS Date), N'3364542006', N'victoria_ona.ramírez@ramírez.victoria_ona@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3194, N'Diez', N'Daniela Lola', 36000026, N'F', CAST(N'2012-01-07' AS Date), N'3367301272', N'daniela_lola.diez@diez.daniela_lola@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3195, N'Caballero', N'Ainara Carla', 36000027, N'F', CAST(N'2012-01-23' AS Date), N'3363336149', N'ainara_carla.caballero@caballero.ainara_carla@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3196, N'López', N'Leví Beltrán', 36000028, N'M', CAST(N'2012-01-17' AS Date), N'3366736739', N'leví_beltrán.lópez@lópez.leví_beltrán@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3197, N'Gallardo', N'Lemuel Omar', 36000029, N'M', CAST(N'2012-01-01' AS Date), N'3365294738', N'lemuel_omar.gallardo@gallardo.lemuel_omar@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3198, N'Rivera', N'Alba Nour', 36000030, N'F', CAST(N'2012-01-13' AS Date), N'3366200895', N'alba_nour.rivera@rivera.alba_nour@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3199, N'Lorenzo', N'Natalia Fátima', 36000031, N'F', CAST(N'2012-01-21' AS Date), N'3363537680', N'natalia_fátima.lorenzo@lorenzo.natalia_fátima@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3200, N'Reyes', N'Elia África', 36000032, N'F', CAST(N'2012-01-30' AS Date), N'3363025819', N'elia_África.reyes@reyes.elia_áfrica@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3201, N'López', N'Celia Natalia', 36000033, N'F', CAST(N'2012-01-28' AS Date), N'3364791012', N'celia_natalia.lópez@lópez.celia_natalia@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3202, N'Calvo', N'Vega Arlet', 36000034, N'F', CAST(N'2012-01-22' AS Date), N'3367343034', N'vega_arlet.calvo@calvo.vega_arlet@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3203, N'Álvarez', N'Malak Carla', 36000035, N'F', CAST(N'2012-01-04' AS Date), N'3366316881', N'malak_carla.Álvarez@álvarez.malak_carla@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3204, N'Herrero', N'Iria Claudia', 36000036, N'F', CAST(N'2012-01-18' AS Date), N'3364136218', N'iria_claudia.herrero@herrero.iria_claudia@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3205, N'Torres', N'Darío Ashur', 36000037, N'M', CAST(N'2012-01-28' AS Date), N'3363872105', N'darío_ashur.torres@torres.darío_ashur@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3206, N'Fuentes', N'Miguel Mateo', 36000038, N'M', CAST(N'2012-01-27' AS Date), N'3367136522', N'miguel_mateo.fuentes@fuentes.miguel_mateo@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3207, N'García', N'Emma Adriana', 36000039, N'F', CAST(N'2012-01-18' AS Date), N'3366559576', N'emma_adriana.garcía@garcía.emma_adriana@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3208, N'Hernández', N'Benjamín Jiram', 36000040, N'M', CAST(N'2012-01-17' AS Date), N'3366193310', N'benjamín_jiram.hernández@hernández.benjamín_jiram@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3209, N'Ibáñez', N'Salomón Moisés', 36000041, N'M', CAST(N'2012-01-10' AS Date), N'3365305765', N'salomón_moisés.ibáñez@ibáñez.salomón_moisés@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3210, N'Rivera', N'Abimael Tobías', 36000042, N'M', CAST(N'2012-01-17' AS Date), N'3365651293', N'abimael_tobías.rivera@rivera.abimael_tobías@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3211, N'Vicente', N'Yasmín Cristina', 36000043, N'F', CAST(N'2012-01-22' AS Date), N'3368394788', N'yasmín_cristina.vicente@vicente.yasmín_cristina@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3212, N'Santiago', N'Aina Candela', 36000044, N'F', CAST(N'2012-01-24' AS Date), N'3363416888', N'aina_candela.santiago@santiago.aina_candela@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3213, N'Gil', N'Mar Ariadna', 36000045, N'F', CAST(N'2012-01-10' AS Date), N'3363436986', N'mar_ariadna.gil@gil.mar_ariadna@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3214, N'Muñoz', N'Isaías Moisés', 36000046, N'M', CAST(N'2012-01-18' AS Date), N'3368076941', N'isaías_moisés.muñoz@muñoz.isaías_moisés@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3215, N'Santos', N'Benjamín Aram', 36000047, N'M', CAST(N'2012-01-14' AS Date), N'3366190261', N'benjamín_aram.santos@santos.benjamín_aram@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3216, N'Castillo', N'Ainara Aurora', 36000048, N'F', CAST(N'2012-01-21' AS Date), N'3366621625', N'ainara_aurora.castillo@castillo.ainara_aurora@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3217, N'Nuñez', N'Gala Irene', 36000049, N'F', CAST(N'2012-01-09' AS Date), N'3369075529', N'gala_irene.nuñez@nuñez.gala_irene@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3218, N'Álvarez', N'Dámaso Naín', 36000050, N'M', CAST(N'2012-01-27' AS Date), N'3365531492', N'dámaso_naín.Álvarez@álvarez.dámaso_naín@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3219, N'Delgado', N'Luna Lara', 36000051, N'F', CAST(N'2012-01-04' AS Date), N'3368525683', N'luna_lara.delgado@delgado.luna_lara@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3220, N'Ortega', N'Jeremías Julio', 36000052, N'M', CAST(N'2012-01-01' AS Date), N'3369849515', N'jeremías_julio.ortega@ortega.jeremías_julio@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3221, N'Rojas', N'Leyre Carolina', 36000053, N'F', CAST(N'2012-01-20' AS Date), N'3369495812', N'leyre_carolina.rojas@rojas.leyre_carolina@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3222, N'Soto', N'Naín Nicolás', 36000054, N'M', CAST(N'2012-01-06' AS Date), N'3365679905', N'naín_nicolás.soto@soto.naín_nicolás@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3223, N'Bravo', N'Iria Elia', 36000055, N'F', CAST(N'2012-01-25' AS Date), N'3366680970', N'iria_elia.bravo@bravo.iria_elia@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3224, N'Diez', N'Saúl Ismael', 36000056, N'M', CAST(N'2012-01-15' AS Date), N'3365572133', N'saúl_ismael.diez@diez.saúl_ismael@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3225, N'Carmona', N'Marduk Abdiel', 36000057, N'M', CAST(N'2012-01-01' AS Date), N'3366172849', N'marduk_abdiel.carmona@carmona.marduk_abdiel@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3226, N'Suárez', N'Cristina Victoria', 36000058, N'F', CAST(N'2012-01-02' AS Date), N'3366401240', N'cristina_victoria.suárez@suárez.cristina_victoria@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3227, N'Domínguez', N'Daniela Inés', 36000059, N'F', CAST(N'2012-01-02' AS Date), N'3367301064', N'daniela_inés.domínguez@domínguez.daniela_inés@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3228, N'Fuentes', N'Renato Jehoram', 36000060, N'M', CAST(N'2012-01-05' AS Date), N'3363598987', N'renato_jehoram.fuentes@fuentes.renato_jehoram@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3229, N'Mora', N'Lemuel Tobías', 36000061, N'M', CAST(N'2012-01-04' AS Date), N'3369956852', N'lemuel_tobías.mora@mora.lemuel_tobías@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3230, N'Gutiérrez', N'Gadiel Naín', 36000062, N'M', CAST(N'2012-01-13' AS Date), N'3367355972', N'gadiel_naín.gutiérrez@gutiérrez.gadiel_naín@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3231, N'Rubio', N'Nour Abril', 36000063, N'F', CAST(N'2012-01-11' AS Date), N'3363815335', N'nour_abril.rubio@rubio.nour_abril@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3232, N'López', N'Isaac Ismael', 36000064, N'M', CAST(N'2012-01-07' AS Date), N'3364918647', N'isaac_ismael.lópez@lópez.isaac_ismael@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3233, N'Castro', N'Andrea Carolina', 36000065, N'F', CAST(N'2012-01-08' AS Date), N'3363990102', N'andrea_carolina.castro@castro.andrea_carolina@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3234, N'Fuentes', N'Caleb Leví', 36000066, N'M', CAST(N'2012-01-29' AS Date), N'3368359905', N'caleb_leví.fuentes@fuentes.caleb_leví@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3235, N'Soto', N' Inés', 36000067, N'F', CAST(N'2012-01-11' AS Date), N'3365346518', N'_inés.soto@soto._inés@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3236, N'Duran', N'Laia Carmen', 36000068, N'F', CAST(N'2012-01-06' AS Date), N'3369534750', N'laia_carmen.duran@duran.laia_carmen@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3237, N'Rojas', N'Mara Jimena', 36000069, N'F', CAST(N'2012-01-16' AS Date), N'3367584271', N'mara_jimena.rojas@rojas.mara_jimena@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3238, N'González', N'Nuria Iris', 36000070, N'F', CAST(N'2012-01-15' AS Date), N'3365338277', N'nuria_iris.gonzález@gonzález.nuria_iris@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3239, N'Peña', N'India Paula', 36000071, N'F', CAST(N'2012-01-29' AS Date), N'3365643567', N'india_paula.peña@peña.india_paula@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3240, N'Rojas', N'Chloe Sara', 36000072, N'F', CAST(N'2012-01-07' AS Date), N'3363872788', N'chloe_sara.rojas@rojas.chloe_sara@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3241, N'Muñoz', N'Daniela Mara', 36000073, N'F', CAST(N'2012-01-05' AS Date), N'3368478686', N'daniela_mara.muñoz@muñoz.daniela_mara@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3242, N'Romero', N'Baltasar Benjamín', 36000074, N'M', CAST(N'2012-01-05' AS Date), N'3368063609', N'baltasar_benjamín.romero@romero.baltasar_benjamín@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3243, N'Ortega', N'Marina Gala', 36000075, N'F', CAST(N'2012-01-20' AS Date), N'3363247937', N'marina_gala.ortega@ortega.marina_gala@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3244, N'Castro', N'Omar Demócrito', 36000076, N'M', CAST(N'2012-01-12' AS Date), N'3364481660', N'omar_demócrito.castro@castro.omar_demócrito@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3245, N'Soto', N'Neftalí Noé', 36000077, N'M', CAST(N'2012-01-28' AS Date), N'3366269970', N'neftalí_noé.soto@soto.neftalí_noé@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3246, N'Santos', N'Daniel Acab', 36000078, N'M', CAST(N'2012-01-25' AS Date), N'3365150262', N'daniel_acab.santos@santos.daniel_acab@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3247, N'Pérez', N'Abril Isabel', 36000079, N'F', CAST(N'2012-01-24' AS Date), N'3365739814', N'abril_isabel.pérez@pérez.abril_isabel@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3248, N'Medina', N'Jared Gadiel', 36000080, N'M', CAST(N'2012-01-18' AS Date), N'3368175086', N'jared_gadiel.medina@medina.jared_gadiel@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3249, N'Soto', N'Gabriela Lara', 36000081, N'F', CAST(N'2012-01-06' AS Date), N'3369773564', N'gabriela_lara.soto@soto.gabriela_lara@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3250, N'Flores', N'Elia Manuela', 36000082, N'F', CAST(N'2012-01-10' AS Date), N'3368408495', N'elia_manuela.flores@flores.elia_manuela@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3251, N'Garrido', N'Sofía Isabella', 36000083, N'F', CAST(N'2012-01-16' AS Date), N'3365815079', N'sofía_isabella.garrido@garrido.sofía_isabella@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3252, N'Rivera', N'Mateo Francisco', 36000084, N'M', CAST(N'2012-01-19' AS Date), N'3369457082', N'mateo_francisco.rivera@rivera.mateo_francisco@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3253, N'Márquez', N'Eliel Homero', 36000085, N'M', CAST(N'2012-01-03' AS Date), N'3367651148', N'eliel_homero.márquez@márquez.eliel_homero@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3254, N'Benitez', N'Helena Carla', 36000086, N'F', CAST(N'2012-01-27' AS Date), N'3366295578', N'helena_carla.benitez@benitez.helena_carla@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3255, N'Sáez', N'Nora Sara', 36000087, N'F', CAST(N'2012-01-19' AS Date), N'3367151670', N'nora_sara.sáez@sáez.nora_sara@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3256, N'Peña', N'Blanca Iria', 36000088, N'F', CAST(N'2012-01-12' AS Date), N'3364072684', N'blanca_iria.peña@peña.blanca_iria@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3257, N'Alonso', N'Valeria Laia', 36000089, N'F', CAST(N'2012-01-24' AS Date), N'3365150506', N'valeria_laia.alonso@alonso.valeria_laia@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3258, N'Pastor', N'Lucía Naia', 36000090, N'F', CAST(N'2012-01-19' AS Date), N'3366027819', N'lucía_naia.pastor@pastor.lucía_naia@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3259, N'Diez', N'Lara Amaia', 36000091, N'F', CAST(N'2012-01-24' AS Date), N'3366369446', N'lara_amaia.diez@diez.lara_amaia@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3260, N'Castro', N'Ciro Eliel', 36000092, N'M', CAST(N'2012-01-28' AS Date), N'3365510429', N'ciro_eliel.castro@castro.ciro_eliel@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3261, N'Peña', N'Olivia Elia', 36000093, N'F', CAST(N'2012-01-27' AS Date), N'3369542377', N'olivia_elia.peña@peña.olivia_elia@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3262, N'González', N'Luna Gala', 36000094, N'F', CAST(N'2012-01-11' AS Date), N'3363615236', N'luna_gala.gonzález@gonzález.luna_gala@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3263, N'Pastor', N'María Cayetana', 36000095, N'F', CAST(N'2012-01-22' AS Date), N'3369916795', N'maría_cayetana.pastor@pastor.maría_cayetana@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3264, N'González', N'Isaac Tobías', 36000096, N'M', CAST(N'2012-01-01' AS Date), N'3367127952', N'isaac_tobías.gonzález@gonzález.isaac_tobías@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3265, N'Rivera', N'Jimena Andrea', 36000097, N'F', CAST(N'2012-01-18' AS Date), N'3363183186', N'jimena_andrea.rivera@rivera.jimena_andrea@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3266, N'Molina', N'Abel Set', 36000098, N'M', CAST(N'2012-01-03' AS Date), N'3365651512', N'abel_set.molina@molina.abel_set@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3267, N'Velasco', N'Nicolás Lucas', 36000099, N'M', CAST(N'2012-01-21' AS Date), N'3368452407', N'nicolás_lucas.velasco@velasco.nicolás_lucas@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3268, N'Rubio', N'Carla Elena', 36500001, N'F', CAST(N'2013-01-18' AS Date), N'3369197125', N'carla_elena.rubio@rubio.carla_elena@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3269, N'Rojas', N'Ariadna Vera', 36500002, N'F', CAST(N'2013-01-13' AS Date), N'3364885006', N'ariadna_vera.rojas@rojas.ariadna_vera@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3270, N'Aguilar', N'Nerea Mia', 36500003, N'F', CAST(N'2013-01-23' AS Date), N'3364004031', N'nerea_mia.aguilar@aguilar.nerea_mia@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3271, N'Márquez', N'Saúl', 36500004, N'M', CAST(N'2013-01-23' AS Date), N'3368416594', N'saúl.márquez@márquez.saúl@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3272, N'Domínguez', N'Omar Gadiel', 36500005, N'M', CAST(N'2013-01-12' AS Date), N'3364435366', N'omar_gadiel.domínguez@domínguez.omar_gadiel@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3273, N'Molina', N'Luna Ana', 36500006, N'F', CAST(N'2013-01-30' AS Date), N'3369464437', N'luna_ana.molina@molina.luna_ana@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3274, N'Cruz', N'Ainara Valentina', 36500007, N'F', CAST(N'2013-01-03' AS Date), N'3368921231', N'ainara_valentina.cruz@cruz.ainara_valentina@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3275, N'Nuñez', N'Leví Aram', 36500008, N'M', CAST(N'2013-01-06' AS Date), N'3363290331', N'leví_aram.nuñez@nuñez.leví_aram@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3276, N'Morales', N'Neftalí Aarón', 36500009, N'M', CAST(N'2013-01-18' AS Date), N'3368710973', N'neftalí_aarón.morales@morales.neftalí_aarón@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3277, N'Ibáñez', N'Laura Rocío', 36500010, N'F', CAST(N'2013-01-02' AS Date), N'3368185820', N'laura_rocío.ibáñez@ibáñez.laura_rocío@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3278, N'Márquez', N'Iris Natalia', 36500011, N'F', CAST(N'2013-01-29' AS Date), N'3367662980', N'iris_natalia.márquez@márquez.iris_natalia@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3279, N'Iglesias', N'Berta Claudia', 36500012, N'F', CAST(N'2013-01-11' AS Date), N'3365474346', N'berta_claudia.iglesias@iglesias.berta_claudia@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3280, N'Rivera', N'Andrés Israel', 36500013, N'M', CAST(N'2013-01-16' AS Date), N'3367799751', N'andrés_israel.rivera@rivera.andrés_israel@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3281, N'Suárez', N'Jaír de Galaad Simón', 36500014, N'M', CAST(N'2013-01-01' AS Date), N'3365906856', N'jaír_de_galaad_simón.suárez@suárez.jaír_de_galaad_simón@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3282, N'Ortiz', N'Iria Ariadna', 36500015, N'F', CAST(N'2013-01-13' AS Date), N'3367380276', N'iria_ariadna.ortiz@ortiz.iria_ariadna@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3283, N'Martínez', N'Jacob Mateo', 36500016, N'M', CAST(N'2013-01-30' AS Date), N'3363050907', N'jacob_mateo.martínez@martínez.jacob_mateo@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3284, N'Vicente', N'Sergio', 36500017, N'M', CAST(N'2013-01-11' AS Date), N'3364145559', N'sergio.vicente@vicente.sergio@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3285, N'Sánchez', N'Omar Adán', 36500018, N'M', CAST(N'2013-01-16' AS Date), N'3364300655', N'omar_adán.sánchez@sánchez.omar_adán@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3286, N'Carmona', N'Esteban Neftalí', 36500019, N'M', CAST(N'2013-01-16' AS Date), N'3366350404', N'esteban_neftalí.carmona@carmona.esteban_neftalí@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3287, N'Ibáñez', N'Triana Carmen', 36500020, N'F', CAST(N'2013-01-24' AS Date), N'3368645912', N'triana_carmen.ibáñez@ibáñez.triana_carmen@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3288, N'Ibáñez', N'Inés Elsa', 36500021, N'F', CAST(N'2013-01-10' AS Date), N'3364586251', N'inés_elsa.ibáñez@ibáñez.inés_elsa@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3289, N'Méndez', N'Adriana Aurora', 36500022, N'F', CAST(N'2013-01-12' AS Date), N'3364722812', N'adriana_aurora.méndez@méndez.adriana_aurora@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3290, N'Castro', N'Jacob Ashur', 36500023, N'M', CAST(N'2013-01-19' AS Date), N'3363875319', N'jacob_ashur.castro@castro.jacob_ashur@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3291, N'Herrera', N'Eneas Ezequiel', 36500024, N'M', CAST(N'2013-01-01' AS Date), N'3365236971', N'eneas_ezequiel.herrera@herrera.eneas_ezequiel@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3292, N'Domínguez', N'Leire Gabriela', 36500025, N'F', CAST(N'2013-01-18' AS Date), N'3363214830', N'leire_gabriela.domínguez@domínguez.leire_gabriela@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3293, N'Marin', N'Jesús Darío', 36500026, N'M', CAST(N'2013-01-12' AS Date), N'3366335470', N'jesús_darío.marin@marin.jesús_darío@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3294, N'Duran', N'Bartolomé Julio', 36500027, N'M', CAST(N'2013-01-10' AS Date), N'3365194281', N'bartolomé_julio.duran@duran.bartolomé_julio@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3295, N'Molina', N'Claudia Aina', 36500028, N'F', CAST(N'2013-01-01' AS Date), N'3369502665', N'claudia_aina.molina@molina.claudia_aina@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3296, N'Muñoz', N'Blanca Valeria', 36500029, N'F', CAST(N'2013-01-18' AS Date), N'3366756863', N'blanca_valeria.muñoz@muñoz.blanca_valeria@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3297, N'Reyes', N'Luna Lina', 36500030, N'F', CAST(N'2013-01-07' AS Date), N'3363789301', N'luna_lina.reyes@reyes.luna_lina@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3298, N'Hernández', N'Set Elías', 36500031, N'M', CAST(N'2013-01-12' AS Date), N'3369437016', N'set_elías.hernández@hernández.set_elías@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3299, N'Alonso', N'Adriana Clara', 36500032, N'F', CAST(N'2013-01-25' AS Date), N'3369366802', N'adriana_clara.alonso@alonso.adriana_clara@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3300, N'Molina', N'Lola Luna', 36500033, N'F', CAST(N'2013-01-13' AS Date), N'3364178873', N'lola_luna.molina@molina.lola_luna@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3301, N'Martínez', N'Lara Zoe', 36500034, N'F', CAST(N'2013-01-23' AS Date), N'3369542003', N'lara_zoe.martínez@martínez.lara_zoe@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3302, N'Gallardo', N'Adán Naín', 36500035, N'M', CAST(N'2013-01-17' AS Date), N'3367148671', N'adán_naín.gallardo@gallardo.adán_naín@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3303, N'Rodríguez', N'Andrea Nahia', 36500036, N'F', CAST(N'2013-01-23' AS Date), N'3368451598', N'andrea_nahia.rodríguez@rodríguez.andrea_nahia@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3304, N'Hernández', N'Naín Samuel', 36500037, N'M', CAST(N'2013-01-11' AS Date), N'3369718727', N'naín_samuel.hernández@hernández.naín_samuel@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3305, N'Prieto', N'Irene Aroa', 36500038, N'F', CAST(N'2013-01-23' AS Date), N'3369290897', N'irene_aroa.prieto@prieto.irene_aroa@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3306, N'Soler', N'Nour Irene', 36500039, N'F', CAST(N'2013-01-07' AS Date), N'3367236395', N'nour_irene.soler@soler.nour_irene@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3307, N'Moreno', N'Gabriela Isabel', 36500040, N'F', CAST(N'2013-01-19' AS Date), N'3367015625', N'gabriela_isabel.moreno@moreno.gabriela_isabel@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3308, N'Ruiz', N'Abel Acab', 36500041, N'M', CAST(N'2013-01-12' AS Date), N'3369679310', N'abel_acab.ruiz@ruiz.abel_acab@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3309, N'Reyes', N'Chloe Macarena', 36500042, N'F', CAST(N'2013-01-10' AS Date), N'3364312829', N'chloe_macarena.reyes@reyes.chloe_macarena@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3310, N'Garrido', N'Victoria Manuela', 36500043, N'F', CAST(N'2013-01-22' AS Date), N'3365803624', N'victoria_manuela.garrido@garrido.victoria_manuela@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3311, N'Santana', N'Valeria Cayetana', 36500044, N'F', CAST(N'2013-01-27' AS Date), N'3368619293', N'valeria_cayetana.santana@santana.valeria_cayetana@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3312, N'Ruiz', N'Berta Manuela', 36500045, N'F', CAST(N'2013-01-30' AS Date), N'3368678282', N'berta_manuela.ruiz@ruiz.berta_manuela@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3313, N'Gutiérrez', N'Sara Nora', 36500046, N'F', CAST(N'2013-01-05' AS Date), N'3364482363', N'sara_nora.gutiérrez@gutiérrez.sara_nora@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3314, N'Crespo', N'Uzías Lucas', 36500047, N'M', CAST(N'2013-01-27' AS Date), N'3364763561', N'uzías_lucas.crespo@crespo.uzías_lucas@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3315, N'Molina', N'Diana Jana', 36500048, N'F', CAST(N'2013-01-13' AS Date), N'3369651609', N'diana_jana.molina@molina.diana_jana@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3316, N'Ruiz', N'Felipe Alejandro', 36500049, N'M', CAST(N'2013-01-05' AS Date), N'3364409445', N'felipe_alejandro.ruiz@ruiz.felipe_alejandro@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3317, N'Soto', N'Elena Emma', 36500050, N'F', CAST(N'2013-01-09' AS Date), N'3369193578', N'elena_emma.soto@soto.elena_emma@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3318, N'Álvarez', N'Rafael Israel', 36500051, N'M', CAST(N'2013-01-09' AS Date), N'3367630283', N'rafael_israel.Álvarez@álvarez.rafael_israel@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3319, N'Ramírez', N'Aurora Nerea', 36500052, N'F', CAST(N'2013-01-26' AS Date), N'3368550744', N'aurora_nerea.ramírez@ramírez.aurora_nerea@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3320, N'Ruiz', N'India Carla', 36500053, N'F', CAST(N'2013-01-03' AS Date), N'3363083593', N'india_carla.ruiz@ruiz.india_carla@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3321, N'Navarro', N'Valentina Diana', 36500054, N'F', CAST(N'2013-01-29' AS Date), N'3365637622', N'valentina_diana.navarro@navarro.valentina_diana@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3322, N'Parra', N'Irene Yasmín', 36500055, N'F', CAST(N'2013-01-21' AS Date), N'3369136846', N'irene_yasmín.parra@parra.irene_yasmín@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3323, N'Domínguez', N'Acab Tobías', 36500056, N'M', CAST(N'2013-01-02' AS Date), N'3368966872', N'acab_tobías.domínguez@domínguez.acab_tobías@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3324, N'Muñoz', N'Chloe Lara', 36500057, N'F', CAST(N'2013-01-08' AS Date), N'3368746247', N'chloe_lara.muñoz@muñoz.chloe_lara@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3325, N'Roman', N'Jehoram Acab', 36500058, N'M', CAST(N'2013-01-03' AS Date), N'3364869355', N'jehoram_acab.roman@roman.jehoram_acab@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3326, N'Santana', N'Laia Ainara', 36500059, N'F', CAST(N'2013-01-12' AS Date), N'3364401512', N'laia_ainara.santana@santana.laia_ainara@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3327, N'Méndez', N'Marta Julieta', 36500060, N'F', CAST(N'2013-01-07' AS Date), N'3369213132', N'marta_julieta.méndez@méndez.marta_julieta@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3328, N'Carmona', N'Marcos Baltasar', 36500061, N'M', CAST(N'2013-01-27' AS Date), N'3368011550', N'marcos_baltasar.carmona@carmona.marcos_baltasar@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3329, N'Serrano', N'Ashur Josué', 36500062, N'M', CAST(N'2013-01-01' AS Date), N'3364679334', N'ashur_josué.serrano@serrano.ashur_josué@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3330, N'Alonso', N'Nuria Cristina', 36500063, N'F', CAST(N'2013-01-12' AS Date), N'3363908498', N'nuria_cristina.alonso@alonso.nuria_cristina@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3331, N'Soler', N'Gabriela Adriana', 36500064, N'F', CAST(N'2013-01-07' AS Date), N'3363477639', N'gabriela_adriana.soler@soler.gabriela_adriana@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3332, N'García', N'Triana Claudia', 36500065, N'F', CAST(N'2013-01-08' AS Date), N'3365904487', N'triana_claudia.garcía@garcía.triana_claudia@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3333, N'Ramos', N'Nahia Isabel', 36500066, N'F', CAST(N'2013-01-12' AS Date), N'3369061908', N'nahia_isabel.ramos@ramos.nahia_isabel@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3334, N'Prieto', N'Valeria Andrea', 36500067, N'F', CAST(N'2013-01-11' AS Date), N'3368525111', N'valeria_andrea.prieto@prieto.valeria_andrea@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3335, N'Sáez', N'Manuela Sofía', 36500068, N'F', CAST(N'2013-01-30' AS Date), N'3369421467', N'manuela_sofía.sáez@sáez.manuela_sofía@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3336, N'Rojas', N'Elena Berta', 36500069, N'F', CAST(N'2013-01-25' AS Date), N'3368692268', N'elena_berta.rojas@rojas.elena_berta@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3337, N'Vega', N'Noa Amaia', 36500070, N'F', CAST(N'2013-01-23' AS Date), N'3365411604', N'noa_amaia.vega@vega.noa_amaia@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3338, N'Vidal', N'Isabel Martina', 36500071, N'F', CAST(N'2013-01-13' AS Date), N'3367867507', N'isabel_martina.vidal@vidal.isabel_martina@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3339, N'Iglesias', N'Yasmín Cayetana', 36500072, N'F', CAST(N'2013-01-22' AS Date), N'3365913419', N'yasmín_cayetana.iglesias@iglesias.yasmín_cayetana@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3340, N'Méndez', N'Laura Triana', 36500073, N'F', CAST(N'2013-01-17' AS Date), N'3367344843', N'laura_triana.méndez@méndez.laura_triana@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3341, N'Parra', N'Amira Nora', 36500074, N'F', CAST(N'2013-01-17' AS Date), N'3366510503', N'amira_nora.parra@parra.amira_nora@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3342, N'Vicente', N'Joaquín Zacarías', 36500075, N'M', CAST(N'2013-01-17' AS Date), N'3366639775', N'joaquín_zacarías.vicente@vicente.joaquín_zacarías@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3343, N'Sanz', N'Lina Cayetana', 36500076, N'F', CAST(N'2013-01-26' AS Date), N'3365943587', N'lina_cayetana.sanz@sanz.lina_cayetana@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3344, N'Castillo', N'Eneas Isaías', 36500077, N'M', CAST(N'2013-01-07' AS Date), N'3367474598', N'eneas_isaías.castillo@castillo.eneas_isaías@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3345, N'Bravo', N'Jacob Rafael', 36500078, N'M', CAST(N'2013-01-12' AS Date), N'3366501507', N'jacob_rafael.bravo@bravo.jacob_rafael@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3346, N'Caballero', N'Fátima Elia', 36500079, N'F', CAST(N'2013-01-13' AS Date), N'3363352043', N'fátima_elia.caballero@caballero.fátima_elia@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3347, N'Vega', N'Abril Marina', 36500080, N'F', CAST(N'2013-01-02' AS Date), N'3364419179', N'abril_marina.vega@vega.abril_marina@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3348, N'Crespo', N'Vera Chloe', 36500081, N'F', CAST(N'2013-01-01' AS Date), N'3367569659', N'vera_chloe.crespo@crespo.vera_chloe@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3349, N'Molina', N'Marta Isabel', 36500082, N'F', CAST(N'2013-01-08' AS Date), N'3363555098', N'marta_isabel.molina@molina.marta_isabel@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3350, N'Méndez', N'Amaia Abril', 36500083, N'F', CAST(N'2013-01-02' AS Date), N'3366976040', N'amaia_abril.méndez@méndez.amaia_abril@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3351, N'Gallego', N'Jaír de Galaad Beltrán', 36500084, N'M', CAST(N'2013-01-10' AS Date), N'3367605984', N'jaír_de_galaad_beltrán.gallego@gallego.jaír_de_galaad_beltrán@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3352, N'Navarro', N'Macarena Julia', 36500085, N'F', CAST(N'2013-01-17' AS Date), N'3369506818', N'macarena_julia.navarro@navarro.macarena_julia@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3353, N'Herrero', N'Chloe Ainhoa', 36500086, N'F', CAST(N'2013-01-01' AS Date), N'3367251720', N'chloe_ainhoa.herrero@herrero.chloe_ainhoa@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3354, N'Gómez', N'Tobías Gadiel', 36500087, N'M', CAST(N'2013-01-28' AS Date), N'3366604501', N'tobías_gadiel.gómez@gómez.tobías_gadiel@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3355, N'Crespo', N'Labán Adán', 36500088, N'M', CAST(N'2013-01-18' AS Date), N'3368614610', N'labán_adán.crespo@crespo.labán_adán@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3356, N'Cruz', N'Valentina Yasmín', 36500089, N'F', CAST(N'2013-01-24' AS Date), N'3368191964', N'valentina_yasmín.cruz@cruz.valentina_yasmín@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3357, N'Ortega', N'Gadiel Darío', 36500090, N'M', CAST(N'2013-01-09' AS Date), N'3364230580', N'gadiel_darío.ortega@ortega.gadiel_darío@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3358, N'López', N'Vera Ana', 36500091, N'F', CAST(N'2013-01-24' AS Date), N'3367251732', N'vera_ana.lópez@lópez.vera_ana@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3359, N'Flores', N'Luna Diana', 36500092, N'F', CAST(N'2013-01-18' AS Date), N'3363875966', N'luna_diana.flores@flores.luna_diana@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3360, N'Giménez', N'Abimael Abel', 36500093, N'M', CAST(N'2013-01-22' AS Date), N'3363517473', N'abimael_abel.giménez@giménez.abimael_abel@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3361, N'Nieto', N'Dámaso Tobías', 36500094, N'M', CAST(N'2013-01-11' AS Date), N'3369280463', N'dámaso_tobías.nieto@nieto.dámaso_tobías@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3362, N'Montero', N'Jared Beltrán', 36500095, N'M', CAST(N'2013-01-24' AS Date), N'3367427951', N'jared_beltrán.montero@montero.jared_beltrán@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3363, N'Gómez', N'Ona Aitana', 36500096, N'F', CAST(N'2013-01-30' AS Date), N'3364730804', N'ona_aitana.gómez@gómez.ona_aitana@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3364, N'Aguilar', N'Luna India', 36500097, N'F', CAST(N'2013-01-14' AS Date), N'3365232188', N'luna_india.aguilar@aguilar.luna_india@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3365, N'Ibáñez', N'Gabriel Neftalí', 36500098, N'M', CAST(N'2013-01-01' AS Date), N'3366168797', N'gabriel_neftalí.ibáñez@ibáñez.gabriel_neftalí@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3366, N'Ibáñez', N'Ana Clara', 36500099, N'F', CAST(N'2013-01-15' AS Date), N'3363595164', N'ana_clara.ibáñez@ibáñez.ana_clara@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3367, N'Herrera', N'Adara Elia', 37000001, N'F', CAST(N'2014-01-25' AS Date), N'3365072566', N'adara_elia.herrera@herrera.adara_elia@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3368, N'Vargas', N'Mar Chloe', 37000002, N'F', CAST(N'2014-01-28' AS Date), N'3365748239', N'mar_chloe.vargas@vargas.mar_chloe@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3369, N'Rubio', N'Germán Joanix', 37000003, N'M', CAST(N'2014-01-10' AS Date), N'3368467333', N'germán_joanix.rubio@rubio.germán_joanix@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3370, N'Rodríguez', N'Jana Nuria', 37000004, N'F', CAST(N'2014-01-24' AS Date), N'3367266070', N'jana_nuria.rodríguez@rodríguez.jana_nuria@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3371, N'Calvo', N'Jacob Abraham', 37000005, N'M', CAST(N'2014-01-10' AS Date), N'3365728891', N'jacob_abraham.calvo@calvo.jacob_abraham@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3372, N'Sánchez', N'Matías Jairo', 37000006, N'M', CAST(N'2014-01-13' AS Date), N'3369020256', N'matías_jairo.sánchez@sánchez.matías_jairo@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3373, N'Parra', N'David Jehoram', 37000007, N'M', CAST(N'2014-01-09' AS Date), N'3366897790', N'david_jehoram.parra@parra.david_jehoram@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3374, N'Fernández', N'Uzías Rafael', 37000008, N'M', CAST(N'2014-01-08' AS Date), N'3365823963', N'uzías_rafael.fernández@fernández.uzías_rafael@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3375, N'Pérez', N'Carlota Amaia', 37000009, N'F', CAST(N'2014-01-08' AS Date), N'3367336386', N'carlota_amaia.pérez@pérez.carlota_amaia@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3376, N'Caballero', N'Gabriel Salomón', 37000010, N'M', CAST(N'2014-01-19' AS Date), N'3369135575', N'gabriel_salomón.caballero@caballero.gabriel_salomón@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3377, N'Marin', N'Elia Abril', 37000011, N'F', CAST(N'2014-01-29' AS Date), N'3364212237', N'elia_abril.marin@marin.elia_abril@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3378, N'Sáez', N'Vega Sara', 37000012, N'F', CAST(N'2014-01-26' AS Date), N'3368619090', N'vega_sara.sáez@sáez.vega_sara@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3379, N'Gallego', N'Paula ', 37000013, N'F', CAST(N'2014-01-13' AS Date), N'3366302501', N'paula_.gallego@gallego.paula_@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3380, N'López', N'Nicolás Lemuel', 37000014, N'M', CAST(N'2014-01-02' AS Date), N'3366328549', N'nicolás_lemuel.lópez@lópez.nicolás_lemuel@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3381, N'Gutiérrez', N'Victoria Noa', 37000015, N'F', CAST(N'2014-01-26' AS Date), N'3366057705', N'victoria_noa.gutiérrez@gutiérrez.victoria_noa@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3382, N'Ortiz', N'Lina Arlet', 37000016, N'F', CAST(N'2014-01-05' AS Date), N'3363297256', N'lina_arlet.ortiz@ortiz.lina_arlet@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3383, N'Carmona', N'Pablo Germán', 37000017, N'M', CAST(N'2014-01-28' AS Date), N'3367277480', N'pablo_germán.carmona@carmona.pablo_germán@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3384, N'Gil', N'Ana Alma', 37000018, N'F', CAST(N'2014-01-12' AS Date), N'3367698391', N'ana_alma.gil@gil.ana_alma@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3385, N'Calvo', N'Marduk Mateo', 37000019, N'M', CAST(N'2014-01-15' AS Date), N'3365541457', N'marduk_mateo.calvo@calvo.marduk_mateo@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3386, N'Gil', N'Rubén Beltrán', 37000020, N'M', CAST(N'2014-01-11' AS Date), N'3365107194', N'rubén_beltrán.gil@gil.rubén_beltrán@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3387, N'Pérez', N'Isabel Lola', 37000021, N'F', CAST(N'2014-01-05' AS Date), N'3363810644', N'isabel_lola.pérez@pérez.isabel_lola@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3388, N'Méndez', N'Miguel Uzías', 37000022, N'M', CAST(N'2014-01-30' AS Date), N'3369795415', N'miguel_uzías.méndez@méndez.miguel_uzías@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3389, N'Fuentes', N'Isabel Nuria', 37000023, N'F', CAST(N'2014-01-30' AS Date), N'3366468695', N'isabel_nuria.fuentes@fuentes.isabel_nuria@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3390, N'Vargas', N'Ana Zoe', 37000024, N'F', CAST(N'2014-01-13' AS Date), N'3367501054', N'ana_zoe.vargas@vargas.ana_zoe@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3391, N'Gutiérrez', N'Ona Irene', 37000025, N'F', CAST(N'2014-01-02' AS Date), N'3369296140', N'ona_irene.gutiérrez@gutiérrez.ona_irene@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3392, N'Torres', N'Sergio Caleb', 37000026, N'M', CAST(N'2014-01-04' AS Date), N'3369197518', N'sergio_caleb.torres@torres.sergio_caleb@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3393, N'Rojas', N'Caín Neftalí', 37000027, N'M', CAST(N'2014-01-20' AS Date), N'3369705728', N'caín_neftalí.rojas@rojas.caín_neftalí@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3394, N'Morales', N'Tobías Abimael', 37000028, N'M', CAST(N'2014-01-30' AS Date), N'3366497891', N'tobías_abimael.morales@morales.tobías_abimael@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3395, N'Iglesias', N'Mateo Jonás', 37000029, N'M', CAST(N'2014-01-27' AS Date), N'3368907459', N'mateo_jonás.iglesias@iglesias.mateo_jonás@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3396, N'Muñoz', N'Agustín Samuel', 37000030, N'M', CAST(N'2014-01-03' AS Date), N'3365237309', N'agustín_samuel.muñoz@muñoz.agustín_samuel@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3397, N'López', N'Joanix', 37000031, N'M', CAST(N'2014-01-17' AS Date), N'3363485082', N'joanix.lópez@lópez.joanix@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3398, N'Sáez', N'Benjamín Félix', 37000032, N'M', CAST(N'2014-01-24' AS Date), N'3366742892', N'benjamín_félix.sáez@sáez.benjamín_félix@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3399, N'Ortega', N'Ezequiel Pablo', 37000033, N'M', CAST(N'2014-01-25' AS Date), N'3365976222', N'ezequiel_pablo.ortega@ortega.ezequiel_pablo@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3400, N'Ramos', N'Ciro Israel', 37000034, N'M', CAST(N'2014-01-14' AS Date), N'3363113815', N'ciro_israel.ramos@ramos.ciro_israel@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3401, N'Gil', N'Laia Cayetana', 37000035, N'F', CAST(N'2014-01-08' AS Date), N'3369077256', N'laia_cayetana.gil@gil.laia_cayetana@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3402, N'Nuñez', N'Rocío Aitana', 37000036, N'F', CAST(N'2014-01-24' AS Date), N'3365089629', N'rocío_aitana.nuñez@nuñez.rocío_aitana@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3403, N'Vargas', N'Jehoram Naín', 37000037, N'M', CAST(N'2014-01-02' AS Date), N'3365256691', N'jehoram_naín.vargas@vargas.jehoram_naín@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3404, N'Pérez', N'Eliseo Isaías', 37000038, N'M', CAST(N'2014-01-24' AS Date), N'3363794359', N'eliseo_isaías.pérez@pérez.eliseo_isaías@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3405, N'Soler', N'Joaquín Jairo', 37000039, N'M', CAST(N'2014-01-01' AS Date), N'3364288806', N'joaquín_jairo.soler@soler.joaquín_jairo@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3406, N'Rojas', N'Adara Arlet', 37000040, N'F', CAST(N'2014-01-13' AS Date), N'3365634951', N'adara_arlet.rojas@rojas.adara_arlet@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3407, N'Cortés', N'Macarena Julieta', 37000041, N'F', CAST(N'2014-01-03' AS Date), N'3368278798', N'macarena_julieta.cortés@cortés.macarena_julieta@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3408, N'Santos', N'Sara Nora', 37000042, N'F', CAST(N'2014-01-25' AS Date), N'3365058590', N'sara_nora.santos@santos.sara_nora@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3409, N'Cano', N'Cayetana Vega', 37000043, N'F', CAST(N'2014-01-08' AS Date), N'3368432996', N'cayetana_vega.cano@cano.cayetana_vega@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3410, N'Sáez', N'Berta Paula', 37000044, N'F', CAST(N'2014-01-08' AS Date), N'3369852039', N'berta_paula.sáez@sáez.berta_paula@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3411, N'Crespo', N'David Matías', 37000045, N'M', CAST(N'2014-01-03' AS Date), N'3368618338', N'david_matías.crespo@crespo.david_matías@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3412, N'Flores', N'Félix Zacarías', 37000046, N'M', CAST(N'2014-01-28' AS Date), N'3369345945', N'félix_zacarías.flores@flores.félix_zacarías@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3413, N'Santiago', N'Fabián José', 37000047, N'M', CAST(N'2014-01-10' AS Date), N'3364823616', N'fabián_josé.santiago@santiago.fabián_josé@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3414, N'Velasco', N'Abdiel Abimael', 37000048, N'M', CAST(N'2014-01-10' AS Date), N'3369396928', N'abdiel_abimael.velasco@velasco.abdiel_abimael@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3415, N'Santos', N'Aina Laia', 37000049, N'F', CAST(N'2014-01-27' AS Date), N'3369609842', N'aina_laia.santos@santos.aina_laia@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3416, N'Crespo', N'Jana Olivia', 37000050, N'F', CAST(N'2014-01-15' AS Date), N'3368364198', N'jana_olivia.crespo@crespo.jana_olivia@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3417, N'Moreno', N'Jonás Jared', 37000051, N'M', CAST(N'2014-01-03' AS Date), N'3366891824', N'jonás_jared.moreno@moreno.jonás_jared@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3418, N'Cabrera', N'Malak Vega', 37000052, N'F', CAST(N'2014-01-26' AS Date), N'3364012894', N'malak_vega.cabrera@cabrera.malak_vega@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3419, N'León', N'Clara Ainhoa', 37000053, N'F', CAST(N'2014-01-20' AS Date), N'3369539251', N'clara_ainhoa.león@león.clara_ainhoa@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3420, N'Ruiz', N'Julio Benjamín', 37000054, N'M', CAST(N'2014-01-04' AS Date), N'3369630880', N'julio_benjamín.ruiz@ruiz.julio_benjamín@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3421, N'Carmona', N'Noa Jimena', 37000055, N'F', CAST(N'2014-01-16' AS Date), N'3364640908', N'noa_jimena.carmona@carmona.noa_jimena@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3422, N'Giménez', N'Candela Gala', 37000056, N'F', CAST(N'2014-01-16' AS Date), N'3367645355', N'candela_gala.giménez@giménez.candela_gala@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3423, N'Cano', N'José Caleb', 37000057, N'M', CAST(N'2014-01-18' AS Date), N'3367319330', N'josé_caleb.cano@cano.josé_caleb@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3424, N'Peña', N'Set Josué', 37000058, N'M', CAST(N'2014-01-01' AS Date), N'3366774738', N'set_josué.peña@peña.set_josué@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3425, N'Vargas', N'Israel Neftalí', 37000059, N'M', CAST(N'2014-01-02' AS Date), N'3369834027', N'israel_neftalí.vargas@vargas.israel_neftalí@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3426, N'Fuentes', N'Arlet Chloe', 37000060, N'F', CAST(N'2014-01-27' AS Date), N'3364255880', N'arlet_chloe.fuentes@fuentes.arlet_chloe@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3427, N'Hidalgo', N'Homero Esteban', 37000061, N'M', CAST(N'2014-01-27' AS Date), N'3366618280', N'homero_esteban.hidalgo@hidalgo.homero_esteban@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3428, N'Muñoz', N'Claudia Jana', 37000062, N'F', CAST(N'2014-01-13' AS Date), N'3367833552', N'claudia_jana.muñoz@muñoz.claudia_jana@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3429, N'Lorenzo', N'Nora Alicia', 37000063, N'F', CAST(N'2014-01-11' AS Date), N'3367289101', N'nora_alicia.lorenzo@lorenzo.nora_alicia@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3430, N'González', N'Acab Neftalí', 37000064, N'M', CAST(N'2014-01-25' AS Date), N'3368536066', N'acab_neftalí.gonzález@gonzález.acab_neftalí@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3431, N'Nuñez', N'Jacob Guido', 37000065, N'M', CAST(N'2014-01-06' AS Date), N'3367326452', N'jacob_guido.nuñez@nuñez.jacob_guido@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3432, N'Mora', N'Alicia Elia', 37000066, N'F', CAST(N'2014-01-02' AS Date), N'3366635176', N'alicia_elia.mora@mora.alicia_elia@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3433, N'Castillo', N'Félix Esteban', 37000067, N'M', CAST(N'2014-01-24' AS Date), N'3368343164', N'félix_esteban.castillo@castillo.félix_esteban@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3434, N'Lozano', N'Noé Salomón', 37000068, N'M', CAST(N'2014-01-21' AS Date), N'3367970585', N'noé_salomón.lozano@lozano.noé_salomón@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3435, N'Pascual', N'Ainhoa Macarena', 37000069, N'F', CAST(N'2014-01-04' AS Date), N'3363778772', N'ainhoa_macarena.pascual@pascual.ainhoa_macarena@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3436, N'Cruz', N'Elena Elsa', 37000070, N'F', CAST(N'2014-01-29' AS Date), N'3368419849', N'elena_elsa.cruz@cruz.elena_elsa@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3437, N'Gallardo', N'Naín Eliel', 37000071, N'M', CAST(N'2014-01-10' AS Date), N'3367660198', N'naín_eliel.gallardo@gallardo.naín_eliel@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3438, N'Santos', N'Lola Julieta', 37000072, N'F', CAST(N'2014-01-16' AS Date), N'3366975986', N'lola_julieta.santos@santos.lola_julieta@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3439, N'Soler', N'Iris', 37000073, N'F', CAST(N'2014-01-07' AS Date), N'3365464208', N'iris.soler@soler.iris@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3440, N'Suárez', N'Diana Victoria', 37000074, N'F', CAST(N'2014-01-09' AS Date), N'3363509534', N'diana_victoria.suárez@suárez.diana_victoria@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3441, N'Castro', N'Ainara Mia', 37000075, N'F', CAST(N'2014-01-08' AS Date), N'3367282795', N'ainara_mia.castro@castro.ainara_mia@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3442, N'Santos', N'Dámaso Mateo', 37000076, N'M', CAST(N'2014-01-22' AS Date), N'3366919689', N'dámaso_mateo.santos@santos.dámaso_mateo@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3443, N'Guerrero', N'Mar Chloe', 37000077, N'F', CAST(N'2014-01-16' AS Date), N'3365607100', N'mar_chloe.guerrero@guerrero.mar_chloe@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3444, N'Crespo', N'Aina Leyre', 37000078, N'F', CAST(N'2014-01-03' AS Date), N'3364302969', N'aina_leyre.crespo@crespo.aina_leyre@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3445, N'Pérez', N'Isaac Israel', 37000079, N'M', CAST(N'2014-01-20' AS Date), N'3368575983', N'isaac_israel.pérez@pérez.isaac_israel@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3446, N'Peña', N'Simón Lucas', 37000080, N'M', CAST(N'2014-01-27' AS Date), N'3366009385', N'simón_lucas.peña@peña.simón_lucas@dinosback.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3447, N'López', N'Zacarías Abimael', 37000081, N'M', CAST(N'2014-01-27' AS Date), N'3364599177', N'zacarías_abimael.lópez@lópez.zacarías_abimael@pichis.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3448, N'Velasco', N'Eliseo Édgar', 37000082, N'M', CAST(N'2014-01-11' AS Date), N'3364367795', N'eliseo_Édgar.velasco@velasco.eliseo_édgar@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3449, N'Gil', N'Fabián Isaías', 37000083, N'M', CAST(N'2014-01-05' AS Date), N'3367960598', N'fabián_isaías.gil@gil.fabián_isaías@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3450, N'Rodríguez', N'Francisco Samuel', 37000084, N'M', CAST(N'2014-01-05' AS Date), N'3364783132', N'francisco_samuel.rodríguez@rodríguez.francisco_samuel@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3451, N'Cano', N'Abimael Elías', 37000085, N'M', CAST(N'2014-01-14' AS Date), N'3365918691', N'abimael_elías.cano@cano.abimael_elías@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3452, N'Pascual', N'Iria Nerea', 37000086, N'F', CAST(N'2014-01-02' AS Date), N'3368651430', N'iria_nerea.pascual@pascual.iria_nerea@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3453, N'Hidalgo', N'Mara Ainhoa', 37000087, N'F', CAST(N'2014-01-04' AS Date), N'3368058066', N'mara_ainhoa.hidalgo@hidalgo.mara_ainhoa@cuco.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3454, N'García', N'Elsa Nahia', 37000088, N'F', CAST(N'2014-01-17' AS Date), N'3367153653', N'elsa_nahia.garcía@garcía.elsa_nahia@pepe.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3455, N'Rojas', N'Acab Labán', 37000089, N'M', CAST(N'2014-01-02' AS Date), N'3368297997', N'acab_labán.rojas@rojas.acab_labán@gmail.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3456, N'García', N'Alba Laura', 37000090, N'F', CAST(N'2014-01-15' AS Date), N'3364205578', N'alba_laura.garcía@garcía.alba_laura@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3457, N'Ramírez', N'Gaspar Édgar', 37000091, N'M', CAST(N'2014-01-05' AS Date), N'3367064177', N'gaspar_Édgar.ramírez@ramírez.gaspar_édgar@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3458, N'Peña', N'Jonás Jairo', 37000092, N'M', CAST(N'2014-01-30' AS Date), N'3366290867', N'jonás_jairo.peña@peña.jonás_jairo@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3459, N'Castillo', N'Francisco Gaspar', 37000093, N'M', CAST(N'2014-01-08' AS Date), N'3366101855', N'francisco_gaspar.castillo@castillo.francisco_gaspar@yahoo.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3460, N'Duran', N'Fabián Caín', 37000094, N'M', CAST(N'2014-01-01' AS Date), N'3366860588', N'fabián_caín.duran@duran.fabián_caín@tems.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3461, N'Santana', N'Arlet Abril', 37000095, N'F', CAST(N'2014-01-17' AS Date), N'3363060475', N'arlet_abril.santana@santana.arlet_abril@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3462, N'Rodríguez', N'Gadiel Ahzià', 37000096, N'M', CAST(N'2014-01-05' AS Date), N'3363076927', N'gadiel_ahzià.rodríguez@rodríguez.gadiel_ahzià@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3463, N'Ramos', N'Inés Ona', 37000097, N'F', CAST(N'2014-01-18' AS Date), N'3366765076', N'inés_ona.ramos@ramos.inés_ona@office.com')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3464, N'Roman', N'Sara Lina', 37000098, N'F', CAST(N'2014-01-13' AS Date), N'3363866323', N'sara_lina.roman@roman.sara_lina@yahoo.com.ar')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3465, N'Cruz', N'Francisco Joaquín', 37000099, N'M', CAST(N'2014-01-07' AS Date), N'3364001068', N'francisco_joaquín.cruz@cruz.francisco_joaquín@garolfa.net')
GO
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni], [genero], [fnacto], [telefono], [email]) VALUES (3466, N'Salazar', N'Christian', 96224732, N'M', CAST(N'2004-05-19' AS Date), N'3364362906', N'csalazarontiveros@frsn.utn.edu.ar')
GO
SET IDENTITY_INSERT [dbo].[Persona] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Especial__72AFBCC65209AF06]    Script Date: 15/8/2024 5:20:34 p. m. ******/
ALTER TABLE [dbo].[Especialidad] ADD UNIQUE NONCLUSTERED 
(
	[nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [uxi_medico_espec]    Script Date: 15/8/2024 5:20:34 p. m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [uxi_medico_espec] ON [dbo].[EspecialidadesMedico]
(
	[medico_id] ASC,
	[especialidad_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ__Paciente__189F813BC8F43E55]    Script Date: 15/8/2024 5:20:34 p. m. ******/
ALTER TABLE [dbo].[Paciente] ADD UNIQUE NONCLUSTERED 
(
	[persona_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ__Persona__D87608A7B0DA054B]    Script Date: 15/8/2024 5:20:34 p. m. ******/
ALTER TABLE [dbo].[Persona] ADD UNIQUE NONCLUSTERED 
(
	[dni] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ix_persona_apenom]    Script Date: 15/8/2024 5:20:34 p. m. ******/
CREATE NONCLUSTERED INDEX [ix_persona_apenom] ON [dbo].[Persona]
(
	[apellido] ASC,
	[nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Persona] ADD  DEFAULT ('No tiene') FOR [telefono]
GO
ALTER TABLE [dbo].[PlanObraSocial] ADD  DEFAULT ('N') FOR [copago_sn]
GO
ALTER TABLE [dbo].[PlanObraSocial] ADD  DEFAULT ((0)) FOR [copago]
GO
ALTER TABLE [dbo].[Clinica]  WITH CHECK ADD FOREIGN KEY([director])
REFERENCES [dbo].[Persona] ([id])
GO
ALTER TABLE [dbo].[EspecialidadesMedico]  WITH CHECK ADD FOREIGN KEY([especialidad_id])
REFERENCES [dbo].[Especialidad] ([id])
GO
ALTER TABLE [dbo].[EspecialidadesMedico]  WITH CHECK ADD FOREIGN KEY([medico_id])
REFERENCES [dbo].[Medico] ([id])
GO
ALTER TABLE [dbo].[Medico]  WITH CHECK ADD FOREIGN KEY([persona_id])
REFERENCES [dbo].[Persona] ([id])
GO
ALTER TABLE [dbo].[PlanesOSPaciente]  WITH CHECK ADD FOREIGN KEY([paciente_id])
REFERENCES [dbo].[Paciente] ([id])
GO
ALTER TABLE [dbo].[PlanesOSPaciente]  WITH CHECK ADD FOREIGN KEY([planobrasocialid])
REFERENCES [dbo].[PlanObraSocial] ([id])
GO
ALTER TABLE [dbo].[Clinica]  WITH CHECK ADD  CONSTRAINT [cuitValido] CHECK  ((len([cuit])=(11)))
GO
ALTER TABLE [dbo].[Clinica] CHECK CONSTRAINT [cuitValido]
GO
ALTER TABLE [dbo].[Persona]  WITH CHECK ADD CHECK  (([genero]='O' OR [genero]='M' OR [genero]='F'))
GO
ALTER TABLE [dbo].[PlanObraSocial]  WITH CHECK ADD CHECK  (([copago_sn]='N' OR [copago_sn]='S'))
GO
/****** Object:  StoredProcedure [dbo].[D_Especialidad]    Script Date: 15/8/2024 5:20:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[D_Especialidad]
    @id INT 
AS 
BEGIN 
  BEGIN TRY
    DELETE FROM Especialidad WHERE id = @id
  END TRY
  BEGIN CATCH
     EXECUTE GetErrorInfo_sp
  END CATCH 
END

GO
/****** Object:  StoredProcedure [dbo].[GetErrorInfo_sp]    Script Date: 15/8/2024 5:20:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetErrorInfo_sp]  
AS  
SELECT  
    ERROR_NUMBER() AS ErrorNumber  
    ,ERROR_SEVERITY() AS ErrorSeverity  
    ,ERROR_STATE() AS ErrorState  
    ,ERROR_PROCEDURE() AS ErrorProcedure  
    ,ERROR_LINE() AS ErrorLine  
    ,ERROR_MESSAGE() AS ErrorMessage;  
GO
/****** Object:  StoredProcedure [dbo].[I_Especialidad]    Script Date: 15/8/2024 5:20:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[I_Especialidad]
     @nombre VARCHAR(512)
    ,@id INT OUTPUT
AS 
BEGIN 
  BEGIN TRY
    INSERT INTO Especialidad
    (NOMBRE)
    VALUES
    (@NOMBRE)

    SELECT @ID = @@IDENTITY
  END TRY
  BEGIN CATCH
     EXECUTE GetErrorInfo_sp
  END CATCH 
END

GO
/****** Object:  StoredProcedure [dbo].[I_Persona]    Script Date: 15/8/2024 5:20:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[I_Persona]
	 @apellido VARCHAR(128),
     @nombre VARCHAR(128),
	 @dni INT,
	 @genero CHAR(1),
	 @fnacto DATE,
	 @telefono VARCHAR(10),
	 @email VARCHAR(128),
	 @id INT OUTPUT
AS 
BEGIN 
  BEGIN TRY
    INSERT INTO Persona
    (apellido, nombre, dni, genero, fnacto, telefono, email)
    VALUES
    (@apellido, @nombre, @dni, @genero, @fnacto, @telefono, @email)

    SELECT @ID = @@IDENTITY
  END TRY
  BEGIN CATCH
     EXECUTE GetErrorInfo_sp
  END CATCH 
END

GO
/****** Object:  StoredProcedure [dbo].[S_Especialidad]    Script Date: 15/8/2024 5:20:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[S_Especialidad]
    @id INT
AS
BEGIN
    SELECT id, nombre FROM Especialidad
    WHERE ID = @id OR @id IS NULL;
END 

GO
/****** Object:  StoredProcedure [dbo].[U_Especialidad]    Script Date: 15/8/2024 5:20:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[U_Especialidad]
    @id INT
   ,@nombre VARCHAR(512)
AS 
BEGIN 
  BEGIN TRY
    UPDATE Especialidad SET nombre = @nombre WHERE id = @id
  END TRY
  BEGIN CATCH
     EXECUTE GetErrorInfo_sp
  END CATCH 
END
GO
USE [master]
GO
ALTER DATABASE [DB2024] SET  READ_WRITE 
GO
