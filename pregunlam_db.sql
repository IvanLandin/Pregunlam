-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-11-2024 a las 02:51:39
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `pregunlam_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `id_categoria` int(11) NOT NULL,
  `descripcion_categoria` varchar(50) NOT NULL,
  `img_categoria` varchar(255) NOT NULL,
  `color_categoria` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`id_categoria`, `descripcion_categoria`, `img_categoria`, `color_categoria`) VALUES
(1, 'Historia', 'public/images/img-categoria/historia.png', '#F2D31F'),
(2, 'Deporte', 'public/images/img-categoria/deporte.png', '#EC2E35'),
(3, 'Entretenimiento', 'public/images/img-categoria/entretenimiento.png', '#ED4CAD'),
(4, 'Arte', 'public/images/img-categoria/arte.png', '#9025EC'),
(5, 'Tecnología', 'public/images/img-categoria/tecnologia.png', '#3343EC'),
(6, 'Geografía', 'public/images/img-categoria/geografia.png', '#39C1F1'),
(7, 'Ciencia', 'public/images/img-categoria/ciencia.png', '#36EC4B');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado`
--

CREATE TABLE `estado` (
  `id_estado` int(11) NOT NULL,
  `descripcion_estado` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estado`
--

INSERT INTO `estado` (`id_estado`, `descripcion_estado`) VALUES
(1, 'pendiente'),
(2, 'aprobada'),
(3, 'reportada'),
(4, 'rechazada'),
(5, 'desactivada');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `partida`
--

CREATE TABLE `partida` (
  `id_partida` int(11) NOT NULL,
  `fechaHora_partida` datetime NOT NULL,
  `puntaje_partida` int(11) NOT NULL,
  `estado_partida` char(1) NOT NULL,
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `partida`
--

INSERT INTO `partida` (`id_partida`, `fechaHora_partida`, `puntaje_partida`, `estado_partida`, `id_usuario`) VALUES
(1, '2024-11-24 22:19:11', 5, 'i', 18),
(2, '2024-11-24 22:20:08', 0, 'i', 18),
(3, '2024-11-24 22:20:12', 0, 'i', 18),
(4, '2024-11-24 22:20:19', 3, 'i', 18),
(5, '2024-11-24 22:29:27', 5, 'i', 8),
(6, '2024-11-24 22:29:59', 0, 'i', 8),
(7, '2024-11-24 22:30:04', 2, 'i', 8),
(8, '2024-11-24 22:30:51', 0, 'i', 10),
(9, '2024-11-24 22:30:55', 3, 'i', 10),
(10, '2024-11-24 22:31:31', 2, 'i', 9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pregunta`
--

CREATE TABLE `pregunta` (
  `id_pregunta` int(11) NOT NULL,
  `interrogante_pregunta` varchar(255) NOT NULL,
  `fechaCreacion_pregunta` date NOT NULL,
  `cantVistas_pregunta` int(11) NOT NULL DEFAULT 0,
  `cantCorrectas_pregunta` int(11) NOT NULL DEFAULT 0,
  `id_usuarioCreador` int(11) DEFAULT NULL,
  `id_categoria` int(11) NOT NULL,
  `id_estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pregunta`
--

INSERT INTO `pregunta` (`id_pregunta`, `interrogante_pregunta`, `fechaCreacion_pregunta`, `cantVistas_pregunta`, `cantCorrectas_pregunta`, `id_usuarioCreador`, `id_categoria`, `id_estado`) VALUES
(1, '¿Quién fue el primer emperador de China?', '2024-10-22', 3, 0, 1, 1, 2),
(2, '¿En qué año cayó el Muro de Berlín?', '2024-10-22', 2, 1, 2, 1, 2),
(3, '¿Cuál fue la civilización que construyó Machu Picchu?', '2024-10-22', 0, 0, 3, 1, 2),
(4, '¿Quién fue el líder del Imperio Mongol?', '2024-10-22', 2, 2, 4, 1, 2),
(5, '¿Qué evento marcó el inicio de la Revolución Francesa?', '2024-10-22', 11, 1, 5, 1, 2),
(6, '¿Cuál es el deporte nacional de Brasil?', '2024-10-22', 1, 1, 1, 2, 2),
(7, '¿En qué país se originó el rugby?', '2024-10-22', 3, 2, 2, 2, 2),
(8, '¿Qué deporte se juega en la Liga Premier?', '2024-10-22', 1, 0, 3, 2, 2),
(9, '¿Cuál es el evento más importante de ciclismo en Europa?', '2024-10-22', 1, 0, 4, 2, 2),
(10, '¿Quién es el máximo goleador de la historia de la UEFA Champions League?', '2024-10-22', 2, 1, 5, 2, 2),
(11, '¿Cuál es la serie argentina más famosa de Netflix?', '2024-10-22', 3, 1, 1, 3, 5),
(12, '¿Qué película ganó el Oscar a la Mejor Película en 2021?', '2024-10-22', 4, 2, 2, 3, 2),
(13, '¿Quién es el creador de la famosa serie \"The Simpsons\"?', '2024-10-22', 4, 1, 3, 3, 2),
(14, '¿Cuál es la película que ganó el Oscar a la Mejor Película en 2022?', '2024-10-22', 3, 3, 4, 3, 2),
(15, '¿Cuál es la película de Disney que se basa en la historia de un joven llamado Aladino?', '2024-10-22', 3, 2, 5, 3, 2),
(16, '¿Quién pintó \"La noche estrellada\"?', '2024-10-22', 1, 0, 1, 4, 2),
(17, '¿Qué artista es conocido por sus murales en México?', '2024-10-22', 4, 2, 1, 4, 2),
(18, '¿Cuál es la técnica utilizada en la obra \"La creación de Adán\"?', '2024-10-22', 3, 1, 1, 4, 2),
(19, '¿Qué estilo artístico representa \"El grito\"?', '2024-10-22', 2, 2, 1, 4, 2),
(20, '¿Quién es el autor de la escultura \"El pensador\"?', '2024-10-22', 2, 1, 1, 4, 2),
(21, '¿Cuál es el lenguaje de programación más utilizado para desarrollo web del lado del cliente?', '2024-10-22', 2, 1, 1, 5, 2),
(22, '¿Qué tecnología se utiliza para hacer comunicaciones a larga distancia sin cables?', '2024-10-22', 2, 1, 2, 5, 2),
(23, '¿Qué dispositivo se utiliza para almacenar datos de manera permanente?', '2024-10-22', 3, 0, 3, 5, 3),
(24, '¿Cuál es el sistema operativo de código abierto más popular?', '2024-10-22', 2, 1, 4, 5, 2),
(25, '¿Qué red social fue lanzada por Mark Zuckerberg en 2004?', '2024-10-22', 5, 2, 5, 5, 2),
(26, '¿Cuál es la capital de Argentina?', '2024-10-22', 2, 1, 1, 6, 2),
(27, '¿Qué país tiene la mayor extensión territorial del mundo?', '2024-10-22', 2, 3, 2, 6, 2),
(28, '¿Cuál es el río más largo de Argentina?', '2024-10-22', 5, 3, 3, 6, 2),
(29, '¿En qué continente se encuentra el país de Egipto?', '2024-10-22', 2, 0, 4, 6, 2),
(30, '¿Cuál es el océano que baña las costas de Argentina?', '2024-10-22', 2, 2, 5, 6, 2),
(31, '¿Cuál es el elemento químico más abundante en el universo?', '2024-10-22', 9, 1, 1, 7, 2),
(32, '¿Qué planeta es conocido como el planeta rojo?', '2024-10-22', 1, 0, 2, 7, 3),
(33, '¿Cuál es la unidad básica de la vida?', '2024-10-22', 2, 0, 3, 7, 2),
(34, '¿Qué tipo de energía es la del sol?', '2024-10-22', 0, 0, 4, 7, 2),
(35, '¿Quién propuso la teoría de la relatividad?', '2024-10-22', 4, 1, 5, 7, 2),
(43, '¿En que año inició la Segunda Guerra Mundial?', '2024-11-18', 2, 1, 18, 1, 2),
(44, '¿Cuál es la duración equivalente de una nota semicorchea en relación a una negra?', '2024-11-24', 0, 0, 9, 4, 1),
(45, '2 x 10 + 15 / 3 = ?', '2024-11-24', 0, 0, 11, 7, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pregunta_partida`
--

CREATE TABLE `pregunta_partida` (
  `id_pregunta_partida` int(11) NOT NULL,
  `respondeCorrecto_pregunta_partida` tinyint(1) NOT NULL,
  `fechaHoraEntrega_pregunta_partida` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `respondio_pregunta_partida` tinyint(1) NOT NULL DEFAULT 0,
  `id_partida` int(11) NOT NULL,
  `id_pregunta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pregunta_partida`
--

INSERT INTO `pregunta_partida` (`id_pregunta_partida`, `respondeCorrecto_pregunta_partida`, `fechaHoraEntrega_pregunta_partida`, `respondio_pregunta_partida`, `id_partida`, `id_pregunta`) VALUES
(1, 1, '2024-11-25 01:19:20', 1, 1, 11),
(2, 1, '2024-11-25 01:19:25', 1, 1, 21),
(3, 1, '2024-11-25 01:19:30', 1, 1, 10),
(4, 1, '2024-11-25 01:19:33', 1, 1, 25),
(5, 1, '2024-11-25 01:19:37', 1, 1, 30),
(6, 0, '2024-11-25 01:19:42', 1, 1, 23),
(7, 0, '2024-11-25 01:20:10', 1, 2, 7),
(8, 0, '2024-11-25 01:20:16', 1, 3, 31),
(9, 1, '2024-11-25 01:20:21', 1, 4, 12),
(10, 1, '2024-11-25 01:20:24', 1, 4, 26),
(11, 1, '2024-11-25 01:20:26', 1, 4, 14),
(12, 0, '2024-11-25 01:20:31', 1, 4, 43),
(13, 1, '2024-11-25 01:29:30', 1, 5, 17),
(14, 1, '2024-11-25 01:29:33', 1, 5, 5),
(15, 1, '2024-11-25 01:29:39', 1, 5, 4),
(16, 1, '2024-11-25 01:29:43', 1, 5, 15),
(17, 1, '2024-11-25 01:29:46', 1, 5, 31),
(18, 0, '2024-11-25 01:29:49', 1, 5, 20),
(19, 0, '2024-11-25 01:30:01', 1, 6, 12),
(20, 1, '2024-11-25 01:30:06', 1, 7, 14),
(21, 1, '2024-11-25 01:30:11', 1, 7, 28),
(22, 0, '2024-11-25 01:30:14', 1, 7, 11),
(23, 0, '2024-11-25 01:30:53', 1, 8, 1),
(24, 1, '2024-11-25 01:30:58', 1, 9, 18),
(25, 1, '2024-11-25 01:31:03', 1, 9, 24),
(26, 1, '2024-11-25 01:31:06', 1, 9, 17),
(27, 0, '2024-11-25 01:31:08', 1, 9, 15),
(28, 1, '2024-11-25 01:31:36', 1, 10, 27),
(29, 1, '2024-11-25 01:31:39', 1, 10, 28),
(30, 0, '2024-11-25 01:31:42', 1, 10, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pregunta_vista`
--

CREATE TABLE `pregunta_vista` (
  `id_pregunta_vista` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_pregunta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pregunta_vista`
--

INSERT INTO `pregunta_vista` (`id_pregunta_vista`, `id_usuario`, `id_pregunta`) VALUES
(1, 18, 11),
(2, 18, 21),
(3, 18, 10),
(4, 18, 25),
(5, 18, 30),
(6, 18, 23),
(7, 18, 7),
(8, 18, 31),
(9, 18, 12),
(10, 18, 26),
(11, 18, 14),
(12, 18, 43),
(13, 8, 17),
(14, 8, 5),
(15, 8, 4),
(16, 8, 15),
(17, 8, 31),
(18, 8, 20),
(19, 8, 12),
(20, 8, 14),
(21, 8, 28),
(22, 8, 11),
(23, 10, 1),
(24, 10, 18),
(25, 10, 24),
(26, 10, 17),
(27, 10, 15),
(28, 9, 27),
(29, 9, 28),
(30, 9, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reporte_pregunta`
--

CREATE TABLE `reporte_pregunta` (
  `id_reporte` int(11) NOT NULL,
  `motivo_reporte` varchar(255) NOT NULL,
  `fecha_reporte` datetime NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_pregunta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `reporte_pregunta`
--

INSERT INTO `reporte_pregunta` (`id_reporte`, `motivo_reporte`, `fecha_reporte`, `id_usuario`, `id_pregunta`) VALUES
(1, 'ssd también almacena datos permanentemente', '2024-11-24 22:19:50', 18, 23);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `respuesta`
--

CREATE TABLE `respuesta` (
  `id_respuesta` int(11) NOT NULL,
  `descripcion_respuesta` varchar(50) NOT NULL,
  `esCorrecta_respuesta` tinyint(1) NOT NULL,
  `id_pregunta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `respuesta`
--

INSERT INTO `respuesta` (`id_respuesta`, `descripcion_respuesta`, `esCorrecta_respuesta`, `id_pregunta`) VALUES
(1, 'Qin Shi Huang', 1, 1),
(2, 'Confucio', 0, 1),
(3, 'Kublai Kan', 0, 1),
(4, 'Sun Tzu', 0, 1),
(5, '1989', 1, 2),
(6, '1991', 0, 2),
(7, '1985', 0, 2),
(8, '1990', 0, 2),
(9, 'Los incas', 1, 3),
(10, 'Los aztecas', 0, 3),
(11, 'Los mayas', 0, 3),
(12, 'Los romanos', 0, 3),
(13, 'Gengis Kan', 1, 4),
(14, 'Atila', 0, 4),
(15, 'Julio César', 0, 4),
(16, 'Carlos Magno', 0, 4),
(17, 'La toma de la Bastilla', 1, 5),
(18, 'La declaración de los Derechos del Hombre', 0, 5),
(19, 'La ejecución de Luis XVI', 0, 5),
(20, 'El inicio de la guerra contra Prusia', 0, 5),
(21, 'Fútbol', 1, 6),
(22, 'Voleibol', 0, 6),
(23, 'Baloncesto', 0, 6),
(24, 'Tenis', 0, 6),
(25, 'Inglaterra', 1, 7),
(26, 'Escocia', 0, 7),
(27, 'Francia', 0, 7),
(28, 'Australia', 0, 7),
(29, 'Fútbol', 1, 8),
(30, 'Rugby', 0, 8),
(31, 'Baloncesto', 0, 8),
(32, 'Cricket', 0, 8),
(33, 'El Tour de Francia', 1, 9),
(34, 'La Vuelta a España', 0, 9),
(35, 'El Giro de Italia', 0, 9),
(36, 'El Campeonato Mundial', 0, 9),
(37, 'Cristiano Ronaldo', 1, 10),
(38, 'Lionel Messi', 0, 10),
(39, 'Raúl González', 0, 10),
(40, 'Thierry Henry', 0, 10),
(41, 'La Casa de Papel', 0, 11),
(42, 'Élite', 0, 11),
(43, 'Los Espookys', 1, 11),
(44, 'Merlí', 0, 11),
(45, 'Nomadland', 1, 12),
(46, 'The Father', 0, 12),
(47, 'Promising Young Woman', 0, 12),
(48, 'Mank', 0, 12),
(49, 'Matt Groening', 1, 13),
(50, 'Seth MacFarlane', 0, 13),
(51, 'Trey Parker', 0, 13),
(52, 'Dan Harmon', 0, 13),
(53, 'CODA', 1, 14),
(54, 'Dune', 0, 14),
(55, 'West Side Story', 0, 14),
(56, 'Belfast', 0, 14),
(57, 'El Rey León', 0, 15),
(58, 'Mulan', 0, 15),
(59, 'Aladino', 1, 15),
(60, 'La Sirenita', 0, 15),
(61, 'Vincent van Gogh', 1, 16),
(62, 'Pablo Picasso', 0, 16),
(63, 'Claude Monet', 0, 16),
(64, 'Henri Matisse', 0, 16),
(65, 'Diego Rivera', 1, 17),
(66, 'Frida Kahlo', 0, 17),
(67, 'David Alfaro Siqueiros', 0, 17),
(68, 'José Clemente Orozco', 0, 17),
(69, 'Fresco', 1, 18),
(70, 'Óleo', 0, 18),
(71, 'Acuarela', 0, 18),
(72, 'Tempera', 0, 18),
(73, 'Expresionismo', 1, 19),
(74, 'Impresionismo', 0, 19),
(75, 'Cubismo', 0, 19),
(76, 'Surrealismo', 0, 19),
(77, 'Auguste Rodin', 1, 20),
(78, 'Gustave Courbet', 0, 20),
(79, 'Henry Moore', 0, 20),
(80, 'Alberto Giacometti', 0, 20),
(81, 'JavaScript', 1, 21),
(82, 'Python', 0, 21),
(83, 'Java', 0, 21),
(84, 'C++', 0, 21),
(85, 'Bluetooth', 0, 22),
(86, 'Wi-Fi', 1, 22),
(87, 'NFC', 0, 22),
(88, 'Ethernet', 0, 22),
(89, 'SSD', 0, 23),
(90, 'HDD', 1, 23),
(91, 'RAM', 0, 23),
(92, 'USB', 0, 23),
(93, 'Windows', 0, 24),
(94, 'Linux', 1, 24),
(95, 'macOS', 0, 24),
(96, 'Unix', 0, 24),
(97, 'Instagram', 0, 25),
(98, 'Twitter', 0, 25),
(99, 'Facebook', 1, 25),
(100, 'LinkedIn', 0, 25),
(101, 'Buenos Aires', 1, 26),
(102, 'Córdoba', 0, 26),
(103, 'La Plata', 0, 26),
(104, 'Mendoza', 0, 26),
(105, 'Rusia', 1, 27),
(106, 'Canadá', 0, 27),
(107, 'China', 0, 27),
(108, 'Estados Unidos', 0, 27),
(109, 'Paraná', 1, 28),
(110, 'Uruguay', 0, 28),
(111, 'Tigre', 0, 28),
(112, 'Colorado', 0, 28),
(113, 'África', 1, 29),
(114, 'Asia', 0, 29),
(115, 'Europa', 0, 29),
(116, 'América', 0, 29),
(117, 'Atlántico', 1, 30),
(118, 'Pacífico', 0, 30),
(119, 'Índico', 0, 30),
(120, 'Ártico', 0, 30),
(121, 'Hidrógeno', 1, 31),
(122, 'Helio', 0, 31),
(123, 'Oxígeno', 0, 31),
(124, 'Carbono', 0, 31),
(125, 'Marte', 1, 32),
(126, 'Júpiter', 0, 32),
(127, 'Venus', 0, 32),
(128, 'Mercurio', 0, 32),
(129, 'Célula', 1, 33),
(130, 'Átomo', 0, 33),
(131, 'Tejido', 0, 33),
(132, 'Órgano', 0, 33),
(133, 'Energía solar', 1, 34),
(134, 'Energía eólica', 0, 34),
(135, 'Energía hidráulica', 0, 34),
(136, 'Energía térmica', 0, 34),
(137, 'Albert Einstein', 1, 35),
(138, 'Isaac Newton', 0, 35),
(139, 'Galileo Galilei', 0, 35),
(140, 'Niels Bohr', 0, 35),
(141, '1939', 1, 43),
(142, '1945', 0, 43),
(143, '1918', 0, 43),
(144, '1912', 0, 43),
(145, '1/4 del tiempo', 1, 44),
(146, '1/2 del tiempo', 0, 44),
(147, '1/8 del tiempo', 0, 44),
(148, 'Duran lo mismo', 0, 44),
(149, '11,66', 1, 45),
(150, '16,66', 0, 45),
(151, '25', 0, 45),
(152, '30', 0, 45);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sexo`
--

CREATE TABLE `sexo` (
  `id_sexo` int(11) NOT NULL,
  `descripcion_sexo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `sexo`
--

INSERT INTO `sexo` (`id_sexo`, `descripcion_sexo`) VALUES
(1, 'masculino'),
(2, 'femenino'),
(3, 'x');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_usuario`
--

CREATE TABLE `tipo_usuario` (
  `id_tipo_usuario` int(11) NOT NULL,
  `descripcion_tipo_usuario` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipo_usuario`
--

INSERT INTO `tipo_usuario` (`id_tipo_usuario`, `descripcion_tipo_usuario`) VALUES
(1, 'admin'),
(2, 'editor'),
(3, 'jugador');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `userName_usuario` varchar(32) NOT NULL,
  `password_usuario` varchar(255) NOT NULL,
  `email_usuario` varchar(254) NOT NULL,
  `img_usuario` varchar(255) NOT NULL,
  `maxPuntaje_usuario` int(11) DEFAULT NULL,
  `nombreCompleto_usuario` varchar(128) NOT NULL,
  `fechaNacimiento_usuario` date NOT NULL,
  `pais_usuario` varchar(255) NOT NULL,
  `fechaRegistro_usuario` date NOT NULL,
  `estado_usuario` char(1) NOT NULL,
  `token_usuario` int(11) NOT NULL,
  `cantPreguntasJugadas_usuario` int(11) NOT NULL,
  `cantPreguntasCorrectas_usuario` int(11) NOT NULL,
  `id_tipo_usuario` int(11) NOT NULL,
  `id_sexo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `userName_usuario`, `password_usuario`, `email_usuario`, `img_usuario`, `maxPuntaje_usuario`, `nombreCompleto_usuario`, `fechaNacimiento_usuario`, `pais_usuario`, `fechaRegistro_usuario`, `estado_usuario`, `token_usuario`, `cantPreguntasJugadas_usuario`, `cantPreguntasCorrectas_usuario`, `id_tipo_usuario`, `id_sexo`) VALUES
(0, 'editor', '$2y$10$N..AFA6v1Q5ic8EAxjPV9OzelwaFWCAoGsKXmucMw8ZbXgGBO1Ct6', '', 'public/images/fotoDePerfil/default.jpg', NULL, '', '0000-00-00', '', '0000-00-00', 'a', 0, 0, 0, 2, 3),
(1, 'admin', '$2y$10$N..AFA6v1Q5ic8EAxjPV9OzelwaFWCAoGsKXmucMw8ZbXgGBO1Ct6', 'kvnrotela@gmail.com', 'public/images/fotoDePerfil/triangle-dancing.gif', NULL, 'Kevin', '2024-10-16', '-34.828868, -58.635762', '2024-11-01', 'a', 126085, 0, 0, 1, 1),
(2, 'Ernesto01', '$2y$10$AAdI21YZNK6o6J382gEhf.aHt4s86WkzZ7TzkUwsMTWsfFLqXLWce', 'ernesto@gmail.com', 'public/images/fotoDePerfil/triangle-dancing.gif', NULL, 'Ernesto', '2024-10-14', '-34.670554, -58.562810', '2024-11-11', 'a', 273684, 0, 0, 3, 1),
(3, 'alex09', '$2y$10$ue3cU5A5ZPNY8GgsrXwPNukdy.SrvGJq84igb2hplGEx/532YaYla', 'alexis@gmail.com', 'public/images/fotoDePerfil/triangle-dancing.gif', NULL, 'alexis', '2024-10-08', '-34.670554, -58.562810', '2024-11-08', 'a', 852260, 0, 0, 3, 1),
(4, 'pablo01', '$2y$10$z42HPSOFsaq8a2uQmgV7X.Ns1MHRfttJEoyVMcs75FK/cqZX7oT4q', 'pablo@gmail.com', '/public/images/fotoDePerfil/triangle-dancing.gif', NULL, 'pablo', '2024-10-08', '-34.670554, -58.562810', '2024-11-13', 'a', 166403, 0, 0, 3, 1),
(5, 'ivan01', '$2y$10$b7UN26.ZW.tS3D67OJcOuOM6RrDwrODIf5qitKQDrMdVAyv8PSVWG', 'ivan@gmail.com', 'public/images/fotoDePerfil/portrait-german-shepherd-head-years-old-front-white-background-copy-space-171994255.jpg', NULL, 'Ivan', '2024-11-12', '-34.828868, -58.635762', '2024-11-10', 'a', 893743, 0, 0, 3, 1),
(6, 'elias04', '$2y$10$6mZqIfdfJEn/axf8ntPdpOgLdVe9OZkjD4aIZI4HWbtUY1/AtPqqO', 'elias@gmail.com', 'public/images/fotoDePerfil/portrait-german-shepherd-head-years-old-front-white-background-copy-space-171994255.jpg', NULL, 'Elias', '2024-10-01', '-34.670554, -58.562810', '2024-11-08', 'a', 296399, 0, 0, 3, 1),
(7, 'wolverine04', '$2y$10$WorEezbFgMOyKDJ1IvfIOeUEf7iWbukrsueIHT7N/OhbVC8mS21Ny', 'wolverine@gmail.com', 'public/images/fotoDePerfil/portrait-german-shepherd-head-years-old-front-white-background-copy-space-171994255.jpg', NULL, 'wolverine', '2024-10-09', '-34.670554, -58.562810', '2024-11-06', 'a', 508803, 0, 0, 3, 1),
(8, 'usuario1', '$2y$10$YGQNKdVsgZCt74FKpNlqHevz1SPavnJqZ3udAbfJX1HCICSir6xda', 'usuario1@gmail.com', 'public/images/fotoDePerfil/default.jpg', 5, 'Usuario Uno', '2000-01-01', '-34.670554, -58.562810', '2024-10-20', 'a', 206740, 10, 7, 3, 1),
(9, 'usuario2', '$2y$10$YGQNKdVsgZCt74FKpNlqHevz1SPavnJqZ3udAbfJX1HCICSir6xda', 'usuario2@gmail.com', 'public/images/fotoDePerfil/default.jpg', 2, 'Usuario Dos', '2000-02-02', '-34.670554, -58.562810', '2024-07-20', 'a', 936270, 3, 2, 3, 1),
(10, 'usuario3', '$2y$10$YGQNKdVsgZCt74FKpNlqHevz1SPavnJqZ3udAbfJX1HCICSir6xda', 'usuario3@gmail.com', 'public/images/fotoDePerfil/default.jpg', 3, 'Usuario Tres', '2000-03-03', '-34.670554, -58.562810', '2024-07-20', 'a', 361128, 5, 3, 3, 1),
(11, 'usuario4', '$2y$10$YGQNKdVsgZCt74FKpNlqHevz1SPavnJqZ3udAbfJX1HCICSir6xda', 'usuario4@gmail.com', 'public/images/fotoDePerfil/default.jpg', NULL, 'Usuario Cuatro', '2000-04-04', '-34.670554, -58.562810', '2024-05-20', 'a', 696831, 0, 0, 3, 1),
(12, 'usuario5', '$2y$10$YGQNKdVsgZCt74FKpNlqHevz1SPavnJqZ3udAbfJX1HCICSir6xda', 'usuario5@gmail.com', 'public/images/fotoDePerfil/default.jpg', NULL, 'Usuario Cinco', '2000-05-05', '-34.670554, -58.562810', '2024-06-20', 'a', 500770, 0, 0, 3, 1),
(13, 'usuario6', '$2y$10$YGQNKdVsgZCt74FKpNlqHevz1SPavnJqZ3udAbfJX1HCICSir6xda', 'usuario6@gmail.com', 'public/images/fotoDePerfil/default.jpg', NULL, 'Usuario Seis', '2000-06-06', '-34.670554, -58.562810', '2024-06-20', 'a', 313359, 0, 0, 3, 1),
(14, 'usuario7', '$2y$10$YGQNKdVsgZCt74FKpNlqHevz1SPavnJqZ3udAbfJX1HCICSir6xda', 'usuario7@gmail.com', 'public/images/fotoDePerfil/default.jpg', NULL, 'Usuario Siete', '2000-07-07', '-34.670554, -58.562810', '2024-05-20', 'a', 864485, 0, 0, 3, 1),
(15, 'usuario8', '$2y$10$YGQNKdVsgZCt74FKpNlqHevz1SPavnJqZ3udAbfJX1HCICSir6xda', 'usuario8@gmail.com', 'public/images/fotoDePerfil/default.jpg', NULL, 'Usuario Ocho', '2000-08-08', '-34.670554, -58.562810', '2024-03-20', 'a', 582348, 0, 0, 3, 1),
(16, 'usuario9', '$2y$10$YGQNKdVsgZCt74FKpNlqHevz1SPavnJqZ3udAbfJX1HCICSir6xda', 'usuario9@gmail.com', 'public/images/fotoDePerfil/default.jpg', NULL, 'Usuario Nueve', '2000-09-09', '-34.670554, -58.562810', '2024-02-20', 'a', 218286, 0, 0, 3, 1),
(17, 'usuario10', '$2y$10$YGQNKdVsgZCt74FKpNlqHevz1SPavnJqZ3udAbfJX1HCICSir6xda', 'usuario10@gmail.com', 'public/images/fotoDePerfil/default.jpg', NULL, 'Usuario Diez', '2000-10-10', '-34.670554, -58.562810', '2024-02-20', 'a', 144385, 0, 0, 3, 1),
(18, 'ivan', '$2y$10$YGQNKdVsgZCt74FKpNlqHevz1SPavnJqZ3udAbfJX1HCICSir6xda', 'ivan@gmail.com', 'public/images/fotoDePerfil/cheems.jpg', 5, 'Ivan', '1997-04-02', '-34.665257, -58.586273', '2024-02-25', 'a', 312325, 12, 8, 3, 1),
(19, 'maria23', '$2y$10$abH9y4MckBiqzOmE1sfu3K0J3gK27Rlz1l0vF19dbmbc4AfqHKZ9C', 'maria23@gmail.com', 'public/images/fotoDePerfil/default.jpg', NULL, 'María', '1995-04-01', '-34.670554, -58.562810', '2024-02-21', 'a', 85042, 0, 0, 2, 2),
(20, 'lucas_91', '$2y$10$7mKZoCflJvDA.6zHlwr4JOd0C/UeQDNhh1yGcKnXQ9WGQ9HRL9ztC', 'lucas_91@gmail.com', 'public/images/fotoDePerfil/default.jpg', NULL, 'Lucas', '1991-06-15', '-34.670554, -58.562810', '2024-02-17', 'a', 125345, 0, 0, 3, 1),
(21, 'ana_perez', '$2y$10$G5ptKgqbmB9KvQ6FfvUosRA6t02c6Pn7grjsQLlmp7OqomT1uV4Dk', 'ana_perez@gmail.com', 'public/images/fotoDePerfil/default.jpg', NULL, 'Ana Pérez', '1990-08-09', '-34.670554, -58.562810', '2024-04-18', 'a', 76321, 0, 0, 2, 2),
(22, 'jorge_martin', '$2y$10$Rj1zA1s6M6cscoX6K9n5lzx63jF0T2B6mkLRmM3.NnUUG0z7V7lIu', 'jorge_martin@gmail.com', 'public/images/fotoDePerfil/default.jpg', NULL, 'Jorge Martín', '1988-12-30', '-34.670554, -58.562810', '2024-06-22', 'a', 95000, 0, 0, 1, 1),
(23, 'sofia_lara', '$2y$10$wP3p0pQfZjv5gfONen6FSCQMGy89W5rDRw6g5/OVi7Wx77k9D6.tq', 'sofia_lara@gmail.com', 'public/images/fotoDePerfil/default.jpg', NULL, 'Sofía Lara', '1998-02-14', '-34.670554, -58.562810', '2024-07-23', 'a', 102430, 0, 0, 3, 2),
(24, 'luis_mendoza', '$2y$10$wZk7ZevCmML76bX0XB7Vr92Fh02wzBqtJeAi9Te7r83p6lKM2/xj', 'luis_mendoza@gmail.com', 'public/images/fotoDePerfil/default.jpg', NULL, 'Luis Mendoza', '1985-05-10', '-34.670554, -58.562810', '2024-08-14', 'a', 114320, 0, 0, 3, 1),
(25, 'paola_ortega', '$2y$10$DvaH9aIiW6OD5.M1P88h5V5h3SHaTKOKRrwzfeJcFHm2w5f9VYZyG', 'paola_ortega@gmail.com', 'public/images/fotoDePerfil/default.jpg', NULL, 'Paola Ortega', '2000-03-21', 'México', '2024-08-13', 'a', 102111, 0, 0, 4, 2),
(26, 'ivan_hernandez', '$2y$10$PntldAiFz8iXZAZd33EHGZQ02hAYv4EHGJalrk.44Ig0gZjJvPQuC', 'ivan_hernandez@gmail.com', 'public/images/fotoDePerfil/default.jpg', NULL, 'Iván Hernández', '1993-11-03', 'Perú', '2024-08-12', 'a', 95022, 0, 0, 5, 1),
(27, 'juliana_sanchez', '$2y$10$4SYfHcnNlFgWfc2OhfbTp3sNEUdzsnW8V2yBBH2NeBpnIDzZknIFi', 'juliana_sanchez@gmail.com', 'public/images/fotoDePerfil/default.jpg', NULL, 'Juliana Sánchez', '1994-07-15', 'Argentina', '2024-03-11', 'a', 130430, 0, 0, 4, 2),
(28, 'marco_garcia', '$2y$10$YzvT8gTSfzHU8EjklfDsWoZjrBsYlSzr57GRVrcHKgKYPJdFZev6', 'marco_garcia@gmail.com', 'public/images/fotoDePerfil/default.jpg', NULL, 'Marco García', '1989-01-22', 'Colombia', '2024-05-10', 'a', 115643, 0, 0, 3, 1),
(29, 'catalina_martinez', '$2y$10$Qbs9d5sk47WVoOVVZfPx1QKJtK1M1Rj6UlTkFX96pa9hptKHiLZ9C', 'catalina_martinez@gmail.com', 'public/images/fotoDePerfil/default.jpg', NULL, 'Catalina Martínez', '1997-09-08', 'México', '2024-07-09', 'a', 110856, 0, 0, 2, 2),
(30, 'santiago_vega', '$2y$10$K.oaXQXkzmPHhZt1N5xF..SeAlHfXtDWB54APqHpa66zTCXyoJkZy', 'santiago_vega@gmail.com', 'public/images/fotoDePerfil/default.jpg', NULL, 'Santiago Vega', '1992-02-11', 'Chile', '2024-09-08', 'a', 98765, 0, 0, 4, 1),
(31, 'patricia_gonzalez', '$2y$10$ZJxZGqHYmIZ5Jv03.Pzrcfy9q8Gx4qEXwOwiWV7I6nkmw5ysf5Vu1', 'patricia_gonzalez@gmail.com', 'public/images/fotoDePerfil/default.jpg', NULL, 'Patricia González', '1990-11-30', 'Argentina', '2024-09-07', 'a', 110034, 0, 0, 3, 2),
(32, 'jorge_ponce', '$2y$10$HVhrX1NjkKh6h9gIH3SKetq1WwPqaJ6M2lItEjQ.3O1j8rVZzAVi', 'jorge_ponce@gmail.com', 'public/images/fotoDePerfil/default.jpg', NULL, 'Jorge Ponce', '1987-03-12', 'Colombia', '2024-10-06', 'a', 115434, 0, 0, 2, 1),
(33, 'maria_luisa', '$2y$10$Krh9F0rKxRzZKLoLryHKUo76PHlFcJfVs47G4mKOaxvbNpnOcVGZm', 'maria_luisa@gmail.com', 'public/images/fotoDePerfil/default.jpg', NULL, 'María Luisa', '1995-05-22', 'España', '2024-03-05', 'a', 120930, 0, 0, 4, 2),
(34, 'david_silva', '$2y$10$0YkpppR57ALt7f5Q61NIKRhz6Se8R5Xa7xG2K8Xh.rpt2gfb6FVkK', 'david_silva@gmail.com', 'public/images/fotoDePerfil/default.jpg', NULL, 'David Silva', '1983-06-17', 'México', '2023-12-04', 'a', 132000, 0, 0, 5, 1),
(35, 'carlos_ferreira', '$2y$10$4Vs7SPntkz6LP0QkmSk18sPbm2Vz9cStcxw2QxmLHD1Y1jSxp7Vym', 'carlos_ferreira@gmail.com', 'public/images/fotoDePerfil/default.jpg', NULL, 'Carlos Ferreira', '1982-07-22', 'Chile', '2023-12-03', 'a', 110321, 0, 0, 3, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`id_estado`);

--
-- Indices de la tabla `partida`
--
ALTER TABLE `partida`
  ADD PRIMARY KEY (`id_partida`),
  ADD KEY `FK_usuario` (`id_usuario`);

--
-- Indices de la tabla `pregunta`
--
ALTER TABLE `pregunta`
  ADD PRIMARY KEY (`id_pregunta`),
  ADD KEY `FK_usuario_creador` (`id_usuarioCreador`),
  ADD KEY `FK_categoria` (`id_categoria`),
  ADD KEY `FK_estado` (`id_estado`);

--
-- Indices de la tabla `pregunta_partida`
--
ALTER TABLE `pregunta_partida`
  ADD PRIMARY KEY (`id_pregunta_partida`),
  ADD KEY `FK_pregunta` (`id_pregunta`),
  ADD KEY `FK_partida` (`id_partida`);

--
-- Indices de la tabla `pregunta_vista`
--
ALTER TABLE `pregunta_vista`
  ADD PRIMARY KEY (`id_pregunta_vista`),
  ADD KEY `FK_pregunta1` (`id_pregunta`),
  ADD KEY `FK_usuario1` (`id_usuario`);

--
-- Indices de la tabla `reporte_pregunta`
--
ALTER TABLE `reporte_pregunta`
  ADD PRIMARY KEY (`id_reporte`),
  ADD KEY `FK_usuario2` (`id_usuario`),
  ADD KEY `FK_pregunta2` (`id_pregunta`);

--
-- Indices de la tabla `respuesta`
--
ALTER TABLE `respuesta`
  ADD PRIMARY KEY (`id_respuesta`),
  ADD KEY `FK_pregunta3` (`id_pregunta`);

--
-- Indices de la tabla `sexo`
--
ALTER TABLE `sexo`
  ADD PRIMARY KEY (`id_sexo`);

--
-- Indices de la tabla `tipo_usuario`
--
ALTER TABLE `tipo_usuario`
  ADD PRIMARY KEY (`id_tipo_usuario`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `FK_tipo_usuario` (`id_tipo_usuario`),
  ADD KEY `FK_sexo` (`id_sexo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `estado`
--
ALTER TABLE `estado`
  MODIFY `id_estado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `partida`
--
ALTER TABLE `partida`
  MODIFY `id_partida` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `pregunta`
--
ALTER TABLE `pregunta`
  MODIFY `id_pregunta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT de la tabla `pregunta_partida`
--
ALTER TABLE `pregunta_partida`
  MODIFY `id_pregunta_partida` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `pregunta_vista`
--
ALTER TABLE `pregunta_vista`
  MODIFY `id_pregunta_vista` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `reporte_pregunta`
--
ALTER TABLE `reporte_pregunta`
  MODIFY `id_reporte` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `respuesta`
--
ALTER TABLE `respuesta`
  MODIFY `id_respuesta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=153;

--
-- AUTO_INCREMENT de la tabla `sexo`
--
ALTER TABLE `sexo`
  MODIFY `id_sexo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tipo_usuario`
--
ALTER TABLE `tipo_usuario`
  MODIFY `id_tipo_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `partida`
--
ALTER TABLE `partida`
  ADD CONSTRAINT `FK_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `pregunta`
--
ALTER TABLE `pregunta`
  ADD CONSTRAINT `FK_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`),
  ADD CONSTRAINT `FK_estado` FOREIGN KEY (`id_estado`) REFERENCES `estado` (`id_estado`),
  ADD CONSTRAINT `FK_usuario_creador` FOREIGN KEY (`id_usuarioCreador`) REFERENCES `usuario` (`id_usuario`);

--
-- Filtros para la tabla `pregunta_vista`
--
ALTER TABLE `pregunta_vista`
  ADD CONSTRAINT `FK_pregunta1` FOREIGN KEY (`id_pregunta`) REFERENCES `pregunta` (`id_pregunta`),
  ADD CONSTRAINT `FK_usuario1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
