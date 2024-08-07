-- CREACIÓN DE LA BASE DE DATOS

CREATE DATABASE Reparto_Agua;

-- CREACIÓN DE LAS TABLAS

USE Reparto_Agua;

CREATE TABLE vehiculos (
    id_patente VARCHAR(7) NOT NULL UNIQUE,
    marca VARCHAR(20) NOT NULL,
    modelo VARCHAR(20) NOT NULL,
    anio INT NOT NULL,
    color VARCHAR(15) NOT NULL,
    fecha_compra DATE NOT NULL,
    fecha_venta DATE,
    PRIMARY KEY (id_patente)
);

CREATE TABLE localidades (
    id_localidad INT NOT NULL AUTO_INCREMENT UNIQUE,
    localidad VARCHAR(40) NOT NULL,
    provincia VARCHAR(40) NOT NULL,
    PRIMARY KEY (id_localidad)
);

CREATE TABLE domicilios (
    id_domicilio INT NOT NULL AUTO_INCREMENT UNIQUE,
    latitud NUMERIC(17 , 13 ) NULL,
    longitud NUMERIC(17 , 13 ) NULL,
    calle VARCHAR(100) NOT NULL,
    altura INT,
    barrio VARCHAR(30),
    otro VARCHAR(30),
    id_localidad INT,
    PRIMARY KEY (id_domicilio),
    FOREIGN KEY (id_localidad)
        REFERENCES localidades (id_localidad)
);

CREATE TABLE repartidores (
	id_repartidor		int			NOT NULL	AUTO_INCREMENT UNIQUE,
	apellido_nombre		varchar(100)	NOT NULL,
	DNI					int				NOT NULL,
	CUIT				BIGINT UNSIGNED	NOT NULL,
	fecha_nacimiento	date			NOT NULL,
	genero				varchar(1)	CONSTRAINT CHECK (genero IN('F', 'M', 'O')),
	id_domicilio		int				NOT NULL,
	estado_civil		varchar(30)	default 'Sin especificar' 
		CONSTRAINT CHECK (estado_civil IN('Soltero', 'Casado', 'Viudo', 'Sin especificar')),
	fecha_ingreso		date			NOT NULL,
	fecha_baja			date,
	telefono			varchar(20)		NOT NULL,
	email				varchar(50)		NOT NULL,
	PRIMARY KEY			(id_repartidor),
	FOREIGN KEY (id_domicilio) 
		REFERENCES domicilios(id_domicilio)
);	

CREATE TABLE repartos (
    id_reparto VARCHAR(3) NOT NULL UNIQUE,
    id_vehiculo_asignado VARCHAR(7),
    id_repartidor_asignado INT,
    PRIMARY KEY (id_reparto),
    FOREIGN KEY (id_vehiculo_asignado)
        REFERENCES vehiculos (id_patente),
    FOREIGN KEY (id_repartidor_asignado)
        REFERENCES repartidores (id_repartidor)
);

CREATE TABLE tipos_domicilios (
    id_tipo_domicilio VARCHAR(1) NOT NULL UNIQUE,
    tipo_domicilio VARCHAR(20) NOT NULL DEFAULT 'Real',
    PRIMARY KEY (id_tipo_domicilio)
);

CREATE TABLE tipos_clientes (
    id_tipo_cliente VARCHAR(1) NOT NULL UNIQUE,
    tipo_cliente VARCHAR(20) NOT NULL,
    PRIMARY KEY (id_tipo_cliente)
);

CREATE TABLE clientes (
	id_cliente			int				NOT NULL	AUTO_INCREMENT	unique,
	apellido_nombre		varchar(100)	NOT NULL,
	DNI					BIGINT UNSIGNED	NOT NULL,
	CUIT				BIGINT UNSIGNED	NOT NULL,
	fecha_nacimiento	date			NOT NULL,
	genero				varchar(1)	CONSTRAINT CHECK (genero IN('F', 'M', 'O')),
	estado_civil		varchar(30)	default 'Sin especificar' 
		CONSTRAINT CHECK (estado_civil IN('Soltero', 'Casado', 'Viudo', 'Sin especificar')),
	fecha_alta			date			NOT NULL,
	fecha_baja			date,
	id_tipo_cliente		varchar(1)		NOT NULL,
	telefono			varchar(20)		NOT NULL,
	email				varchar(100)	NOT NULL,
	PRIMARY KEY	(id_cliente),
	FOREIGN KEY (id_tipo_cliente) 
		REFERENCES tipos_clientes(id_tipo_cliente)
);

CREATE TABLE clientes_domicilios (
    id_cliente_domicilio INT NOT NULL AUTO_INCREMENT,
    id_cliente INT NOT NULL,
    id_tipo_domicilio VARCHAR(1) NOT NULL,
    id_domicilio INT NOT NULL,
    PRIMARY KEY (id_cliente_domicilio),
    FOREIGN KEY (id_domicilio)
        REFERENCES domicilios (id_domicilio),
    FOREIGN KEY (id_cliente)
        REFERENCES clientes (id_cliente)
);



CREATE TABLE rutas (
    id_ruta VARCHAR(6) NOT NULL,
    ruta VARCHAR(3) NOT NULL,
    id_reparto VARCHAR(3) NOT NULL,
    id_cliente INT NOT NULL,
    orden INT NOT NULL,
    PRIMARY KEY (id_ruta),
    FOREIGN KEY (id_reparto)
        REFERENCES repartos (id_reparto),
    FOREIGN KEY (id_cliente)
        REFERENCES clientes (id_cliente)
);


CREATE TABLE dispensers (
    id_dispenser INT NOT NULL AUTO_INCREMENT UNIQUE,
    nro_serie VARCHAR(20) NOT NULL,
    marca VARCHAR(20) NOT NULL,
    estado VARCHAR(10) NOT NULL,
    CONSTRAINT CHECK (estado IN (
		'Comodato' , 
		'Nuevo',
        'Usado',
        'P/ reparar',
        'Reservado',
        'Técnico',
        'Vendido')),
    fecha_compra DATE NOT NULL,
    fecha_baja DATE,
    PRIMARY KEY (id_dispenser)
);


CREATE TABLE clientes_dispensers (
    id_cliente_dispenser INT NOT NULL AUTO_INCREMENT,
    id_cliente INT,
    id_dispenser INT NOT NULL,
    fecha_movimiento DATE NOT NULL,
    movimiento VARCHAR(40) NOT NULL,
    CONSTRAINT CHECK (movimiento IN (
		'Devolución para cambio' , 
		'Baja cliente',
        'Entrega',
        'Entrega por cambio',
        'Reparado',
        'A reparar',
        'Descarte',
        'En reparación')),
    PRIMARY KEY (id_cliente_dispenser),
    FOREIGN KEY (id_cliente)
        REFERENCES clientes (id_cliente),
    FOREIGN KEY (id_dispenser)
        REFERENCES dispensers (id_dispenser)
);


CREATE TABLE productos (
    id_producto VARCHAR(3) NOT NULL UNIQUE,
    producto VARCHAR(20) NOT NULL UNIQUE,
    PRIMARY KEY (id_producto)
);

CREATE TABLE medios_pago (
    id_medio_pago VARCHAR(2) NOT NULL,
    medio_pago VARCHAR(20) NOT NULL,
    PRIMARY KEY (id_medio_pago)
);

CREATE TABLE operaciones (
    id_operacion VARCHAR(1) NOT NULL UNIQUE,
    operacion VARCHAR(20) NOT NULL UNIQUE,
    PRIMARY KEY (id_operacion)
);

CREATE TABLE precios (
    id_precio INT NOT NULL AUTO_INCREMENT UNIQUE,
    fecha_inicio DATE NOT NULL,
    id_producto VARCHAR(3) NOT NULL,
    id_tipo_cliente VARCHAR(1) NOT NULL,
    precio NUMERIC(20 , 2 ) DEFAULT 0,
    PRIMARY KEY (id_precio),
    FOREIGN KEY (id_producto)
        REFERENCES productos (id_producto),
    FOREIGN KEY (id_tipo_cliente)
        REFERENCES tipos_clientes (id_tipo_cliente)
);


CREATE TABLE transacciones (
	id_transaccion	int				NOT NULL 	AUTO_INCREMENT	UNIQUE,
	id_operacion	varchar(1)		NOT NULL,
	id_medio_pago	varchar(2)		NOT NULL,
	id_cliente		int				NOT NULL,
	id_producto		varchar(3),
    cantidad		int				NOT NULL DEFAULT 1,
	id_reparto		varchar(3)	,
	fecha			date			NOT NULL,
	nro_comprobante	int	,
	precio			numeric(20,2),
	PRIMARY KEY (id_transaccion),
	FOREIGN KEY (id_operacion) REFERENCES operaciones(id_operacion),
	FOREIGN KEY (id_medio_pago) REFERENCES medios_pago(id_medio_pago),
	FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
	FOREIGN KEY (id_producto) REFERENCES productos(id_producto),
	FOREIGN KEY (id_reparto) REFERENCES repartos(id_reparto)
);

ALTER TABLE TRANSACCIONES
CHANGE COLUMN nro_comprobante nro_comprobante INT;

-- CARGA DE LAS TABLAS (a continuar)

INSERT INTO vehiculos (id_patente, marca, modelo, anio, color, fecha_compra, fecha_venta )
VALUES	('AA351EF',	'Ford', 	'Ranger',	1996,	'Blanco',	'2017-03-14',	NULL )
, 		('OTR896',	'Ford',		'Ranger',	1996,	'Verde',	'2015-01-14',	NULL )
, 		('AC688WR',	'Iveco',	'Daily',	2008,	'Blanco',	'2019-06-19',	NULL )
,		('LED887',	'Ford',		'Ranger',	2003,	'Gris',		'2013-09-02',	'2015-01-05' )
;


INSERT INTO localidades (id_localidad, localidad, provincia )
VALUES	(NULL,	'Resistencia',		'Chaco' )
, 		(NULL,	'Puerto Vilelas',	'Chaco' )
,		(NULL,	'Barranqueras', 	'Chaco' )
,		(NULL,	'Puerto Tirol', 	'Chaco' )
,	  	(NULL,	'Fontana', 			'Chaco' )
,	  	(NULL,	'La Escondida', 	'Chaco' )
,	  	(NULL,	'Florencia', 		'Santa Fe' )
;



INSERT INTO domicilios (id_domicilio, latitud, longitud, calle, altura, barrio, otro, id_localidad )
VALUES (NULL, -27.3746298, -59.0986756, 'Mz. 30 Pc. 14', NULL, '49 Viviendas', NULL, 4 )
, (NULL, -27.3714065, -59.0974838, 'Martiniano Gomez', NULL, '2 Viviendas', NULL, 4 )
, (NULL, -27.3717883, -59.0972117, 'MZ 27 PC 16', NULL, '2 Viviendas', NULL, 4 )
, (NULL, -27.3721802, -59.0959424, 'Santiago Del Estero', NULL, NULL, NULL, 4 )
, (NULL, -27.3691087, -59.0947402, 'Puerto Tirol S/N', NULL, NULL, NULL, 4 )
, (NULL, -27.3716692, -59.0944434, 'Casa', 7, NULL, NULL, 4 )
, (NULL, -27.3726844, -59.0934762, 'Av. Coronel Avalos', 17, '17 De Octubre', NULL, 4 )
, (NULL, -27.3828718, -59.0905391, 'Mario Canella (Casi Av. Italia)', NULL, NULL, NULL, 4 )
, (NULL, -27.38169445, -59.08817981, 'Rivadavia', 15, NULL, NULL, 4 )
, (NULL, -27.3729397, -59.0877545, '12 De Octubre 0', NULL, NULL, NULL, 4 )
, (NULL, -27.387619, -59.0850907, 'Casa', 6, 'Evita  1 Viviendas', NULL, 4 )
, (NULL, -27.3875917, -59.084295, 'Casa 22', NULL, '25 Viviendas', NULL, 4 )
, (NULL, -27.4211887, -59.0553075, 'Mz 5 Pc 13', 13, NULL, NULL, 5 )
, (NULL, -27.4168825, -59.0495665, 'Mz 52 Pc 07', 7, '444 Viviendas', NULL, 5 )
, (NULL, -27.4559163, -59.0490473, 'Mz 69 pc 18 (Lago Argentino y Tapir)', 18, NULL, NULL, 1 )
, (NULL, -27.4162653, -59.048488, 'Mz 43 Pc 20', 2, '444 Viviendas', NULL, 5 )
, (NULL, -27.4590386, -59.0477222, 'Ciervo de los Pantanos', 2937, NULL, NULL, 1 )
, (NULL, -27.4135516, -59.0477151, 'Pasaje Rivadavia', 122, NULL, NULL, 1 )
, (NULL, -27.4564609, -59.0475957, 'Ch 135 Mz 40 Pc 20', 2, NULL, NULL, 1 )
, (NULL, -27.4222149, -59.0475844, 'Mz. 38 Pc.', NULL, 'Nueva Esperanza', NULL, 5 )
, (NULL, -27.4564991, -59.045778, 'Cataratas Del Iguazu', 3597, '16 Viviendas', NULL, 1 )
, (NULL, -27.410689, -59.0436928, 'Mz 15 Pc', 19, 'Independencia', NULL, 5 )
, (NULL, -27.4224953, -59.0421024, 'Av. Augusto Rey', 1300, 'Santa Ines', NULL, 1 )
, (NULL, -27.4133672, -59.0409443, 'Mz 92 Pc 3', NULL, '263 Viviendas', NULL, 5 )
, (NULL, -27.4033058, -59.0405558, '25 De Mayo', 6000, 'Independencia', NULL, 5 )
, (NULL, -27.4513715, -59.0395683, 'Mz. 92 Pc. 6', NULL, '16 Viviendas', NULL, 1 )
, (NULL, -27.4117087, -59.039216, 'Mz 84 Pc21', 21, '14 Viviendas', NULL, 5 )
, (NULL, -27.4118103, -59.0390495, 'Mz 84 Pc', 1, '263 Viviendas', NULL, 5 )
, (NULL, -27.4120494, -59.0387243, 'Mz. 84 Pc. 3', NULL, '263 Viviendas', NULL, 5 )
, (NULL, -27.4433146, -59.0378158, 'Chapadmalal', 2199, 'Barrio Los Pinos', NULL, 1 )
, (NULL, -27.4175892, -59.0368498, 'Av. Augusto Rey', 680, '444 Viviendas', NULL, 5 )
, (NULL, -27.4509711, -59.0366767, 'Barberan', NULL, NULL, NULL, 1 )
, (NULL, -27.4295728, -59.0348976, 'Mz. 09 Pc. 144', NULL, '124 Viviendas', NULL, 5 )
, (NULL, -27.4114441, -59.0345436, 'Brasil y Pasaje Peron', 4500, 'Villa Allin', NULL, 5 )
, (NULL, -27.4135611, -59.0335553, 'Mz. 77 Pc. 11', NULL, '125 Viviendas', NULL, 5 )
, (NULL, -27.4307512, -59.0328409, 'Pz. 24 Pc. 09', NULL, '124 Viviendas', NULL, 5 )
, (NULL, -27.426135, -59.0319536, 'Ch. 48 Mz. 02 Pc. 20', NULL, 'José Hernandez', NULL, 5 )
, (NULL, -27.4591959, -59.0310749, 'Cerca De La Terminal', NULL, NULL, NULL, 1 )
, (NULL, -27.4552605, -59.0306911, 'Isaias 2714', NULL, NULL, NULL, 1 )
, (NULL, -27.4104625, -59.0288104, 'Av. Cacique Pelayo', 41, 'Evita', NULL, 5 )
, (NULL, -27.426477, -59.0275051, 'Calle', 33, 'Villa Sarmiento', NULL, 5 )
, (NULL, -27.4118041, -59.0272455, 'Mz 16 Pc4', 4, '56 Viviendas', NULL, 5 )
, (NULL, -27.4308149, -59.02707, 'Av. Almirante Brown lote', 3656, NULL, NULL, 1 )
, (NULL, -27.4213457, -59.0264032, 'Mz. 109 Pc. 6', NULL, '8 Viviendas', NULL, 5 )
, (NULL, -27.4168653, -59.0252538, 'Av. 25 De Mayo', 4175, 'Villa Allin', NULL, 5 )
, (NULL, -27.4488555, -59.0251719, 'Mz 41 Pc 18', 18, NULL, NULL, 3 )
, (NULL, -27.4277958, -59.0250154, 'Ch 44 Mz 54 Pc10', 1, NULL, NULL, 5 )
, (NULL, -27.4195962, -59.0248996, 'Ch. 43 Mz. 6 Pc. 08', NULL, 'Villa Allin', NULL, 5 )
, (NULL, -27.4254708, -59.0248591, 'Casa 174 mz 79', NULL, '18 Viviendas', NULL, 5 )
, (NULL, -27.4561705, -59.0245623, 'Av. Mac Lean', 2347, NULL, NULL, 1 )
, (NULL, -27.425597, -59.0227708, 'Santiago Del Estero', 3500, NULL, NULL, 5 )
, (NULL, -27.4523931, -59.0213337, 'Mz 57 Pc 27', 27, NULL, NULL, 1 )
, (NULL, -27.4216561, -59.0199831, 'Av. 25 De Mayo 3550', 3550, 'Villa Oro', NULL, 5 )
, (NULL, -27.4251077, -59.0196867, 'Mz. 11 Pc. 18', NULL, 'Villa Oro (45 Viviendas)', NULL, 5 )
, (NULL, -27.457797, -59.0195455, 'Av. Mac Lean', 26, NULL, 'Centro Comercial Santa Ines', 1 )
, (NULL, -27.4591291, -59.0171292, 'Mz. 98 Casa 959', NULL, 'Santa Ines', NULL, 1 )
, (NULL, -27.4602661, -59.0166405, 'Mz 101 Casa 909', NULL, 'Santa Ines', NULL, 1 )
, (NULL, -27.4530743, -59.0149982, 'S/D Nuñez Estela - Villa Don Enrique', NULL, NULL, NULL, 1 )
, (NULL, -27.4570692, -59.0147701, 'Complejo Jaime Zapata', NULL, NULL, NULL, 1 )
, (NULL, -27.4509564, -59.0147285, 'Mc Clean Y Marconi S/N', NULL, NULL, NULL, 1 )
, (NULL, -27.4445516, -59.0142445, 'Mz. 86 Pc. 8 Casa 7', NULL, 'España', NULL, 1 )
, (NULL, -27.4462269, -59.0137668, 'Mz 25 Pc 2', 2, 'Provincias Unidas', NULL, 1 )
, (NULL, -27.4495518, -59.0135219, 'Av. Urquiza', 1988, NULL, NULL, 1 )
, (NULL, -27.449564, -59.0134112, 'Av. Mac Lean', 152, NULL, NULL, 1 )
, (NULL, -27.4530855, -59.0133132, '20 De Junio', 13, 'Villa Don Enrique', NULL, 1 )
, (NULL, -27.4494538, -59.0131868, 'Av. Mac Lean', 1435, 'La Liguria', NULL, 1 )
, (NULL, -27.4278897, -59.0129626, 'Av. 25 De Mayo 2903 - San Javier', NULL, NULL, NULL, 1 )
, (NULL, -27.4837269, -59.012459, 'Av. Wilde', 669, 'Emercenciano', NULL, 1 )
, (NULL, -27.4810342, -59.0124439, 'Av. San Martin', 33, 'Emerenciano', NULL, 1 )
, (NULL, -27.4692953, -59.0116127, 'Necochea', 2535, 'Villa Don Alberto', NULL, 1 )
, (NULL, -27.4275961, -59.0109304, 'Lote', 216, 'Vº Elba', NULL, 1 )
, (NULL, -27.4357935, -59.0104538, 'Salta 2275', NULL, NULL, NULL, 1 )
, (NULL, -27.4223956, -59.0099486, 'Ruta 11 Km.', 16, NULL, NULL, 1 )
, (NULL, -27.461297, -59.0077353, 'Olegario Andrade', 566, NULL, NULL, 1 )
, (NULL, -27.4214439, -59.0076663, 'Ruta Nacional Nº 11 Km', 1006, NULL, NULL, 1 )
, (NULL, -27.4412851, -59.0076599, 'Mansilla', 564, NULL, NULL, 1 )
, (NULL, -27.4583762, -59.0073054, 'Av. Marconi', 725, 'Villa Progreso', NULL, 1 )
, (NULL, -27.4435938, -59.0067695, 'Av. Mac Lean 686', NULL, NULL, NULL, 1 )
, (NULL, -27.4671715, -59.0064529, 'Fortin Alvarado', 615, NULL, NULL, 1 )
, (NULL, -27.4451325, -59.0064369, 'Fray Rossi', 779, 'Villa Adelanto', NULL, 1 )
, (NULL, -27.46905803, -59.00629421, 'Av. Alberdi', 2201, 'La Liguria', NULL, 1 )
, (NULL, -27.4627015, -59.0061467, 'Av. Urquiza', 5611, NULL, NULL, 1 )
, (NULL, -27.4412077, -59.0058786, 'Uriburi', 496, 'Villa Universidad', NULL, 1 )
, (NULL, -27.4402943, -59.0058463, 'Santiago Del Estero', 1753, 'Villa Seitor', NULL, 1 )
, (NULL, -27.4680904, -59.0054219, 'Alberdi', 2135, 'Centenario', NULL, 1 )
, (NULL, -27.4772961, -59.0049607, 'Ch 209 Mz 98 Pc 25', 25, '24 Viviendas Palermo', NULL, 1 )
, (NULL, -27.4355217, -59.0046772, 'Av. 25 De Mayo', 225, NULL, NULL, 1 )
, (NULL, -27.4356981, -59.0045312, 'Av. 25 de Mayo', 2005, 'Villa Alta', NULL, 1 )
, (NULL, -27.4386046, -59.0042308, 'JUAN DOMINGO PERON', 1775, 'Provincias Unidas', NULL, 1 )
, (NULL, -27.4852264, -59.0038986, 'Mz. 16 Pc. 25', NULL, '17 De Octubre', NULL, 1 )
, (NULL, -27.4693237, -59.003142, 'Jose María Paz', 265, NULL, NULL, 1 )
, (NULL, -27.4774859, -59.0026397, 'Pasaje San Lorenzo', 2562, 'Palermo 2', NULL, 1 )
, (NULL, -27.4373069, -59.0020446, 'San Carlos SN', NULL, NULL, NULL, 1 )
, (NULL, -27.4506986, -59.0014536, 'Av. Alvear 865', NULL, NULL, NULL, 1 )
, (NULL, -27.4375898, -59.0007786, 'Santa Fe', 151, NULL, NULL, 1 )
, (NULL, -27.4370457, -59.0007114, 'M. T. De Alvear', 1683, NULL, NULL, 1 )
, (NULL, -27.4561371, -59.0005553, 'Av. Belgrano', 1131, NULL, NULL, 1 )
, (NULL, -27.444115, -59.000269, 'Padre Sena', 337, 'Villa Alta', NULL, 1 )
, (NULL, -27.4514567, -58.999923, 'Echeverria', 628, NULL, NULL, 1 )
, (NULL, -27.4074553, -58.9998586, 'Lote', 216, 'Vº Elba', NULL, 1 )
, (NULL, -27.4326844, -58.9992515, 'Pasaje Palamedi', 1865, 'Villa Chica', NULL, 1 )
, (NULL, -27.43280942, -58.99914713, 'Pasaje Entre Rios', 1845, NULL, NULL, 1 )
, (NULL, -27.4438016, -58.9982025, 'Juan D. Peron Y Calle 3', NULL, NULL, NULL, 1 )
, (NULL, -27.4599945, -58.9981957, 'Santa Maria De Oro', 1255, NULL, NULL, 1 )
, (NULL, -27.4600228, -58.9981084, 'Santa Maria De Oro', 1245, NULL, NULL, 1 )
, (NULL, -27.44739, -58.9976266, 'Santiago Del Estero', 866, NULL, NULL, 1 )
, (NULL, -27.4473936, -58.9975929, 'Santiago Del Estero 864', NULL, NULL, NULL, 1 )
, (NULL, -27.43294388, -58.99758613, 'Av. Rivadavia', 1752, NULL, NULL, 1 )
, (NULL, -27.45675968, -58.99755253, 'Molina', 274, NULL, NULL, 1 )
, (NULL, -27.45688593, -58.99743908, 'Molina', 26, NULL, NULL, 1 )
, (NULL, -27.4029416, -58.9972785, 'Ruta 11 Km.', 1009, 'Villa Cristo Rey', NULL, 1 )
, (NULL, -27.4430838, -58.9972283, 'Julio A. Roca 1100', NULL, NULL, NULL, 1 )
, (NULL, -27.4527733, -58.9970362, 'Av. Belgrano 701', NULL, NULL, NULL, 1 )
, (NULL, -27.4542217, -58.9962164, 'Ch 101 Mz 28 Pc 12', 12, NULL, NULL, 1 )
, (NULL, -27.4323616, -58.996193, 'Jose Ameri', 627, 'Villa Chica', NULL, 1 )
, (NULL, -27.4448771, -58.9961502, 'Av. 25 de mayo', 821, NULL, NULL, 1 )
, (NULL, -27.4558901, -58.9955849, 'Av. Alvear', 235, NULL, NULL, 1 )
, (NULL, -27.4565647, -58.9943233, 'Alvear Y Santa Maria De Oro', NULL, NULL, NULL, 1 )
, (NULL, -27.44882729, -58.99421665, 'Tuyuti', 25, NULL, NULL, 1 )
, (NULL, -27.4654593, -58.9942144, 'Mz 6 Pc 35', 35, '2 De Agosto', NULL, 1 )
, (NULL, -27.433881, -58.9937491, 'Catamarca', 1487, 'Villa Perrando', NULL, 1 )
, (NULL, -27.47078305, -58.99338929, 'Av. Edison', 844, NULL, 'Dpto G PB', 1 )
, (NULL, -27.4574764, -58.993388, 'Av. Castelli', 13, 'Centro', NULL, 1 )
, (NULL, -27.45706325, -58.99337683, 'Av. Alberdi', 794, NULL, NULL, 1 )
, (NULL, -27.464339, -58.9932048, 'Dodero', 454, NULL, NULL, 1 )
, (NULL, -27.483421, -58.9932036, 'Mza 19 Qta 4 Dpto 02/02', 2, 'Guiraldes', NULL, 1 )
, (NULL, -27.447078, -58.9931175, 'Av. Wilde', 43, NULL, NULL, 1 )
, (NULL, -27.4835816, -58.9929239, 'Mz 19 Dpto 01 Qta 4', 4, 'Guiraldes', NULL, 1 )
, (NULL, -27.460119, -58.9925944, 'Leandro N. Alem', 242, 'Villa Centenario', NULL, 1 )
, (NULL, -27.4532913, -58.9924488, 'Vedia', 484, NULL, NULL, 1 )
, (NULL, -27.4335147, -58.9921239, 'Av. Lavalle', 1415, 'Villa Perrando', NULL, 1 )
, (NULL, -27.4532377, -58.9920607, 'Vedia', 475, NULL, NULL, 1 )
, (NULL, -27.4460794, -58.9920231, 'Av. 25 De Mayo', 64, NULL, NULL, 1 )
, (NULL, -27.3787531, -58.9920053, 'Ruta 11 Km', 1011, NULL, NULL, 1 )
, (NULL, -27.4485331, -58.9919398, 'Av. 25 de mayo', 343, NULL, NULL, 1 )
, (NULL, -27.4529201, -58.9918648, 'Vedia', 417, 'Centro', NULL, 1 )
, (NULL, -27.4593868, -58.9918245, 'Av. Castelli 214', NULL, NULL, NULL, 1 )
, (NULL, -27.4493843, -58.9913973, 'Donovan', 160, 'Villa Odorico', NULL, 1 )
, (NULL, -27.4404573, -58.9906679, 'San Buenaventura del Montealto', 445, 'Villa Donovan', NULL, 1 )
, (NULL, -27.4420448, -58.9906585, 'Av. Avalos', 351, 'Centro', NULL, 1 )
, (NULL, -27.4540359, -58.9901375, 'Santiago Del Estero 18', NULL, NULL, NULL, 1 )
, (NULL, -27.4509797, -58.9899952, 'Juan Domingo Peron', 22, NULL, NULL, 1 )
, (NULL, -27.4465024, -58.9898324, 'Av. Wilde', 99, 'Microcentro', NULL, 1 )
, (NULL, -27.4525481, -58.9897548, 'Santa María De Oro', 277, 'Centro', NULL, 1 )
, (NULL, -27.456824, -58.989704, 'Pasaje Del Teatro', 63, 'Centro', NULL, 1 )
, (NULL, -27.44724622, -58.98896776, 'Marcelo T De Alvear', 384, NULL, NULL, 1 )
, (NULL, -27.4361774, -58.9889545, 'Av. Lavalle', 176, NULL, NULL, 1 )
, (NULL, -27.4838744, -58.9889363, 'Mz 7 Pc 1 Qta2', 2, 'Bº Guiraldes', NULL, 1 )
, (NULL, -27.4428867, -58.9886988, 'Entre Ríos', 656, NULL, NULL, 1 )
, (NULL, -27.4510494, -58.9886427, 'Julio A Roca', 127, NULL, NULL, 1 )
, (NULL, -27.4871747, -58.9883355, 'Mz35 Pc7', NULL, 'Upcp', NULL, 1 )
, (NULL, -27.48726169, -58.98814439, 'B° Upcp', NULL, 'Upcp', NULL, 3 )
, (NULL, -27.4366727, -58.9880985, 'Av. Lavalle', 1, NULL, NULL, 1 )
, (NULL, -27.4544704, -58.9880204, 'Obligado', 127, 'Centro', NULL, 1 )
, (NULL, -27.448753, -58.987544, 'Pueyrredon', 97, '17 Viviendas', NULL, 1 )
, (NULL, -27.4381979, -58.9873684, 'Av. Lavalle', 826, NULL, NULL, 1 )
, (NULL, -27.4493833, -58.987211, 'Marcelo T de Alvear', 145, NULL, NULL, 1 )
, (NULL, -27.4765256, -58.98699, 'Mz 93 Uf 3 S/N', 3, 'Italoargentino', NULL, 1 )
, (NULL, -27.4539981, -58.9863409, 'José María Paz', 170, NULL, NULL, 1 )
, (NULL, -27.4538333, -58.9862773, 'Jose Maria Paz', 170, NULL, NULL, 1 )
, (NULL, -27.3952611, -58.9860699, 'San Pablo Y Misiones', NULL, NULL, NULL, 5 )
, (NULL, -27.4409115, -58.9853703, 'Pje Wilde', 876, NULL, NULL, 1 )
, (NULL, -27.4882904, -58.985248, 'Urquiza', 222, 'San Valentin', NULL, 1 )
, (NULL, -27.4500946, -58.9850951, 'Av. Sarmiento', 146, NULL, NULL, 1 )
, (NULL, -27.4506107, -58.984928, 'Pellegrini', 280, 'Malvinas', NULL, 3 )
, (NULL, -27.4721937, -58.9846195, 'Lestani', 1438, 'Amtter', 'Mz 72 Pc 6', 1 )
, (NULL, -27.4719102, -58.9845774, 'Dr. Arturo Lestani (Mz 56 Pc 16)', 145, 'Llaponagat', NULL, 1 )
, (NULL, -27.4688606, -58.9843182, 'Mz. 58 Pc. 4 Uf. 1', NULL, 'Llaponagat', NULL, 1 )
, (NULL, -27.45358939, -58.98417663, 'Roque Saenz Peña', 18, NULL, NULL, 1 )
, (NULL, -27.452976, -58.9840662, 'Av. 9 de julio', 259, NULL, NULL, 1 )
, (NULL, -27.4522619, -58.9840473, 'Pellegrini', 62, NULL, NULL, 1 )
, (NULL, -27.4547718, -58.9836409, 'Colon', 66, 'Juan B. Alverdi', NULL, 1 )
, (NULL, -27.45399982, -58.98347417, 'Av. 9 De Julio', 360, NULL, NULL, 1 )
, (NULL, -27.4019577, -58.983056, 'Mz. 11 Casa 6', NULL, 'Mapic 2', NULL, 1 )
, (NULL, -27.4559346, -58.9830509, 'Av. San Martín', 118, 'La Liguria', NULL, 1 )
, (NULL, -27.425469, -58.9824497, 'Padre Juan Nicolau Nº 354 Bº La Isla Villa Rio Negro', NULL, NULL, NULL, 1 )
, (NULL, -27.457683, -58.9823354, 'Arturo Illia', 655, NULL, NULL, 1 )
, (NULL, -27.4441878, -58.9820804, 'Catamarca', 197, 'Microcentro', NULL, 1 )
, (NULL, -27.4538419, -58.9819063, 'Irigoyen', 448, NULL, NULL, 1 )
, (NULL, -27.44398373, -58.98189969, 'Pueyrredon', 72, NULL, NULL, 1 )
, (NULL, -27.4901499, -58.9806814, 'Mz 80 Pc 06', 6, '24 Viviendas', NULL, 1 )
, (NULL, -27.4520859, -58.9805794, 'French', 278, 'Centro', NULL, 1 )
, (NULL, -27.4509046, -58.9801296, 'Italia', 52, 'Los Troncos', NULL, 1 )
, (NULL, -27.4668497, -58.9800223, 'Tuyuti', 1352, 'Villa Itati', NULL, 1 )
, (NULL, -27.489251, -58.9799192, 'Pasaje Coco Marola', 24, NULL, NULL, 1 )
, (NULL, -27.47344955, -58.97925328, 'Carlos Boggio', 1786, NULL, NULL, 1 )
, (NULL, -27.4743657, -58.9789845, 'Pasaje Boggio', 1857, 'Villa Centenario', NULL, 1 )
, (NULL, -27.4625073, -58.9788539, 'Obligado', 1131, NULL, NULL, 1 )
, (NULL, -27.4435806, -58.978811, 'Guemes', 1050, NULL, NULL, 1 )
, (NULL, -27.4472983, -58.978411, 'Cordoba', 217, NULL, NULL, 1 )
, (NULL, -27.4419846, -58.9780814, 'Alice Le Seige', 22, NULL, NULL, 1 )
, (NULL, -27.4015285, -58.9779836, 'Mz. 21 Pc. 22', NULL, '162 Viviendas', NULL, 1 )
, (NULL, -27.4712682, -58.9779831, 'Goitia 627 Tiro Federal', NULL, NULL, NULL, 1 )
, (NULL, -27.4456446, -58.9777586, 'Lopez y Planes', 986, 'Centro', NULL, 1 )
, (NULL, -27.4210158, -58.9776977, 'Fortin Warnes', 2798, NULL, NULL, 1 )
, (NULL, -27.4497768, -58.97756788, 'Saavedra Nº 420', NULL, NULL, NULL, 1 )
, (NULL, -27.4108838, -58.9774804, 'Autovia Gobernador Tenev', 15, 'Ex Textil Abraham', 'Km. 15', 1 )
, (NULL, -27.45979607, -58.97689563, 'Av. 9 De Julio', 1050, NULL, NULL, 1 )
, (NULL, -27.4640408, -58.9763215, 'Duvivier', 254, NULL, NULL, 1 )
, (NULL, -27.46483872, -58.97620219, 'Obligado 1451', NULL, NULL, NULL, 1 )
, (NULL, -27.46483454, -58.97618468, 'Obligado', 1451, 'Central Norte', NULL, 1 )
, (NULL, -27.4607316, -58.976018, 'Av. 9 de Julio y Nicolás Rojas Acosta', NULL, 'Villa Chica', NULL, 1 )
, (NULL, -27.4731732, -58.9759557, 'Av. CastellI', 1946, NULL, NULL, 5 )
, (NULL, -27.4609329, -58.9755265, 'Av. 9 De Julio Y Calle 4', NULL, NULL, NULL, 1 )
, (NULL, -27.4615502, -58.9751053, 'Av. 9 De Julio', 13, NULL, NULL, 1 )
, (NULL, -27.5017944, -58.9749557, 'Av. Soberanía Nacional', 3971, '76 Viviendas', NULL, 3 )
, (NULL, -27.4178531, -58.9746149, 'Ch 107 Mz 10 Pc 22', 22, NULL, NULL, 1 )
, (NULL, -27.4591218, -58.9740242, 'Brown', 1210, 'Central', NULL, 1 )
, (NULL, -27.443772, -58.97373, 'Alice Lesaige', 26, 'Villa San Martin', NULL, 1 )
, (NULL, -27.4499556, -58.9736775, 'Laprida', 661, NULL, NULL, 1 )
, (NULL, -27.4839328, -58.973233, 'Viviano Meza', 1194, NULL, NULL, 1 )
, (NULL, -27.4955447, -58.9731081, 'Mz. 27 Pc. 12 Ch. 295 - 60 Viviendas Uom.', NULL, NULL, NULL, 1 )
, (NULL, -27.4770987, -58.9728261, 'Av. Urquiza 870', NULL, NULL, NULL, 1 )
, (NULL, -27.4387425, -58.9726732, 'Policia De Territorios', 136, NULL, NULL, 1 )
, (NULL, -27.4634265, -58.9724755, 'Av. 9 de Julio', 1585, NULL, NULL, 1 )
, (NULL, -27.41779996, -58.97173165, 'Av. Sabin', 2929, NULL, NULL, 1 )
, (NULL, -27.4772328, -58.9711036, 'Av. Castelli', 2499, 'Villa Luzuriaga', NULL, 1 )
, (NULL, -27.4818299, -58.9695079, 'Castelan y Boggio', 135, 'Villa Luzuriaga', NULL, 1 )
, (NULL, -27.4661381, -58.9694028, 'Av. 9 de Julio', 1820, NULL, NULL, 1 )
, (NULL, -27.5045658, -58.9687311, 'Mz. 33 Pc. 15', NULL, '56 Viviendas', NULL, 3 )
, (NULL, -27.4797729, -58.9687046, 'Castelli Y Calle 20', NULL, NULL, NULL, 1 )
, (NULL, -27.4704771, -58.9686224, 'Alice Lesaige', 1465, NULL, NULL, 1 )
, (NULL, -27.4670556, -58.9683561, 'Av. 9 de Julio', 1999, 'Ex Textil Abraham', 'Km. 15', 1 )
, (NULL, -27.4847146, -58.9681435, 'La Rubita', NULL, NULL, NULL, 1 )
, (NULL, -27.414052, -58.9679198, 'Paseo Hiper Libertad', NULL, NULL, NULL, 1 )
, (NULL, -27.4140928, -58.967555, 'Ruta Nicolas Avellaneda Y Av. Sabin', NULL, NULL, NULL, 1 )
, (NULL, -27.4843436, -58.9664978, 'Marcelino Castelan', 1265, 'Villa Luzuriaga', NULL, 1 )
, (NULL, -27.4700063, -58.9662971, 'Ing. Schur', 57, NULL, NULL, 1 )
, (NULL, -27.469076, -58.9660393, 'Av. 9 De Julio', 2529, 'Villa Donovan', NULL, 1 )
, (NULL, -27.4396515, -58.9639678, 'Celmira G Cabral', 571, NULL, NULL, 1 )
, (NULL, -27.50985749, -58.96293447, 'Mz 14 Casa 10', NULL, 'Los Milagros', NULL, 3 )
, (NULL, -27.4992247, -58.962263, 'Don Orione', 55, NULL, NULL, 3 )
, (NULL, -27.4955914, -58.9613365, 'Mz.105 Pc. 8', NULL, '12 Viviendas Utdyc', NULL, 3 )
, (NULL, -27.4867376, -58.960874, 'Av. Castelli Entre 20 Y 30', NULL, NULL, NULL, 1 )
, (NULL, -27.4107595, -58.9608453, 'mz 6 pc 14', 14, 'Santo Domingo', NULL, 1 )
, (NULL, -27.4946665, -58.9606923, 'Toledo', 4265, NULL, NULL, 3 )
, (NULL, -27.4979492, -58.9599424, 'Mz. 81 Pc. 12', NULL, '2 Viviendas', NULL, 3 )
, (NULL, -27.512824, -58.959929, 'Soberania', NULL, 'Los Milagros', NULL, 3 )
, (NULL, -27.502211, -58.9592236, 'Fortin Warnes Y Nicolas R. Acosta', NULL, '11 Viviendas', NULL, 3 )
, (NULL, -27.5023478, -58.9589369, 'Mz10 Pc12 110', 12, NULL, NULL, 3 )
, (NULL, -27.4954175, -58.9583222, 'Toledo Y Yatay', NULL, NULL, NULL, 3 )
, (NULL, -27.4891053, -58.9580722, 'Castelli Casi España', NULL, NULL, NULL, 1 )
, (NULL, -27.49706623, -58.95797961, 'Av. Toledo', 455, '2 Viviendas', NULL, 3 )
, (NULL, -27.490927, -58.9578871, 'Sauce Y Alem', NULL, NULL, NULL, 3 )
, (NULL, -27.5021457, -58.9578675, 'Nicolas R. Acosta y Edison', NULL, NULL, NULL, 3 )
, (NULL, -27.4743394, -58.9578663, 'Irigoyen M3035 Mz 62 Pc 4', 4, 'Vial', NULL, 1 )
, (NULL, -27.4980814, -58.9575458, 'Ceweluk Miguel S/N', NULL, NULL, NULL, 3 )
, (NULL, -27.5004962, -58.9571262, 'Pje. Carlos Hardy', 4850, NULL, NULL, 3 )
, (NULL, -27.5006729, -58.9563356, 'Mz. 113 Pc. 12', NULL, '237 Viviendas', NULL, 3 )
, (NULL, -27.4955031, -58.9560922, 'Jose Marmol Y Algarrobo', NULL, '5 Viviendas', NULL, 3 )
, (NULL, -27.49272375, -58.95597224, 'Timbo', 4470, 'Las Malvinas', NULL, 3 )
, (NULL, -27.4983489, -58.9553526, 'Mz 64 Pc 9', NULL, '5 Viviendas', NULL, 3 )
, (NULL, -27.4870692, -58.9550702, 'Rodriguez Peña', 4120, 'Mujeres Argentinas', NULL, 1 )
, (NULL, -27.493533, -58.9548124, 'Gomez Marcelo', NULL, NULL, NULL, 3 )
, (NULL, -27.4242397, -58.9524883, 'Pasaje Italia', 455, 'Villa Fabiana Norte', NULL, 1 )
, (NULL, -27.4876199, -58.9517328, 'Arturo Illia', 446, NULL, NULL, 3 )
, (NULL, -27.4928178, -58.9507352, 'Tatane', 630, NULL, NULL, 3 )
, (NULL, -27.4861189, -58.9505677, 'Arturo Illia', 4287, 'Las Malvinas', NULL, 3 )
, (NULL, -27.4187165, -58.9504718, 'Av. Sarmiento', 45, NULL, NULL, 1 )
, (NULL, -27.4892775, -58.9503165, 'Lapacho', 399, NULL, NULL, 3 )
, (NULL, -27.4815649, -58.9499167, 'Aristobulos De Valle', 3960, NULL, NULL, 1 )
, (NULL, -27.4841553, -58.9493478, 'Av. 9 de julio', 4202, 'Las Malvinas', NULL, 3 )
, (NULL, -27.4873594, -58.9492003, 'Arturo Illia', 444, NULL, NULL, 3 )
, (NULL, -27.4942152, -58.9490039, 'Nicolas R. Acosta', 62, 'Las Malvinas', NULL, 3 )
, (NULL, -27.4849001, -58.9486723, 'Av. 9 De Julio', 4302, NULL, NULL, 3 )
, (NULL, -27.4858334, -58.9480928, 'Irigoyen', 4545, NULL, NULL, 3 )
, (NULL, -27.4651232, -58.9478384, 'Pc. 121 Uf. 14', NULL, 'Mujeres Argentinas', NULL, 1 )
, (NULL, -27.485854, -58.9473879, 'Av. 9 De Julio', 4440, NULL, NULL, 3 )
, (NULL, -27.4897618, -58.9473566, 'Tatane', 256, NULL, NULL, 3 )
, (NULL, -27.4880632, -58.947297, 'Algarrobo', 140, NULL, NULL, 3 )
, (NULL, -27.4890555, -58.9466728, 'Tatane S/N', NULL, NULL, NULL, 3 )
, (NULL, -27.4853376, -58.9462315, 'Irigoyen', 434, NULL, NULL, 3 )
, (NULL, -27.4807079, -58.9462159, 'Sabatini', 279, NULL, NULL, 3 )
, (NULL, -27.5104572, -58.9459018, 'Mz 82 Pc18', 18, '15 Viviendas', NULL, 2 )
, (NULL, -27.4849234, -58.9458536, 'Pirovano', 4618, NULL, NULL, 3 )
, (NULL, -27.4857008, -58.9458376, 'Hipolito Irigoyen', 4520, NULL, NULL, 3 )
, (NULL, -27.4868254, -58.9456728, 'Chile', 26, NULL, NULL, 3 )
, (NULL, -27.4877907, -58.9452897, 'Av. 9 de Julio', 4690, 'Mapic 2', NULL, 1 )
, (NULL, -27.4931404, -58.9448781, 'Nicolas R. Acosta', 205, 'Los Naranjitos', NULL, 6 )
, (NULL, -27.4905454, -58.9446942, 'Nicolas R. Acosta', 150, NULL, NULL, 3 )
, (NULL, -27.4834665, -58.9446022, 'Paraguay', 4557, 'Villa Florida', NULL, 3 )
, (NULL, -27.48983248, -58.94456109, 'Juan B Justo', 4880, NULL, NULL, 3 )
, (NULL, -27.4842593, -58.9445316, 'Bolivia', 270, NULL, NULL, 3 )
, (NULL, -27.4926745, -58.9444634, 'Nicolas R. Acosta', 200, NULL, NULL, 3 )
, (NULL, -27.5165953, -58.9444232, 'Mz 14 Pc 8', 8, 'San Jose', NULL, 2 )
, (NULL, -27.5106536, -58.9440755, 'Saavedra Y Facundo Quiroga', NULL, 'Lote 22', NULL, 2 )
, (NULL, -27.5089523, -58.9440639, 'Mz 87 Pc 15', 15, 'Barrio 48 Viviendas', NULL, 2 )
, (NULL, -27.49130956, -58.9439762, 'Nicolas R. Acosta', 205, NULL, 'Parque Industrial Ex Ucal', 3 )
, (NULL, -27.4831263, -58.9436583, 'Diagonal Eva Peron', 335, NULL, NULL, 1 )
, (NULL, -27.4859048, -58.943607, 'Brown', 4665, NULL, NULL, 3 )
, (NULL, -27.5128676, -58.9435908, 'Santa Lucia', 612, NULL, NULL, 2 )
, (NULL, -27.491875, -58.943542, 'Parque Industrial Barranqueras - Ex Ucal', NULL, 'Centro', NULL, 3 )
, (NULL, -27.4920217, -58.9434102, 'Nicolas R. Acosta', 205, NULL, 'Parque Industrial Ex Ucal', 3 )
, (NULL, -27.4895806, -58.9432506, 'Av. 9 De Julio', 4900, NULL, NULL, 3 )
, (NULL, -27.5069796, -58.943003, 'Mz 50 Pc 20 Cs 17', 17, '6 Viviendas', NULL, 2 )
, (NULL, -27.4889055, -58.9429987, 'San Martín', 49, 'Villa Florida', NULL, 3 )
, (NULL, -27.4870528, -58.9426755, 'Brown', 48, 'Villa Florida', NULL, 3 )
, (NULL, -27.5093863, -58.942257, 'Av. San Martin', 800, NULL, NULL, 2 )
, (NULL, -27.4873219, -58.9421751, 'Pirovano', 475, NULL, NULL, 3 )
, (NULL, -27.5132681, -58.9421567, 'Av. San Martin', 1100, NULL, NULL, 2 )
, (NULL, -27.5124997, -58.9420602, 'Av. San Martin', NULL, NULL, NULL, 2 )
, (NULL, -27.506058, -58.9417543, 'Francisco Ramirez', NULL, NULL, NULL, 2 )
, (NULL, -27.5065525, -58.9412573, 'Mendoza Y Peñaloza', NULL, '6 Viv', '0', 2 )
, (NULL, -27.4880681, -58.9408149, 'Brown', 498, NULL, NULL, 3 )
, (NULL, -27.5109717, -58.940652, 'Pio XII', 425, 'Guemes', NULL, 2 )
, (NULL, -27.4998111, -58.9405911, 'Mosconi', NULL, NULL, NULL, 3 )
, (NULL, -27.5114302, -58.9404573, 'Pasaje', 4, 'Guemes', NULL, 2 )
, (NULL, -27.4828648, -58.9403053, 'Saavedra', 457, NULL, NULL, 3 )
, (NULL, -27.5103964, -58.9400822, 'Pio Xii', 346, NULL, NULL, 2 )
, (NULL, -27.50971316, -58.94003542, 'Victoria', 674, 'Molino', NULL, 2 )
, (NULL, -27.4847102, -58.9398259, 'Don Orione', 55, NULL, NULL, 3 )
, (NULL, -27.482987, -58.9397416, 'Diagonal S/N', NULL, NULL, NULL, 3 )
, (NULL, -27.4918255, -58.9396122, 'Pasaje San Martin', 527, 'Villa Emilia', NULL, 3 )
, (NULL, -27.5162877, -58.9393163, 'Constitucion', 40, NULL, NULL, 2 )
, (NULL, -27.493015, -58.938647, 'Fray Mocho 40', 40, NULL, NULL, 3 )
, (NULL, -27.49238, -58.9380019, 'Hipolito Yrigoyen', 54, 'Villa Emilia', NULL, 3 )
, (NULL, -27.5197253, -58.9378616, 'Av. Juan Manuel De Rosas Y 1 De Mayo', NULL, NULL, NULL, 2 )
, (NULL, -27.4199535, -58.937531, 'Av. Velez Sarfield', 479, 'Villa Fabiana', NULL, 1 )
, (NULL, -27.48652193, -58.93751648, 'Paraguay', 5054, NULL, NULL, 3 )
, (NULL, -27.49701785, -58.93737525, 'Villa Forestacion 5', NULL, NULL, NULL, 3 )
, (NULL, -27.4819596, -58.9373549, 'Av. Laprida', 4787, NULL, NULL, 3 )
, (NULL, -27.48240955, -58.93727098, 'Don Orione', 78, 'Villa Rossi', NULL, 3 )
, (NULL, -27.4968305, -58.9371708, 'Mosconi', 115, NULL, NULL, 3 )
, (NULL, -27.4862636, -58.9371543, 'Av. San Martin', 455, 'Aimara', NULL, 3 )
, (NULL, -27.5122206, -58.936973, 'Pasaje Yatay', NULL, '98 Viviendas', 'Mz. 121 Pc. 7', 3 )
, (NULL, -27.4866599, -58.9350557, 'Miguel Cane', 625, 'Villa Emilia', NULL, 3 )
, (NULL, -27.4854351, -58.9331388, 'Av. Laprida', 5208, NULL, NULL, 3 )
, (NULL, -27.4891021, -58.9326865, 'Saavedra 5485', 5485, NULL, NULL, 3 )
, (NULL, -27.4862387, -58.9326172, 'Av. Laprida', 531, NULL, NULL, 3 )
, (NULL, -27.4813744, -58.9326057, 'Joaquin V Gonzalez', 1080, NULL, NULL, 3 )
, (NULL, -27.4952513, -58.9321607, 'Av. del Puerto Sector:B Nave 8', 235, NULL, NULL, 5 )
, (NULL, -27.4867268, -58.931993, 'Av. Laprida', 3140, 'Don Orione', NULL, 3 )
, (NULL, -27.4964909, -58.9318154, 'Av. Río Parana', 235, NULL, NULL, 3 )
, (NULL, -27.4718505, -58.9316812, 'Pasaje Pasteur', 4445, '2 De Abril', NULL, 3 )
, (NULL, -27.4884248, -58.9297775, 'Av. Laprida Y Belgrano', 5601, NULL, NULL, 3 )
, (NULL, -27.4746049, -58.929473, 'Pasteur', 4763, 'Zumalao', NULL, 3 )
, (NULL, -27.486287, -58.929348, 'Guiraldes', 95, NULL, NULL, 3 )
, (NULL, -27.4728746, -58.9292866, 'Pasaje San Luis', 4758, 'Sumalao', NULL, 3 )
, (NULL, -27.48567619, -58.9291876, 'Lestani', 5485, 'Villa Rossi', NULL, 3 )
, (NULL, -27.4782996, -58.9271928, 'Pasaje San Luis', 5800, NULL, NULL, 3 )
, (NULL, -27.4930389, -58.9269097, 'Hipolito Irigoyen', 4240, '28 Viviendas', NULL, 1 )
, (NULL, -27.4884066, -58.926546, 'Capitan Solari', 123, NULL, NULL, 3 )
, (NULL, -27.4817786, -58.9260251, 'Fray Mocho', 1450, NULL, NULL, 3 )
, (NULL, -27.4807919, -58.92514, 'Fray Mocho', 16, 'La Lomita', NULL, 3 )
, (NULL, -27.4889548, -58.9245054, 'Hipolito Irigoyen', 4240, '28 Viviendas', NULL, 1 )
, (NULL, -27.4700526, -58.9217887, 'Av. San Martin', 248, NULL, NULL, 3 )
, (NULL, -27.4707354, -58.9205467, 'Av. Las Piedras', NULL, NULL, NULL, 3 )
, (NULL, -27.468936, -58.9204202, 'Av. San Martin', NULL, NULL, NULL, 3 )
, (NULL, -27.46844687, -58.92039386, 'Av. San Martin', 2685, NULL, NULL, 3 )
, (NULL, -27.4725257, -58.9189925, 'Miguel Cane', 2415, NULL, NULL, 3 )
, (NULL, -27.46562122, -58.9172532, 'Av. San Martin', 3, 'La Toma', NULL, 3 )
, (NULL, -27.47263343, -58.9106598, 'Gaboto', 31, NULL, NULL, 3 )
, (NULL, -27.44065642, -58.89461613, 'Av. San Martin', NULL, NULL, NULL, 3 )
, (NULL, -27.4405735, -58.848451, 'Antequera A 150 Mts Del Asfalto', NULL, NULL, NULL, 3 )
, (NULL, NULL, NULL, 'Miguel Cane', 532, NULL, NULL, 3 )
, (NULL, NULL, NULL, 'Casa 6 Mz 1', 1, NULL, NULL, 3 )
, (NULL, NULL, NULL, 'Don Orione', 13, NULL, NULL, 3 )
, (NULL, NULL, NULL, 'Mz 125 Pc 15', 15, NULL, NULL, 3 )
, (NULL, NULL, NULL, 'Sauce', 199, NULL, NULL, 3 )
, (NULL, NULL, NULL, 'Pje Boggio', 438, NULL, NULL, 3 )
, (NULL, NULL, NULL, 'Cervantes', 4549, NULL, NULL, 1 )
, (NULL, NULL, NULL, 'Parcela 72 Chacra 13', NULL, NULL, NULL, 3 )
, (NULL, NULL, NULL, 'Mz. 51 Pc. 26', NULL, NULL, NULL, 3 )
, (NULL, NULL, NULL, 'Sarmiento Y San Martin', NULL, NULL, NULL, 1 )
, (NULL, NULL, NULL, 'Mz 81 Pc 9', 9, NULL, NULL, 1 )
, (NULL, NULL, NULL, 'Ch 43Mz 1 Pc 16', 16, NULL, NULL, 1 )
, (NULL, NULL, NULL, 'Calle 1', 64, NULL, NULL, 1 )
, (NULL, NULL, NULL, 'San Fernando', 527, NULL, NULL, 1 )
, (NULL, NULL, NULL, 'Pasaje San Juan', 314, NULL, NULL, 1 )
, (NULL, NULL, NULL, 'Padre Sena', 337, NULL, NULL, 1 )
, (NULL, NULL, NULL, 'Haceros', 263, NULL, NULL, 1 )
, (NULL, NULL, NULL, 'Vedia', 126, NULL, NULL, 1 )
, (NULL, NULL, NULL, 'Av. 9 De Julio', 2529, NULL, NULL, 1 )
, (NULL, NULL, NULL, 'Mitre', 166, NULL, NULL, 1 )
, (NULL, NULL, NULL, 'Av. Mac Lean', 26, NULL, NULL, 1 )
, (NULL, NULL, NULL, 'Castelan', 135, NULL, NULL, 1 )
, (NULL, NULL, NULL, 'Corrientes', 67, NULL, NULL, 1 )
, (NULL, NULL, NULL, 'Castelan', 135, NULL, NULL, 1 )
, (NULL, NULL, NULL, 'Mz. 9 Pc. 31', NULL, NULL, NULL, 1 )
, (NULL, NULL, NULL, 'Av. Urquiza', 275, NULL, NULL, 1 )
, (NULL, NULL, NULL, 'Aristóbulo Del Valle', 3947, NULL, NULL, 3 )
, (NULL, NULL, NULL, 'Aristóbulo Del Valle', 3947, NULL, NULL, 3 )
, (NULL, NULL, NULL, 'Aristóbulo Del Valle', 3947, NULL, NULL, 3 )
, (NULL, NULL, NULL, 'Av. Urquiza', 275, NULL, NULL, 3 )
, (NULL, NULL, NULL, 'Mz. 11 Casa 6', NULL, NULL, NULL, 3 )
, (NULL, NULL, NULL, 'Av. Sarmiento', 65, NULL, NULL, 1 )
, (NULL, NULL, NULL, 'Av. Italia', 916, NULL, NULL, 1 )
, (NULL, NULL, NULL, 'Ameri', 3656, NULL, NULL, 1 )
, (NULL, NULL, NULL, 'Cordoba', 217, NULL, NULL, 1 )
, (NULL, NULL, NULL, 'Obligado 1281', 1281, NULL, NULL, 1 )
, (NULL, NULL, NULL, 'Roberto Mora', 95, NULL, NULL, 1 )
, (NULL, NULL, NULL, 'Mz 9 Pc 3 Uf 01', NULL, NULL, NULL, 1 )
, (NULL, NULL, NULL, 'Mz 62 Pc 16', NULL, NULL, NULL, 1 )
, (NULL, NULL, NULL, 'Mz 62 Pc 16', NULL, NULL, NULL, 1 )
, (NULL, NULL, NULL, 'Autovia Gobernador Tenev', 15, NULL, NULL, 1 )
, (NULL, NULL, NULL, 'Don Bosco', 546, NULL, NULL, 1 )
, (NULL, NULL, NULL, 'Marcelo T De Alvear', 1683, NULL, NULL, 1 )
, (NULL, NULL, NULL, 'Colon', 573, NULL, NULL, 1 )
, (NULL, NULL, NULL, 'Obligado', 1524, NULL, NULL, 1 )
, (NULL, NULL, NULL, 'Carlos Hardy', 629, NULL, NULL, 1 )
, (NULL, NULL, NULL, 'Mz 81 Casa 812', 812, NULL, NULL, 1 )
, (NULL, NULL, NULL, 'Mz 75 Pc 14', 14, NULL, NULL, 1 )
, (NULL, NULL, NULL, 'Fray Grotti', 76, NULL, NULL, 1 )
, (NULL, NULL, NULL, 'Fray Grotti', 76, NULL, NULL, 1 )
, (NULL, NULL, NULL, 'Mz 95 Cs11', 11, NULL, NULL, 1 )
, (NULL, NULL, NULL, 'Liniers', 1198, NULL, NULL, 1 )
, (NULL, NULL, NULL, 'Av. Laprida', 4, NULL, NULL, 1 )
, (NULL, NULL, NULL, 'Santa Fe', 6, NULL, NULL, 1 )
, (NULL, NULL, NULL, 'Mz 40 Casa 6', 6, NULL, NULL, 1 )
, (NULL, NULL, NULL, 'Arbo Y Blanco', 1498, NULL, NULL, 1 )
, (NULL, NULL, NULL, 'Av. Avalos', 698, NULL, NULL, 1 )
, (NULL, NULL, NULL, 'Av. Lavalle', 1, NULL, NULL, 1 )
, (NULL, NULL, NULL, 'Cataratas Del Iguazu', 2695, NULL, NULL, 1 )
, (NULL, NULL, NULL, 'Marcelo T De Alvear', 26, NULL, NULL, 1 )
, (NULL, NULL, NULL, 'Juan B. Justo', 1517, NULL, NULL, 1 )
, (NULL, NULL, NULL, 'Jose María Paz', 735, NULL, NULL, 1 )
, (NULL, NULL, NULL, 'Pellegrini', 725, NULL, NULL, 1 )
, (NULL, NULL, NULL, 'Mz 29 Pc 29', 29, NULL, NULL, 1 )
, (NULL, NULL, NULL, 'Santa Maria De Oro', 1516, NULL, NULL, 1 )
, (NULL, NULL, NULL, 'Colon', 334, NULL, NULL, 1 )
, (NULL, NULL, NULL, 'Arturo Illia', 437, NULL, NULL, 1 )
, (NULL, NULL, NULL, 'Jose Noveri', 156, NULL, NULL, 1 )
, (NULL, NULL, NULL, 'Jose Noveri', 156, NULL, NULL, 1 )
, (NULL, NULL, NULL, 'Jose Noveri', 156, NULL, NULL, 1 )
, (NULL, NULL, NULL, 'Av. Castelli', 6468, NULL, NULL, 1 )
, (NULL, NULL, NULL, 'Mz. 76 Pc. 25', NULL, NULL, NULL, 1 )
, (NULL, NULL, NULL, 'Cs 19', NULL, 'La Toma', NULL, 4 )
, (NULL, NULL, NULL, 'Av. Rio Parana', 45, NULL, NULL, 4 )
, (NULL, NULL, NULL, 'Paraguay', NULL, 'Villa Emilia', NULL, 4 )
, (NULL, NULL, NULL, 'Sgto Cabral', NULL, NULL, NULL, 4 )
, (NULL, NULL, NULL, 'Santa lucia S/N', NULL, NULL, NULL, 4 )
, (NULL, NULL, NULL, '40 Viviendas - mz 127 pc 107', 7, NULL, NULL, 4 )
, (NULL, NULL, NULL, 'Mauricio Feldman n°438', 17, 'Villa Gonzalito', NULL, 4 )
, (NULL, NULL, NULL, 'Gaboto', NULL, 'Villa Fucksman', NULL, 4 )
, (NULL, NULL, NULL, 'Av. Paraguay', 1815, NULL, NULL, 4 )
, (NULL, NULL, NULL, 'Cordoba', 5085, NULL, NULL, 3 )
, (NULL, NULL, NULL, 'Pirovano', 5245, 'Villa Emilia', NULL, 3 )
, (NULL, NULL, NULL, 'Asuncion', 710, NULL, NULL, 3 )
, (NULL, NULL, NULL, 'Mz. 2 Pc. 16 Casa 14', NULL, 'Vista Linda', NULL, 3 )
, (NULL, NULL, NULL, 'Av. Piacentini', 1135, NULL, 'Monoblock A PB Dpto. P34', 1 )
, (NULL, NULL, NULL, 'Mz. 71 Pc. 12', NULL, '125 Viviendas CGT', NULL, 3 )
, (NULL, NULL, NULL, 'Mz. 2 Pc. 16 Casa 14', NULL, 'Vista Linda', NULL, 1 )
, (NULL, NULL, NULL, 'Ameghino', 4630, NULL, NULL, 3 )
, (NULL, NULL, NULL, 'Benjamin Zorrilla', 848, NULL, NULL, 1 )
, (NULL, NULL, NULL, 'Obligado', 2598, NULL, NULL, 1 )
, (NULL, NULL, NULL, 'Leandro N. Alem', 2720, NULL, NULL, 1 )
, (NULL, NULL, NULL, 'Algarrobo', 425, NULL, NULL, 3 )
, (NULL, NULL, NULL, 'San Juan y Alem', NULL, 'Gral. San Martin', NULL, 3 )
, (NULL, NULL, NULL, 'Viedma', NULL, 'Obrero', NULL, 2 )
, (NULL, NULL, NULL, 'Juan B. Justo', 5720, NULL, NULL, 3 )
, (NULL, NULL, NULL, 'Juan B. Justo ', 5140, NULL, NULL, 3 )
, (NULL, NULL, NULL, 'Frondizi', 1220, 'Las Malvinas', 'piso 5 dpto 2', 1 )
, (NULL, NULL, NULL, 'Pirovano', 5220, 'Hipolito Irigoyen 2', NULL, 3 )
, (NULL, NULL, NULL, 'Mz. W Pc. 12', NULL, NULL, NULL, 3 )
, (NULL, NULL, NULL, 'Mz. 84 Pc. 15', NULL, 'Las Malvinas', NULL, 1 )
, (NULL, NULL, NULL, 'LOTE 11 S/N', NULL, NULL, NULL, 3 )
, (NULL, NULL, NULL, 'Yatay 690', 690, 'Villa Luzuriaga', 'Casa 2', 3 )
, (NULL, NULL, NULL, 'Don Orione', 540, 'Barrio 300 Viviendas', NULL, 3 )
, (NULL, NULL, NULL, 'Carlos Boggio', 3125, NULL, NULL, 1 )
, (NULL, NULL, NULL, 'Mz 29 Pc 2', NULL, 'Barranqueras', NULL, 1 )
, (NULL, NULL, NULL, 'Cordoba', 5060, NULL, NULL, 3 )
, (NULL, NULL, NULL, 'Av. Rio Parana', 600, 'Villa Florida', NULL, 2 )
, (NULL, NULL, NULL, 'Irigoyen', 4630, 'Villa Forestacion', NULL, 3 )
, (NULL, NULL, NULL, 'Lote 11 Casa 71', NULL, NULL, NULL, 3 )
, (NULL, NULL, NULL, 'Pje. San Martin', 1485, NULL, NULL, 3 )
, (NULL, NULL, NULL, 'San Juan', 5101, 'Barrio La Toma', NULL, 3 )
, (NULL, NULL, NULL, 'Av. San Martin', 3250, NULL, NULL, 3 )
, (NULL, NULL, NULL, 'Av. San Martin', 1324, 'LA LOMA', NULL, 3 )
, (NULL, NULL, NULL, 'San Juan', 5140, 'Villa Maria Cristina', NULL, 3 )
;


INSERT INTO productos (id_producto, producto)
VALUES	('B20', 'Bidón 20 lts.')
,		('B12', 'Bidón 12 lts.')
,		('E20', 'Envase 20 lts.')
,		('DFC', 'Dispenser FC')
;




INSERT INTO medios_pago (id_medio_pago, medio_pago)
VALUES	('EF', 'Efectivo')
,		('TR', 'Transferencia')
,		('CC', 'Cuenta Corriente')
;


INSERT INTO tipos_clientes (id_tipo_cliente, tipo_cliente)
VALUES	('A', 'Abono')
,		('R', 'Revendedor')
,		('N', 'Natural')
,		('F', 'Facturado')
;


INSERT INTO tipos_domicilios (id_tipo_domicilio, tipo_domicilio)
VALUES	('A', 'De atención')
,		('R', 'Real')
,		('L', 'Legal')
;


INSERT INTO repartos (id_reparto, id_vehiculo_asignado, id_repartidor_asignado)
VALUES	('R01', NULL, NULL)
,		('R02', NULL, NULL)
,		('R11', NULL, NULL)
;


INSERT INTO repartidores (id_repartidor, apellido_nombre, DNI, CUIT, fecha_nacimiento, genero, id_domicilio, fecha_ingreso, fecha_baja, telefono, email )
VALUES (NULL, 'Alan Romero', 44651968, 20446519681, '2002-12-26', 'M', 469, '2024-03-18', NULL, '3624861313', 'alan_romero@gmail.com ')
, (NULL, 'Ian Aramis Gomez Menesse', 46777983, 20467779831, '2006-01-05', 'M', 468, '2024-05-30', NULL, '3624861678', 'ian_aramis_gomez_menesse@gmail.com ')
, (NULL, 'Fleyta Teodoro Vicente', 14496079, 20144960791, '1961-07-04', 'M', 467, '2010-03-25', NULL, '3624862043', 'fleyta_teodoro_vicente@gmail.com ')
, (NULL, 'Cardozo Lucas Ezequiel', 45469117, 20454691171, '1990-06-23', 'M', 466, '2023-04-01', NULL, '3624862408', 'cardozo_lucas_ezequiel@gmail.com ')
, (NULL, 'Brian Gomez Veron', 45101860, 20451018601, '2004-04-04', 'M', 465, '2023-12-21', NULL, '3624862773', 'brian_gomez_veron@gmail.com ')
, (NULL, 'Ivan Kuszmiruk', 45793879, 20457938791, '2004-04-26', 'M', 464, '2024-05-06', NULL, '3624863138', 'ivan_kuszmiruk@gmail.com ')
, (NULL, 'Insaurralde Vilma Romina Luciana', 29523624, 27295236243, '1982-06-06', 'F', 463, '2023-08-01', NULL, '3624863503', 'insaurralde_vilma_romina_luciana@gmail.com ')
, (NULL, 'Ramirez Sofia Celeste', 33732503, 27337325039, '1988-11-26', 'F', 462, '2013-07-25', NULL, '3624863868', 'ramirez_sofia_celeste@gmail.com ')
, (NULL, 'Benitez Jeremias Moises', 38383956, 20383839561, '1994-09-06', 'M', 461, '2023-04-01', NULL, '3624864233', 'benitez_jeremias_moises@gmail.com ')
, (NULL, 'Barrientos Nestor Edgardo', 44085527, 20440855271, '1988-09-10', 'M', 460, '2023-01-16', NULL, '3624864598', 'barrientos_nestor_edgardo@gmail.com ')
, (NULL, 'Haedo Exequiel', 35858726, 20358587261, '1991-06-13', 'M', 459, '2021-07-29', NULL, '3624864963', 'haedo_exequiel@gmail.com ')
, (NULL, 'López Adrian Ezequiel', 37584988, 20375849881, '1994-01-14', 'M', 458, '2019-12-06', '2020-02-07', '3624865328', 'lópez_adrian_ezequiel@gmail.com ')
, (NULL, 'Aguirre Angel Mariano', 28048473, 20280484731, '1980-06-16', 'M', 457, '2019-12-30', '2022-09-25', '3624865693', 'aguirre_angel_mariano@gmail.com ')
, (NULL, 'González Martín Fernando', 30879616, 20308796161, '1984-03-05', 'M', 456, '2020-02-05', '2020-05-25', '3624866058', 'gonzález_martín_fernando@gmail.com ')
, (NULL, 'Maidana Arnaldo Arsenio Ruben', 31325534, 20313255341, '1985-01-11', 'M', 455, '2020-01-28', '2020-04-16', '3624866423', 'maidana_arnaldo_arsenio_ruben@gmail.com ')
, (NULL, 'Godoy Diego José', 42202178, 20422021781, '1997-05-25', 'M', 454, '2020-01-24', '2022-11-05', '3624866788', 'godoy_diego_josé@gmail.com ')
, (NULL, 'Sandoval Enzo Esequiel', 39940804, 20399408041, '1996-11-30', 'M', 453, '2020-05-15', '2021-12-20', '3624867153', 'sandoval_enzo_esequiel@gmail.com ')
, (NULL, 'Cuyua Alexis Leonardo', 36019462, 20360194621, '1991-02-01', 'M', 452, '2020-05-28', '2020-10-01', '3624867518', 'cuyua_alexis_leonardo@gmail.com ')
, (NULL, 'Ramirez Wellig Emno Lautaro', 46149145, 20461491451, '2000-12-21', 'M', 451, '2020-10-24', '2021-01-27', '3624867883', 'ramirez_wellig_emno_lautaro@gmail.com ')
, (NULL, 'Quintana Esteban Javier', 37585624, 20375856241, '1993-06-30', 'M', 450, '2020-10-24', '2023-08-22', '3624868248', 'quintana_esteban_javier@gmail.com ')
, (NULL, 'Maidana Angel Ulises', 36115366, 20361153661, '1992-02-15', 'M', 449, '2020-11-10', '2021-02-13', '3624868613', 'maidana_angel_ulises@gmail.com ')
, (NULL, 'Herrendorf Florencia Vanina', 36233329, 27362333291, '1992-03-24', 'F', 448, '2018-02-01', '2020-11-29', '3624868978', 'herrendorf_florencia_vanina@gmail.com ')
, (NULL, 'Vallejos Pelozo Gonzalo Ezequiel', 36115647, 20361156471, '1992-04-23', 'M', 447, '2020-09-29', '2022-05-22', '3624869343', 'vallejos_pelozo_gonzalo_ezequiel@gmail.com ')
, (NULL, 'Zalazar Emanuel Antonio', 39177136, 20391771361, '1994-12-12', 'M', 446, '2021-02-01', '2021-06-23', '3624869708', 'zalazar_emanuel_antonio@gmail.com ')
, (NULL, 'Quiroz Gaston Lucas', 38047660, 20380476601, '1993-06-23', 'M', 445, '2020-05-29', '2020-09-17', '3624870073', 'quiroz_gaston_lucas@gmail.com ')
, (NULL, 'Ayala Ivan Mauricio', 39815232, 20398152321, '1994-08-24', 'M', 444, '2020-01-01', '2022-11-14', '3624870438', 'ayala_ivan_mauricio@gmail.com ')
, (NULL, 'Barrientos Nestor Edgardo', 44085527, 20440855271, '1988-09-10', 'M', 443, '2023-01-16', '2023-05-07', '3624870803', 'barrientos_nestor_edgardo@gmail.com ')
, (NULL, 'Encina Leandro Maximiliano', 38971997, 20389719971, '1995-07-14', 'M', 442, '2020-09-29', '2023-08-13', '3624871168', 'encina_leandro_maximiliano@gmail.com ')
, (NULL, 'Ortigoza Alexis Emmanuel', 35858568, 20358585681, '1991-04-18', 'M', 441, '2020-08-13', '2022-04-21', '3624871533', 'ortigoza_alexis_emmanuel@gmail.com ')
, (NULL, 'Pintos Agustin Fabian', 46462939, 20464629391, '2005-05-11', 'M', 440, '2021-12-20', '2022-05-27', '3624871898', 'pintos_agustin_fabian@gmail.com ')
, (NULL, 'Rolon Hugo Orlando', 43006561, 20430065611, '1995-09-18', 'M', 439, '2018-07-01', '2018-11-05', '3624872263', 'rolon_hugo_orlando@gmail.com ')
, (NULL, 'Enzo Centurion', 43145673, 20431456731, '1995-12-09', 'M', 438, '2021-12-02', '2024-10-31', '3624872628', 'enzo_centurion@gmail.com ')
, (NULL, 'Wirz Fernando Ariel', 35687538, 20356875381, '1991-03-08', 'M', 437, '2017-01-06', '2017-05-13', '3624872993', 'wirz_fernando_ariel@gmail.com ')
, (NULL, 'Gutierrez Gaston Joaquin', 42745521, 20427455211, '2000-05-17', 'M', 436, '2021-05-10', '2024-04-08', '3624873358', 'gutierrez_gaston_joaquin@gmail.com ')
, (NULL, 'Gomez Marcos Javier', 36974738, 20369747381, '1992-10-24', 'M', 435, '2022-04-18', '2024-01-10', '3624873723', 'gomez_marcos_javier@gmail.com ')
, (NULL, 'Prieto Hector', 28234239, 20282342391, '1980-10-01', 'M', 434, '2022-01-21', '2022-07-14', '3624874088', 'prieto_hector@gmail.com ')
, (NULL, 'Fernandez Matias', 45370687, 20453706871, '2003-12-24', 'M', 433, '2021-12-31', '2022-05-23', '3624874453', 'fernandez_matias@gmail.com ')
, (NULL, 'Ferreyra Jorge Damian', 32062902, 20320629021, '1986-03-30', 'M', 432, '2020-02-26', '2023-02-10', '3624874818', 'ferreyra_jorge_damian@gmail.com ')
, (NULL, 'Blanco Sebastian Alexis', 45104560, 20451045601, '2004-01-13', 'M', 431, '2021-11-08', '2022-03-31', '3624875183', 'blanco_sebastian_alexis@gmail.com ')
, (NULL, 'Torres Gustavo Norberto', 30391392, 20303913921, '1983-10-09', 'M', 430, '2022-08-01', '2022-11-17', '3624875548', 'torres_gustavo_norberto@gmail.com ')
, (NULL, 'Mosqueda Braian Leonel', 40789987, 20407899871, '1996-09-14', 'M', 429, '2022-12-16', '2024-06-16', '3624875913', 'mosqueda_braian_leonel@gmail.com ')
, (NULL, 'Ojeda Ezequiel Gustavo', 43145637, 20431456371, '2000-03-06', 'M', 428, '2022-10-15', '2023-04-23', '3624876278', 'ojeda_ezequiel_gustavo@gmail.com ')
, (NULL, 'Fernandez Juan Roman', 44385711, 20443857111, '2002-02-18', 'M', 427, '2022-10-11', '2023-03-19', '3624876643', 'fernandez_juan_roman@gmail.com ')
, (NULL, 'Acosta Cecilia Noemi', 31119314, 27311193142, '1984-09-08', 'F', 426, '2021-05-12', '2024-05-12', '3624877008', 'acosta_cecilia_noemi@gmail.com ')
, (NULL, 'Mosqueda Luis', 38047956, 20380479561, '1994-04-28', 'M', 425, '2022-11-09', '2023-04-17', '3624877373', 'mosqueda_luis@gmail.com ')
;



INSERT INTO clientes (id_cliente, apellido_nombre, DNI, CUIT, fecha_nacimiento, genero, estado_civil, fecha_alta, fecha_baja, id_tipo_cliente, telefono, email )
VALUES (NULL, 'Ramos ', 14808187, 20148081876, '1977-01-09', 'M', 'Soltero', '2016-06-30', NULL, 'A', '3624843475', 'ramos@gmail.com ')
, (NULL, 'Barrientos Ramona ', 4734541, 20047345416, '1988-10-01', 'M', 'Soltero', '2016-06-30', NULL, 'A', '4483161', 'barrientos ramona@gmail.com ')
, (NULL, 'Facor Srl (Farmar) ', 30647675502, 30647675502, '1995-10-28', 'O', NULL, '2016-06-30', NULL, 'F', '3624452794', 'facor srl farmar@gmail.com ')
, (NULL, 'Medero Walter ', 17425215, 20174252158, '1956-06-04', 'M', 'Soltero', '2016-06-30', NULL, 'A', '3624437560', 'medero walter@gmail.com ')
, (NULL, 'Su Pan Vallejos Sebastian ', 10980348, 20109803481, '1969-05-07', 'M', 'Soltero', '2016-06-30', NULL, 'F', '4484055', 'su pan vallejos sebastian@gmail.com ')
, (NULL, 'Todo Motor ', 13116730, 20131167300, '1948-06-25', 'M', 'Soltero', '2016-06-30', NULL, 'F', '3624466448', 'todo motor@gmail.com ')
, (NULL, 'Starcevich Patricia (Cotillon Pochoclos) ', 13116730, 20131167303, '1962-10-29', 'M', 'Soltero', '2016-06-30', NULL, 'N', '3624698936', 'starcevich patricia cotillon pochoclos@gmail.com ')
, (NULL, 'La Flota ', 30670180065, 30670180065, '1996-09-16', 'O', NULL, '2016-06-30', NULL, 'F', '4485649', 'la flota@gmail.com ')
, (NULL, 'Borda Alcaida ', 6590061, 20065900616, '1962-10-01', 'M', 'Soltero', '2016-06-30', NULL, 'F', '4482814', 'borda alcaida@gmail.com ')
, (NULL, 'Gomez Marcelo ', 12467958, 20124679586, '1966-06-19', 'M', 'Soltero', '2016-06-30', NULL, 'N', '4482642', 'gomez marcelo@gmail.com ')
, (NULL, 'Autogoma Mari ', 30124578963, 30124578963, '1953-05-16', 'O', NULL, '2016-06-30', NULL, 'N', '3624427054', 'autogoma mari@gmail.com ')
, (NULL, 'Gomez Jorge ', 12467973, 20124679736, '1978-01-27', 'M', 'Soltero', '2016-06-30', NULL, 'N', '154365220', 'gomez jorge@gmail.com ')
, (NULL, 'Ceweluk Jorge ', 23912550, 20239125506, '1961-07-30', 'M', 'Soltero', '2016-06-30', NULL, 'N', '3624957076', 'ceweluk jorge@gmail.com ')
, (NULL, 'Aguirre Eusebia ', 4967110, 20049671106, '1981-10-26', 'M', 'Soltero', '2016-06-30', '2017-04-30', 'A', '3624589877', 'aguirre eusebia@gmail.com ')
, (NULL, 'Gimenez Acuña Lucia ', 40818584, 20332915326, '1989-10-28', 'M', 'Soltero', '2016-06-30', NULL, 'A', '3624538537', 'gimenez acuña lucia@gmail.com ')
, (NULL, 'Peron Osmar (Joyería Vilmar) ', 7623619, 20076236195, '1979-02-19', 'M', 'Soltero', '2016-06-30', NULL, 'F', '3624426741', 'peron osmar joyería vilmar@gmail.com ')
, (NULL, 'Nuñez Paulino ', 11895266, 20118952666, '1985-07-15', 'M', 'Soltero', '2016-06-30', NULL, 'R', '3624737327', 'nuñez paulino@gmail.com ')
, (NULL, 'Pilcheria Lulu ', 22522050, 20217495996, '1988-04-13', 'M', 'Soltero', '2016-06-30', NULL, 'F', '3624035584', 'pilcheria lulu@gmail.com ')
, (NULL, 'Ramirez Carniceria ', 10578633, 20105786336, '1947-11-02', 'M', 'Soltero', '2016-06-30', NULL, 'N', '4482857', 'ramirez carniceria@gmail.com ')
, (NULL, 'Pilcheria Lulu Pilcheria Lulu', 31221440, 20283931846, '1986-09-15', 'M', 'Soltero', '2016-06-30', NULL, 'A', '3624035584', 'pilcheria lulu pilcheria lulu@gmail.com ')
, (NULL, 'Ramos Bernabe', 14808187, 20148081876, '1980-07-06', 'M', 'Soltero', '2016-06-30', NULL, 'A', '3624739994', 'ramos bernabe@gmail.com ')
, (NULL, 'Barrientos Ramona', 4734541, 20047345416, '1970-01-13', 'M', 'Soltero', '2016-06-30', NULL, 'A', '4483161', 'barrientos ramona@gmail.com ')
, (NULL, 'Franco Romina Daniela ', 10719564, 20400413376, '1972-02-06', 'M', 'Soltero', '2016-09-09', NULL, 'A', '3624414442', 'franco romina daniela@gmail.com ')
, (NULL, 'Juzgado De Faltas Nº 1 ', 30999167655, 30999167655, '2001-09-27', 'O', NULL, '2016-09-09', NULL, 'A', '3624500730', 'juzgado de faltas nº 1@gmail.com ')
, (NULL, 'Amar Joyas ', 40190636, 20124603906, '1996-07-07', 'M', 'Soltero', '2016-09-10', NULL, 'N', '3624650566', 'amar joyas@gmail.com ')
, (NULL, 'Supermercado Filiponi Mazon Lidia ', 18545502, 20248228626, '1948-12-22', 'M', 'Soltero', '2016-09-10', NULL, 'F', '3624781127', 'supermercado filiponi mazon lidia@gmail.com ')
, (NULL, 'Registro Del Automotor ', 29625647, 27296256477, '1977-11-11', 'F', 'Soltero', '2016-09-14', NULL, 'A', '3624765644', 'registro del automotor@gmail.com ')
, (NULL, 'Inpach ', 30712337881, 30712337881, '2002-06-02', 'O', NULL, '2016-09-14', NULL, 'F', '3624426567', 'inpach@gmail.com ')
, (NULL, 'Marcelo Mecanico ', 32818811, 20128961346, '1998-06-28', 'M', 'Soltero', '2016-09-14', NULL, 'N', '3624697771', 'marcelo mecanico@gmail.com ')
, (NULL, 'Ceweluk Miguel ', 17197981, 20328340686, '2002-05-12', 'M', 'Soltero', '2016-09-15', NULL, 'N', '3624449105', 'ceweluk miguel@gmail.com ')
, (NULL, 'Municipalidad De Barranqueras ', 30670180065, 30670180065, '1953-11-21', 'O', NULL, '2016-09-26', NULL, 'F', '3624555360', 'municipalidad de barranqueras@gmail.com ')
, (NULL, 'Nuñez Estela ', 37253947, 20322016076, '1952-04-24', 'M', 'Soltero', '2016-09-26', NULL, 'N', '3624202638', 'nuñez estela@gmail.com ')
, (NULL, 'Unitan Saica ', 30506733002, 30506733002, '1958-12-14', 'O', NULL, '2016-10-03', NULL, 'F', '3482538858', 'unitan saica@gmail.com ')
, (NULL, 'Wasinger Wilson ', 17298342, 20144100396, '1965-11-20', 'M', 'Soltero', '2016-10-03', NULL, 'R', '3624507698', 'wasinger wilson@gmail.com ')
, (NULL, 'Gomez Rolando Verduleria 9 De Julio ', 23382686, 20233826864, '1964-10-04', 'M', 'Soltero', '2016-10-03', NULL, 'R', '3624897178', 'gomez rolando verduleria 9 de julio@gmail.com ')
, (NULL, 'Lopez Jesus Alberto ', 27025770, 20270257705, '1995-03-22', 'M', 'Soltero', '2016-10-03', NULL, 'R', '3624669606', 'lopez jesus alberto@gmail.com ')
, (NULL, 'Baez Daniel ', 20020197, 20261066276, '1990-04-13', 'M', 'Soltero', '2016-10-03', NULL, 'R', '3624634629', 'baez daniel@gmail.com ')
, (NULL, 'Meza Julio Oscar', 22330847, 20223308476, '1988-10-18', 'M', 'Soltero', '2016-10-03', NULL, 'R', '3624990195', 'meza julio oscar@gmail.com ')
, (NULL, 'Fleyta Vicente (Punto De Venta) ', 39663439, 20147126686, '1948-04-30', 'M', 'Soltero', '2016-10-03', NULL, 'R', '3624506467', 'fleyta vicente punto de venta@gmail.com ')
, (NULL, 'Rudin Pablo ', 13703464, 20215377086, '1958-02-18', 'M', 'Soltero', '2016-10-03', NULL, 'R', '3624122623', 'rudin pablo@gmail.com ')
, (NULL, 'Cuenca Tato Rey De Las Frutas ', 39745181, 20396097486, '2004-08-25', 'M', 'Soltero', '2016-10-25', NULL, 'R', '3624914101', 'cuenca tato rey de las frutas@gmail.com ')
, (NULL, 'Fernandez Nora Rotiseria ', 22232131, 20295866236, '1962-09-19', 'M', 'Soltero', '2016-10-25', NULL, 'R', '3624268774', 'fernandez nora rotiseria@gmail.com ')
, (NULL, 'Hipermercado Libertad ', 30612929455, 30612929455, '1980-02-06', 'O', NULL, '2016-10-25', NULL, 'F', '4458452', 'hipermercado libertad@gmail.com ')
, (NULL, 'Victor Cerdan ', 37490107, 20285281466, '2001-09-02', 'M', 'Soltero', '2016-10-31', NULL, 'N', '3624934708', 'victor cerdan@gmail.com ')
, (NULL, 'Instituto Del Deporte Chaqueño (Montenegro Raul ) ', 30712337679, 30712337679, '1964-08-22', 'O', NULL, '2016-11-14', NULL, 'F', '3624706608', 'instituto del deporte chaqueño montenegro raul@gmail.com ')
, (NULL, 'Toñanes Marcelo Eduardo ', 30712337679, 30712337679, '1963-04-13', 'O', NULL, '2016-11-14', NULL, 'F', '3624901820', 'toñanes marcelo eduardo@gmail.com ')
, (NULL, 'Manfrey Cooperativa De Tamberos ', 30501773383, 30501773383, '1985-11-10', 'O', NULL, '2016-11-14', NULL, 'F', '3624490911', 'manfrey cooperativa de tamberos@gmail.com ')
, (NULL, 'Hospital Eva Peron ', 30999177448, 30999177448, '1970-01-17', 'O', NULL, '2016-12-22', NULL, 'F', '3624799326', 'hospital eva peron@gmail.com ')
, (NULL, 'Velazco Graciela Jorgelina', 29724384, 20297243846, '1991-01-19', 'M', 'Soltero', '2017-01-01', NULL, 'R', '3624769762', 'velazco graciela jorgelina@gmail.com ')
, (NULL, 'Wal Mar ', 33015626, 20359548936, '1994-12-26', 'M', 'Soltero', '2017-01-01', NULL, 'N', '3624539484', 'wal mar@gmail.com ')
, (NULL, 'Cotelo Hector Alejandro', 28047929, 20280479296, '2001-07-28', 'M', 'Soltero', '2017-01-01', NULL, 'R', '3624261650', 'cotelo hector alejandro@gmail.com ')
, (NULL, 'Opessa Sa ', 17956175, 20242435966, '1983-11-13', 'M', 'Soltero', '2017-01-01', NULL, 'A', '3624713203', 'opessa sa@gmail.com ')
, (NULL, 'Monuti Santiago ', 37329063, 20165889646, '1961-01-14', 'M', 'Soltero', '2017-01-03', NULL, 'R', '3624907611', 'monuti santiago@gmail.com ')
, (NULL, 'Famago ', 18988902, 20186565536, '1980-01-19', 'M', 'Soltero', '2017-01-04', NULL, 'N', '3624584223', 'famago@gmail.com ')
, (NULL, 'Dorita ', 37978861, 20167502516, '1970-09-16', 'M', 'Soltero', '2017-01-05', NULL, 'N', '4481334', 'dorita@gmail.com ')
, (NULL, 'Trangoni Julio', 34795770, 20347957706, '1982-03-31', 'M', 'Soltero', '2017-01-10', NULL, 'R', '3624751434', 'trangoni julio@gmail.com ')
, (NULL, 'Cementerio ', 30670180065, 30670180065, '2000-02-29', 'O', NULL, '2017-02-17', NULL, 'F', '3624591999', 'cementerio@gmail.com ')
, (NULL, 'El Parrillon ', 30711206740, 30711206740, '1959-09-28', 'O', NULL, '2017-02-17', NULL, 'N', '3624482192', 'el parrillon@gmail.com ')
, (NULL, 'Gonzales Angel ', 14931777, 20101750566, '1957-08-16', 'M', 'Soltero', '2017-03-30', NULL, 'N', '3624733632', 'gonzales angel@gmail.com ')
, (NULL, 'Supercemento Saic ', 30502888419, 30502888419, '1993-07-19', 'O', NULL, '2017-04-01', NULL, 'F', '3624702289', 'supercemento saic@gmail.com ')
, (NULL, 'Verduleria Galardon ', 32583077, 20278798016, '1965-07-21', 'M', 'Soltero', '2017-04-28', NULL, 'R', '3624619683', 'verduleria galardon@gmail.com ')
, (NULL, 'Tamara De Paniagua - Inmobiliaria Puente ', 32745456, 20406102756, '1958-12-02', 'M', 'Soltero', '2017-05-10', NULL, 'N', '3624693499', 'tamara de paniagua - inmobiliaria puente@gmail.com ')
, (NULL, 'Gomez Walter', 17257827, 20219665206, '1956-03-08', 'M', 'Soltero', '2017-06-01', NULL, 'N', '3624493320', 'gomez walter@gmail.com ')
, (NULL, 'Meza Roberto', 25699545, 20256995456, '1982-02-26', 'M', 'Soltero', '2017-06-14', NULL, 'A', '3624538608', 'meza roberto@gmail.com ')
, (NULL, 'Rodriguez Cecilia ', 10072548, 20261853986, '1952-12-06', 'M', 'Soltero', '2017-06-23', NULL, 'R', '3624711530', 'rodriguez cecilia@gmail.com ')
, (NULL, 'Leonardo Feyen ', 29581164, 20140240186, '1952-02-04', 'M', 'Soltero', '2017-06-27', NULL, 'R', '3624865717', 'leonardo feyen@gmail.com ')
, (NULL, 'Freshi Ramon Hugo (Pv) ', 17376966, 20246052426, '1948-02-01', 'M', 'Soltero', '2017-06-27', NULL, 'R', '3624745834', 'freshi ramon hugo pv@gmail.com ')
, (NULL, 'Pividori Eduardo José', 13367929, 20133679296, '1956-06-25', 'M', 'Soltero', '2017-06-30', NULL, 'N', '3624895978', 'pividori eduardo josé@gmail.com ')
, (NULL, 'Grupo Nuevo Horizonte S.R.L. Patricio Cané', 30710350694, 30710350694, '1991-06-24', 'O', NULL, '2017-07-03', NULL, 'N', '3624600478', 'grupo nuevo horizonte s.r.l. patricio cané@gmail.com ')
, (NULL, 'Fortini Luis Antonio', 17369316, 20173693166, '1954-01-28', 'M', 'Soltero', '2017-07-05', NULL, 'R', '3624168361', 'fortini luis antonio@gmail.com ')
, (NULL, 'Mondelo Luis ', 33760194, 20119878116, '1966-02-05', 'M', 'Soltero', '2017-07-05', NULL, 'R', '3624577839', 'mondelo luis@gmail.com ')
, (NULL, 'Chaco Servicios S.A. ', 30650408922, 30650408922, '1953-04-27', 'O', NULL, '2017-08-01', NULL, 'N', '3624907282', 'chaco servicios s.a.@gmail.com ')
, (NULL, 'Chaco Servicios Srl ', 19864614, 20213935586, '1994-05-15', 'M', 'Soltero', '2017-08-01', NULL, 'N', '3624439826', 'chaco servicios srl@gmail.com ')
, (NULL, 'La Colonia Goitia Hugo ', 23987315, 20239873156, '2000-10-26', 'M', 'Soltero', '2017-08-16', NULL, 'R', '3624618680', 'la colonia goitia hugo@gmail.com ')
, (NULL, 'Herrera Telma Dora', 3920785, 20039207856, '1969-12-14', 'M', 'Soltero', '2017-08-30', NULL, 'A', '3624794229', 'herrera telma dora@gmail.com ')
, (NULL, 'Eiden Marcos', 30484229, 20304842297, '1985-04-07', 'M', 'Soltero', '2017-09-05', NULL, 'A', '3624540592', 'eiden marcos@gmail.com ')
, (NULL, 'Robledo Nelson Fabian', 26447478, 20264474788, '1993-11-08', 'M', 'Soltero', '2017-10-01', NULL, 'R', '3624731226', 'robledo nelson fabian@gmail.com ')
, (NULL, 'El Leon Supermercado ', 25039633, 20216719576, '1947-05-30', 'M', 'Soltero', '2017-10-13', NULL, 'R', '3624465767', 'el leon supermercado@gmail.com ')
, (NULL, 'Maria De Los Angeles Romero Pv ', 28318301, 20283183018, '1973-09-12', 'M', 'Soltero', '2017-10-18', NULL, 'R', '3624514777', 'maria de los angeles romero pv@gmail.com ')
, (NULL, 'Rovella Carranza ', 35524309, 20221920256, '1964-07-18', 'M', 'Soltero', '2017-12-19', NULL, 'F', '3624576332', 'rovella carranza@gmail.com ')
, (NULL, 'Zacarias Blanca Selva', 6155947, 20061559476, '2002-09-22', 'M', 'Soltero', '2017-12-20', NULL, 'A', '3624789541', 'zacarias blanca selva@gmail.com ')
, (NULL, 'Barrientos Manuel ', 26447249, 20264472496, '1974-12-19', 'M', 'Soltero', '2017-12-29', NULL, 'N', '3624714592', 'barrientos manuel@gmail.com ')
, (NULL, 'Kiosco Franco ', 31337388, 20295839516, '1985-06-17', 'M', 'Soltero', '2018-01-04', NULL, 'R', '3624756453', 'kiosco franco@gmail.com ')
, (NULL, 'Maidana Mirta Lilian', 16368407, 20163684076, '1951-11-25', 'M', 'Soltero', '2018-01-17', NULL, 'A', '3624646991', 'maidana mirta lilian@gmail.com ')
, (NULL, 'Rios Gabriel Edgardo', 30789924, 20307899246, '1987-09-16', 'M', 'Soltero', '2018-01-17', NULL, 'A', '3624636593', 'rios gabriel edgardo@gmail.com ')
, (NULL, 'Maria Jeremich ', 27324726, 20196993846, '1947-10-20', 'M', 'Soltero', '2018-01-24', NULL, 'N', '3794271654', 'maria jeremich@gmail.com ')
, (NULL, 'Albarracin Ruben Alfredo', 14606892, 20146068926, '1975-06-06', 'M', 'Soltero', '2018-03-01', NULL, 'A', '3624885711', 'albarracin ruben alfredo@gmail.com ')
, (NULL, 'Mazzero Christian', 37704480, 20377044806, '1955-07-03', 'M', 'Soltero', '2018-03-06', NULL, 'A', '3624854650', 'mazzero christian@gmail.com ')
, (NULL, 'Gutierrez Luis (Pv) ', 13413545, 20219369826, '1949-10-14', 'M', 'Soltero', '2018-04-12', NULL, 'R', '3624841833', 'gutierrez luis pv@gmail.com ')
, (NULL, 'Galarza Roberto Javier', 22830025, 20228300256, '1947-09-24', 'M', 'Soltero', '2018-04-13', NULL, 'A', '3624683839', 'galarza roberto javier@gmail.com ')
, (NULL, 'Miranda Nidia Beatriz', 12104394, 20121043946, '1984-01-05', 'M', 'Soltero', '2018-04-20', NULL, 'A', '3624612861', 'miranda nidia beatriz@gmail.com ')
, (NULL, 'Block Walter', 20521917, 30710834489, '1959-06-20', 'O', NULL, '2018-05-18', NULL, 'A', '3624812811', 'block walter@gmail.com ')
, (NULL, 'Castillo ', 26513312, 20382860366, '1996-08-03', 'M', 'Soltero', '2018-06-25', NULL, 'R', '3624624708', 'castillo@gmail.com ')
, (NULL, 'Franco María Estela', 12485710, 20124857106, '1955-07-15', 'M', 'Soltero', '2018-06-26', NULL, 'A', '362444444', 'franco maría estela@gmail.com ')
, (NULL, 'Ruíz Ivana Soledad', 28567770, 20285677706, '1950-02-07', 'M', 'Soltero', '2018-08-08', NULL, 'A', '3624311336', 'ruíz ivana soledad@gmail.com ')
, (NULL, 'Burosky Lucia ', 18599179, 20143107126, '1952-07-21', 'M', 'Soltero', '2018-08-15', NULL, 'N', '3624868706', 'burosky lucia@gmail.com ')
, (NULL, 'Gomez Norma Beatriz', 24077683, 20240776836, '1969-01-24', 'M', 'Soltero', '2018-08-15', NULL, 'A', '3625240876', 'gomez norma beatriz@gmail.com ')
, (NULL, 'Santillan Mariela Alejandra', 25827884, 20258278846, '1954-07-13', 'M', 'Soltero', '2018-08-15', NULL, 'A', '3624761684', 'santillan mariela alejandra@gmail.com ')
, (NULL, 'Raynoldi Alejo Camilo', 16746655, 20167466556, '1990-06-15', 'M', 'Soltero', '2018-08-16', NULL, 'A', '3624513263', 'raynoldi alejo camilo@gmail.com ')
, (NULL, 'Guevara Vanesa Janet', 37865069, 20378650696, '1962-10-10', 'M', 'Soltero', '2018-08-16', NULL, 'A', '3624250585', 'guevara vanesa janet@gmail.com ')
, (NULL, 'Montagner Nicolas', 25278559, 30716052776, '1963-02-16', 'O', NULL, '2018-08-22', NULL, 'N', '3624595481', 'montagner nicolas@gmail.com ')
, (NULL, 'Palacios Isabel Adelaida', 22912116, 20229121166, '1965-04-09', 'M', 'Soltero', '2018-09-01', '2019-08-06', 'A', '3624765028', 'palacios isabel adelaida@gmail.com ')
, (NULL, 'Benítez Patricia Alejandra', 22882401, 20228824016, '1994-08-23', 'M', 'Soltero', '2018-09-01', NULL, 'A', '3624731222', 'benítez patricia alejandra@gmail.com ')
, (NULL, 'Docteur Patricia - R (24) ', 23256584, 20142215286, '1971-09-22', 'M', 'Soltero', '2018-09-05', NULL, 'R', '3624318625', 'docteur patricia - r 24@gmail.com ')
, (NULL, 'Valoriani Edgard ', 34977206, 20319247716, '1989-02-20', 'M', 'Soltero', '2018-09-06', NULL, 'R', '3624466366', 'valoriani edgard@gmail.com ')
, (NULL, 'Soto Ana - R ', 30807002, 20231339946, '1992-07-23', 'M', 'Soltero', '2018-09-06', NULL, 'R', '3624813318', 'soto ana - r@gmail.com ')
, (NULL, 'Kostecki Horacio', 32301838, 20323018384, '1987-11-30', 'M', 'Soltero', '2018-09-06', NULL, 'A', '3624247530', 'kostecki horacio@gmail.com ')
, (NULL, 'Madona Jorge Luis - R ', 27579291, 20313497316, '1980-12-11', 'M', 'Soltero', '2018-09-07', NULL, 'R', '3624304231', 'madona jorge luis - r@gmail.com ')
, (NULL, 'Acevedo Soledad Mabel', 36631982, 23366319824, '1946-06-16', 'O', NULL, '2018-09-18', NULL, 'A', '3624487974', 'acevedo soledad mabel@gmail.com ')
, (NULL, 'Gilfauy Laura Susana - R (Pv) ', 36361252, 20329182656, '1952-02-14', 'M', 'Soltero', '2018-09-21', NULL, 'R', '3624333311', 'gilfauy laura susana - r pv@gmail.com ')
, (NULL, 'Almada Federico Daniel', 34477156, 20344771566, '1962-08-05', 'M', 'Soltero', '2018-10-05', NULL, 'A', '3625237876', 'almada federico daniel@gmail.com ')
, (NULL, '(Farmar I) Quintana Zulma Beatriz', 32426688, 30670152673, '1957-08-14', 'O', NULL, '2018-10-30', NULL, 'N', '3644654732', 'farmar i quintana zulma beatriz@gmail.com ')
, (NULL, 'Kiosco Patricia Y Hnos - Pv ', 24377281, 20243772816, '1994-03-27', 'M', 'Soltero', '2018-11-02', NULL, 'R', '3624683886', 'kiosco patricia y hnos - pv@gmail.com ')
, (NULL, 'Barboza María Laura', 24343843, 20243438436, '1989-03-18', 'M', 'Soltero', '2018-11-20', NULL, 'A', '3624131094', 'barboza maría laura@gmail.com ')
, (NULL, 'Esquivel Hugo Luis', 11832997, 20118329976, '1973-08-28', 'M', 'Soltero', '2018-12-11', NULL, 'A', '3624868570', 'esquivel hugo luis@gmail.com ')
, (NULL, 'Espindola Rodrigo Javier', 41227523, 20412275236, '2005-09-29', 'M', 'Soltero', '2018-12-15', NULL, 'A', '3624788110', 'espindola rodrigo javier@gmail.com ')
, (NULL, 'Sabater Silvia Susana', 16551360, 20165513606, '1950-05-25', 'M', 'Soltero', '2018-12-18', NULL, 'A', '3624221566', 'sabater silvia susana@gmail.com ')
, (NULL, 'Claudia Trangoni ', 11654195, 20353967446, '1951-06-15', 'M', 'Soltero', '2019-01-18', NULL, 'R', '3624817206', 'claudia trangoni@gmail.com ')
, (NULL, 'Oviedo Esteban Horacio', 31972156, 20319721566, '1954-10-05', 'M', 'Soltero', '2019-02-15', NULL, 'R', '3624800204', 'oviedo esteban horacio@gmail.com ')
, (NULL, 'Saucedo Claudio Agustín', 32745798, 20327457986, '1947-02-04', 'M', 'Soltero', '2019-02-22', NULL, 'N', '3624079169', 'saucedo claudio agustín@gmail.com ')
, (NULL, 'Godoy Nicolas Hector', 35466571, 20354665716, '1952-07-08', 'M', 'Soltero', '2019-03-19', NULL, 'A', '3624616203', 'godoy nicolas hector@gmail.com ')
, (NULL, 'Acuña Pablo G. ', 25792980, 20257929806, '1955-04-12', 'M', 'Soltero', '2019-03-30', NULL, 'R', '3624894817', 'acuña pablo g.@gmail.com ')
, (NULL, 'Castillo Ireneo Dimas', 5080766, 20050807666, '1995-11-22', 'M', 'Soltero', '2019-04-01', NULL, 'A', '3624867106', 'castillo ireneo dimas@gmail.com ')
, (NULL, 'Faranda Maria Laura', 13439448, 20134394486, '1951-05-22', 'M', 'Soltero', '2019-04-25', NULL, 'A', '3624623579', 'faranda maria laura@gmail.com ')
, (NULL, 'Solis Mauricio', 19035422, 20190354226, '1990-12-13', 'M', 'Soltero', '2019-06-07', NULL, 'A', '3624903375', 'solis mauricio@gmail.com ')
, (NULL, 'Gomez Jorge (Pv) ', 25612024, 20168877356, '1970-11-04', 'M', 'Soltero', '2019-06-19', NULL, 'R', '3624603791', 'gomez jorge pv@gmail.com ')
, (NULL, 'Antoniolli Karina Elisabet', 25828227, 20258282276, '1952-10-19', 'M', 'Soltero', '2019-06-22', NULL, 'N', '3624224604', 'antoniolli karina elisabet@gmail.com ')
, (NULL, 'Gòmez Marcela Natalia', 33612920, 20336129206, '1985-06-12', 'M', 'Soltero', '2019-06-25', NULL, 'A', '3624950469', 'gòmez marcela natalia@gmail.com ')
, (NULL, 'Lopez Hernan Rolando', 17808548, 20178085486, '2003-07-08', 'M', 'Soltero', '2019-08-02', NULL, 'A', '3625221657', 'lopez hernan rolando@gmail.com ')
, (NULL, 'Avalos Carolina Nancy', 23575134, 20235751346, '1996-02-21', 'M', 'Soltero', '2019-08-02', NULL, 'A', '3624262886', 'avalos carolina nancy@gmail.com ')
, (NULL, 'Sodja Alexis', 28888442, 30711459851, '2005-10-22', 'O', NULL, '2019-09-02', NULL, 'N', '1121577000', 'sodja alexis@gmail.com ')
, (NULL, 'Sandoval Hector Fabian ', 11966457, 20276202746, '1953-04-10', 'M', 'Soltero', '2019-09-14', NULL, 'N', '3624611824', 'sandoval hector fabian@gmail.com ')
, (NULL, 'Jacinto Farias ', 40478551, 20150787266, '1981-02-23', 'M', 'Soltero', '2019-09-24', NULL, 'N', '3624924679', 'jacinto farias@gmail.com ')
, (NULL, 'Sosa Gladys Noemi (Pv) ', 38224508, 20227779026, '1970-09-19', 'M', 'Soltero', '2019-10-10', NULL, 'R', '3624220836', 'sosa gladys noemi pv@gmail.com ')
, (NULL, 'Sandoval Liliana Elisabeth', 29826903, 20298269036, '1977-11-12', 'M', 'Soltero', '2019-10-11', NULL, 'R', '3624725808', 'sandoval liliana elisabeth@gmail.com ')
, (NULL, 'Gonzalez Laura', 22436850, 20224368506, '1990-09-01', 'M', 'Soltero', '2019-10-24', NULL, 'R', '3624607685', 'gonzalez laura@gmail.com ')
, (NULL, 'Leguizamon Mauricio Antonio', 32180986, 20321809866, '1975-03-17', 'M', 'Soltero', '2019-10-28', NULL, 'A', '3624406137', 'leguizamon mauricio antonio@gmail.com ')
, (NULL, 'Acosta Norma Romina', 32446189, 20324461896, '1993-07-23', 'M', 'Soltero', '2019-10-29', NULL, 'A', '3624033211', 'acosta norma romina@gmail.com ')
, (NULL, 'Gilfauy Laura Susana - Panaderia Pv ', 27472258, 20105519816, '1971-12-12', 'M', 'Soltero', '2019-10-30', NULL, 'R', '3624333311', 'gilfauy laura susana - panaderia pv@gmail.com ')
, (NULL, 'Borchichi Federico Alberto (Pv) ', 14604903, 20124461936, '1958-07-11', 'M', 'Soltero', '2019-10-31', NULL, 'R', '3624212526', 'borchichi federico alberto pv@gmail.com ')
, (NULL, 'Servasoni Marina ', 14962778, 20158402216, '1980-10-29', 'M', 'Soltero', '2019-11-05', NULL, 'R', '4482064', 'servasoni marina@gmail.com ')
, (NULL, 'Familia Aguirre ', 40035647, 20261031186, '1977-04-28', 'M', 'Soltero', '2019-11-15', NULL, 'R', '3624278953', 'familia aguirre@gmail.com ')
, (NULL, 'Soto Ana (Mercadito Anita 2 ) R ', 12725493, 20347277716, '1970-08-30', 'M', 'Soltero', '2019-11-21', NULL, 'R', '3624450478', 'soto ana mercadito anita 2 r@gmail.com ')
, (NULL, 'Natalia Gomez ', 11243104, 20199639006, '1959-06-11', 'M', 'Soltero', '2019-11-22', NULL, 'R', '3624618690', 'natalia gomez@gmail.com ')
, (NULL, 'Aranda Enrique Alejandro', 25961395, 20259613956, '1964-02-20', 'M', 'Soltero', '2019-11-22', NULL, 'R', '3624310759', 'aranda enrique alejandro@gmail.com ')
, (NULL, 'Rodríguez Oscar Ramón', 20419619, 20204196196, '1983-08-20', 'M', 'Soltero', '2019-11-22', NULL, 'A', '3624243363', 'rodríguez oscar ramón@gmail.com ')
, (NULL, 'Dulce Limon ', 28224189, 20314168046, '1981-07-03', 'M', 'Soltero', '2019-11-26', NULL, 'R', '3624524390', 'dulce limon@gmail.com ')
, (NULL, 'Alarcon Gustavo', 30704744, 20205000946, '1954-12-01', 'M', 'Soltero', '2019-11-27', NULL, 'R', '3624480452', 'alarcon gustavo@gmail.com ')
, (NULL, 'Ballestero Graciela ', 16959420, 20239951986, '1967-03-28', 'M', 'Soltero', '2019-12-06', NULL, 'N', '3624527202', 'ballestero graciela@gmail.com ')
, (NULL, 'Quiroz Sergio Nestor', 21930694, 20219306946, '1987-11-24', 'M', 'Soltero', '2019-12-11', NULL, 'R', '3624175047', 'quiroz sergio nestor@gmail.com ')
, (NULL, 'Marin ', 16041110, 20115494106, '1962-01-24', 'M', 'Soltero', '2019-12-24', NULL, 'R', '3624458545', 'marin@gmail.com ')
, (NULL, 'Britez Oscar Alfredo', 20634842, 20206348426, '1953-01-03', 'M', 'Soltero', '2020-01-02', NULL, 'R', '3624773637', 'britez oscar alfredo@gmail.com ')
, (NULL, 'Fibro Art ', 32893701, 20285039846, '2003-07-18', 'M', 'Soltero', '2020-01-09', NULL, 'N', '3624493658', 'fibro art@gmail.com ')
, (NULL, 'Rios Gabriel (Pv) ', 15584888, 20328902276, '1985-08-10', 'M', 'Soltero', '2020-01-28', NULL, 'R', '3624576829', 'rios gabriel pv@gmail.com ')
, (NULL, 'Rolon Walter Edgardo (Pv) ', 28876965, 20318428186, '1965-06-13', 'M', 'Soltero', '2020-01-29', NULL, 'R', '3624809120', 'rolon walter edgardo pv@gmail.com ')
, (NULL, 'Rios Nelida ', 24613988, 20219959086, '1974-01-15', 'M', 'Soltero', '2020-02-04', NULL, 'N', '3624565497', 'rios nelida@gmail.com ')
, (NULL, 'Smith Adriana (Pv) ', 14985891, 20294720056, '1986-05-15', 'M', 'Soltero', '2020-02-07', NULL, 'R', '3624715141', 'smith adriana pv@gmail.com ')
, (NULL, 'Gomez Andrea (Pv) ', 17401568, 20218565396, '1979-03-19', 'M', 'Soltero', '2020-02-07', NULL, 'R', '3624535653', 'gomez andrea pv@gmail.com ')
, (NULL, 'Marlen Fibro Art ', 27653824, 20108451856, '1948-02-05', 'M', 'Soltero', '2020-02-08', NULL, 'N', '3624420374', 'marlen fibro art@gmail.com ')
, (NULL, 'Duarte Damian Joel', 29934079, 20299340796, '1999-10-03', 'M', 'Soltero', '2020-02-10', NULL, 'R', '3624233766', 'duarte damian joel@gmail.com ')
, (NULL, 'Ojeda Ramona P.V ', 17184317, 20352450056, '1981-06-25', 'M', 'Soltero', '2020-02-20', NULL, 'R', '3624452742', 'ojeda ramona p.v@gmail.com ')
, (NULL, 'Autoservicio Los Maestros ', 21382107, 20378760636, '1949-06-02', 'M', 'Soltero', '2020-02-25', NULL, 'R', '3624577776', 'autoservicio los maestros@gmail.com ')
, (NULL, 'Ludueño Amir', 40606352, 20406063526, '2005-03-31', 'M', 'Soltero', '2020-03-07', NULL, 'A', '3624249616', 'ludueño amir@gmail.com ')
, (NULL, 'Maffei Luis Angel', 7910128, 20079101286, '1945-02-17', 'M', 'Soltero', '2020-03-16', NULL, 'N', '3624601164', 'maffei luis angel@gmail.com ')
, (NULL, 'Añasco Lorena', 17810118, 20221057386, '2003-02-16', 'M', 'Soltero', '2020-03-17', NULL, 'N', '3624872459', 'añasco lorena@gmail.com ')
, (NULL, 'Juan Perez', 16416588, 20342277816, '1950-05-10', 'M', 'Soltero', '2020-03-17', NULL, 'R', '3624774084', '-@gmail.com ')
, (NULL, 'Sotomayor Cristian (Pv) ', 29654652, 20125367246, '1978-11-30', 'M', 'Soltero', '2020-03-18', NULL, 'R', '3624755903', 'sotomayor cristian pv@gmail.com ')
, (NULL, 'Quiroz Mario Alcides', 31858996, 20318589966, '1961-03-26', 'M', 'Soltero', '2020-03-20', NULL, 'R', '3624049123', 'quiroz mario alcides@gmail.com ')
, (NULL, 'Encina Elena ', 29364070, 20395252976, '1971-01-10', 'M', 'Soltero', '2020-04-13', NULL, 'N', '3624616586', 'encina elena@gmail.com ')
, (NULL, 'Arguello Rita Erika Cecilia', 29365583, 27369779983, '1974-11-26', 'F', 'Soltero', '2020-04-16', NULL, 'R', '3624278527', 'arguello rita erika cecilia@gmail.com ')
, (NULL, 'Miño Jorge Luis - Propietario ', 20451693, 20204516936, '1972-11-14', 'M', 'Soltero', '2020-04-21', NULL, 'N', '3624470528', 'miño jorge luis - propietario@gmail.com ')
, (NULL, 'Gerez Romina', 35742597, 20299644976, '1967-05-02', 'M', 'Soltero', '2020-04-23', NULL, 'R', '3624737027', 'gerez romina@gmail.com ')
, (NULL, 'Contreras Sabrina', 34949684, 20247950506, '1989-06-08', 'M', 'Soltero', '2020-04-24', NULL, 'R', '3624009559', 'contreras sabrina@gmail.com ')
, (NULL, 'Gomez Vanesa', 14400761, 20384951666, '2001-07-18', 'M', 'Soltero', '2020-04-24', NULL, 'R', '3624253684', 'gomez vanesa@gmail.com ')
, (NULL, 'Ponce Irma Noemi', 17920971, 20179209716, '1983-12-21', 'M', 'Soltero', '2020-04-24', NULL, 'R', '3624596745', 'ponce irma noemi@gmail.com ')
, (NULL, 'Mercadito Charly ', 18698069, 20171339386, '1946-01-23', 'M', 'Soltero', '2020-04-25', NULL, 'N', '3624877924', 'mercadito charly@gmail.com ')
, (NULL, 'Amarilla Maria Luisa', 17150991, 20171509916, '1964-02-20', 'M', 'Soltero', '2020-04-25', NULL, 'R', '3624970297', 'amarilla maria luisa@gmail.com ')
, (NULL, 'Julian Salinas ', 17825350, 20204832196, '1971-06-04', 'M', 'Soltero', '2020-04-25', NULL, 'R', '3625240859', 'julian salinas@gmail.com ')
, (NULL, 'Vodanovich Miriam', 39691788, 20288283406, '1963-11-12', 'M', 'Soltero', '2020-04-25', NULL, 'R', '3624423357', 'vodanovich miriam@gmail.com ')
, (NULL, 'Fleyta Mario Ruben', 26924184, 20269241846, '1951-09-22', 'M', 'Soltero', '2020-04-29', NULL, 'R', '3624235522', 'fleyta mario ruben@gmail.com ')
, (NULL, 'Changazzo Miriam Lorena', 25210875, 20252108756, '1946-11-30', 'M', 'Soltero', '2020-04-30', NULL, 'R', '3624236905', 'changazzo miriam lorena@gmail.com ')
, (NULL, 'Torres Victoria', 33075016, 27330750161, '1998-04-30', 'F', 'Soltero', '2020-04-30', NULL, 'R', '3624235114', 'torres victoria@gmail.com ')
, (NULL, 'Sartori Adolfo', 30543294760, 30543294760, '1952-07-10', 'O', NULL, '2020-05-01', NULL, 'F', '3624851203', 'sartori adolfo@gmail.com ')
, (NULL, 'Gutierrez Emanuel', 29613929, 20296139296, '1985-07-05', 'M', 'Soltero', '2020-05-02', NULL, 'R', '3624175700', 'gutierrez emanuel@gmail.com ')
, (NULL, 'Sanchez Hernando Jesus', 29137755, 20291377556, '1967-03-12', 'M', 'Soltero', '2020-05-02', NULL, 'R', '3625243624', 'sanchez hernando jesus@gmail.com ')
, (NULL, 'Torres Olga Noemi', 16704473, 20167044736, '1986-05-21', 'M', 'Soltero', '2020-05-02', NULL, 'R', '3624050912', 'torres olga noemi@gmail.com ')
, (NULL, 'Fernandez Vanesa Noemi', 28126471, 20149338176, '1968-12-13', 'M', 'Soltero', '2020-05-02', NULL, 'R', '3624271070', 'fernandez vanesa noemi@gmail.com ')
, (NULL, 'Cañete Monica Beatriz', 21860041, 20218600416, '2000-11-03', 'M', 'Soltero', '2020-05-02', NULL, 'R', '3624483842', 'cañete monica beatriz@gmail.com ')
, (NULL, 'Monzon Paola Lilian', 28125912, 20281259126, '1994-02-13', 'M', 'Soltero', '2020-05-05', NULL, 'R', '3624655563', 'monzon paola lilian@gmail.com ')
, (NULL, 'Castillo Laura', 30522852, 27171281461, '1946-01-23', 'F', 'Soltero', '2020-05-06', '2023-01-30', 'R', '3624625795', 'castillo laura@gmail.com ')
, (NULL, 'Rosciani Nicolas', 31971091, 20319710915, '1998-09-14', 'M', 'Soltero', '2020-05-09', NULL, 'R', '3624549587', 'rosciani nicolas@gmail.com ')
, (NULL, 'Cardozo Vanesa Estela', 30159396, 20301593966, '1980-01-13', 'M', 'Soltero', '2020-05-09', NULL, 'R', '3624603589', 'cardozo vanesa estela@gmail.com ')
, (NULL, 'Toledo Leandro Edgar', 34671231, 20346712318, '1957-05-15', 'M', 'Soltero', '2020-05-09', NULL, 'R', '3624865970', 'toledo leandro edgar@gmail.com ')
, (NULL, 'Roman Lorena Marisol', 30159130, 20301591306, '1962-09-30', 'M', 'Soltero', '2020-05-11', NULL, 'A', '3624257546', 'roman lorena marisol@gmail.com ')
, (NULL, 'Gonzalez Elsa Roxana', 12624658, 20245989766, '1968-01-23', 'M', 'Soltero', '2020-05-13', NULL, 'R', '3625224235', 'gonzalez elsa roxana@gmail.com ')
, (NULL, 'Zapata Laura Magali', 30791690, 27307916903, '1953-12-27', 'F', 'Soltero', '2020-05-14', NULL, 'R', '3624817009', 'zapata laura magali@gmail.com ')
, (NULL, 'Aquino Isabel', 16366420, 20163664206, '1988-11-14', 'M', 'Soltero', '2020-05-14', NULL, 'A', '3624266793', 'aquino isabel@gmail.com ')
, (NULL, 'Romero Elena Beatriz', 27526700, 20275267006, '1965-07-31', 'M', 'Soltero', '2020-05-15', NULL, 'R', '3624641408', 'romero elena beatriz@gmail.com ')
, (NULL, 'Farias Pablo Andres', 35690246, 20356902466, '1983-05-09', 'M', 'Soltero', '2020-05-15', NULL, 'R', '3624041630', 'farias pablo andres@gmail.com ')
, (NULL, 'Hardy ', 29933099, 20300435836, '1955-09-06', 'M', 'Soltero', '2020-05-22', NULL, 'N', '3624528330', 'hardy@gmail.com ')
, (NULL, 'Ruiz Diaz Marcelo Gabriel', 43347367, 20433473676, '1966-05-06', 'M', 'Soltero', '2020-05-22', NULL, 'R', '3624901584', 'ruiz diaz marcelo gabriel@gmail.com ')
, (NULL, 'Esteban Vall Fernando Emiliano', 33377573, 20333775736, '1952-09-28', 'M', 'Soltero', '2020-06-01', NULL, 'A', '3725454460', 'esteban vall fernando emiliano@gmail.com ')
, (NULL, 'Bellini Laura Cecilia (N)', 26140274, 20261402746, '2005-08-28', 'M', 'Soltero', '2020-06-05', NULL, 'N', '3624128426', 'bellini laura cecilia n@gmail.com ')
, (NULL, 'Dure Jorge Raul', 31330117, 20313301176, '2004-07-29', 'M', 'Soltero', '2020-06-10', NULL, 'A', '3624688616', 'dure jorge raul@gmail.com ')
, (NULL, 'Gonzalez Noelia Soledad', 28047876, 27280478763, '1946-12-26', 'F', 'Soltero', '2020-06-17', NULL, 'R', '3624253831', 'gonzalez noelia soledad@gmail.com ')
, (NULL, 'Gonzalez Jorge', 28926778, 20271486476, '1991-02-04', 'M', 'Soltero', '2020-07-03', NULL, 'R', '3624872927', 'gonzalez jorge@gmail.com ')
, (NULL, 'Morel Dario', 34184023, 20379174706, '1977-10-29', 'M', 'Soltero', '2020-07-04', NULL, 'R', '3624748513', 'morel dario@gmail.com ')
, (NULL, 'Cimbaro Canela Guliana', 36211028, 20362110286, '1956-05-14', 'M', 'Soltero', '2020-07-11', NULL, 'R', '3624096999', 'cimbaro canela guliana@gmail.com ')
, (NULL, 'Ferreyra Luis', 38681000, 20391440516, '1995-04-11', 'M', 'Soltero', '2020-07-15', NULL, 'N', '3624792415', 'ferreyra luis@gmail.com ')
, (NULL, 'Calvo Jose Antonio (Piero) ', 20971598, 20209715989, '1952-06-29', 'M', 'Soltero', '2020-08-01', NULL, 'F', '3624448456', 'calvo jose antonio piero@gmail.com ')
, (NULL, 'Foschiatti Maria Cristina', 25828425, 20258284256, '1988-01-05', 'M', 'Soltero', '2020-08-01', NULL, 'R', '3624863419', 'foschiatti maria cristina@gmail.com ')
, (NULL, 'Rojas Karina', 26645198, 20266451986, '1990-04-07', 'M', 'Soltero', '2020-08-19', NULL, 'R', '3624385602', 'rojas karina@gmail.com ')
, (NULL, 'Dominguez Ramon', 14559590, 20206094506, '1948-07-26', 'M', 'Casado', '2020-09-01', NULL, 'R', '3624492408', 'dominguez ramon@gmail.com ')
, (NULL, 'Landa Rodrigo Sebastian', 26223772, 20262237726, '1952-06-12', 'M', 'Casado', '2020-09-01', NULL, 'A', '3624669784', 'landa rodrigo sebastian@gmail.com ')
, (NULL, 'Ledesma Hector Antonio', 19904221, 20190842736, '2004-07-23', 'M', 'Casado', '2020-09-15', NULL, 'R', '3624919292', 'ledesma hector antonio@gmail.com ')
, (NULL, 'Lencina Daniel Alberto', 42066793, 20420667936, '1954-05-09', 'M', 'Casado', '2020-10-03', NULL, 'R', '3624756219', 'lencina daniel alberto@gmail.com ')
, (NULL, 'Cubilla Diego Javier', 34055511, 20340555113, '1973-02-18', 'M', 'Casado', '2020-10-05', NULL, 'R', '3625207559', 'cubilla diego javier@gmail.com ')
, (NULL, 'Gomez Narciso José', 30791654, 20307916542, '2004-04-02', 'M', 'Casado', '2020-10-10', NULL, 'R', '3624888650', 'gomez narciso josé@gmail.com ')
, (NULL, 'Quiroz Luis Oscar', 22330189, 20223301896, '1965-01-27', 'M', 'Casado', '2020-10-21', NULL, 'R', '3624229932', 'quiroz luis oscar@gmail.com ')
, (NULL, 'Acosta Carlos Alberto', 29767912, 20297679126, '1996-07-16', 'M', 'Casado', '2020-10-21', NULL, 'R', '3624369242', 'acosta carlos alberto@gmail.com ')
, (NULL, 'Peralta Juan Manuel', 32728811, 20327288116, '1979-12-09', 'M', 'Casado', '2020-10-27', NULL, 'R', '3624729285', 'peralta juan manuel@gmail.com ')
, (NULL, 'Blasco Julia (Hermano)', 16551360, 20165513606, '1957-04-05', 'M', 'Casado', '2020-11-03', NULL, 'A', '3624221566', 'blasco julia hermano@gmail.com ')
, (NULL, 'Sosa Ofelia Catalina', 27980069, 27279800697, '1997-03-08', 'F', 'Casado', '2020-11-04', NULL, 'R', '3624074240', 'sosa ofelia catalina@gmail.com ')
, (NULL, 'Cisneros Silvia Amalia', 23513926, 20365237276, '1945-11-19', 'M', 'Casado', '2020-11-11', NULL, 'N', '3624832954', 'cisneros silvia amalia@gmail.com ')
, (NULL, 'Acosta Gaston', 32154477, 20128673686, '1962-03-31', 'M', 'Casado', '2021-01-04', '2024-06-30', 'N', '3624832322', 'acosta gaston@gmail.com ')
, (NULL, 'Medina Cristian Jacobo', 13716337, 20408670506, '1987-12-24', 'M', 'Casado', '2021-01-05', NULL, 'R', '3624609094', 'medina cristian jacobo@gmail.com ')
, (NULL, 'Riedel Nicolas', 10978103, 20288824366, '1992-12-30', 'M', 'Casado', '2021-01-09', NULL, 'R', '3624623996', 'riedel nicolas@gmail.com ')
, (NULL, 'Morales Ruben', 11061752, 20351129966, '1979-09-30', 'M', 'Casado', '2021-01-16', NULL, 'R', '3624631144', 'morales ruben@gmail.com ')
, (NULL, 'Flores Alicia', 39873381, 20191544126, '2001-10-22', 'M', 'Casado', '2021-01-20', NULL, 'N', '3624944792', 'flores alicia@gmail.com ')
, (NULL, 'Escobar Marlene', 10868392, 20317387256, '1974-01-30', 'M', 'Casado', '2021-01-28', NULL, 'N', '3624834635', 'escobar marlene@gmail.com ')
, (NULL, 'Barni Alexis Ezequiel', 28675236, 20381885416, '1968-09-06', 'M', 'Casado', '2021-01-29', NULL, 'R', '3625210542', 'barni alexis ezequiel@gmail.com ')
, (NULL, 'Colman Dante Gustavo', 27410816, 23274108169, '1960-07-19', 'O', NULL, '2021-01-30', NULL, 'A', '3624256137', 'colman dante gustavo@gmail.com ')
, (NULL, 'Espindola Jesus Salvador', 13904681, 34546687068, '2001-06-30', 'O', NULL, '2021-02-03', NULL, 'A', '3624693846', 'espindola jesus salvador@gmail.com ')
, (NULL, 'Gonzalez Alfredo ', 11442926, 20322976126, '2004-08-08', 'M', 'Casado', '2021-02-04', NULL, 'N', '3624500673', 'gonzalez alfredo@gmail.com ')
, (NULL, 'Benitez Evelin', 24299114, 20188064396, '1963-07-27', 'M', 'Casado', '2021-02-04', NULL, 'R', '3624480396', 'benitez evelin@gmail.com ')
, (NULL, 'Aguirre Anibal', 28661594, 20286615946, '1958-10-21', 'M', 'Casado', '2021-02-05', NULL, 'R', '3624801839', 'aguirre anibal@gmail.com ')
, (NULL, 'Ojeda Dario Enrique', 23987327, 20239873276, '1974-06-14', 'M', 'Casado', '2021-02-05', NULL, 'A', '3624597938', 'ojeda dario enrique@gmail.com ')
, (NULL, 'Palacios Leandro', 33383497, 20333834976, '2001-01-08', 'M', 'Casado', '2021-02-06', NULL, 'A', '3624727019', 'palacios leandro@gmail.com ')
, (NULL, 'Passamano Ramon', 24596501, 20113962146, '1975-12-25', 'M', 'Casado', '2021-02-09', NULL, 'R', '3624162723', 'passamano ramon@gmail.com ')
, (NULL, 'Berezosky Leonardo Manuel', 31209282, 20312092826, '1992-05-31', 'M', 'Casado', '2021-02-09', NULL, 'A', '3794318343', 'berezosky leonardo manuel@gmail.com ')
, (NULL, 'Quiroz Horacio Norberto', 27585646, 20275856466, '1953-03-25', 'M', 'Casado', '2021-02-19', NULL, 'R', '3624236424', 'quiroz horacio norberto@gmail.com ')
, (NULL, 'Garcia Gisela Solange', 33384093, 20333840936, '1978-06-11', 'M', 'Casado', '2021-02-19', NULL, 'R', '3624504173', 'garcia gisela solange@gmail.com ')
, (NULL, 'Ramirez Emanuel David', 34055900, 20340559006, '1972-01-24', 'M', 'Casado', '2021-02-23', NULL, 'R', '3624390278', 'ramirez emanuel david@gmail.com ')
, (NULL, 'Hertler Hermes', 39190295, 20391902956, '1996-08-15', 'M', 'Casado', '2021-02-24', NULL, 'R', '0', 'hertler hermes@gmail.com ')
, (NULL, 'Arce Valeria', 38332900, 20237356706, '1989-10-01', 'M', 'Casado', '2021-02-27', NULL, 'N', '3624554946', 'arce valeria@gmail.com ')
, (NULL, 'Leiva Maximiliano Damian', 40606851, 20406068516, '2005-06-18', 'M', 'Casado', '2021-03-01', NULL, 'R', '3624856342', 'leiva maximiliano damian@gmail.com ')
, (NULL, 'Sanabria Celeste', 23791649, 20376087456, '1977-11-16', 'M', 'Casado', '2021-03-01', NULL, 'N', '3624741942', 'sanabria celeste@gmail.com ')
, (NULL, 'Cabrera Oscar Bonifacio', 10639134, 30715120409, '2001-03-18', 'O', NULL, '2021-03-12', NULL, 'A', '3624154266', 'cabrera oscar bonifacio@gmail.com ')
, (NULL, 'Bangher Flavia Valeria', 34702681, 20347026816, '1961-11-14', 'M', 'Casado', '2021-03-18', NULL, 'R', '3624804324', 'bangher flavia valeria@gmail.com ')
, (NULL, 'Bogado Angelina', 25073624, 20250736246, '1991-11-22', 'M', 'Casado', '2021-03-26', NULL, 'R', '3625207480', 'bogado angelina@gmail.com ')
, (NULL, 'Bogado Alvaro', 22343247, 30716836165, '1988-08-22', 'O', NULL, '2021-04-14', NULL, 'A', '3624124279', 'bogado alvaro@gmail.com ')
, (NULL, 'Sanchez Marcelo', 21714185, 20277839426, '1953-10-29', 'M', 'Casado', '2021-04-16', NULL, 'N', '3624760916', 'sanchez marcelo@gmail.com ')
, (NULL, 'Feldman Maximiliano', 14154067, 20342582186, '1996-10-24', 'M', 'Casado', '2021-04-16', NULL, 'N', '3624710858', 'feldman maximiliano@gmail.com ')
, (NULL, 'Alfonso Rafael Cesar', 29223757, 20292237576, '1958-03-07', 'M', 'Casado', '2021-04-29', NULL, 'R', '3624824125', 'alfonso rafael cesar@gmail.com ')
, (NULL, 'Fernández Marcelo Jose', 29720741, 20297207416, '1962-11-12', 'M', 'Casado', '2021-05-12', NULL, 'A', '3624259467', 'fernández marcelo jose@gmail.com ')
, (NULL, 'Herrendorf Florencia', 15922523, 20115407596, '1966-06-18', 'M', 'Casado', '2021-05-22', NULL, 'F', '3624609467', 'herrendorf florencia@gmail.com ')
, (NULL, 'Velazco Pablo Daniel', 29223605, 20292236056, '1950-11-24', 'M', 'Casado', '2021-06-15', NULL, 'A', '3624125692', 'velazco pablo daniel@gmail.com ')
, (NULL, 'Lopez Ruben', 6192462, 20061924626, '1965-01-15', 'M', 'Casado', '2021-07-14', NULL, 'F', '3624539610', 'lopez ruben@gmail.com ')
, (NULL, 'Caseres Monica Beatriz', 17016730, 20170167306, '1952-09-18', 'M', 'Casado', '2021-07-16', NULL, 'A', '3624872285', 'caseres monica beatriz@gmail.com ')
, (NULL, 'Panificadora Don Ramon ', 33426712, 20191870786, '1981-08-09', 'M', 'Casado', '2021-08-27', NULL, 'R', '3624896794', 'panificadora don ramon@gmail.com ')
, (NULL, 'Vera Ricardo Sebastian', 28625577, 30564680148, '1994-01-06', 'O', NULL, '2021-10-01', NULL, 'A', '3624108550', 'vera ricardo sebastian@gmail.com ')
, (NULL, 'Acosta Gabriel Alberto', 25942850, 33717056189, '1968-01-10', 'O', NULL, '2021-10-14', NULL, 'A', '3624247339', 'acosta gabriel alberto@gmail.com ')
, (NULL, 'Colussi Veronica Isabel', 31570468, 20315704686, '1992-11-16', 'M', 'Casado', '2021-10-21', NULL, 'A', '3624875789', 'colussi veronica isabel@gmail.com ')
, (NULL, 'Barrios Rodolfo Ramon', 35899467, 20358994676, '1946-04-05', 'M', 'Casado', '2021-11-11', NULL, 'A', '3624290316', 'barrios rodolfo ramon@gmail.com ')
, (NULL, 'Foschia Roberto German', 30748101, 20307481016, '1977-03-18', 'M', 'Casado', '2021-12-01', NULL, 'A', '3624931089', 'foschia roberto german@gmail.com ')
, (NULL, 'Soto Ramona', 20977854, 20209778546, '2000-09-25', 'M', 'Casado', '2021-12-20', '2022-10-30', 'A', '3624710235', 'soto ramona@gmail.com ')
, (NULL, 'Bianchi Williams', 23987511, 20239875116, '1948-04-06', 'M', 'Casado', '2021-12-21', NULL, 'A', '3624921005', 'bianchi williams@gmail.com ')
, (NULL, 'Bonavita Garcia Johanna Cristina', 27001941, 20270019416, '1989-02-27', 'M', 'Casado', '2022-02-18', NULL, 'A', '3624549649', 'bonavita garcia johanna cristina@gmail.com ')
, (NULL, 'De Bortoli Mario', 33548653, 20335486536, '1959-05-24', 'M', 'Casado', '2022-03-02', NULL, 'A', '3624331836', 'de bortoli mario@gmail.com ')
, (NULL, 'Bugnart Maria Nela', 35030958, 20350309586, '1965-08-04', 'M', 'Casado', '2022-03-18', NULL, 'A', '3624968818', 'bugnart maria nela@gmail.com ')
, (NULL, 'Castillo Leyes Jorge Diego', 29554709, 20295547096, '1995-10-19', 'M', 'Casado', '2022-03-25', NULL, 'A', '3624259722', 'castillo leyes jorge diego@gmail.com ')
, (NULL, 'Vidal Nilda Manuela', 24727838, 20247278386, '1987-11-17', 'M', 'Casado', '2022-03-25', NULL, 'A', '3625269981', 'vidal nilda manuela@gmail.com ')
, (NULL, 'Gomez Gustavo Horacio', 16368128, 20163681286, '1999-05-28', 'M', 'Casado', '2022-04-01', NULL, 'A', '3721400225', 'gomez gustavo horacio@gmail.com ')
, (NULL, 'Zapata Hector Gabriel', 38190995, 20381909956, '1950-04-01', 'M', 'Casado', '2022-05-16', NULL, 'A', '3624067618', 'zapata hector gabriel@gmail.com ')
, (NULL, 'Pereira Jessica Alejandra', 27212256, 20272122566, '1982-01-03', 'M', 'Casado', '2022-05-17', NULL, 'A', '3624683560', 'pereira jessica alejandra@gmail.com ')
, (NULL, 'Mieres Catalina', 5274087, 20052740876, '1952-02-02', 'M', 'Casado', '2022-05-19', NULL, 'A', '3624462486', 'mieres catalina@gmail.com ')
, (NULL, 'Alegre Sandra Viviana', 23876267, 20238762676, '1947-05-31', 'M', 'Casado', '2022-06-16', NULL, 'A', '3624605305', 'alegre sandra viviana@gmail.com ')
, (NULL, 'Gonzalez Analia Alexandra', 33724739, 20337247396, '2002-01-31', 'M', 'Casado', '2022-07-25', NULL, 'A', '3624669642', 'gonzalez analia alexandra@gmail.com ')
, (NULL, 'Ayala Pablo Daniel', 31570768, 20315707686, '2001-07-03', 'M', 'Casado', '2022-08-08', NULL, 'A', '3624814149', 'ayala pablo daniel@gmail.com ')
, (NULL, 'Maciel Carina Beatriz', 35301899, 20353018996, '1946-04-08', 'M', 'Casado', '2022-08-22', NULL, 'A', '3625224764', 'maciel carina beatriz@gmail.com ')
, (NULL, 'Veliz Nelida', 10674493, 20106744936, '1963-07-04', 'M', 'Casado', '2022-08-30', NULL, 'A', '3624635788', 'veliz nelida@gmail.com ')
, (NULL, 'Casco Vilma Noemi', 23419966, 20234199666, '1953-02-24', 'M', 'Casado', '2022-09-09', NULL, 'A', '3624890012', 'casco vilma noemi@gmail.com ')
, (NULL, 'Obregon Romina Vanesa', 31330132, 20313301326, '1970-01-24', 'M', 'Casado', '2022-09-19', NULL, 'A', '3624248664', 'obregon romina vanesa@gmail.com ')
, (NULL, 'Perez Karina Elisabeth', 29925542, 20299255426, '1989-02-14', 'M', 'Casado', '2022-09-29', NULL, 'A', '3624127243', 'perez karina elisabeth@gmail.com ')
, (NULL, 'Mihal Oscar Andres', 12466446, 20124664466, '1959-06-08', 'M', 'Casado', '2022-09-29', NULL, 'A', '3624252124', 'mihal oscar andres@gmail.com ')
, (NULL, 'Samita Maximiliano', 41040474, 20410404746, '2001-09-29', 'M', 'Casado', '2022-10-03', NULL, 'A', '3644502904', 'samita maximiliano@gmail.com ')
, (NULL, 'Viganotti Danielo Oscar', 24908580, 30686050145, '1985-02-06', 'O', NULL, '2022-11-17', NULL, 'A', '3624303941', 'viganotti danielo oscar@gmail.com ')
, (NULL, 'Ferrero Marcos Sebastian', 35466375, 20354663756, '1961-10-30', 'M', 'Casado', '2022-12-05', NULL, 'A', '3624510065', 'ferrero marcos sebastian@gmail.com ')
, (NULL, 'Barreto Faustino Antonio', 12343135, 20123431356, '1981-07-23', 'M', 'Casado', '2022-12-12', NULL, 'A', '3625459280', 'barreto faustino antonio@gmail.com ')
, (NULL, 'Spesso Julieta Higinia', 33123899, 20331238996, '1976-09-02', 'M', 'Casado', '2022-12-16', NULL, 'A', '3624725815', 'spesso julieta higinia@gmail.com ')
, (NULL, 'Dure Laura Manuela', 25534137, 20255341376, '1954-10-28', 'M', 'Casado', '2022-12-19', NULL, 'A', '3624703865', 'dure laura manuela@gmail.com ')
, (NULL, 'Gonzalez Celia Adelina', 23691439, 20236914396, '1996-07-26', 'M', 'Casado', '2022-12-23', NULL, 'A', '3624559277', 'gonzalez celia adelina@gmail.com ')
, (NULL, 'Perin Gabriela Del Valle', 28522481, 20285224816, '1983-11-02', 'M', 'Casado', '2023-01-11', NULL, 'A', '3537301303', 'perin gabriela del valle@gmail.com ')
, (NULL, 'Martinez Andrea Veronica', 27877560, 20278775606, '1967-06-19', 'M', 'Casado', '2023-01-14', NULL, 'A', '3624873719', 'martinez andrea veronica@gmail.com ')
, (NULL, 'Perez Benitez Lilian', 13114587, 20131145876, '1989-06-25', 'M', 'Casado', '2023-01-25', NULL, 'A', '3624651558', 'perez benitez lilian@gmail.com ')
, (NULL, 'Chahin Cecilia Lorena', 30791520, 20307915206, '1947-03-21', 'M', 'Casado', '2023-02-01', NULL, 'A', '1166609300', 'chahin cecilia lorena@gmail.com ')
, (NULL, 'Martinez Facundo Nahuel', 30748372, 20307483726, '1988-10-07', 'M', 'Casado', '2023-02-09', NULL, 'A', '3624728312', 'martinez facundo nahuel@gmail.com ')
, (NULL, 'Gonzalez Victor Luis', 35037300, 20350373006, '1975-03-02', 'M', 'Casado', '2023-02-09', NULL, 'A', '3624161267', 'gonzalez victor luis@gmail.com ')
, (NULL, 'Alegre Maria Cecilia', 37157919, 20371579196, '1950-10-05', 'M', 'Casado', '2023-02-17', NULL, 'A', '3764811199', 'alegre maria cecilia@gmail.com ')
, (NULL, 'Thorlet Fernando Andres', 25278388, 20252783886, '1992-10-25', 'M', 'Casado', '2023-02-22', NULL, 'A', '3644645167', 'thorlet fernando andres@gmail.com ')
, (NULL, 'Lopez Marcelo Alejandro', 23685584, 20236855846, '1952-07-07', 'M', 'Casado', '2023-02-23', NULL, 'A', '3624855975', 'lopez marcelo alejandro@gmail.com ')
, (NULL, 'Gutierrez Francisco', 7806118, 20078061186, '1970-02-22', 'M', 'Casado', '2023-03-14', NULL, 'A', '3624774313', 'gutierrez francisco@gmail.com ')
, (NULL, 'Pereyra Maria Lorena', 25083229, 33715092129, '1999-12-12', 'O', NULL, '2023-03-16', NULL, 'A', '3625215209', 'pereyra maria lorena@gmail.com ')
, (NULL, 'Gutierrez Yanina Alexandra', 29613925, 20296139256, '1985-06-07', 'M', 'Casado', '2023-03-21', NULL, 'A', '3624263104', 'gutierrez yanina alexandra@gmail.com ')
, (NULL, 'Jerez Roberto Oscar', 22330219, 20223302196, '1992-04-23', 'M', 'Casado', '2023-03-27', NULL, 'A', '3624297980', 'jerez roberto oscar@gmail.com ')
, (NULL, 'Ojeda Aurelio Oscar', 13306119, 20133061196, '1965-01-05', 'M', 'Casado', '2023-03-28', NULL, 'A', '3624775132', 'ojeda aurelio oscar@gmail.com ')
, (NULL, 'Vargas Susana Aida', 23059927, 20230599276, '1999-08-23', 'M', 'Casado', '2023-04-04', NULL, 'A', '3624165207', 'vargas susana aida@gmail.com ')
, (NULL, 'Ojeda Antonio Ramon', 29552857, 20295528576, '1983-08-21', 'M', 'Casado', '2023-04-18', NULL, 'A', '3624232483', 'ojeda antonio ramon@gmail.com ')
, (NULL, 'Escobar Cristian Ariel', 30214987, 20302149876, '1952-01-05', 'M', 'Casado', '2023-05-04', NULL, 'A', '3624822177', 'escobar cristian ariel@gmail.com ')
, (NULL, 'Leguizamon Miguel De Jesus', 17369964, 20173699646, '1973-08-31', 'M', 'Casado', '2023-05-11', NULL, 'A', '3624562160', 'leguizamon miguel de jesus@gmail.com ')
, (NULL, 'Sorba Isaac', 34302900, 20343029006, '1961-10-28', 'M', 'Casado', '2023-06-02', NULL, 'A', '3624207722', 'sorba isaac@gmail.com ')
, (NULL, 'Vence Rosalia', 20500190, 20205001906, '1985-05-17', 'M', 'Casado', '2023-06-13', NULL, 'A', '3624366886', 'vence rosalia@gmail.com ')
, (NULL, 'Bobadilla Ricardo Martin', 32062322, 20320623226, '2002-02-05', 'M', 'Casado', '2023-06-16', NULL, 'A', '3624782065', 'bobadilla ricardo martin@gmail.com ')
, (NULL, 'Alderete Juana Irene', 13114423, 20131144236, '1963-05-17', 'M', 'Casado', '2023-06-21', '2024-02-28', 'A', '3624172947', 'alderete juana irene@gmail.com ')
, (NULL, 'Alderete Juana Irene (Mamá)', 13114423, 20131144236, '1984-10-02', 'M', 'Casado', '2023-07-28', NULL, 'A', '3624172947', 'alderete juana irene mamá@gmail.com ')
, (NULL, 'Rodriguez Claudio Leonardo', 27088637, 30630617762, '1992-07-03', 'O', NULL, '2023-09-11', NULL, 'A', '3624125364', 'rodriguez claudio leonardo@gmail.com ')
, (NULL, 'Perez Luis Alfredo', 33878669, 20338786696, '2002-02-19', 'M', 'Casado', '2023-09-20', NULL, 'A', '3625470130', 'perez luis alfredo@gmail.com ')
, (NULL, 'Kochowiec Karen', 39309945, 20393099456, '1988-07-25', 'M', 'Casado', '2023-10-02', NULL, 'A', '3624614158', 'kochowiec karen@gmail.com ')
, (NULL, 'Perez Graciela Beatriz', 16349079, 20163490796, '1998-12-07', 'M', 'Casado', '2023-10-12', NULL, 'A', '3624793041', 'perez graciela beatriz@gmail.com ')
, (NULL, 'Gill Nidia Mabel', 26575287, 30717828867, '1959-08-29', 'O', NULL, '2023-10-18', NULL, 'A', '3625628762', 'gill nidia mabel@gmail.com ')
, (NULL, 'Duarte Nicolas Fernando', 36198417, 20361984176, '1981-03-01', 'M', 'Casado', '2023-10-24', NULL, 'A', '3624692223', 'duarte nicolas fernando@gmail.com ')
, (NULL, 'Alcaraz Ignacio Raul', 17388712, 20173887126, '1958-10-22', 'M', 'Casado', '2023-11-09', NULL, 'A', '3624815908', 'alcaraz ignacio raul@gmail.com ')
, (NULL, 'Romero Nicolas Ariel', 33724985, 20337249856, '1959-03-13', 'M', 'Casado', '2023-11-13', NULL, 'A', '3624263505', 'romero nicolas ariel@gmail.com ')
, (NULL, 'Alunni Ana Laura', 36611313, 20366113136, '1996-06-04', 'M', 'Casado', '2023-11-14', NULL, 'A', '3624330030', 'alunni ana laura@gmail.com ')
, (NULL, 'Suarez Marisa Griselda', 22891419, 20228914196, '2001-01-24', 'M', 'Casado', '2023-11-15', NULL, 'A', '3624802809', 'suarez marisa griselda@gmail.com ')
, (NULL, 'Fernandez Ivan Ezequiel', 37168365, 20371683656, '1956-10-01', 'M', 'Casado', '2023-11-15', NULL, 'A', '3624333397', 'fernandez ivan ezequiel@gmail.com ')
, (NULL, 'Kees Juan Ramon', 28707552, 20287075526, '1993-03-26', 'M', 'Casado', '2023-11-15', NULL, 'A', '3624406726', 'kees juan ramon@gmail.com ')
, (NULL, 'Mendez Silvina Elizabeth', 26651153, 30710390807, '2003-03-11', 'O', NULL, '2023-11-17', NULL, 'A', '3624836999', 'mendez silvina elizabeth@gmail.com ')
, (NULL, 'Gonzalez Mirta Graciela', 13309252, 20133092526, '2004-05-16', 'M', 'Casado', '2023-11-20', NULL, 'A', '3624013600', 'gonzalez mirta graciela@gmail.com ')
, (NULL, 'Romera Carolina Lucia', 28858145, 20288581456, '1973-05-16', 'M', 'Casado', '2023-12-04', NULL, 'A', '3624729280', 'romera carolina lucia@gmail.com ')
, (NULL, 'Miño Nicolas Enrique', 39776908, 20397769086, '1949-02-27', 'M', 'Casado', '2023-12-11', NULL, 'A', '3624556443', 'miño nicolas enrique@gmail.com ')
, (NULL, 'Gonzalez Marcelo Javier', 27212297, 20272122976, '2002-04-20', 'M', 'Casado', '2023-12-13', NULL, 'A', '3624528703', 'gonzalez marcelo javier@gmail.com ')
, (NULL, 'Garcia Bustos Maria Florencia', 30484112, 20304841126, '1954-07-07', 'M', 'Casado', '2023-12-14', NULL, 'A', '3624225146', 'garcia bustos maria florencia@gmail.com ')
, (NULL, 'Godoy Leandro Francisco', 32408034, 20324080346, '1947-05-08', 'M', 'Casado', '2023-12-19', NULL, 'A', '3624259696', 'godoy leandro francisco@gmail.com ')
, (NULL, 'Del Valle Petrona', 11035506, 20110355066, '1975-12-27', 'M', 'Casado', '2023-12-19', NULL, 'A', '3624967975', 'del valle petrona@gmail.com ')
, (NULL, 'Espinola Lucazevich Gabriela', 23987005, 20239870056, '1977-04-10', 'M', 'Casado', '2023-12-26', NULL, 'A', '3624253205', 'espinola lucazevich gabriela@gmail.com ')
, (NULL, 'Moralez Delia Elena', 28741121, 20287411216, '1964-04-24', 'M', 'Casado', '2023-12-26', NULL, 'A', '3624742836', 'moralez delia elena@gmail.com ')
, (NULL, 'Fernandez Clarisa Lorena', 24194921, 20241949216, '1965-04-12', 'M', 'Casado', '2023-12-26', NULL, 'A', '3794693448', 'fernandez clarisa lorena@gmail.com ')
, (NULL, 'Riquelme Sonia Patricia', 17251748, 20172517486, '1975-04-29', 'M', 'Casado', '2023-12-27', NULL, 'A', '3624185333', 'riquelme sonia patricia@gmail.com ')
, (NULL, 'Maidana Julio Agustin', 20763297, 20207632976, '1982-10-20', 'M', 'Casado', '2024-01-02', NULL, 'A', '3624903110', 'maidana julio agustin@gmail.com ')
, (NULL, 'Ayala Laura Mabel', 24632431, 20246324316, '1957-01-06', 'M', 'Casado', '2024-01-02', NULL, 'A', '3625629521', 'ayala laura mabel@gmail.com ')
, (NULL, 'Rodriguez Garcia Maria Luisa', 12482927, 20124829276, '1981-07-09', 'M', 'Casado', '2024-01-02', NULL, 'A', '3624776932', 'rodriguez garcia maria luisa@gmail.com ')
, (NULL, 'Maidana Mario Hector', 20192977, 20201929776, '1989-12-14', 'M', 'Casado', '2024-01-02', NULL, 'A', '3624382720', 'maidana mario hector@gmail.com ')
, (NULL, 'Ramos Laura Noemí', 10408689, 20104086896, '1956-11-24', 'M', 'Casado', '2024-01-04', NULL, 'A', '3624775694', 'ramos laura noemí@gmail.com ')
, (NULL, 'Ruiz Sergio Daniel', 21978134, 20219781346, '1979-01-28', 'M', 'Casado', '2024-01-05', NULL, 'A', '3624592625', 'ruiz sergio daniel@gmail.com ')
, (NULL, 'Martinez Diana', 37771589, 30716264234, '1977-01-23', 'O', NULL, '2024-02-02', NULL, 'A', '3725465863', 'martinez diana@gmail.com ')
, (NULL, 'Aguero Monica Alejandra', 35690043, 20356900436, '1971-07-18', 'M', 'Casado', '2024-02-05', NULL, 'A', '3624784346', 'aguero monica alejandra@gmail.com ')
;


INSERT INTO rutas (id_ruta, ruta,id_reparto, id_cliente, orden )
VALUES ('A01-1', 'A01', 'R01', 1,1 )
, ('A01-2', 'A01', 'R01', 2,2 )
, ('A01-3', 'A01', 'R01', 3,3 )
, ('A01-4', 'A01', 'R01', 4,4 )
, ('A01-5', 'A01', 'R01', 5,5 )
, ('A01-6', 'A01', 'R01', 6,6 )
, ('A01-7', 'A01', 'R01', 7,7 )
, ('A01-8', 'A01', 'R01', 8,8 )
, ('A01-9', 'A01', 'R01', 9,9 )
, ('A01-10', 'A01', 'R01', 10,10 )
, ('A01-11', 'A01', 'R01', 11,11 )
, ('A01-12', 'A01', 'R01', 12,12 )
, ('A01-13', 'A01', 'R01', 13,13 )
, ('A01-14', 'A01', 'R01', 15,14 )
, ('A01-15', 'A01', 'R01', 16,15 )
, ('A01-16', 'A01', 'R01', 17,16 )
, ('A01-17', 'A01', 'R01', 18,17 )
, ('A01-18', 'A01', 'R01', 19,18 )
, ('A01-19', 'A01', 'R01', 20,19 )
, ('A01-20', 'A01', 'R01', 21,20 )
, ('A01-21', 'A01', 'R01', 22,21 )
, ('A01-22', 'A01', 'R01', 23,22 )
, ('A02-1', 'A02', 'R02', 24,1 )
, ('A02-2', 'A02', 'R02', 25,2 )
, ('A02-3', 'A02', 'R02', 26,3 )
, ('A02-4', 'A02', 'R02', 27,4 )
, ('A02-5', 'A02', 'R02', 28,5 )
, ('A02-6', 'A02', 'R02', 29,6 )
, ('A02-7', 'A02', 'R02', 30,7 )
, ('A02-8', 'A02', 'R02', 31,8 )
, ('A02-9', 'A02', 'R02', 32,9 )
, ('A02-10', 'A02', 'R02', 33,10 )
, ('A02-11', 'A02', 'R02', 34,11 )
, ('A11-1', 'A11', 'R11', 35,1 )
, ('A11-2', 'A11', 'R11', 36,2 )
, ('A11-3', 'A11', 'R11', 37,3 )
, ('A11-4', 'A11', 'R11', 38,4 )
, ('A11-5', 'A11', 'R11', 39,5 )
, ('A11-6', 'A11', 'R11', 40,6 )
, ('A11-7', 'A11', 'R11', 41,7 )
, ('A11-8', 'A11', 'R11', 42,8 )
, ('A11-9', 'A11', 'R11', 43,9 )
, ('A11-10', 'A11', 'R11', 44,10 )
, ('A11-11', 'A11', 'R11', 45,11 )
, ('A11-12', 'A11', 'R11', 46,12 )
, ('A11-13', 'A11', 'R11', 47,13 )
, ('A11-14', 'A11', 'R11', 48,14 )
, ('A11-15', 'A11', 'R11', 49,15 )
, ('A11-16', 'A11', 'R11', 50,16 )
, ('A11-17', 'A11', 'R11', 51,17 )
, ('A11-18', 'A11', 'R11', 52,18 )
, ('A11-19', 'A11', 'R11', 53,19 )
, ('A11-20', 'A11', 'R11', 54,20 )
, ('A11-21', 'A11', 'R11', 55,21 )
, ('B01-1', 'B01', 'R01', 56,1 )
, ('B01-2', 'B01', 'R01', 57,2 )
, ('B01-3', 'B01', 'R01', 58,3 )
, ('B01-4', 'B01', 'R01', 59,4 )
, ('B01-5', 'B01', 'R01', 60,5 )
, ('B01-6', 'B01', 'R01', 61,6 )
, ('B01-7', 'B01', 'R01', 62,7 )
, ('B01-8', 'B01', 'R01', 63,8 )
, ('B01-9', 'B01', 'R01', 64,9 )
, ('B01-10', 'B01', 'R01', 65,10 )
, ('B01-11', 'B01', 'R01', 66,11 )
, ('B01-12', 'B01', 'R01', 67,12 )
, ('B01-13', 'B01', 'R01', 68,13 )
, ('B01-14', 'B01', 'R01', 69,14 )
, ('B01-15', 'B01', 'R01', 70,15 )
, ('B01-16', 'B01', 'R01', 71,16 )
, ('B01-17', 'B01', 'R01', 72,17 )
, ('B01-18', 'B01', 'R01', 73,18 )
, ('B01-19', 'B01', 'R01', 74,19 )
, ('B01-20', 'B01', 'R01', 75,20 )
, ('B01-21', 'B01', 'R01', 76,21 )
, ('B01-22', 'B01', 'R01', 77,22 )
, ('B01-23', 'B01', 'R01', 78,23 )
, ('B02-1', 'B02', 'R02', 79,1 )
, ('B02-2', 'B02', 'R02', 80,2 )
, ('B02-3', 'B02', 'R02', 81,3 )
, ('B02-4', 'B02', 'R02', 82,4 )
, ('B02-5', 'B02', 'R02', 83,5 )
, ('B02-6', 'B02', 'R02', 84,6 )
, ('B02-7', 'B02', 'R02', 85,7 )
, ('B02-8', 'B02', 'R02', 86,8 )
, ('B02-9', 'B02', 'R02', 87,9 )
, ('B02-10', 'B02', 'R02', 88,10 )
, ('B02-11', 'B02', 'R02', 89,11 )
, ('B02-12', 'B02', 'R02', 90,12 )
, ('B02-13', 'B02', 'R02', 91,13 )
, ('B02-14', 'B02', 'R02', 92,14 )
, ('B02-15', 'B02', 'R02', 93,15 )
, ('B02-16', 'B02', 'R02', 94,16 )
, ('B11-1', 'B11', 'R11', 95,1 )
, ('B11-2', 'B11', 'R11', 96,2 )
, ('B11-3', 'B11', 'R11', 97,3 )
, ('B11-4', 'B11', 'R11', 98,4 )
, ('B11-5', 'B11', 'R11', 99,5 )
, ('B11-6', 'B11', 'R11', 100,6 )
, ('B11-7', 'B11', 'R11', 101,7 )
, ('B11-8', 'B11', 'R11', 103,8 )
, ('B11-9', 'B11', 'R11', 104,9 )
, ('B11-10', 'B11', 'R11', 105,10 )
, ('B11-11', 'B11', 'R11', 106,11 )
, ('B11-12', 'B11', 'R11', 107,12 )
, ('B11-13', 'B11', 'R11', 108,13 )
, ('B11-14', 'B11', 'R11', 109,14 )
, ('B11-15', 'B11', 'R11', 110,15 )
, ('B11-16', 'B11', 'R11', 111,16 )
, ('B11-17', 'B11', 'R11', 112,17 )
, ('B11-18', 'B11', 'R11', 113,18 )
, ('B11-19', 'B11', 'R11', 114,19 )
, ('B11-20', 'B11', 'R11', 115,20 )
, ('C01-1', 'C01', 'R01', 116,1 )
, ('C01-2', 'C01', 'R01', 117,2 )
, ('C01-3', 'C01', 'R01', 118,3 )
, ('C01-4', 'C01', 'R01', 119,4 )
, ('C01-5', 'C01', 'R01', 120,5 )
, ('C01-6', 'C01', 'R01', 121,6 )
, ('C01-7', 'C01', 'R01', 122,7 )
, ('C01-8', 'C01', 'R01', 123,8 )
, ('C01-9', 'C01', 'R01', 124,9 )
, ('C01-10', 'C01', 'R01', 125,10 )
, ('C01-11', 'C01', 'R01', 126,11 )
, ('C01-12', 'C01', 'R01', 127,12 )
, ('C01-13', 'C01', 'R01', 128,13 )
, ('C01-14', 'C01', 'R01', 129,14 )
, ('C01-15', 'C01', 'R01', 130,15 )
, ('C01-16', 'C01', 'R01', 131,16 )
, ('C01-17', 'C01', 'R01', 132,17 )
, ('C01-18', 'C01', 'R01', 133,18 )
, ('C01-19', 'C01', 'R01', 134,19 )
, ('C01-20', 'C01', 'R01', 135,20 )
, ('C01-21', 'C01', 'R01', 136,21 )
, ('C01-22', 'C01', 'R01', 137,22 )
, ('C02-1', 'C02', 'R02', 138,1 )
, ('C02-2', 'C02', 'R02', 139,2 )
, ('C02-3', 'C02', 'R02', 140,3 )
, ('C02-4', 'C02', 'R02', 141,4 )
, ('C02-5', 'C02', 'R02', 142,5 )
, ('C02-6', 'C02', 'R02', 143,6 )
, ('C02-7', 'C02', 'R02', 144,7 )
, ('C02-8', 'C02', 'R02', 145,8 )
, ('C02-9', 'C02', 'R02', 146,9 )
, ('C02-10', 'C02', 'R02', 147,10 )
, ('C02-11', 'C02', 'R02', 148,11 )
, ('C02-12', 'C02', 'R02', 149,12 )
, ('C02-13', 'C02', 'R02', 150,13 )
, ('C02-14', 'C02', 'R02', 151,14 )
, ('C02-15', 'C02', 'R02', 152,15 )
, ('C02-16', 'C02', 'R02', 153,16 )
, ('C02-17', 'C02', 'R02', 154,17 )
, ('C11-1', 'C11', 'R11', 155,1 )
, ('C11-2', 'C11', 'R11', 156,2 )
, ('C11-3', 'C11', 'R11', 157,3 )
, ('C11-4', 'C11', 'R11', 158,4 )
, ('C11-5', 'C11', 'R11', 159,5 )
, ('C11-6', 'C11', 'R11', 160,6 )
, ('C11-7', 'C11', 'R11', 161,7 )
, ('C11-8', 'C11', 'R11', 162,8 )
, ('C11-9', 'C11', 'R11', 163,9 )
, ('C11-10', 'C11', 'R11', 164,10 )
, ('C11-11', 'C11', 'R11', 165,11 )
, ('C11-12', 'C11', 'R11', 166,12 )
, ('C11-13', 'C11', 'R11', 167,13 )
, ('C11-14', 'C11', 'R11', 168,14 )
, ('C11-15', 'C11', 'R11', 169,15 )
, ('C11-16', 'C11', 'R11', 170,16 )
, ('C11-17', 'C11', 'R11', 171,17 )
, ('C11-18', 'C11', 'R11', 172,18 )
, ('C11-19', 'C11', 'R11', 173,19 )
, ('C11-20', 'C11', 'R11', 174,20 )
, ('D01-1', 'D01', 'R01', 175,1 )
, ('D01-2', 'D01', 'R01', 176,2 )
, ('D01-3', 'D01', 'R01', 177,3 )
, ('D01-4', 'D01', 'R01', 178,4 )
, ('D01-5', 'D01', 'R01', 179,5 )
, ('D01-6', 'D01', 'R01', 180,6 )
, ('D01-7', 'D01', 'R01', 181,7 )
, ('D01-8', 'D01', 'R01', 182,8 )
, ('D01-9', 'D01', 'R01', 183,9 )
, ('D01-10', 'D01', 'R01', 184,10 )
, ('D01-11', 'D01', 'R01', 185,11 )
, ('D01-12', 'D01', 'R01', 186,12 )
, ('D01-13', 'D01', 'R01', 187,13 )
, ('D01-14', 'D01', 'R01', 188,14 )
, ('D01-15', 'D01', 'R01', 189,15 )
, ('D01-16', 'D01', 'R01', 191,16 )
, ('D01-17', 'D01', 'R01', 192,17 )
, ('D01-18', 'D01', 'R01', 193,18 )
, ('D01-19', 'D01', 'R01', 194,19 )
, ('D01-20', 'D01', 'R01', 195,20 )
, ('D01-21', 'D01', 'R01', 196,21 )
, ('D01-22', 'D01', 'R01', 197,22 )
, ('D02-1', 'D02', 'R02', 198,1 )
, ('D02-2', 'D02', 'R02', 199,2 )
, ('D02-3', 'D02', 'R02', 200,3 )
, ('D02-4', 'D02', 'R02', 201,4 )
, ('D02-5', 'D02', 'R02', 202,5 )
, ('D02-6', 'D02', 'R02', 203,6 )
, ('D02-7', 'D02', 'R02', 204,7 )
, ('D02-8', 'D02', 'R02', 205,8 )
, ('D02-9', 'D02', 'R02', 206,9 )
, ('D02-10', 'D02', 'R02', 207,10 )
, ('D02-11', 'D02', 'R02', 208,11 )
, ('D02-12', 'D02', 'R02', 209,12 )
, ('D02-13', 'D02', 'R02', 210,13 )
, ('D02-14', 'D02', 'R02', 211,14 )
, ('D02-15', 'D02', 'R02', 212,15 )
, ('D02-16', 'D02', 'R02', 213,16 )
, ('D02-17', 'D02', 'R02', 214,17 )
, ('D02-18', 'D02', 'R02', 215,18 )
, ('D02-19', 'D02', 'R02', 216,19 )
, ('D02-20', 'D02', 'R02', 217,20 )
, ('D02-21', 'D02', 'R02', 218,21 )
, ('D02-22', 'D02', 'R02', 219,22 )
, ('D02-23', 'D02', 'R02', 220,23 )
, ('D02-24', 'D02', 'R02', 221,24 )
, ('D11-1', 'D11', 'R11', 222,1 )
, ('D11-2', 'D11', 'R11', 223,2 )
, ('D11-3', 'D11', 'R11', 224,3 )
, ('D11-4', 'D11', 'R11', 226,4 )
, ('D11-5', 'D11', 'R11', 227,5 )
, ('D11-6', 'D11', 'R11', 228,6 )
, ('D11-7', 'D11', 'R11', 229,7 )
, ('D11-8', 'D11', 'R11', 230,8 )
, ('D11-9', 'D11', 'R11', 231,9 )
, ('D11-10', 'D11', 'R11', 232,10 )
, ('D11-11', 'D11', 'R11', 233,11 )
, ('D11-12', 'D11', 'R11', 234,12 )
, ('D11-13', 'D11', 'R11', 235,13 )
, ('D11-14', 'D11', 'R11', 236,14 )
, ('D11-15', 'D11', 'R11', 237,15 )
, ('D11-16', 'D11', 'R11', 238,16 )
, ('D11-17', 'D11', 'R11', 239,17 )
, ('D11-18', 'D11', 'R11', 240,18 )
, ('D11-19', 'D11', 'R11', 241,19 )
, ('D11-20', 'D11', 'R11', 242,20 )
, ('E01-1', 'E01', 'R01', 243,1 )
, ('E01-2', 'E01', 'R01', 244,2 )
, ('E01-3', 'E01', 'R01', 245,3 )
, ('E01-4', 'E01', 'R01', 246,4 )
, ('E01-5', 'E01', 'R01', 247,5 )
, ('E01-6', 'E01', 'R01', 248,6 )
, ('E01-7', 'E01', 'R01', 249,7 )
, ('E01-8', 'E01', 'R01', 250,8 )
, ('E01-9', 'E01', 'R01', 251,9 )
, ('E01-10', 'E01', 'R01', 252,10 )
, ('E01-11', 'E01', 'R01', 253,11 )
, ('E01-12', 'E01', 'R01', 254,12 )
, ('E01-13', 'E01', 'R01', 255,13 )
, ('E01-14', 'E01', 'R01', 256,14 )
, ('E01-15', 'E01', 'R01', 257,15 )
, ('E01-16', 'E01', 'R01', 258,16 )
, ('E01-17', 'E01', 'R01', 259,17 )
, ('E01-18', 'E01', 'R01', 260,18 )
, ('E01-19', 'E01', 'R01', 261,19 )
, ('E01-20', 'E01', 'R01', 262,20 )
, ('E01-21', 'E01', 'R01', 263,21 )
, ('E01-22', 'E01', 'R01', 264,22 )
, ('E01-23', 'E01', 'R01', 265,23 )
, ('E01-24', 'E01', 'R01', 267,24 )
, ('E01-25', 'E01', 'R01', 268,25 )
, ('E01-26', 'E01', 'R01', 269,26 )
, ('E01-27', 'E01', 'R01', 270,27 )
, ('E01-28', 'E01', 'R01', 271,28 )
, ('E01-29', 'E01', 'R01', 272,29 )
, ('E01-30', 'E01', 'R01', 273,30 )
, ('E01-31', 'E01', 'R01', 274,31 )
, ('E01-32', 'E01', 'R01', 275,32 )
, ('E01-33', 'E01', 'R01', 276,33 )
, ('E01-34', 'E01', 'R01', 277,34 )
, ('E01-35', 'E01', 'R01', 278,35 )
, ('E01-36', 'E01', 'R01', 279,36 )
, ('E01-37', 'E01', 'R01', 280,37 )
, ('E01-38', 'E01', 'R01', 281,38 )
, ('E01-39', 'E01', 'R01', 282,39 )
, ('E01-40', 'E01', 'R01', 283,40 )
, ('E01-41', 'E01', 'R01', 284,41 )
, ('E01-42', 'E01', 'R01', 285,42 )
, ('E01-43', 'E01', 'R01', 286,43 )
, ('E01-44', 'E01', 'R01', 287,44 )
, ('E01-45', 'E01', 'R01', 288,45 )
, ('E01-46', 'E01', 'R01', 289,46 )
, ('E01-47', 'E01', 'R01', 290,47 )
, ('E01-48', 'E01', 'R01', 291,48 )
, ('E01-49', 'E01', 'R01', 292,49 )
, ('E01-50', 'E01', 'R01', 293,50 )
, ('E01-51', 'E01', 'R01', 294,51 )
, ('E01-52', 'E01', 'R01', 295,52 )
, ('E01-53', 'E01', 'R01', 296,53 )
, ('E01-54', 'E01', 'R01', 297,54 )
, ('E01-55', 'E01', 'R01', 298,55 )
, ('E01-56', 'E01', 'R01', 299,56 )
, ('E01-57', 'E01', 'R01', 300,57 )
, ('E01-58', 'E01', 'R01', 301,58 )
, ('E02-1', 'E02', 'R02', 302,1 )
, ('E02-2', 'E02', 'R02', 303,2 )
, ('E02-3', 'E02', 'R02', 304,3 )
, ('E02-4', 'E02', 'R02', 305,4 )
, ('E02-5', 'E02', 'R02', 306,5 )
, ('E02-6', 'E02', 'R02', 307,6 )
, ('E02-7', 'E02', 'R02', 308,7 )
, ('E02-8', 'E02', 'R02', 309,8 )
, ('E02-9', 'E02', 'R02', 310,9 )
, ('E02-10', 'E02', 'R02', 311,10 )
, ('E02-11', 'E02', 'R02', 312,11 )
, ('E02-12', 'E02', 'R02', 313,12 )
, ('E02-13', 'E02', 'R02', 315,13 )
, ('E02-14', 'E02', 'R02', 316,14 )
, ('E02-15', 'E02', 'R02', 317,15 )
, ('E02-16', 'E02', 'R02', 318,16 )
, ('E02-17', 'E02', 'R02', 319,17 )
, ('E02-18', 'E02', 'R02', 320,18 )
, ('E02-19', 'E02', 'R02', 321,19 )
, ('E02-20', 'E02', 'R02', 322,20 )
, ('E02-21', 'E02', 'R02', 323,21 )
, ('E02-22', 'E02', 'R02', 324,22 )
, ('E02-23', 'E02', 'R02', 325,23 )
, ('E11-1', 'E11', 'R11', 326,1 )
, ('E11-2', 'E11', 'R11', 327,2 )
, ('E11-3', 'E11', 'R11', 328,3 )
, ('E11-4', 'E11', 'R11', 329,4 )
, ('E11-5', 'E11', 'R11', 330,5 )
, ('E11-6', 'E11', 'R11', 331,6 )
, ('E11-7', 'E11', 'R11', 332,7 )
, ('E11-8', 'E11', 'R11', 333,8 )
, ('E11-9', 'E11', 'R11', 334,9 )
, ('E11-10', 'E11', 'R11', 335,10 )
, ('E11-11', 'E11', 'R11', 336,11 )
, ('E11-12', 'E11', 'R11', 337,12 )
, ('E11-13', 'E11', 'R11', 338,13 )
, ('E11-14', 'E11', 'R11', 339,14 )
, ('E11-15', 'E11', 'R11', 340,15 )
, ('E11-16', 'E11', 'R11', 341,16 )
, ('E11-17', 'E11', 'R11', 342,17 )
, ('E11-18', 'E11', 'R11', 343,18 )
, ('E11-19', 'E11', 'R11', 344,19 )
, ('E11-20', 'E11', 'R11', 345,20 )
, ('E11-21', 'E11', 'R11', 346,21 )
, ('E11-22', 'E11', 'R11', 347,22 )
;



INSERT INTO dispensers (id_dispenser, nro_serie,marca, estado, fecha_compra,fecha_baja )
VALUES (NULL, 'U-274505-6290', 'Ushuaia', 'Comodato','2019-03-26',NULL )
, (NULL, 'A-36601-35127', 'Aquadisp', 'Comodato','2019-05-02',NULL )
, (NULL, 'A-53197-110009', 'Aquadisp', 'Comodato','2019-11-01',NULL )
, (NULL, 'A-53178-110010', 'Aquadisp', 'Comodato','2019-08-28',NULL )
, (NULL, 'H-40126-110028', 'Humma', 'Comodato','2019-05-23',NULL )
, (NULL, 'A-53230-110054', 'Aquadisp', 'Comodato','2019-05-16',NULL )
, (NULL, 'H-40325-110071', 'Humma', 'Comodato','2019-11-28',NULL )
, (NULL, 'H-40601-110079', 'Humma', 'Comodato','2019-03-26',NULL )
, (NULL, 'H-40255-110082', 'Humma', 'Comodato','2019-11-29',NULL )
, (NULL, 'H-40440-110089', 'Humma', 'Comodato','2019-04-13',NULL )
, (NULL, 'H-40304-110091', 'Humma', 'Comodato','2020-04-20',NULL )
, (NULL, 'H-40282-110094', 'Humma', 'Comodato','2019-05-30',NULL )
, (NULL, 'H-40374-110098', 'Humma', 'Comodato','2019-11-02',NULL )
, (NULL, 'H-120002-112401', 'Humma', 'Comodato','2020-05-11',NULL )
, (NULL, 'H-120008-112403', 'Humma', 'Comodato','2020-05-08',NULL )
, (NULL, 'H-120078-112413', 'Humma', 'Comodato','2019-12-05',NULL )
, (NULL, 'H-120080-112414', 'Humma', 'Comodato','2024-03-06',NULL )
, (NULL, 'H-120088-112416', 'Humma', 'Comodato','2019-06-22',NULL )
, (NULL, 'H-120096-112417', 'Humma', 'Comodato','2020-06-05',NULL )
, (NULL, 'H-120121-112422', 'Humma', 'Comodato','2019-05-27',NULL )
, (NULL, 'H-120141-112426', 'Humma', 'Comodato','2020-01-27',NULL )
, (NULL, 'H-120158-112430', 'Humma', 'Comodato','2019-04-03',NULL )
, (NULL, 'H-120187-112434', 'Humma', 'Comodato','2019-06-10',NULL )
, (NULL, 'H-120219-112438', 'Humma', 'Comodato','2019-04-16',NULL )
, (NULL, 'H-120242-112444', 'Humma', 'Comodato','2019-12-09',NULL )
, (NULL, 'H-120245-112445', 'Humma', 'Comodato','2019-04-01',NULL )
, (NULL, 'H-120277-112449', 'Humma', 'Comodato','2020-04-30',NULL )
, (NULL, 'H-120285-112450', 'Humma', 'Comodato','2019-12-13',NULL )
, (NULL, 'H-20291-112451', 'Humma', 'Comodato','2021-06-15',NULL )
, (NULL, 'H-20329-112456', 'Humma', 'Comodato','2019-05-18',NULL )
, (NULL, 'H-120398-112463', 'Humma', 'Comodato','2019-03-26',NULL )
, (NULL, 'H-120411-112465', 'Humma', 'Comodato','2019-03-28',NULL )
, (NULL, 'H-120414-112466', 'Humma', 'Comodato','2020-04-24',NULL )
, (NULL, 'H-120415-112467', 'Humma', 'Comodato','2020-04-06',NULL )
, (NULL, 'A-78413-112490', 'Aquadisp', 'Comodato','2020-07-03',NULL )
, (NULL, 'A-78061-112493', 'Aquadisp', 'Comodato','2019-05-29',NULL )
, (NULL, 'A-77778-112495', 'Aquadisp', 'Comodato','2019-03-26',NULL )
, (NULL, 'A-78080-112499', 'Aquadisp', 'Comodato','2019-05-06',NULL )
, (NULL, 'H-41086-116702', 'Humma', 'Comodato','2020-04-24',NULL )
, (NULL, 'H-40826-116706', 'Humma', 'Comodato','2019-11-01',NULL )
, (NULL, 'H-40817-116710', 'Humma', 'Comodato','2020-01-25',NULL )
, (NULL, 'H-40711-116715', 'Humma', 'Comodato','2019-08-14',NULL )
, (NULL, 'H-40716-116717', 'Humma', 'Comodato','2019-03-27',NULL )
, (NULL, 'H-40989-116718', 'Humma', 'Comodato','2019-05-17',NULL )
, (NULL, 'H-40982-116720', 'Humma', 'Comodato','2019-03-26',NULL )
, (NULL, 'H-41030-116723', 'Humma', 'Comodato','2019-10-01',NULL )
, (NULL, 'H-40356-116736', 'Humma', 'Comodato','2019-06-12',NULL )
, (NULL, 'H-40329-116738', 'Humma', 'Comodato','2020-06-06',NULL )
, (NULL, 'H-40113-116746', 'Humma', 'Comodato','2019-10-31',NULL )
, (NULL, 'H-40478-116750', 'Humma', 'Comodato','2021-06-15',NULL )
, (NULL, 'H-40724-116752', 'Humma', 'Comodato','2021-05-06',NULL )
, (NULL, 'H-40975-116753', 'Humma', 'Comodato','2019-12-26',NULL )
, (NULL, 'H-40858-116758', 'Humma', 'Comodato','2019-07-12',NULL )
, (NULL, 'H-40346-116759', 'Humma', 'Comodato','2020-01-30',NULL )
, (NULL, 'H-41015-116761', 'Humma', 'Comodato','2019-07-03',NULL )
, (NULL, 'H-40719-116762', 'Humma', 'Comodato','2020-01-09',NULL )
, (NULL, 'H-40316-116768', 'Humma', 'Comodato','2019-03-26',NULL )
, (NULL, 'H-40754-116771', 'Humma', 'Comodato','2019-08-08',NULL )
, (NULL, 'H-40361-116776', 'Humma', 'Comodato','2020-07-03',NULL )
, (NULL, 'H-40462-116778', 'Humma', 'Comodato','2019-06-06',NULL )
, (NULL, 'H-40384-116779', 'Humma', 'Comodato','2019-04-13',NULL )
, (NULL, 'H-41259-116783', 'Humma', 'Comodato','2019-07-24',NULL )
, (NULL, 'H-40489-116788', 'Humma', 'Comodato','2020-10-07',NULL )
, (NULL, 'H-40332-116790', 'Humma', 'Comodato','2019-10-31',NULL )
, (NULL, 'H-40437-116792', 'Humma', 'Comodato','2019-09-27',NULL )
, (NULL, 'H-40219-116796', 'Humma', 'Comodato','2019-08-09',NULL )
, (NULL, 'U---136209', 'Ushuaia', 'Comodato','2020-05-18',NULL )
, (NULL, 'H-120865-136248', 'Humma', 'Comodato','2019-06-14',NULL )
, (NULL, 'U-259542-136260', 'Ushuaia', 'Comodato','2019-10-26',NULL )
, (NULL, 'H-120858-136285', 'Humma', 'Comodato','2019-12-16',NULL )
, (NULL, 'H-120860-136286', 'Humma', 'Comodato','2020-02-24',NULL )
, (NULL, 'U-279277-136296', 'Ushuaia', 'Comodato','2019-12-23',NULL )
, (NULL, 'U----136300', 'Ushuaia', 'Comodato','2019-11-26',NULL )
, (NULL, 'H-10447-350104', 'Humma', 'Comodato','2020-03-06',NULL )
, (NULL, 'H-10456-350105', 'Humma', 'Comodato','2019-03-26',NULL )
, (NULL, 'A-37311-350116', 'Aquadisp', 'Comodato','2019-04-30',NULL )
, (NULL, 'A-37249-350118', 'Aquadisp', 'Comodato','2019-11-29',NULL )
, (NULL, 'A-37533-350120', 'Aquadisp', 'Comodato','2019-12-27',NULL )
, (NULL, 'A-37552-350123', 'Aquadisp', 'Comodato','2019-04-01',NULL )
, (NULL, 'A-37279-350124', 'Aquadisp', 'Comodato','2019-04-18',NULL )
, (NULL, 'A-37488-350125', 'Aquadisp', 'Comodato','2019-10-29',NULL )
, (NULL, 'A-37531-350128', 'Aquadisp', 'Comodato','2019-06-21',NULL )
, (NULL, 'A-37554-350130', 'Aquadisp', 'Comodato','2019-11-28',NULL )
, (NULL, 'A-37155-350136', 'Aquadisp', 'Comodato','2021-04-14',NULL )
, (NULL, 'A-37505-350138', 'Aquadisp', 'Comodato','2019-11-14',NULL )
, (NULL, 'A-37243-350142', 'Aquadisp', 'Comodato','2019-05-07',NULL )
, (NULL, 'A-37251-350146', 'Aquadisp', 'Comodato','2020-01-30',NULL )
, (NULL, 'A-37532-350147', 'Aquadisp', 'Comodato','2019-10-18',NULL )
, (NULL, 'A-36793-350156', 'Aquadisp', 'Comodato','2019-10-24',NULL )
, (NULL, 'A-37520-350160', 'Aquadisp', 'Comodato','2019-08-19',NULL )
, (NULL, 'A-37460-350165', 'Aquadisp', 'Comodato','2020-01-04',NULL )
, (NULL, 'A-37526-350169', 'Aquadisp', 'Comodato','2019-05-27',NULL )
, (NULL, 'A-37506-350185', 'Aquadisp', 'Comodato','2019-09-16',NULL )
, (NULL, 'A-37046-350186', 'Aquadisp', 'Comodato','2019-04-18',NULL )
, (NULL, 'A-37166-350187', 'Aquadisp', 'Comodato','2019-09-12',NULL )
, (NULL, 'U-350194-350194', 'Ushuaia', 'Comodato','2019-05-13',NULL )
, (NULL, 'H-71040-554101', 'Humma', 'Comodato','2019-05-16',NULL )
, (NULL, 'H-80750-554119', 'Humma', 'Comodato','2019-04-08',NULL )
, (NULL, 'H-70673-554122', 'Humma', 'Comodato','2019-12-06',NULL )
, (NULL, 'H-80381-554123', 'Humma', 'Comodato','2019-12-06',NULL )
, (NULL, 'A-52803-554138', 'Aquadisp', 'Comodato','2019-12-14',NULL )
, (NULL, 'A-52997-554139', 'Aquadisp', 'Comodato','2019-05-31',NULL )
, (NULL, 'A-53239-554144', 'Aquadisp', 'Comodato','2019-04-01',NULL )
, (NULL, 'A-52986-554145', 'Aquadisp', 'Comodato','2020-01-08',NULL )
, (NULL, 'A-53201-554164', 'Aquadisp', 'Comodato','2020-04-09',NULL )
, (NULL, 'A-52790-554171', 'Aquadisp', 'Comodato','2020-01-21',NULL )
, (NULL, 'A-53006-554183', 'Aquadisp', 'Comodato','2019-04-24',NULL )
, (NULL, 'A-70117-554190', 'Aquadisp', 'Comodato','2019-12-23',NULL )
, (NULL, 'A-36600-606901', 'Aquadisp', 'Comodato','2019-10-18',NULL )
, (NULL, 'U-317600-606904', 'Ushuaia', 'Comodato','2020-09-08',NULL )
, (NULL, 'A-36617-606913', 'Aquadisp', 'Comodato','2019-10-18',NULL )
, (NULL, 'U-319492-606921', 'Ushuaia', 'Comodato','2020-09-08',NULL )
, (NULL, 'U-318147-606922', 'Ushuaia', 'Comodato','2020-09-08',NULL )
, (NULL, 'U-318156-606925', 'Ushuaia', 'Comodato','2020-09-08',NULL )
, (NULL, 'U-317614-606926', 'Ushuaia', 'Comodato','2020-09-08',NULL )
, (NULL, 'U-318302-606927', 'Ushuaia', 'Comodato','2020-09-08',NULL )
, (NULL, 'H-80825-606934', 'Humma', 'Comodato','2019-12-24',NULL )
, (NULL, 'A-52981-606935', 'Aquadisp', 'Comodato','2019-10-07',NULL )
, (NULL, 'A-37261-606936', 'Aquadisp', 'Comodato','2019-03-26',NULL )
, (NULL, 'U-271083-606938', 'Ushuaia', 'Comodato','2019-08-01',NULL )
, (NULL, 'H-120170-606939', 'Humma', 'Comodato','2019-03-26',NULL )
, (NULL, 'H-40722-606942', 'Humma', 'Comodato','2019-08-13',NULL )
, (NULL, 'A-570123-606948', 'Aquadisp', 'Comodato','2019-12-04',NULL )
, (NULL, 'A-570250-606949', 'Aquadisp', 'Comodato','2019-12-04',NULL )
, (NULL, 'H-40727-606959', 'Humma', 'Comodato','2019-05-16',NULL )
, (NULL, 'U-274515-606964', 'Ushuaia', 'Comodato','2019-10-24',NULL )
, (NULL, 'A-53222-606970', 'Aquadisp', 'Comodato','2019-07-02',NULL )
, (NULL, 'A-78255-606976', 'Aquadisp', 'Comodato','2019-03-26',NULL )
, (NULL, 'H-80677-606978', 'Humma', 'Comodato','2019-07-15',NULL )
, (NULL, 'U-606980-606980', 'Ushuaia', 'Comodato','2019-03-26',NULL )
, (NULL, 'U-275031-606981', 'Ushuaia', 'Comodato','2019-03-26',NULL )
, (NULL, 'U---606993', 'Ushuaia', 'Comodato','2020-04-24',NULL )
, (NULL, 'U-268252-606995', 'Ushuaia', 'Comodato','2020-11-06',NULL )
, (NULL, 'U-318365-639206', 'Ushuaia', 'Comodato','2020-09-08',NULL )
, (NULL, 'U-318101-639207', 'Ushuaia', 'Comodato','2020-09-08',NULL )
, (NULL, 'U-318169-639208', 'Ushuaia', 'Comodato','2020-09-08',NULL )
, (NULL, 'A-52807-639209', 'Aquadisp', 'Comodato','2020-09-16',NULL )
, (NULL, 'U-318166-639210', 'Ushuaia', 'Comodato','2020-09-08',NULL )
, (NULL, 'U-335594-639234', 'Ushuaia', 'Comodato','2021-03-01',NULL )
, (NULL, 'U-275027-639242', 'Ushuaia', 'Comodato','2019-04-13',NULL )
, (NULL, 'A-70167-639248', 'Aquadisp', 'Comodato','2019-03-26',NULL )
, (NULL, 'H-120171-639251', 'Humma', 'Comodato','2020-12-04',NULL )
, (NULL, 'H-80625-639251', 'Humma', 'Comodato','2020-12-05',NULL )
, (NULL, 'A-52809-639253', 'Aquadisp', 'Comodato','2019-04-30',NULL )
, (NULL, 'A-53237-639257', 'Aquadisp', 'Comodato','2020-12-18',NULL )
, (NULL, 'H-40319-639261', 'Humma', 'Comodato','2019-07-13',NULL )
, (NULL, 'A-37487-639268', 'Aquadisp', 'Comodato','2019-10-09',NULL )
, (NULL, 'H-71121-639273', 'Humma', 'Comodato','2019-11-23',NULL )
, (NULL, 'H-40419-639278', 'Humma', 'Comodato','2019-11-06',NULL )
, (NULL, 'A-52784-639286', 'Aquadisp', 'Comodato','2019-04-12',NULL )
, (NULL, 'A-78251-950404', 'Aquadisp', 'Comodato','2019-12-04',NULL )
, (NULL, 'A-78802-950405', 'Aquadisp', 'Comodato','2020-01-01',NULL )
, (NULL, 'A-78399-950407', 'Aquadisp', 'Comodato','2019-05-31',NULL )
, (NULL, 'A-69992-950408', 'Aquadisp', 'Comodato','2019-03-27',NULL )
, (NULL, 'A-77632-950409', 'Aquadisp', 'Comodato','2019-05-03',NULL )
, (NULL, 'A-78423-950415', 'Aquadisp', 'Comodato','2020-03-16',NULL )
, (NULL, 'A-78011-950419', 'Aquadisp', 'Comodato','2019-08-13',NULL )
, (NULL, 'A-70049-950471', 'Aquadisp', 'Comodato','2020-02-06',NULL )
, (NULL, 'A-78089-950474', 'Aquadisp', 'Comodato','2019-05-17',NULL )
, (NULL, 'A-70665-950479', 'Aquadisp', 'Comodato','2019-08-08',NULL )
, (NULL, 'A-70256-950481', 'Aquadisp', 'Comodato','2019-05-18',NULL )
, (NULL, 'A-77836-950484', 'Aquadisp', 'Comodato','2019-05-16',NULL )
, (NULL, 'A-77651-950493', 'Aquadisp', 'Comodato','2020-02-06',NULL )
, (NULL, 'A-70640-950494', 'Aquadisp', 'Comodato','2019-10-07',NULL )
, (NULL, 'A-77815-950496', 'Aquadisp', 'Comodato','2020-01-07',NULL )
, (NULL, 'A-78286-112500', 'Aquadisp', 'Nuevo','2021-04-13',NULL )
, (NULL, 'A-37281-350113', 'Aquadisp', 'Nuevo','2021-01-28',NULL )
, (NULL, 'U-335402-639231', 'Ushuaia', 'Nuevo','2021-02-04',NULL )
, (NULL, 'U-335109-639232', 'Ushuaia', 'Nuevo','2021-02-04',NULL )
, (NULL, 'U-335118-639233', 'Ushuaia', 'Nuevo','2021-02-06',NULL )
, (NULL, 'U-335434-639250', 'Ushuaia', 'Nuevo','2021-02-02',NULL )
, (NULL, 'A---639256', 'Aquadisp', 'Nuevo','2021-05-10',NULL )
, (NULL, 'H-40814-639263', 'Humma', 'Nuevo','2021-05-28',NULL )
, (NULL, 'A-57433-950482', 'Aquadisp', 'Nuevo','2021-04-13',NULL )
, (NULL, 'H-40449-11088', 'Humma', 'Usado','2021-07-05',NULL )
, (NULL, 'A-53131-110007', 'Aquadisp', 'Usado','2020-02-04',NULL )
, (NULL, 'U-257467-110015', 'Ushuaia', 'Usado','2019-03-26',NULL )
, (NULL, 'H-40592-110034', 'Humma', 'Usado','2021-05-06',NULL )
, (NULL, 'H-120026-112407', 'Humma', 'Usado','2020-04-16',NULL )
, (NULL, 'H-120065-112411', 'Humma', 'P/ reparar','2020-02-10',NULL )
, (NULL, 'H-120100-112419', 'Humma', 'P/ reparar','2020-06-12',NULL )
, (NULL, 'H-40818-116708', 'Humma', 'P/ reparar','2019-06-04',NULL )
, (NULL, 'H-41072-116764', 'Humma', 'P/ reparar','2021-07-01',NULL )
, (NULL, 'H-40409-116787', 'Humma', 'P/ reparar','2020-02-06',NULL )
, (NULL, 'H-40413-116800', 'Humma', 'P/ reparar','2021-04-30',NULL )
, (NULL, 'U-318190-350147', 'Ushuaia', 'P/ reparar','2020-09-08',NULL )
, (NULL, 'A-37457-350167', 'Aquadisp', 'P/ reparar','2019-12-03',NULL )
, (NULL, 'U-318175-606906', 'Ushuaia', 'P/ reparar','2020-09-08',NULL )
, (NULL, 'A-70349-606924', 'Aquadisp', 'P/ reparar','2019-04-30',NULL )
, (NULL, 'U-274500-606937', 'Ushuaia', 'P/ reparar','2019-08-01',NULL )
, (NULL, 'A---606961', 'Aquadisp', 'P/ reparar','2019-10-30',NULL )
, (NULL, 'A-53245-606962', 'Aquadisp', 'P/ reparar','2019-11-07',NULL )
, (NULL, 'A-77631-950420', 'Aquadisp', 'P/ reparar','2019-10-29',NULL )
, (NULL, 'A-70354-950488', 'Aquadisp', 'P/ reparar','2019-05-16',NULL )
, (NULL, 'H-120190-112435', 'Humma', 'Reservado','2019-05-09',NULL )
, (NULL, 'A-37310-606977', 'Aquadisp', 'Reservado','2019-05-16',NULL )
, (NULL, 'A-32685-110020', 'Aquadisp', 'Técnico','2020-08-10',NULL )
, (NULL, 'A-32909-110051', 'Aquadisp', 'Técnico','2019-06-13',NULL )
, (NULL, 'A-52982-554146', 'Aquadisp', 'Técnico','2019-08-22',NULL )
, (NULL, 'A-78106-950449', 'Aquadisp', 'Técnico','2020-07-28',NULL )
, (NULL, 'A-53217-110052', 'Aquadisp', 'Vendido','2019-05-16','2019-06-16' )
, (NULL, 'H-40335-110076', 'Humma', 'Vendido','2019-11-29','2019-11-30' )
, (NULL, 'H-120293-112452', 'Humma', 'Vendido','2019-05-06','2019-07-05' )
, (NULL, 'H-110639-136274', 'Humma', 'Vendido','2019-03-26','2019-04-15' )
, (NULL, 'A-37491-350149', 'Aquadisp', 'Vendido','2019-05-31','2019-06-15' )
, (NULL, 'A-570409-606946', 'Aquadisp', 'Vendido','2019-12-04','2019-12-07' )
, (NULL, 'A-570423-606947', 'Aquadisp', 'Vendido','2019-12-04','2019-12-07' )
, (NULL, 'A-570254-606953', 'Aquadisp', 'Vendido','2019-12-04','2019-12-07' )
, (NULL, 'A-570089-606954', 'Aquadisp', 'Vendido','2019-12-04','2019-12-14' )
, (NULL, 'A-570268-606955', 'Aquadisp', 'Vendido','2019-12-04','2019-12-09' )
, (NULL, 'A-570092-606956', 'Aquadisp', 'Vendido','2019-12-04','2019-12-05' )
, (NULL, 'A-570190-606957', 'Aquadisp', 'Vendido','2019-12-04','2019-12-05' )
, (NULL, 'A-570026-606958', 'Aquadisp', 'Vendido','2019-12-04','2019-12-05' )
;


INSERT INTO clientes_dispensers (id_cliente_dispenser, id_cliente,id_dispenser, fecha_movimiento, movimiento )
VALUES (NULL, 1, 1,'2016-06-30', 'Entrega' )
, (NULL, 2, 2,'2016-06-30', 'Entrega' )
, (NULL, 4, 3,'2016-06-30', 'Entrega' )
, (NULL, 14, 4,'2016-06-30', 'Entrega' )
, (NULL, 14, 4,'2017-04-30', 'Baja cliente' )
, (NULL, 27, 4,'2017-01-01', 'Entrega' )
, (NULL, 15, 5,'2016-06-30', 'Entrega' )
, (NULL, 20, 6,'2016-06-30', 'Entrega' )
, (NULL, 21, 7,'2016-06-30', 'Entrega' )
, (NULL, 22, 8,'2016-06-30', 'Entrega' )
, (NULL, 23, 9,'2016-09-09', 'Entrega' )
, (NULL, 24, 10,'2016-09-09', 'Entrega' )
, (NULL, 52, 11,'2017-06-14', 'Entrega' )
, (NULL, 64, 12,'2017-08-30', 'Entrega' )
, (NULL, 75, 13,'2017-09-05', 'Entrega' )
, (NULL, 76, 14,'2017-12-20', 'Entrega' )
, (NULL, 81, 15,'2018-01-17', 'Entrega' )
, (NULL, 84, 16,'2018-01-17', 'Entrega' )
, (NULL, 85, 17,'2018-03-01', 'Entrega' )
, (NULL, 87, 18,'2018-03-06', 'Entrega' )
, (NULL, 88, 19,'2018-04-13', 'Entrega' )
, (NULL, 90, 20,'2018-04-20', 'Entrega' )
, (NULL, 91, 21,'2018-05-18', 'Entrega' )
, (NULL, 92, 22,'2018-06-26', 'Entrega' )
, (NULL, 94, 23,'2018-08-08', 'Entrega' )
, (NULL, 95, 24,'2018-08-15', 'Entrega' )
, (NULL, 97, 25,'2018-08-15', 'Entrega' )
, (NULL, 98, 26,'2018-08-16', 'Entrega' )
, (NULL, 99, 27,'2018-08-16', 'Entrega' )
, (NULL, 100, 28,'2018-09-01', 'Entrega' )
, (NULL, 103, 29,'2018-09-06', 'Entrega' )
, (NULL, 102, 30,'2018-09-01', 'Entrega' )
, (NULL, 102, 30,'2019-08-06', 'Baja cliente' )
, (NULL, 117, 30,'2019-04-01', 'Entrega' )
, (NULL, 107, 31,'2018-09-18', 'Entrega' )
, (NULL, 109, 32,'2018-10-05', 'Entrega' )
, (NULL, 111, 33,'2018-11-20', 'Entrega' )
, (NULL, 114, 34,'2018-12-11', 'Entrega' )
, (NULL, 115, 35,'2018-12-15', 'Entrega' )
, (NULL, 116, 36,'2019-03-19', 'Entrega' )
, (NULL, 121, 37,'2019-04-25', 'Entrega' )
, (NULL, 123, 38,'2019-06-07', 'Entrega' )
, (NULL, 124, 39,'2019-06-25', 'Entrega' )
, (NULL, 125, 40,'2019-08-02', 'Entrega' )
, (NULL, 128, 41,'2019-08-02', 'Entrega' )
, (NULL, 129, 42,'2019-10-28', 'Entrega' )
, (NULL, 130, 43,'2019-10-29', 'Entrega' )
, (NULL, 137, 44,'2019-11-22', 'Entrega' )
, (NULL, 138, 45,'2020-03-07', 'Entrega' )
, (NULL, 146, 46,'2020-05-11', 'Entrega' )
, (NULL, 163, 47,'2020-05-14', 'Entrega' )
, (NULL, 194, 48,'2020-06-01', 'Entrega' )
, (NULL, 197, 49,'2020-06-10', 'Entrega' )
, (NULL, 202, 50,'2020-09-01', 'Entrega' )
, (NULL, 204, 51,'2020-11-03', 'Entrega' )
, (NULL, 214, 52,'2021-01-30', 'Entrega' )
, (NULL, 222, 53,'2021-02-03', 'Entrega' )
, (NULL, 232, 54,'2021-02-05', 'Entrega' )
, (NULL, 233, 55,'2021-02-06', 'Entrega' )
, (NULL, 237, 56,'2021-02-09', 'Entrega' )
, (NULL, 238, 57,'2021-03-12', 'Entrega' )
, (NULL, 240, 58,'2021-04-14', 'Entrega' )
, (NULL, 248, 59,'2021-05-12', 'Entrega' )
, (NULL, 251, 60,'2021-06-15', 'Entrega' )
, (NULL, 255, 61,'2021-07-16', 'Entrega' )
, (NULL, 257, 62,'2021-10-01', 'Entrega' )
, (NULL, 259, 63,'2021-10-14', 'Entrega' )
, (NULL, 261, 64,'2021-10-21', 'Entrega' )
, (NULL, 262, 65,'2021-11-11', 'Entrega' )
, (NULL, 263, 66,'2021-12-01', 'Entrega' )
, (NULL, 264, 67,'2022-02-18', 'Entrega' )
, (NULL, 265, 68,'2021-12-21', 'Entrega' )
, (NULL, 268, 69,'2022-03-18', 'Entrega' )
, (NULL, 267, 70,'2022-03-02', 'Entrega' )
, (NULL, 266, 71,'2021-12-20', 'Entrega' )
, (NULL, 266, 71,'2022-10-30', 'Baja cliente' )
, (NULL, 282, 71,'2022-09-29', 'Entrega' )
, (NULL, 269, 72,'2022-03-25', 'Entrega' )
, (NULL, 270, 73,'2022-03-25', 'Entrega' )
, (NULL, 271, 74,'2022-04-01', 'Entrega' )
, (NULL, 272, 75,'2022-05-16', 'Entrega' )
, (NULL, 273, 76,'2022-05-17', 'Entrega' )
, (NULL, 274, 77,'2022-05-19', 'Entrega' )
, (NULL, 275, 78,'2022-06-16', 'Entrega' )
, (NULL, 276, 79,'2022-07-25', 'Entrega' )
, (NULL, 277, 80,'2022-08-08', 'Entrega' )
, (NULL, 278, 81,'2022-08-22', 'Entrega' )
, (NULL, 279, 82,'2022-08-30', 'Entrega' )
, (NULL, 280, 83,'2022-09-19', 'Entrega' )
, (NULL, 281, 84,'2022-09-29', 'Entrega' )
, (NULL, 283, 85,'2022-10-03', 'Entrega' )
, (NULL, 284, 86,'2022-11-17', 'Entrega' )
, (NULL, 285, 87,'2022-12-05', 'Entrega' )
, (NULL, 286, 88,'2022-12-12', 'Entrega' )
, (NULL, 287, 89,'2022-12-16', 'Entrega' )
, (NULL, 288, 90,'2022-12-19', 'Entrega' )
, (NULL, 289, 91,'2022-12-23', 'Entrega' )
, (NULL, 290, 92,'2023-01-11', 'Entrega' )
, (NULL, 291, 93,'2023-01-14', 'Entrega' )
, (NULL, 292, 94,'2023-01-25', 'Entrega' )
, (NULL, 293, 95,'2023-02-01', 'Entrega' )
, (NULL, 294, 96,'2023-02-09', 'Entrega' )
, (NULL, 295, 97,'2023-02-09', 'Entrega' )
, (NULL, 296, 98,'2023-02-17', 'Entrega' )
, (NULL, 297, 99,'2023-02-22', 'Entrega' )
, (NULL, 298, 100,'2023-02-23', 'Entrega' )
, (NULL, 299, 101,'2023-03-14', 'Entrega' )
, (NULL, 300, 102,'2023-03-16', 'Entrega' )
, (NULL, 301, 103,'2023-03-21', 'Entrega' )
, (NULL, 302, 104,'2023-03-27', 'Entrega' )
, (NULL, 303, 105,'2023-03-28', 'Entrega' )
, (NULL, 304, 106,'2023-04-04', 'Entrega' )
, (NULL, 305, 107,'2023-04-18', 'Entrega' )
, (NULL, 306, 108,'2023-05-04', 'Entrega' )
, (NULL, 307, 109,'2023-05-11', 'Entrega' )
, (NULL, 308, 110,'2023-06-02', 'Entrega' )
, (NULL, 309, 111,'2023-06-13', 'Entrega' )
, (NULL, 310, 112,'2023-06-16', 'Entrega' )
, (NULL, 311, 113,'2023-07-28', 'Entrega' )
, (NULL, 312, 114,'2023-09-11', 'Entrega' )
, (NULL, 313, 115,'2023-09-20', 'Entrega' )
, (NULL, 315, 116,'2023-10-12', 'Entrega' )
, (NULL, 316, 117,'2023-12-02', 'Entrega por cambio' )
, (NULL, 317, 118,'2023-10-24', 'Entrega' )
, (NULL, 339, 119,'2024-01-02', 'Entrega' )
, (NULL, 319, 120,'2023-11-13', 'Entrega' )
, (NULL, 320, 121,'2023-11-14', 'Entrega' )
, (NULL, 321, 122,'2023-11-15', 'Entrega' )
, (NULL, 322, 123,'2023-11-15', 'Entrega' )
, (NULL, 323, 124,'2023-11-15', 'Entrega' )
, (NULL, 324, 125,'2023-11-17', 'Entrega' )
, (NULL, 325, 126,'2023-11-20', 'Entrega' )
, (NULL, 326, 127,'2023-12-04', 'Entrega' )
, (NULL, 327, 128,'2023-12-11', 'Entrega' )
, (NULL, 328, 129,'2023-12-13', 'Entrega' )
, (NULL, 329, 130,'2023-12-14', 'Entrega' )
, (NULL, 330, 131,'2023-12-19', 'Entrega' )
, (NULL, 331, 132,'2023-12-19', 'Entrega' )
, (NULL, 332, 133,'2023-12-26', 'Entrega' )
, (NULL, 333, 134,'2024-01-16', 'Entrega por cambio' )
, (NULL, 334, 135,'2023-12-26', 'Entrega' )
, (NULL, 335, 136,'2023-12-27', 'Entrega' )
, (NULL, 336, 137,'2024-01-02', 'Entrega' )
, (NULL, 337, 138,'2024-01-02', 'Entrega' )
, (NULL, 338, 139,'2024-02-15', 'Entrega por cambio' )
, (NULL, 339, 140,'2024-01-02', 'Entrega' )
, (NULL, 340, 141,'2024-01-04', 'Entrega' )
, (NULL, 341, 142,'2024-01-05', 'Entrega' )
, (NULL, 342, 143,'2024-02-05', 'Entrega por cambio' )
, (NULL, 343, 144,'2024-02-05', 'Entrega' )
, (NULL, 344, 145,'2023-03-16', 'Entrega' )
, (NULL, 345, 146,'2023-11-15', 'Entrega' )
, (NULL, 346, 147,'2024-02-05', 'Entrega' )
, (NULL, 347, 148,'2016-06-30', 'Entrega' )
, (NULL, 303, 149,'2023-03-28', 'Entrega' )
, (NULL, 326, 150,'2023-12-04', 'Entrega' )
, (NULL, 347, 151,'2016-06-30', 'Entrega' )
, (NULL, 14, 152,'2016-06-30', 'Entrega' )
, (NULL, 1, 153,'2016-06-30', 'Entrega' )
, (NULL, 268, 154,'2022-03-18', 'Entrega' )
, (NULL, 269, 155,'2022-03-25', 'Entrega' )
, (NULL, 270, 156,'2022-03-25', 'Entrega' )
, (NULL, 271, 157,'2022-04-01', 'Entrega' )
, (NULL, 272, 158,'2022-05-16', 'Entrega' )
, (NULL, 273, 159,'2022-05-17', 'Entrega' )
, (NULL, 274, 160,'2022-05-19', 'Entrega' )
, (NULL, 275, 161,'2022-06-16', 'Entrega' )
, (NULL, 276, 162,'2022-07-25', 'Entrega' )
, (NULL, 277, 163,'2022-08-08', 'Entrega' )
, (NULL, 277, 164,'2022-08-08', 'Entrega' )
, (NULL, 318, 165,'2024-02-29', 'Entrega por cambio' )
, (NULL, 333, 175,'2023-12-26', 'Entrega' )
, (NULL, 333, 175,'2024-01-15', 'Devolución para cambio' )
, (NULL, NULL, 175,'2024-01-15', 'A reparar' )
, (NULL, NULL, 175,'2024-01-20', 'Reparado' )
, (NULL, 316, 176,'2023-10-18', 'Entrega' )
, (NULL, 316, 176,'2023-12-01', 'Devolución para cambio' )
, (NULL, NULL, 176,'2023-12-01', 'A reparar' )
, (NULL, NULL, 176,'2023-12-16', 'Reparado' )
, (NULL, 342, 177,'2024-02-02', 'Entrega' )
, (NULL, 342, 177,'2024-02-01', 'Devolución para cambio' )
, (NULL, NULL, 177,'2024-02-01', 'A reparar' )
, (NULL, NULL, 177,'2024-02-11', 'Reparado' )
, (NULL, 338, 178,'2024-01-02', 'Entrega' )
, (NULL, 338, 178,'2024-02-10', 'Devolución para cambio' )
, (NULL, NULL, 178,'2024-02-10', 'A reparar' )
, (NULL, NULL, 178,'2024-03-10', 'Reparado' )
, (NULL, 318, 179,'2023-11-09', 'Entrega' )
, (NULL, 318, 179,'2024-02-29', 'Devolución para cambio' )
, (NULL, NULL, 179,'2024-02-29', 'A reparar' )
, (NULL, NULL, 179,'2024-03-10', 'Reparado' )
, (NULL, NULL, 180,'2022-01-10', 'A reparar' )
, (NULL, NULL, 181,'2022-03-27', 'A reparar' )
, (NULL, NULL, 182,'2020-12-01', 'A reparar' )
, (NULL, NULL, 183,'2023-01-01', 'A reparar' )
, (NULL, NULL, 184,'2021-08-11', 'A reparar' )
, (NULL, NULL, 185,'2022-11-06', 'A reparar' )
, (NULL, NULL, 186,'2022-03-20', 'A reparar' )
, (NULL, NULL, 187,'2021-06-16', 'A reparar' )
, (NULL, NULL, 188,'2022-03-26', 'A reparar' )
, (NULL, NULL, 189,'2020-11-17', 'A reparar' )
, (NULL, NULL, 190,'2021-02-21', 'A reparar' )
, (NULL, NULL, 191,'2021-05-25', 'A reparar' )
, (NULL, NULL, 192,'2021-06-05', 'A reparar' )
, (NULL, NULL, 193,'2021-05-30', 'A reparar' )
, (NULL, NULL, 194,'2020-12-18', 'A reparar' )
, (NULL, NULL, 197,'2024-12-03', 'En reparación' )
, (NULL, NULL, 198,'2023-10-14', 'En reparación' )
, (NULL, NULL, 199,'2023-12-31', 'En reparación' )
, (NULL, NULL, 200,'2024-12-14', 'En reparación' )
;


INSERT INTO clientes_domicilios (id_cliente_domicilio, id_cliente,id_domicilio, id_tipo_domicilio )
VALUES (NULL, 1, 1, 'A' )
, (NULL, 2, 2, 'A' )
, (NULL, 3, 3, 'A' )
, (NULL, 4, 4, 'A' )
, (NULL, 5, 5, 'A' )
, (NULL, 6, 6, 'A' )
, (NULL, 7, 7, 'A' )
, (NULL, 8, 8, 'A' )
, (NULL, 9, 9, 'A' )
, (NULL, 10, 10, 'A' )
, (NULL, 11, 11, 'A' )
, (NULL, 12, 12, 'A' )
, (NULL, 13, 13, 'A' )
, (NULL, 14, 14, 'A' )
, (NULL, 15, 15, 'A' )
, (NULL, 16, 16, 'A' )
, (NULL, 17, 17, 'A' )
, (NULL, 18, 18, 'A' )
, (NULL, 19, 19, 'A' )
, (NULL, 20, 20, 'A' )
, (NULL, 21, 21, 'A' )
, (NULL, 22, 22, 'A' )
, (NULL, 23, 23, 'A' )
, (NULL, 24, 24, 'A' )
, (NULL, 25, 25, 'A' )
, (NULL, 26, 26, 'A' )
, (NULL, 27, 27, 'A' )
, (NULL, 28, 28, 'A' )
, (NULL, 29, 29, 'A' )
, (NULL, 30, 30, 'A' )
, (NULL, 31, 31, 'A' )
, (NULL, 32, 32, 'A' )
, (NULL, 33, 33, 'A' )
, (NULL, 34, 34, 'A' )
, (NULL, 35, 35, 'A' )
, (NULL, 36, 36, 'A' )
, (NULL, 37, 37, 'A' )
, (NULL, 38, 38, 'A' )
, (NULL, 39, 39, 'A' )
, (NULL, 40, 40, 'A' )
, (NULL, 41, 41, 'A' )
, (NULL, 42, 42, 'A' )
, (NULL, 43, 43, 'A' )
, (NULL, 44, 44, 'A' )
, (NULL, 45, 45, 'A' )
, (NULL, 46, 46, 'A' )
, (NULL, 47, 47, 'A' )
, (NULL, 48, 48, 'A' )
, (NULL, 49, 49, 'A' )
, (NULL, 50, 50, 'A' )
, (NULL, 51, 51, 'A' )
, (NULL, 52, 52, 'A' )
, (NULL, 53, 53, 'A' )
, (NULL, 54, 54, 'A' )
, (NULL, 55, 55, 'A' )
, (NULL, 56, 56, 'A' )
, (NULL, 57, 57, 'A' )
, (NULL, 58, 58, 'A' )
, (NULL, 59, 59, 'A' )
, (NULL, 60, 60, 'A' )
, (NULL, 61, 61, 'A' )
, (NULL, 62, 62, 'A' )
, (NULL, 63, 63, 'A' )
, (NULL, 64, 64, 'A' )
, (NULL, 65, 65, 'A' )
, (NULL, 66, 66, 'A' )
, (NULL, 67, 67, 'A' )
, (NULL, 68, 68, 'A' )
, (NULL, 69, 69, 'A' )
, (NULL, 70, 70, 'A' )
, (NULL, 71, 71, 'A' )
, (NULL, 72, 72, 'A' )
, (NULL, 73, 73, 'A' )
, (NULL, 74, 74, 'A' )
, (NULL, 75, 75, 'A' )
, (NULL, 76, 76, 'A' )
, (NULL, 77, 77, 'A' )
, (NULL, 78, 78, 'A' )
, (NULL, 79, 79, 'A' )
, (NULL, 80, 80, 'A' )
, (NULL, 81, 81, 'A' )
, (NULL, 82, 82, 'A' )
, (NULL, 83, 83, 'A' )
, (NULL, 84, 84, 'A' )
, (NULL, 85, 85, 'A' )
, (NULL, 86, 86, 'A' )
, (NULL, 87, 87, 'A' )
, (NULL, 88, 88, 'A' )
, (NULL, 89, 89, 'A' )
, (NULL, 90, 90, 'A' )
, (NULL, 91, 91, 'A' )
, (NULL, 92, 92, 'A' )
, (NULL, 93, 93, 'A' )
, (NULL, 94, 94, 'A' )
, (NULL, 95, 95, 'A' )
, (NULL, 96, 96, 'A' )
, (NULL, 97, 97, 'A' )
, (NULL, 98, 98, 'A' )
, (NULL, 99, 99, 'A' )
, (NULL, 100, 100, 'A' )
, (NULL, 101, 101, 'A' )
, (NULL, 102, 102, 'A' )
, (NULL, 103, 103, 'A' )
, (NULL, 104, 104, 'A' )
, (NULL, 105, 105, 'A' )
, (NULL, 106, 106, 'A' )
, (NULL, 107, 107, 'A' )
, (NULL, 108, 108, 'A' )
, (NULL, 109, 109, 'A' )
, (NULL, 110, 110, 'A' )
, (NULL, 111, 111, 'A' )
, (NULL, 112, 112, 'A' )
, (NULL, 113, 113, 'A' )
, (NULL, 114, 114, 'A' )
, (NULL, 115, 115, 'A' )
, (NULL, 116, 116, 'A' )
, (NULL, 117, 117, 'A' )
, (NULL, 118, 118, 'A' )
, (NULL, 119, 119, 'A' )
, (NULL, 120, 120, 'A' )
, (NULL, 121, 121, 'A' )
, (NULL, 122, 122, 'A' )
, (NULL, 123, 123, 'A' )
, (NULL, 124, 124, 'A' )
, (NULL, 125, 125, 'A' )
, (NULL, 126, 126, 'A' )
, (NULL, 127, 127, 'A' )
, (NULL, 128, 128, 'A' )
, (NULL, 129, 129, 'A' )
, (NULL, 130, 130, 'A' )
, (NULL, 131, 131, 'A' )
, (NULL, 132, 132, 'A' )
, (NULL, 133, 133, 'A' )
, (NULL, 134, 134, 'A' )
, (NULL, 135, 135, 'A' )
, (NULL, 136, 136, 'A' )
, (NULL, 137, 137, 'A' )
, (NULL, 138, 138, 'A' )
, (NULL, 139, 139, 'A' )
, (NULL, 140, 140, 'A' )
, (NULL, 141, 141, 'A' )
, (NULL, 142, 142, 'A' )
, (NULL, 143, 143, 'A' )
, (NULL, 144, 144, 'A' )
, (NULL, 145, 145, 'A' )
, (NULL, 146, 146, 'A' )
, (NULL, 147, 147, 'A' )
, (NULL, 148, 148, 'A' )
, (NULL, 149, 149, 'A' )
, (NULL, 150, 150, 'A' )
, (NULL, 151, 151, 'A' )
, (NULL, 152, 152, 'A' )
, (NULL, 153, 153, 'A' )
, (NULL, 154, 154, 'A' )
, (NULL, 155, 155, 'A' )
, (NULL, 156, 156, 'A' )
, (NULL, 157, 157, 'A' )
, (NULL, 158, 158, 'A' )
, (NULL, 159, 159, 'A' )
, (NULL, 160, 160, 'A' )
, (NULL, 161, 161, 'A' )
, (NULL, 162, 162, 'A' )
, (NULL, 163, 163, 'A' )
, (NULL, 164, 164, 'A' )
, (NULL, 165, 165, 'A' )
, (NULL, 166, 166, 'A' )
, (NULL, 167, 167, 'A' )
, (NULL, 168, 168, 'A' )
, (NULL, 169, 169, 'A' )
, (NULL, 170, 170, 'A' )
, (NULL, 171, 171, 'A' )
, (NULL, 172, 172, 'A' )
, (NULL, 173, 173, 'A' )
, (NULL, 174, 174, 'A' )
, (NULL, 175, 175, 'A' )
, (NULL, 176, 176, 'A' )
, (NULL, 177, 177, 'A' )
, (NULL, 178, 178, 'A' )
, (NULL, 179, 179, 'A' )
, (NULL, 180, 180, 'A' )
, (NULL, 181, 181, 'A' )
, (NULL, 182, 182, 'A' )
, (NULL, 183, 183, 'A' )
, (NULL, 184, 184, 'A' )
, (NULL, 185, 185, 'A' )
, (NULL, 186, 186, 'A' )
, (NULL, 187, 187, 'A' )
, (NULL, 188, 188, 'A' )
, (NULL, 189, 189, 'A' )
, (NULL, 190, 190, 'A' )
, (NULL, 191, 191, 'A' )
, (NULL, 192, 192, 'A' )
, (NULL, 193, 193, 'A' )
, (NULL, 194, 194, 'A' )
, (NULL, 195, 195, 'A' )
, (NULL, 196, 196, 'A' )
, (NULL, 197, 197, 'A' )
, (NULL, 198, 198, 'A' )
, (NULL, 199, 199, 'A' )
, (NULL, 200, 200, 'A' )
, (NULL, 201, 201, 'A' )
, (NULL, 202, 202, 'A' )
, (NULL, 203, 203, 'A' )
, (NULL, 204, 204, 'A' )
, (NULL, 205, 205, 'A' )
, (NULL, 206, 206, 'A' )
, (NULL, 207, 207, 'A' )
, (NULL, 208, 208, 'A' )
, (NULL, 209, 209, 'A' )
, (NULL, 210, 210, 'A' )
, (NULL, 211, 211, 'A' )
, (NULL, 212, 212, 'A' )
, (NULL, 213, 213, 'A' )
, (NULL, 214, 214, 'A' )
, (NULL, 215, 215, 'A' )
, (NULL, 216, 216, 'A' )
, (NULL, 217, 217, 'A' )
, (NULL, 218, 218, 'A' )
, (NULL, 219, 219, 'A' )
, (NULL, 220, 220, 'A' )
, (NULL, 221, 221, 'A' )
, (NULL, 222, 222, 'A' )
, (NULL, 223, 223, 'A' )
, (NULL, 224, 224, 'A' )
, (NULL, 225, 225, 'A' )
, (NULL, 226, 226, 'A' )
, (NULL, 227, 227, 'A' )
, (NULL, 228, 228, 'A' )
, (NULL, 229, 229, 'A' )
, (NULL, 230, 230, 'A' )
, (NULL, 231, 231, 'A' )
, (NULL, 232, 232, 'A' )
, (NULL, 233, 233, 'A' )
, (NULL, 234, 234, 'A' )
, (NULL, 235, 235, 'A' )
, (NULL, 236, 236, 'A' )
, (NULL, 237, 237, 'A' )
, (NULL, 238, 238, 'A' )
, (NULL, 239, 239, 'A' )
, (NULL, 240, 240, 'A' )
, (NULL, 241, 241, 'A' )
, (NULL, 242, 242, 'A' )
, (NULL, 243, 243, 'A' )
, (NULL, 244, 244, 'A' )
, (NULL, 245, 245, 'A' )
, (NULL, 246, 246, 'A' )
, (NULL, 247, 247, 'A' )
, (NULL, 248, 248, 'A' )
, (NULL, 249, 249, 'A' )
, (NULL, 250, 250, 'A' )
, (NULL, 251, 251, 'A' )
, (NULL, 252, 252, 'A' )
, (NULL, 253, 253, 'A' )
, (NULL, 254, 254, 'A' )
, (NULL, 255, 255, 'A' )
, (NULL, 256, 256, 'A' )
, (NULL, 257, 257, 'A' )
, (NULL, 258, 258, 'A' )
, (NULL, 259, 259, 'A' )
, (NULL, 260, 260, 'A' )
, (NULL, 261, 261, 'A' )
, (NULL, 262, 262, 'A' )
, (NULL, 263, 263, 'A' )
, (NULL, 264, 264, 'A' )
, (NULL, 265, 265, 'A' )
, (NULL, 266, 266, 'A' )
, (NULL, 267, 267, 'A' )
, (NULL, 268, 268, 'A' )
, (NULL, 269, 269, 'A' )
, (NULL, 270, 270, 'A' )
, (NULL, 271, 271, 'A' )
, (NULL, 272, 272, 'A' )
, (NULL, 273, 273, 'A' )
, (NULL, 274, 274, 'A' )
, (NULL, 275, 275, 'A' )
, (NULL, 276, 276, 'A' )
, (NULL, 277, 277, 'A' )
, (NULL, 278, 278, 'A' )
, (NULL, 279, 279, 'A' )
, (NULL, 280, 280, 'A' )
, (NULL, 281, 281, 'A' )
, (NULL, 282, 282, 'A' )
, (NULL, 283, 283, 'A' )
, (NULL, 284, 284, 'A' )
, (NULL, 285, 285, 'A' )
, (NULL, 286, 286, 'A' )
, (NULL, 287, 287, 'A' )
, (NULL, 288, 288, 'A' )
, (NULL, 289, 289, 'A' )
, (NULL, 290, 290, 'A' )
, (NULL, 291, 291, 'A' )
, (NULL, 292, 292, 'A' )
, (NULL, 293, 293, 'A' )
, (NULL, 294, 294, 'A' )
, (NULL, 295, 295, 'A' )
, (NULL, 296, 296, 'A' )
, (NULL, 297, 297, 'A' )
, (NULL, 298, 298, 'A' )
, (NULL, 299, 299, 'A' )
, (NULL, 300, 300, 'A' )
, (NULL, 301, 301, 'A' )
, (NULL, 302, 302, 'A' )
, (NULL, 303, 303, 'A' )
, (NULL, 304, 304, 'A' )
, (NULL, 305, 305, 'A' )
, (NULL, 306, 306, 'A' )
, (NULL, 307, 307, 'A' )
, (NULL, 308, 308, 'A' )
, (NULL, 309, 309, 'A' )
, (NULL, 310, 310, 'A' )
, (NULL, 311, 311, 'A' )
, (NULL, 312, 312, 'A' )
, (NULL, 313, 313, 'A' )
, (NULL, 314, 314, 'A' )
, (NULL, 315, 315, 'A' )
, (NULL, 316, 316, 'A' )
, (NULL, 317, 317, 'A' )
, (NULL, 318, 318, 'A' )
, (NULL, 319, 319, 'A' )
, (NULL, 320, 320, 'A' )
, (NULL, 321, 321, 'A' )
, (NULL, 322, 322, 'A' )
, (NULL, 323, 323, 'A' )
, (NULL, 324, 324, 'A' )
, (NULL, 325, 325, 'A' )
, (NULL, 326, 326, 'A' )
, (NULL, 327, 327, 'A' )
, (NULL, 328, 328, 'A' )
, (NULL, 329, 329, 'A' )
, (NULL, 330, 330, 'A' )
, (NULL, 331, 331, 'A' )
, (NULL, 332, 332, 'A' )
, (NULL, 333, 333, 'A' )
, (NULL, 334, 334, 'A' )
, (NULL, 335, 335, 'A' )
, (NULL, 336, 336, 'A' )
, (NULL, 337, 337, 'A' )
, (NULL, 338, 338, 'A' )
, (NULL, 339, 339, 'A' )
, (NULL, 340, 340, 'A' )
, (NULL, 341, 341, 'A' )
, (NULL, 194, 342, 'L' )
, (NULL, 34, 343, 'L' )
, (NULL, 19, 344, 'L' )
, (NULL, 198, 345, 'L' )
, (NULL, 23, 346, 'L' )
, (NULL, 237, 347, 'L' )
, (NULL, 309, 348, 'L' )
, (NULL, 151, 350, 'L' )
, (NULL, 177, 351, 'L' )
, (NULL, 67, 352, 'L' )
, (NULL, 14, 353, 'L' )
, (NULL, 215, 354, 'L' )
, (NULL, 222, 355, 'L' )
, (NULL, 182, 356, 'L' )
, (NULL, 229, 357, 'L' )
, (NULL, 155, 358, 'L' )
, (NULL, 105, 359, 'L' )
, (NULL, 140, 360, 'L' )
, (NULL, 86, 361, 'L' )
, (NULL, 82, 362, 'L' )
, (NULL, 162, 363, 'L' )
, (NULL, 341, 364, 'L' )
, (NULL, 87, 365, 'L' )
, (NULL, 35, 366, 'L' )
, (NULL, 189, 367, 'L' )
, (NULL, 90, 368, 'L' )
, (NULL, 197, 369, 'L' )
, (NULL, 300, 370, 'L' )
, (NULL, 318, 371, 'L' )
, (NULL, 200, 372, 'L' )
, (NULL, 154, 373, 'L' )
, (NULL, 299, 374, 'L' )
, (NULL, 284, 375, 'L' )
, (NULL, 232, 376, 'L' )
, (NULL, 131, 377, 'L' )
, (NULL, 316, 378, 'L' )
, (NULL, 18, 379, 'L' )
, (NULL, 255, 380, 'L' )
, (NULL, 183, 381, 'L' )
, (NULL, 22, 382, 'L' )
, (NULL, 218, 383, 'L' )
, (NULL, 206, 384, 'L' )
, (NULL, 51, 385, 'L' )
, (NULL, 212, 386, 'L' )
, (NULL, 141, 387, 'L' )
, (NULL, 199, 388, 'L' )
, (NULL, 4, 389, 'L' )
, (NULL, 196, 390, 'L' )
, (NULL, 100, 391, 'L' )
, (NULL, 205, 392, 'L' )
, (NULL, 37, 393, 'L' )
, (NULL, 174, 394, 'L' )
, (NULL, 20, 395, 'L' )
, (NULL, 79, 396, 'L' )
, (NULL, 187, 397, 'L' )
, (NULL, 294, 398, 'L' )
, (NULL, 327, 399, 'L' )
, (NULL, 64, 400, 'L' )
, (NULL, 253, 401, 'L' )
, (NULL, 225, 402, 'L' )
, (NULL, 21, 403, 'L' )
, (NULL, 306, 404, 'L' )
, (NULL, 347, 405, 'L' )
, (NULL, 246, 406, 'L' )
, (NULL, 36, 407, 'L' )
, (NULL, 288, 408, 'L' )
, (NULL, 188, 409, 'L' )
, (NULL, 77, 410, 'L' )
, (NULL, 101, 411, 'L' )
, (NULL, 106, 412, 'L' )
, (NULL, 276, 413, 'L' )
, (NULL, 312, 414, 'L' )
, (NULL, 80, 417, 'L' )
, (NULL, 92, 418, 'L' )
, (NULL, 68, 419, 'L' )
, (NULL, 78, 420, 'L' )
, (NULL, 93, 421, 'L' )
, (NULL, 65, 422, 'L' )
, (NULL, 326, 423, 'L' )
, (NULL, 256, 424, 'L' )
, (NULL, 6, 425, 'L' )
, (NULL, 110, 426, 'L' )
, (NULL, 66, 427, 'L' )
, (NULL, 288, 428, 'R' )
, (NULL, 70, 429, 'R' )
, (NULL, 300, 430, 'R' )
, (NULL, 340, 431, 'R' )
, (NULL, 267, 432, 'R' )
, (NULL, 116, 433, 'R' )
, (NULL, 303, 434, 'R' )
, (NULL, 260, 435, 'R' )
, (NULL, 140, 436, 'R' )
, (NULL, 25, 437, 'R' )
, (NULL, 236, 438, 'R' )
, (NULL, 248, 439, 'R' )
, (NULL, 323, 440, 'R' )
, (NULL, 258, 441, 'R' )
, (NULL, 75, 442, 'R' )
, (NULL, 281, 443, 'R' )
, (NULL, 240, 444, 'R' )
, (NULL, 307, 445, 'R' )
, (NULL, 185, 446, 'R' )
, (NULL, 193, 447, 'R' )
, (NULL, 133, 449, 'R' )
, (NULL, 77, 450, 'R' )
, (NULL, 68, 451, 'R' )
, (NULL, 297, 452, 'R' )
, (NULL, 108, 453, 'R' )
, (NULL, 250, 454, 'R' )
, (NULL, 187, 455, 'R' )
, (NULL, 166, 456, 'R' )
, (NULL, 287, 457, 'R' )
, (NULL, 115, 458, 'R' )
, (NULL, 80, 459, 'R' )
;


INSERT INTO precios (id_precio, fecha_inicio,id_producto, id_tipo_cliente, precio )
VALUES (NULL, '2016-01-01', 'B12', 'A',800.00 )
, (NULL, '2016-01-01', 'B20', 'A',1300.00 )
, (NULL, '2016-01-01', 'DFC', 'A',80000.00 )
, (NULL, '2016-01-01', 'E20', 'A',1600.00 )
, (NULL, '2016-01-01', 'B12', 'F',800.00 )
, (NULL, '2016-01-01', 'B20', 'F',1300.00 )
, (NULL, '2016-01-01', 'DFC', 'F',80000.00 )
, (NULL, '2016-01-01', 'E20', 'F',1600.00 )
, (NULL, '2016-01-01', 'B12', 'N',800.00 )
, (NULL, '2016-01-01', 'B20', 'N',1300.00 )
, (NULL, '2016-01-01', 'DFC', 'N',80000.00 )
, (NULL, '2016-01-01', 'E20', 'N',1600.00 )
, (NULL, '2016-01-01', 'B12', 'R',560.00 )
, (NULL, '2016-01-01', 'B20', 'R',910.00 )
, (NULL, '2016-01-01', 'DFC', 'R',80000.00 )
, (NULL, '2016-01-01', 'E20', 'R',1600.00 )
, (NULL, '2019-01-01', 'B12', 'A',1000.00 )
, (NULL, '2019-01-01', 'B20', 'A',1600.00 )
, (NULL, '2019-01-01', 'DFC', 'A',96000.00 )
, (NULL, '2019-01-01', 'E20', 'A',2000.00 )
, (NULL, '2019-01-01', 'B12', 'F',1000.00 )
, (NULL, '2019-01-01', 'B20', 'F',1600.00 )
, (NULL, '2019-01-01', 'DFC', 'F',96000.00 )
, (NULL, '2019-01-01', 'E20', 'F',2000.00 )
, (NULL, '2019-01-01', 'B12', 'N',1000.00 )
, (NULL, '2019-01-01', 'B20', 'N',1600.00 )
, (NULL, '2019-01-01', 'DFC', 'N',96000.00 )
, (NULL, '2019-01-01', 'E20', 'N',2000.00 )
, (NULL, '2019-01-01', 'B12', 'R',700.00 )
, (NULL, '2019-01-01', 'B20', 'R',1120.00 )
, (NULL, '2019-01-01', 'DFC', 'R',96000.00 )
, (NULL, '2019-01-01', 'E20', 'R',2000.00 )
, (NULL, '2021-01-01', 'B12', 'A',1200.00 )
, (NULL, '2021-01-01', 'B20', 'A',2000.00 )
, (NULL, '2021-01-01', 'DFC', 'A',120000.00 )
, (NULL, '2021-01-01', 'E20', 'A',2400.00 )
, (NULL, '2021-01-01', 'B12', 'F',1200.00 )
, (NULL, '2021-01-01', 'B20', 'F',2000.00 )
, (NULL, '2021-01-01', 'DFC', 'F',120000.00 )
, (NULL, '2021-01-01', 'E20', 'F',2400.00 )
, (NULL, '2021-01-01', 'B12', 'N',1200.00 )
, (NULL, '2021-01-01', 'B20', 'N',2000.00 )
, (NULL, '2021-01-01', 'DFC', 'N',120000.00 )
, (NULL, '2021-01-01', 'E20', 'N',2400.00 )
, (NULL, '2021-01-01', 'B12', 'R',840.00 )
, (NULL, '2021-01-01', 'B20', 'R',1400.00 )
, (NULL, '2021-01-01', 'DFC', 'R',120000.00 )
, (NULL, '2021-01-01', 'E20', 'R',2400.00 )
, (NULL, '2023-01-01', 'B12', 'A',1500.00 )
, (NULL, '2023-01-01', 'B20', 'A',2500.00 )
, (NULL, '2023-01-01', 'DFC', 'A',150000.00 )
, (NULL, '2023-01-01', 'E20', 'A',3000.00 )
, (NULL, '2023-01-01', 'B12', 'F',1500.00 )
, (NULL, '2023-01-01', 'B20', 'F',2500.00 )
, (NULL, '2023-01-01', 'DFC', 'F',150000.00 )
, (NULL, '2023-01-01', 'E20', 'F',3000.00 )
, (NULL, '2023-01-01', 'B12', 'N',1500.00 )
, (NULL, '2023-01-01', 'B20', 'N',2500.00 )
, (NULL, '2023-01-01', 'DFC', 'N',150000.00 )
, (NULL, '2023-01-01', 'E20', 'N',3000.00 )
, (NULL, '2023-01-01', 'B12', 'R',1050.00 )
, (NULL, '2023-01-01', 'B20', 'R',1750.00 )
, (NULL, '2023-01-01', 'DFC', 'R',150000.00 )
, (NULL, '2023-01-01', 'E20', 'R',3000.00 )
, (NULL, '2024-01-01', 'B12', 'A',3000.00 )
, (NULL, '2024-01-01', 'B20', 'A',5000.00 )
, (NULL, '2024-01-01', 'DFC', 'A',300000.00 )
, (NULL, '2024-01-01', 'E20', 'A',6000.00 )
, (NULL, '2024-01-01', 'B12', 'F',3000.00 )
, (NULL, '2024-01-01', 'B20', 'F',5000.00 )
, (NULL, '2024-01-01', 'DFC', 'F',300000.00 )
, (NULL, '2024-01-01', 'E20', 'F',6000.00 )
, (NULL, '2024-01-01', 'B12', 'N',3000.00 )
, (NULL, '2024-01-01', 'B20', 'N',5000.00 )
, (NULL, '2024-01-01', 'DFC', 'N',300000.00 )
, (NULL, '2024-01-01', 'E20', 'N',6000.00 )
, (NULL, '2024-01-01', 'B12', 'R',2100.00 )
, (NULL, '2024-01-01', 'B20', 'R',3500.00 )
, (NULL, '2024-01-01', 'DFC', 'R',300000.00 )
, (NULL, '2024-01-01', 'E20', 'R',6000.00 )
;


INSERT INTO operaciones (id_operacion, operacion)
VALUES	('V', 'Venta')
,		('A', 'Abono')	
,		('C', 'Cobro')	
;


INSERT INTO transacciones  (id_transaccion, id_operacion, id_medio_pago, id_cliente, id_producto, cantidad, id_reparto, fecha, nro_comprobante, precio )
VALUES (NULL, 'V', 'EF', 1,'B20',2,'R01','2023-12-28',1,NULL )
, (NULL, 'V', 'EF', 2,'B20',1,'R01','2022-01-07',2,NULL )
, (NULL, 'V', 'EF', 3,'B20',4,'R01','2023-12-30',3,NULL )
, (NULL, 'V', 'EF', 4,'B20',3,'R01','2024-05-02',4,NULL )
, (NULL, 'V', 'TR', 5,'B20',4,'R01','2023-11-23',5,NULL )
, (NULL, 'V', 'EF', 6,'B20',1,'R01','2023-02-18',6,NULL )
, (NULL, 'V', 'EF', 7,'B20',1,'R01','2022-07-21',7,NULL )
, (NULL, 'V', 'EF', 8,'B20',1,'R01','2022-02-07',8,NULL )
, (NULL, 'V', 'EF', 9,'B20',4,'R01','2023-01-07',9,NULL )
, (NULL, 'V', 'EF', 10,'B20',1,'R01','2024-04-28',10,NULL )
, (NULL, 'V', 'EF', 11,'B20',1,'R01','2024-02-16',11,NULL )
, (NULL, 'V', 'EF', 12,'B20',1,'R01','2022-05-26',12,NULL )
, (NULL, 'V', 'EF', 13,'B20',2,'R01','2023-05-10',13,NULL )
, (NULL, 'V', 'EF', 15,'B20',4,'R01','2022-11-01',14,NULL )
, (NULL, 'V', 'EF', 16,'B20',4,'R01','2024-03-10',15,NULL )
, (NULL, 'V', 'EF', 17,'B20',4,'R01','2022-01-08',16,NULL )
, (NULL, 'V', 'EF', 18,'B20',2,'R01','2022-01-28',17,NULL )
, (NULL, 'V', 'EF', 19,'B20',2,'R01','2023-04-27',18,NULL )
, (NULL, 'V', 'EF', 20,'B20',4,'R01','2023-09-14',19,NULL )
, (NULL, 'V', 'EF', 21,'B20',1,'R01','2022-05-20',20,NULL )
, (NULL, 'V', 'EF', 22,'B20',2,'R01','2022-07-28',21,NULL )
, (NULL, 'V', 'TR', 23,'B20',3,'R01','2023-09-02',22,NULL )
, (NULL, 'V', 'EF', 24,'B20',2,'R02','2022-07-19',23,NULL )
, (NULL, 'V', 'EF', 25,'B20',4,'R02','2022-10-22',24,NULL )
, (NULL, 'V', 'EF', 26,'B20',4,'R02','2023-07-18',25,NULL )
, (NULL, 'V', 'EF', 27,'B20',3,'R02','2022-12-01',26,NULL )
, (NULL, 'V', 'EF', 28,'B20',4,'R02','2023-01-15',27,NULL )
, (NULL, 'V', 'EF', 29,'B20',4,'R02','2024-05-12',28,NULL )
, (NULL, 'V', 'EF', 30,'B20',1,'R02','2023-10-12',29,NULL )
, (NULL, 'V', 'EF', 31,'B20',2,'R02','2023-10-24',30,NULL )
, (NULL, 'V', 'EF', 32,'B20',4,'R02','2023-02-06',31,NULL )
, (NULL, 'V', 'EF', 33,'B20',3,'R02','2023-09-29',32,NULL )
, (NULL, 'V', 'EF', 34,'B20',3,'R02','2022-06-25',33,NULL )
, (NULL, 'V', 'EF', 35,'B20',2,'R11','2022-09-30',34,NULL )
, (NULL, 'V', 'EF', 36,'B20',4,'R11','2022-04-17',35,NULL )
, (NULL, 'V', 'EF', 37,'B20',2,'R11','2022-11-10',36,NULL )
, (NULL, 'V', 'EF', 38,'B20',3,'R11','2023-01-14',37,NULL )
, (NULL, 'V', 'EF', 39,'B20',1,'R11','2022-04-06',38,NULL )
, (NULL, 'V', 'TR', 40,'B20',3,'R11','2023-03-03',39,NULL )
, (NULL, 'V', 'EF', 41,'B20',1,'R11','2024-06-18',40,NULL )
, (NULL, 'V', 'EF', 42,'B20',2,'R11','2022-03-10',41,NULL )
, (NULL, 'V', 'EF', 43,'B20',2,'R11','2022-03-30',42,NULL )
, (NULL, 'V', 'EF', 44,'B20',3,'R11','2023-12-14',43,NULL )
, (NULL, 'V', 'EF', 45,'B20',2,'R11','2022-03-12',44,NULL )
, (NULL, 'V', 'EF', 46,'B20',4,'R11','2022-04-14',45,NULL )
, (NULL, 'V', 'EF', 47,'B20',3,'R11','2022-03-31',46,NULL )
, (NULL, 'V', 'EF', 48,'B20',2,'R11','2023-12-26',47,NULL )
, (NULL, 'V', 'EF', 49,'B20',3,'R11','2022-10-01',48,NULL )
, (NULL, 'V', 'EF', 50,'B20',4,'R11','2023-08-22',49,NULL )
, (NULL, 'V', 'EF', 51,'B20',2,'R11','2023-09-03',50,NULL )
, (NULL, 'V', 'EF', 52,'B20',4,'R11','2022-07-25',51,NULL )
, (NULL, 'V', 'EF', 53,'B20',1,'R11','2023-11-17',52,NULL )
, (NULL, 'V', 'EF', 54,'B20',4,'R11','2024-05-13',53,NULL )
, (NULL, 'V', 'EF', 55,'B20',1,'R11','2022-10-25',54,NULL )
, (NULL, 'V', 'EF', 56,'B20',3,'R01','2024-07-12',55,NULL )
, (NULL, 'V', 'TR', 57,'B20',4,'R01','2023-12-16',56,NULL )
, (NULL, 'V', 'EF', 58,'B20',2,'R01','2022-12-20',57,NULL )
, (NULL, 'V', 'EF', 59,'B20',4,'R01','2024-06-23',58,NULL )
, (NULL, 'V', 'EF', 60,'B20',1,'R01','2023-06-19',59,NULL )
, (NULL, 'V', 'EF', 61,'B20',2,'R01','2024-05-22',60,NULL )
, (NULL, 'V', 'EF', 62,'B20',3,'R01','2024-07-22',61,NULL )
, (NULL, 'V', 'EF', 63,'B20',3,'R01','2022-02-20',62,NULL )
, (NULL, 'V', 'EF', 64,'B20',2,'R01','2022-06-02',63,NULL )
, (NULL, 'V', 'EF', 65,'B20',3,'R01','2023-05-14',64,NULL )
, (NULL, 'V', 'EF', 66,'B20',1,'R01','2023-03-04',65,NULL )
, (NULL, 'V', 'EF', 67,'B20',3,'R01','2022-04-19',66,NULL )
, (NULL, 'V', 'EF', 68,'B20',1,'R01','2022-03-22',67,NULL )
, (NULL, 'V', 'EF', 69,'B20',1,'R01','2023-02-16',68,NULL )
, (NULL, 'V', 'EF', 70,'B20',2,'R01','2023-08-09',69,NULL )
, (NULL, 'V', 'EF', 71,'B20',2,'R01','2024-02-04',70,NULL )
, (NULL, 'V', 'EF', 72,'B20',4,'R01','2024-04-30',71,NULL )
, (NULL, 'V', 'EF', 73,'B20',1,'R01','2024-05-03',72,NULL )
, (NULL, 'V', 'TR', 74,'B20',2,'R01','2022-10-26',73,NULL )
, (NULL, 'V', 'EF', 75,'B20',2,'R01','2023-10-17',74,NULL )
, (NULL, 'V', 'EF', 76,'B20',1,'R01','2023-08-13',75,NULL )
, (NULL, 'V', 'EF', 77,'B20',3,'R01','2022-07-24',76,NULL )
, (NULL, 'V', 'EF', 78,'B20',1,'R01','2023-08-25',77,NULL )
, (NULL, 'V', 'EF', 79,'B20',1,'R02','2023-01-30',78,NULL )
, (NULL, 'V', 'EF', 80,'B20',2,'R02','2024-05-06',79,NULL )
, (NULL, 'V', 'EF', 81,'B20',1,'R02','2023-11-12',80,NULL )
, (NULL, 'V', 'EF', 82,'B20',2,'R02','2022-11-02',81,NULL )
, (NULL, 'V', 'EF', 83,'B20',3,'R02','2022-07-24',82,NULL )
, (NULL, 'V', 'EF', 84,'B20',1,'R02','2023-02-26',83,NULL )
, (NULL, 'V', 'EF', 85,'B20',1,'R02','2023-04-19',84,NULL )
, (NULL, 'V', 'EF', 86,'B20',1,'R02','2024-06-04',85,NULL )
, (NULL, 'V', 'EF', 87,'B20',3,'R02','2024-06-19',86,NULL )
, (NULL, 'V', 'EF', 88,'B20',3,'R02','2022-03-17',87,NULL )
, (NULL, 'V', 'EF', 89,'B20',3,'R02','2024-05-25',88,NULL )
, (NULL, 'V', 'EF', 90,'B20',2,'R02','2024-06-19',89,NULL )
, (NULL, 'V', 'TR', 91,'B20',2,'R02','2023-06-10',90,NULL )
, (NULL, 'V', 'EF', 92,'B20',4,'R02','2023-05-19',91,NULL )
, (NULL, 'V', 'EF', 93,'B20',4,'R02','2024-04-22',92,NULL )
, (NULL, 'V', 'EF', 94,'B20',4,'R02','2024-07-08',93,NULL )
, (NULL, 'V', 'EF', 95,'B20',2,'R11','2022-02-09',94,NULL )
, (NULL, 'V', 'EF', 96,'B20',4,'R11','2023-03-04',95,NULL )
, (NULL, 'V', 'EF', 97,'B20',4,'R11','2023-10-06',96,NULL )
, (NULL, 'V', 'EF', 98,'B20',2,'R11','2022-06-15',97,NULL )
, (NULL, 'V', 'EF', 99,'B20',2,'R11','2024-03-05',98,NULL )
, (NULL, 'V', 'EF', 100,'B20',2,'R11','2023-02-24',99,NULL )
, (NULL, 'V', 'EF', 101,'B20',1,'R11','2023-11-28',100,NULL )
, (NULL, 'V', 'EF', 103,'B20',3,'R11','2023-06-06',101,NULL )
, (NULL, 'V', 'EF', 104,'B20',3,'R11','2024-02-02',102,NULL )
, (NULL, 'V', 'EF', 105,'B20',3,'R11','2022-07-03',103,NULL )
, (NULL, 'V', 'EF', 106,'B20',1,'R11','2022-10-12',104,NULL )
, (NULL, 'V', 'EF', 107,'B20',1,'R11','2023-07-30',105,NULL )
, (NULL, 'V', 'EF', 108,'B20',2,'R11','2023-05-16',106,NULL )
, (NULL, 'V', 'TR', 109,'B20',4,'R11','2024-02-23',107,NULL )
, (NULL, 'V', 'EF', 110,'B20',1,'R11','2023-03-25',108,NULL )
, (NULL, 'V', 'EF', 111,'B20',2,'R11','2022-03-09',109,NULL )
, (NULL, 'V', 'EF', 112,'B20',3,'R11','2022-11-17',110,NULL )
, (NULL, 'V', 'EF', 113,'B20',1,'R11','2022-06-16',111,NULL )
, (NULL, 'V', 'EF', 114,'B20',2,'R11','2023-04-17',112,NULL )
, (NULL, 'V', 'EF', 115,'B20',1,'R11','2022-07-08',113,NULL )
, (NULL, 'V', 'EF', 116,'B20',2,'R01','2022-03-15',114,NULL )
, (NULL, 'V', 'EF', 117,'B20',1,'R01','2022-04-16',115,NULL )
, (NULL, 'V', 'EF', 118,'B20',2,'R01','2024-06-14',116,NULL )
, (NULL, 'V', 'EF', 119,'B20',2,'R01','2022-10-20',117,NULL )
, (NULL, 'V', 'EF', 120,'B20',2,'R01','2022-04-05',118,NULL )
, (NULL, 'V', 'EF', 121,'B20',3,'R01','2022-08-14',119,NULL )
, (NULL, 'V', 'EF', 122,'B20',2,'R01','2024-06-21',120,NULL )
, (NULL, 'V', 'EF', 123,'B20',2,'R01','2023-12-21',121,NULL )
, (NULL, 'V', 'EF', 124,'B20',4,'R01','2022-06-26',122,NULL )
, (NULL, 'V', 'EF', 125,'B20',1,'R01','2024-03-28',123,NULL )
, (NULL, 'V', 'TR', 126,'B20',4,'R01','2022-01-17',124,NULL )
, (NULL, 'V', 'EF', 127,'B20',4,'R01','2024-03-23',125,NULL )
, (NULL, 'V', 'EF', 128,'B20',1,'R01','2022-05-15',126,NULL )
, (NULL, 'V', 'EF', 129,'B20',1,'R01','2023-10-08',127,NULL )
, (NULL, 'V', 'EF', 130,'B20',2,'R01','2022-09-02',128,NULL )
, (NULL, 'V', 'EF', 131,'B20',1,'R01','2022-12-09',129,NULL )
, (NULL, 'V', 'EF', 132,'B20',3,'R01','2023-03-06',130,NULL )
, (NULL, 'V', 'EF', 133,'B20',2,'R01','2023-03-01',131,NULL )
, (NULL, 'V', 'EF', 134,'B20',1,'R01','2024-06-09',132,NULL )
, (NULL, 'V', 'EF', 135,'B20',1,'R01','2023-11-17',133,NULL )
, (NULL, 'V', 'EF', 136,'B20',2,'R01','2022-09-22',134,NULL )
, (NULL, 'V', 'EF', 137,'B20',4,'R01','2022-03-19',135,NULL )
, (NULL, 'V', 'EF', 138,'B20',2,'R02','2023-10-29',136,NULL )
, (NULL, 'V', 'EF', 139,'B20',4,'R02','2023-01-10',137,NULL )
, (NULL, 'V', 'EF', 140,'B20',2,'R02','2022-01-29',138,NULL )
, (NULL, 'V', 'EF', 141,'B20',2,'R02','2023-03-29',139,NULL )
, (NULL, 'V', 'EF', 142,'B20',3,'R02','2024-05-18',140,NULL )
, (NULL, 'V', 'TR', 143,'B20',1,'R02','2023-03-10',141,NULL )
, (NULL, 'V', 'EF', 144,'B20',2,'R02','2023-06-28',142,NULL )
, (NULL, 'V', 'EF', 145,'B20',4,'R02','2022-03-30',143,NULL )
, (NULL, 'V', 'EF', 146,'B20',2,'R02','2023-12-02',144,NULL )
, (NULL, 'V', 'EF', 147,'B20',4,'R02','2023-08-21',145,NULL )
, (NULL, 'V', 'EF', 148,'B20',2,'R02','2022-01-27',146,NULL )
, (NULL, 'V', 'EF', 149,'B20',3,'R02','2024-06-07',147,NULL )
, (NULL, 'V', 'EF', 150,'B20',2,'R02','2023-11-04',148,NULL )
, (NULL, 'V', 'EF', 151,'B20',1,'R02','2022-07-15',149,NULL )
, (NULL, 'V', 'EF', 152,'B20',4,'R02','2023-08-24',150,NULL )
, (NULL, 'V', 'EF', 153,'B20',3,'R02','2024-06-07',151,NULL )
, (NULL, 'V', 'EF', 154,'B20',4,'R02','2024-02-29',152,NULL )
, (NULL, 'V', 'EF', 155,'B20',3,'R11','2023-06-08',153,NULL )
, (NULL, 'V', 'EF', 156,'B20',4,'R11','2023-11-26',154,NULL )
, (NULL, 'V', 'EF', 157,'B20',2,'R11','2022-05-29',155,NULL )
, (NULL, 'V', 'EF', 158,'B20',1,'R11','2022-08-18',156,NULL )
, (NULL, 'V', 'EF', 159,'B20',3,'R11','2022-01-19',157,NULL )
, (NULL, 'V', 'TR', 160,'B20',3,'R11','2022-09-04',158,NULL )
, (NULL, 'V', 'EF', 161,'B20',3,'R11','2023-11-08',159,NULL )
, (NULL, 'V', 'EF', 162,'B20',3,'R11','2022-12-09',160,NULL )
, (NULL, 'V', 'EF', 163,'B20',1,'R11','2022-04-05',161,NULL )
, (NULL, 'V', 'EF', 164,'B20',3,'R11','2024-01-20',162,NULL )
, (NULL, 'V', 'EF', 165,'B20',2,'R11','2024-06-03',163,NULL )
, (NULL, 'V', 'EF', 166,'B20',2,'R11','2022-04-12',164,NULL )
, (NULL, 'V', 'EF', 167,'B20',3,'R11','2024-04-08',165,NULL )
, (NULL, 'V', 'EF', 168,'B20',1,'R11','2022-01-29',166,NULL )
, (NULL, 'V', 'EF', 169,'B20',3,'R11','2023-08-30',167,NULL )
, (NULL, 'V', 'EF', 170,'B20',1,'R11','2022-10-27',168,NULL )
, (NULL, 'V', 'EF', 171,'B20',1,'R11','2022-01-18',169,NULL )
, (NULL, 'V', 'EF', 172,'B20',3,'R11','2022-08-25',170,NULL )
, (NULL, 'V', 'EF', 173,'B20',4,'R11','2023-02-22',171,NULL )
, (NULL, 'V', 'EF', 174,'B20',3,'R11','2023-01-10',172,NULL )
, (NULL, 'V', 'EF', 175,'B20',3,'R01','2023-01-28',173,NULL )
, (NULL, 'V', 'EF', 176,'B20',1,'R01','2023-04-08',174,NULL )
, (NULL, 'V', 'TR', 177,'B20',1,'R01','2022-12-24',175,NULL )
, (NULL, 'V', 'EF', 178,'B20',2,'R01','2023-04-29',176,NULL )
, (NULL, 'V', 'EF', 179,'B20',1,'R01','2022-11-02',177,NULL )
, (NULL, 'V', 'EF', 180,'B20',3,'R01','2023-05-09',178,NULL )
, (NULL, 'V', 'EF', 181,'B20',3,'R01','2023-10-10',179,NULL )
, (NULL, 'V', 'EF', 182,'B20',1,'R01','2024-04-13',180,NULL )
, (NULL, 'V', 'EF', 183,'B20',2,'R01','2023-07-24',181,NULL )
, (NULL, 'V', 'EF', 184,'B20',1,'R01','2023-01-08',182,NULL )
, (NULL, 'V', 'EF', 185,'B20',2,'R01','2024-01-04',183,NULL )
, (NULL, 'V', 'EF', 186,'B20',2,'R01','2024-04-19',184,NULL )
, (NULL, 'V', 'EF', 187,'B20',1,'R01','2022-02-17',185,NULL )
, (NULL, 'V', 'EF', 188,'B20',4,'R01','2024-04-13',186,NULL )
, (NULL, 'V', 'EF', 189,'B20',2,'R01','2022-05-02',187,NULL )
, (NULL, 'V', 'EF', 191,'B20',2,'R01','2023-10-11',188,NULL )
, (NULL, 'V', 'EF', 192,'B20',3,'R01','2023-06-07',189,NULL )
, (NULL, 'V', 'EF', 193,'B20',2,'R01','2023-03-05',190,NULL )
, (NULL, 'V', 'EF', 194,'B20',3,'R01','2022-07-02',191,NULL )
, (NULL, 'V', 'TR', 195,'B20',3,'R01','2022-12-20',192,NULL )
, (NULL, 'V', 'EF', 196,'B20',1,'R01','2024-03-10',193,NULL )
, (NULL, 'V', 'EF', 197,'B20',4,'R01','2023-03-26',194,NULL )
, (NULL, 'V', 'EF', 198,'B20',1,'R02','2022-09-14',195,NULL )
, (NULL, 'V', 'EF', 199,'B20',2,'R02','2024-04-17',196,NULL )
, (NULL, 'V', 'EF', 200,'B20',2,'R02','2024-01-31',197,NULL )
, (NULL, 'V', 'EF', 201,'B20',1,'R02','2024-04-12',198,NULL )
, (NULL, 'V', 'EF', 202,'B20',1,'R02','2022-08-04',199,NULL )
, (NULL, 'V', 'EF', 203,'B20',4,'R02','2022-06-28',200,NULL )
, (NULL, 'V', 'EF', 204,'B20',2,'R02','2023-02-24',201,NULL )
, (NULL, 'V', 'EF', 205,'B20',3,'R02','2024-03-20',202,NULL )
, (NULL, 'V', 'EF', 206,'B20',4,'R02','2022-12-22',203,NULL )
, (NULL, 'V', 'EF', 207,'B20',3,'R02','2023-11-16',204,NULL )
, (NULL, 'V', 'EF', 208,'B20',1,'R02','2024-03-14',205,NULL )
, (NULL, 'V', 'EF', 209,'B20',3,'R02','2022-05-12',206,NULL )
, (NULL, 'V', 'EF', 210,'B20',4,'R02','2022-03-24',207,NULL )
, (NULL, 'V', 'EF', 211,'B20',4,'R02','2022-03-16',208,NULL )
, (NULL, 'V', 'TR', 212,'B20',4,'R02','2024-03-03',209,NULL )
, (NULL, 'V', 'EF', 213,'B20',4,'R02','2022-07-10',210,NULL )
, (NULL, 'V', 'EF', 214,'B20',2,'R02','2022-04-01',211,NULL )
, (NULL, 'V', 'EF', 215,'B20',3,'R02','2022-03-23',212,NULL )
, (NULL, 'V', 'EF', 216,'B20',2,'R02','2024-02-14',213,NULL )
, (NULL, 'V', 'EF', 217,'B20',4,'R02','2022-09-16',214,NULL )
, (NULL, 'V', 'EF', 218,'B20',2,'R02','2024-07-05',215,NULL )
, (NULL, 'V', 'EF', 219,'B20',1,'R02','2024-01-16',216,NULL )
, (NULL, 'V', 'EF', 220,'B20',2,'R02','2024-02-22',217,NULL )
, (NULL, 'V', 'EF', 221,'B20',4,'R02','2022-05-24',218,NULL )
, (NULL, 'V', 'EF', 222,'B20',4,'R11','2023-06-16',219,NULL )
, (NULL, 'V', 'EF', 223,'B20',4,'R11','2023-08-26',220,NULL )
, (NULL, 'V', 'EF', 224,'B20',2,'R11','2022-10-22',221,NULL )
, (NULL, 'V', 'EF', 226,'B20',4,'R11','2023-03-19',222,NULL )
, (NULL, 'V', 'EF', 227,'B20',1,'R11','2022-10-31',223,NULL )
, (NULL, 'V', 'EF', 228,'B20',3,'R11','2024-02-24',224,NULL )
, (NULL, 'V', 'EF', 229,'B20',3,'R11','2024-02-01',225,NULL )
, (NULL, 'V', 'TR', 230,'B20',1,'R11','2023-08-31',226,NULL )
, (NULL, 'V', 'EF', 231,'B20',4,'R11','2023-02-28',227,NULL )
, (NULL, 'V', 'EF', 232,'B20',4,'R11','2022-12-31',228,NULL )
, (NULL, 'V', 'EF', 233,'B20',2,'R11','2022-03-28',229,NULL )
, (NULL, 'V', 'EF', 234,'B20',1,'R11','2022-03-07',230,NULL )
, (NULL, 'V', 'EF', 235,'B20',1,'R11','2022-10-02',231,NULL )
, (NULL, 'V', 'EF', 236,'B20',3,'R11','2022-04-12',232,NULL )
, (NULL, 'V', 'EF', 237,'B20',2,'R11','2022-09-03',233,NULL )
, (NULL, 'V', 'EF', 238,'B20',2,'R11','2023-02-03',234,NULL )
, (NULL, 'V', 'EF', 239,'B20',3,'R11','2023-01-12',235,NULL )
, (NULL, 'V', 'EF', 240,'B20',2,'R11','2022-03-14',236,NULL )
, (NULL, 'V', 'EF', 241,'B20',3,'R11','2022-08-18',237,NULL )
, (NULL, 'V', 'EF', 242,'B20',2,'R11','2024-03-04',238,NULL )
, (NULL, 'V', 'EF', 243,'B20',1,'R01','2022-12-25',239,NULL )
, (NULL, 'V', 'EF', 244,'B20',3,'R01','2022-09-29',240,NULL )
, (NULL, 'V', 'EF', 245,'B20',4,'R01','2022-03-15',241,NULL )
, (NULL, 'V', 'EF', 246,'B20',2,'R01','2022-07-10',242,NULL )
, (NULL, 'V', 'TR', 247,'B20',2,'R01','2022-05-22',243,NULL )
, (NULL, 'V', 'EF', 248,'B20',2,'R01','2022-09-01',244,NULL )
, (NULL, 'V', 'EF', 249,'B20',1,'R01','2023-06-24',245,NULL )
, (NULL, 'V', 'EF', 250,'B20',3,'R01','2023-09-05',246,NULL )
, (NULL, 'V', 'EF', 251,'B20',2,'R01','2023-10-12',247,NULL )
, (NULL, 'V', 'EF', 252,'B20',3,'R01','2022-06-10',248,NULL )
, (NULL, 'V', 'EF', 253,'B20',3,'R01','2022-03-25',249,NULL )
, (NULL, 'V', 'EF', 254,'B20',4,'R01','2023-08-03',250,NULL )
, (NULL, 'V', 'EF', 255,'B20',3,'R01','2023-11-30',251,NULL )
, (NULL, 'V', 'EF', 256,'B20',3,'R01','2024-06-19',252,NULL )
, (NULL, 'V', 'EF', 257,'B20',3,'R01','2022-03-21',253,NULL )
, (NULL, 'V', 'EF', 258,'B20',2,'R01','2023-01-02',254,NULL )
, (NULL, 'V', 'EF', 259,'B20',1,'R01','2023-05-31',255,NULL )
, (NULL, 'V', 'EF', 260,'B20',1,'R01','2024-03-06',256,NULL )
, (NULL, 'V', 'EF', 261,'B20',4,'R01','2023-07-21',257,NULL )
, (NULL, 'V', 'EF', 262,'B20',2,'R01','2024-03-02',258,NULL )
, (NULL, 'V', 'EF', 263,'B20',4,'R01','2024-02-24',259,NULL )
, (NULL, 'V', 'TR', 264,'B20',4,'R01','2023-11-15',260,NULL )
, (NULL, 'V', 'EF', 265,'B20',4,'R01','2023-12-04',261,NULL )
, (NULL, 'V', 'EF', 267,'B20',3,'R01','2022-06-01',262,NULL )
, (NULL, 'V', 'EF', 268,'B20',1,'R01','2022-03-15',263,NULL )
, (NULL, 'V', 'EF', 269,'B20',1,'R01','2022-02-11',264,NULL )
, (NULL, 'V', 'EF', 270,'B20',4,'R01','2022-05-13',265,NULL )
, (NULL, 'V', 'EF', 271,'B20',2,'R01','2022-07-16',266,NULL )
, (NULL, 'V', 'EF', 272,'B20',2,'R01','2023-10-16',267,NULL )
, (NULL, 'V', 'EF', 273,'B20',2,'R01','2022-06-25',268,NULL )
, (NULL, 'V', 'EF', 274,'B20',3,'R01','2022-04-11',269,NULL )
, (NULL, 'V', 'EF', 275,'B20',2,'R01','2024-01-10',270,NULL )
, (NULL, 'V', 'EF', 276,'B20',3,'R01','2022-05-20',271,NULL )
, (NULL, 'V', 'EF', 277,'B20',1,'R01','2022-06-12',272,NULL )
, (NULL, 'V', 'EF', 278,'B20',2,'R01','2022-08-21',273,NULL )
, (NULL, 'V', 'EF', 279,'B20',1,'R01','2024-02-01',274,NULL )
, (NULL, 'V', 'EF', 280,'B20',4,'R01','2022-02-15',275,NULL )
, (NULL, 'V', 'EF', 281,'B20',4,'R01','2022-05-02',276,NULL )
, (NULL, 'V', 'TR', 282,'B20',1,'R01','2022-11-11',277,NULL )
, (NULL, 'V', 'EF', 283,'B20',2,'R01','2023-03-20',278,NULL )
, (NULL, 'V', 'EF', 284,'B20',4,'R01','2022-05-26',279,NULL )
, (NULL, 'V', 'EF', 285,'B20',4,'R01','2024-01-22',280,NULL )
, (NULL, 'V', 'EF', 286,'B20',1,'R01','2023-07-04',281,NULL )
, (NULL, 'V', 'EF', 287,'B20',2,'R01','2022-03-02',282,NULL )
, (NULL, 'V', 'EF', 288,'B20',3,'R01','2022-04-24',283,NULL )
, (NULL, 'V', 'EF', 289,'B20',3,'R01','2024-01-21',284,NULL )
, (NULL, 'V', 'EF', 290,'B20',2,'R01','2022-07-04',285,NULL )
, (NULL, 'V', 'EF', 291,'B20',4,'R01','2023-11-05',286,NULL )
, (NULL, 'V', 'EF', 292,'B20',2,'R01','2024-05-17',287,NULL )
, (NULL, 'V', 'EF', 293,'B20',3,'R01','2024-01-03',288,NULL )
, (NULL, 'V', 'EF', 294,'B20',4,'R01','2022-04-16',289,NULL )
, (NULL, 'V', 'EF', 295,'B20',4,'R01','2023-01-28',290,NULL )
, (NULL, 'V', 'EF', 296,'B20',4,'R01','2022-09-01',291,NULL )
, (NULL, 'V', 'EF', 297,'B20',2,'R01','2023-05-22',292,NULL )
, (NULL, 'V', 'EF', 298,'B20',3,'R01','2023-11-16',293,NULL )
, (NULL, 'V', 'TR', 299,'B20',2,'R01','2022-05-12',294,NULL )
, (NULL, 'V', 'EF', 300,'B20',2,'R01','2022-10-01',295,NULL )
, (NULL, 'V', 'EF', 301,'B20',4,'R01','2024-07-14',296,NULL )
, (NULL, 'V', 'EF', 302,'B20',3,'R02','2023-05-30',297,NULL )
, (NULL, 'V', 'EF', 303,'B20',1,'R02','2023-07-12',298,NULL )
, (NULL, 'V', 'EF', 304,'B20',2,'R02','2023-04-20',299,NULL )
, (NULL, 'V', 'EF', 305,'B20',1,'R02','2022-09-29',300,NULL )
, (NULL, 'V', 'EF', 306,'B20',2,'R02','2023-08-29',301,NULL )
, (NULL, 'V', 'EF', 307,'B20',3,'R02','2022-07-28',302,NULL )
, (NULL, 'V', 'EF', 308,'B20',2,'R02','2023-01-20',303,NULL )
, (NULL, 'V', 'EF', 309,'B20',1,'R02','2023-10-24',304,NULL )
, (NULL, 'V', 'EF', 310,'B20',3,'R02','2023-02-15',305,NULL )
, (NULL, 'V', 'EF', 311,'B20',1,'R02','2022-02-22',306,NULL )
, (NULL, 'V', 'EF', 312,'B20',1,'R02','2023-05-11',307,NULL )
, (NULL, 'V', 'EF', 313,'B20',2,'R02','2022-04-16',308,NULL )
, (NULL, 'V', 'EF', 315,'B20',3,'R02','2024-06-14',309,NULL )
, (NULL, 'V', 'EF', 316,'B20',2,'R02','2022-06-20',310,NULL )
, (NULL, 'V', 'TR', 317,'B20',4,'R02','2023-06-05',311,NULL )
, (NULL, 'V', 'EF', 318,'B20',4,'R02','2023-01-16',312,NULL )
, (NULL, 'V', 'EF', 319,'B20',4,'R02','2024-03-12',313,NULL )
, (NULL, 'V', 'EF', 320,'B20',1,'R02','2022-09-02',314,NULL )
, (NULL, 'V', 'EF', 321,'B20',2,'R02','2022-05-07',315,NULL )
, (NULL, 'V', 'EF', 322,'B20',2,'R02','2022-06-13',316,NULL )
, (NULL, 'V', 'EF', 323,'B20',2,'R02','2022-08-29',317,NULL )
, (NULL, 'V', 'EF', 324,'B20',3,'R02','2022-08-31',318,NULL )
, (NULL, 'V', 'EF', 325,'B20',4,'R02','2022-09-25',319,NULL )
, (NULL, 'V', 'EF', 326,'B20',4,'R11','2022-05-27',320,NULL )
, (NULL, 'V', 'EF', 327,'B20',2,'R11','2023-03-22',321,NULL )
, (NULL, 'V', 'EF', 328,'B20',4,'R11','2024-01-24',322,NULL )
, (NULL, 'V', 'EF', 329,'B20',1,'R11','2023-10-18',323,NULL )
, (NULL, 'V', 'EF', 330,'B20',1,'R11','2022-09-23',324,NULL )
, (NULL, 'V', 'EF', 331,'B20',2,'R11','2024-01-04',325,NULL )
, (NULL, 'V', 'EF', 332,'B20',3,'R11','2024-02-26',326,NULL )
, (NULL, 'V', 'EF', 333,'B20',2,'R11','2023-08-30',327,NULL )
, (NULL, 'V', 'TR', 334,'B20',2,'R11','2022-02-09',328,NULL )
, (NULL, 'V', 'EF', 335,'B20',4,'R11','2022-09-18',329,NULL )
, (NULL, 'V', 'EF', 336,'B20',1,'R11','2022-09-11',330,NULL )
, (NULL, 'V', 'EF', 337,'B20',1,'R11','2023-05-27',331,NULL )
, (NULL, 'V', 'EF', 338,'B20',2,'R11','2024-01-02',332,NULL )
, (NULL, 'V', 'EF', 339,'B20',4,'R11','2023-12-01',333,NULL )
, (NULL, 'V', 'TR', 340,'B20',2,'R11','2022-08-26',334,NULL )
, (NULL, 'V', 'TR', 341,'B20',3,'R11','2022-12-30',335,NULL )
, (NULL, 'V', 'TR', 342,'B20',3,'R11','2024-03-26',336,NULL )
, (NULL, 'V', 'TR', 343,'B20',3,'R11','2023-07-24',337,NULL )
, (NULL, 'V', 'EF', 344,'B20',3,'R11','2024-01-22',338,NULL )
, (NULL, 'V', 'TR', 345,'B20',2,'R11','2023-02-25',339,NULL )
, (NULL, 'V', 'TR', 346,'B20',1,'R11','2022-08-05',340,NULL )
, (NULL, 'V', 'EF', 347,'B20',4,'R11','2023-03-01',341,NULL )
, (NULL, 'V', 'EF', 1,'B20',2,'R01','2022-03-10',342,NULL )
, (NULL, 'V', 'EF', 2,'B20',1,'R01','2022-02-25',343,NULL )
, (NULL, 'V', 'EF', 3,'B20',4,'R01','2022-03-26',344,NULL )
, (NULL, 'V', 'EF', 4,'B20',4,'R01','2022-07-09',345,NULL )
, (NULL, 'V', 'TR', 5,'B20',2,'R01','2022-08-03',346,NULL )
, (NULL, 'V', 'EF', 6,'B20',3,'R01','2023-01-29',347,NULL )
, (NULL, 'V', 'EF', 7,'B20',2,'R01','2024-02-10',348,NULL )
, (NULL, 'V', 'EF', 8,'B20',2,'R01','2024-05-19',349,NULL )
, (NULL, 'V', 'EF', 9,'B20',2,'R01','2022-03-19',350,NULL )
, (NULL, 'V', 'EF', 10,'B20',4,'R01','2023-12-22',351,NULL )
, (NULL, 'V', 'EF', 11,'B20',2,'R01','2022-10-18',352,NULL )
, (NULL, 'V', 'EF', 12,'B20',4,'R01','2023-06-24',353,NULL )
, (NULL, 'V', 'EF', 13,'B20',4,'R01','2024-03-12',354,NULL )
, (NULL, 'V', 'EF', 15,'B20',2,'R01','2022-04-03',355,NULL )
, (NULL, 'V', 'EF', 16,'B20',1,'R01','2022-10-26',356,NULL )
, (NULL, 'V', 'EF', 17,'B20',3,'R01','2022-02-01',357,NULL )
, (NULL, 'V', 'EF', 18,'B20',3,'R01','2022-06-24',358,NULL )
, (NULL, 'V', 'EF', 19,'B20',2,'R01','2022-07-17',359,NULL )
, (NULL, 'V', 'EF', 20,'B20',2,'R01','2022-01-22',360,NULL )
, (NULL, 'V', 'EF', 21,'B20',3,'R01','2024-07-03',361,NULL )
, (NULL, 'V', 'EF', 22,'B20',3,'R01','2023-03-25',362,NULL )
, (NULL, 'V', 'TR', 23,'B20',3,'R01','2022-12-31',363,NULL )
, (NULL, 'V', 'EF', 24,'B20',1,'R02','2022-02-02',364,NULL )
, (NULL, 'V', 'EF', 25,'B20',3,'R02','2023-07-22',365,NULL )
, (NULL, 'V', 'EF', 26,'B20',4,'R02','2023-09-06',366,NULL )
, (NULL, 'V', 'EF', 27,'B20',1,'R02','2022-10-10',367,NULL )
, (NULL, 'V', 'EF', 28,'B20',1,'R02','2023-12-29',368,NULL )
, (NULL, 'V', 'EF', 29,'B20',3,'R02','2024-04-15',369,NULL )
, (NULL, 'V', 'EF', 30,'B20',3,'R02','2022-01-25',370,NULL )
, (NULL, 'V', 'EF', 31,'B20',3,'R02','2022-02-26',371,NULL )
, (NULL, 'V', 'EF', 32,'B20',4,'R02','2024-06-19',372,NULL )
, (NULL, 'V', 'EF', 33,'B20',3,'R02','2023-12-25',373,NULL )
, (NULL, 'V', 'EF', 34,'B20',3,'R02','2024-04-27',374,NULL )
, (NULL, 'V', 'EF', 35,'B20',4,'R11','2022-03-24',375,NULL )
, (NULL, 'V', 'EF', 36,'B20',1,'R11','2022-08-09',376,NULL )
, (NULL, 'V', 'EF', 37,'B20',1,'R11','2023-04-27',377,NULL )
, (NULL, 'V', 'EF', 38,'B20',3,'R11','2022-10-31',378,NULL )
, (NULL, 'V', 'EF', 39,'B20',4,'R11','2022-06-11',379,NULL )
, (NULL, 'V', 'TR', 40,'B20',3,'R11','2022-09-17',380,NULL )
, (NULL, 'V', 'EF', 41,'B20',2,'R11','2023-01-22',381,NULL )
, (NULL, 'V', 'EF', 42,'B20',3,'R11','2024-04-30',382,NULL )
, (NULL, 'V', 'EF', 43,'B20',2,'R11','2024-05-28',383,NULL )
, (NULL, 'V', 'EF', 44,'B20',4,'R11','2024-07-11',384,NULL )
, (NULL, 'V', 'EF', 45,'B20',1,'R11','2023-01-03',385,NULL )
, (NULL, 'V', 'EF', 46,'B20',3,'R11','2023-01-14',386,NULL )
, (NULL, 'V', 'EF', 47,'B20',3,'R11','2024-04-24',387,NULL )
, (NULL, 'V', 'EF', 48,'B20',4,'R11','2022-02-10',388,NULL )
, (NULL, 'V', 'EF', 49,'B20',3,'R11','2023-06-11',389,NULL )
, (NULL, 'V', 'EF', 50,'B20',2,'R11','2023-04-12',390,NULL )
, (NULL, 'V', 'EF', 51,'B20',4,'R11','2024-04-23',391,NULL )
, (NULL, 'V', 'EF', 52,'B20',3,'R11','2022-08-25',392,NULL )
, (NULL, 'V', 'EF', 53,'B20',4,'R11','2024-05-11',393,NULL )
, (NULL, 'V', 'EF', 54,'B20',1,'R11','2022-08-01',394,NULL )
, (NULL, 'V', 'EF', 55,'B20',1,'R11','2023-07-27',395,NULL )
, (NULL, 'V', 'EF', 56,'B20',1,'R01','2024-04-24',396,NULL )
, (NULL, 'V', 'TR', 57,'B20',4,'R01','2023-06-20',397,NULL )
, (NULL, 'V', 'EF', 58,'B20',3,'R01','2023-01-15',398,NULL )
, (NULL, 'V', 'EF', 59,'B20',2,'R01','2024-04-18',399,NULL )
, (NULL, 'V', 'EF', 60,'B20',4,'R01','2024-07-20',400,NULL )
, (NULL, 'V', 'EF', 61,'B20',1,'R01','2022-01-10',401,NULL )
, (NULL, 'V', 'EF', 62,'B20',3,'R01','2023-11-04',402,NULL )
, (NULL, 'V', 'EF', 63,'B20',4,'R01','2022-07-12',403,NULL )
, (NULL, 'V', 'EF', 64,'B20',3,'R01','2024-03-18',404,NULL )
, (NULL, 'V', 'EF', 65,'B20',3,'R01','2024-01-31',405,NULL )
, (NULL, 'V', 'EF', 66,'B20',4,'R01','2022-03-03',406,NULL )
, (NULL, 'V', 'EF', 67,'B20',4,'R01','2022-03-28',407,NULL )
, (NULL, 'V', 'EF', 68,'B20',1,'R01','2022-07-30',408,NULL )
, (NULL, 'V', 'EF', 69,'B20',2,'R01','2023-12-14',409,NULL )
, (NULL, 'V', 'EF', 70,'B20',2,'R01','2023-12-07',410,NULL )
, (NULL, 'V', 'EF', 71,'B20',4,'R01','2022-10-06',411,NULL )
, (NULL, 'V', 'EF', 72,'B20',2,'R01','2024-02-26',412,NULL )
, (NULL, 'V', 'EF', 73,'B20',4,'R01','2022-07-09',413,NULL )
, (NULL, 'V', 'TR', 74,'B20',2,'R01','2023-11-02',414,NULL )
, (NULL, 'V', 'EF', 75,'B20',1,'R01','2023-08-10',415,NULL )
, (NULL, 'V', 'EF', 76,'B20',3,'R01','2022-09-20',416,NULL )
, (NULL, 'V', 'EF', 77,'B20',4,'R01','2022-05-20',417,NULL )
, (NULL, 'V', 'EF', 78,'B20',3,'R01','2024-06-05',418,NULL )
, (NULL, 'V', 'EF', 79,'B20',2,'R02','2023-09-07',419,NULL )
, (NULL, 'V', 'EF', 80,'B20',4,'R02','2024-04-18',420,NULL )
, (NULL, 'V', 'EF', 81,'B20',4,'R02','2023-11-21',421,NULL )
, (NULL, 'V', 'EF', 82,'B20',3,'R02','2022-04-25',422,NULL )
, (NULL, 'V', 'EF', 83,'B20',2,'R02','2022-09-02',423,NULL )
, (NULL, 'V', 'EF', 84,'B20',4,'R02','2022-07-24',424,NULL )
, (NULL, 'V', 'EF', 85,'B20',4,'R02','2023-01-07',425,NULL )
, (NULL, 'V', 'EF', 86,'B20',1,'R02','2022-03-04',426,NULL )
, (NULL, 'V', 'EF', 87,'B20',2,'R02','2022-04-23',427,NULL )
, (NULL, 'V', 'EF', 88,'B20',1,'R02','2024-03-24',428,NULL )
, (NULL, 'V', 'EF', 89,'B20',4,'R02','2022-12-17',429,NULL )
, (NULL, 'V', 'EF', 90,'B20',4,'R02','2023-04-22',430,NULL )
, (NULL, 'V', 'TR', 91,'B20',1,'R02','2023-10-16',431,NULL )
, (NULL, 'V', 'EF', 92,'B20',2,'R02','2024-01-14',432,NULL )
, (NULL, 'V', 'EF', 93,'B20',1,'R02','2023-05-30',433,NULL )
, (NULL, 'V', 'EF', 94,'B20',4,'R02','2023-12-12',434,NULL )
, (NULL, 'V', 'EF', 95,'B20',4,'R11','2023-05-10',435,NULL )
, (NULL, 'V', 'EF', 96,'B20',3,'R11','2022-11-30',436,NULL )
, (NULL, 'V', 'EF', 97,'B20',2,'R11','2023-03-21',437,NULL )
, (NULL, 'V', 'EF', 98,'B20',4,'R11','2023-01-02',438,NULL )
, (NULL, 'V', 'EF', 99,'B20',4,'R11','2022-09-02',439,NULL )
, (NULL, 'V', 'EF', 100,'B20',2,'R11','2023-07-24',440,NULL )
, (NULL, 'V', 'EF', 101,'B20',1,'R11','2023-06-12',441,NULL )
, (NULL, 'V', 'EF', 103,'B20',1,'R11','2024-04-25',442,NULL )
, (NULL, 'V', 'EF', 104,'B20',3,'R11','2022-04-03',443,NULL )
, (NULL, 'V', 'EF', 105,'B20',2,'R11','2023-11-23',444,NULL )
, (NULL, 'V', 'EF', 106,'B20',2,'R11','2024-06-26',445,NULL )
, (NULL, 'V', 'EF', 107,'B20',3,'R11','2022-10-29',446,NULL )
, (NULL, 'V', 'EF', 108,'B20',1,'R11','2024-02-23',447,NULL )
, (NULL, 'V', 'TR', 109,'B20',4,'R11','2022-03-23',448,NULL )
, (NULL, 'V', 'EF', 110,'B20',4,'R11','2022-04-15',449,NULL )
, (NULL, 'V', 'EF', 111,'B20',3,'R11','2022-04-30',450,NULL )
, (NULL, 'V', 'EF', 112,'B20',4,'R11','2024-06-26',451,NULL )
, (NULL, 'V', 'EF', 113,'B20',3,'R11','2022-10-02',452,NULL )
, (NULL, 'V', 'EF', 114,'B20',4,'R11','2023-07-26',453,NULL )
, (NULL, 'V', 'EF', 115,'B20',1,'R11','2023-09-19',454,NULL )
, (NULL, 'V', 'EF', 116,'B20',2,'R01','2022-12-14',455,NULL )
, (NULL, 'V', 'EF', 117,'B20',2,'R01','2023-02-07',456,NULL )
, (NULL, 'V', 'EF', 118,'B20',1,'R01','2023-03-16',457,NULL )
, (NULL, 'V', 'EF', 119,'B20',4,'R01','2022-02-11',458,NULL )
, (NULL, 'V', 'EF', 120,'B20',3,'R01','2024-01-31',459,NULL )
, (NULL, 'V', 'EF', 121,'B20',1,'R01','2022-10-29',460,NULL )
, (NULL, 'V', 'EF', 122,'B20',3,'R01','2023-08-08',461,NULL )
, (NULL, 'V', 'EF', 123,'B20',1,'R01','2022-05-01',462,NULL )
, (NULL, 'V', 'EF', 124,'B20',2,'R01','2022-12-04',463,NULL )
, (NULL, 'V', 'EF', 125,'B20',3,'R01','2023-02-19',464,NULL )
, (NULL, 'V', 'TR', 126,'B20',3,'R01','2024-02-22',465,NULL )
, (NULL, 'V', 'EF', 127,'B20',1,'R01','2022-06-07',466,NULL )
, (NULL, 'V', 'EF', 128,'B20',2,'R01','2022-07-26',467,NULL )
, (NULL, 'V', 'EF', 129,'B20',1,'R01','2023-03-30',468,NULL )
, (NULL, 'V', 'EF', 130,'B20',1,'R01','2024-07-12',469,NULL )
, (NULL, 'V', 'EF', 131,'B20',2,'R01','2023-11-05',470,NULL )
, (NULL, 'V', 'EF', 132,'B20',2,'R01','2023-12-18',471,NULL )
, (NULL, 'V', 'EF', 133,'B20',2,'R01','2023-10-22',472,NULL )
, (NULL, 'V', 'EF', 134,'B20',1,'R01','2022-04-13',473,NULL )
, (NULL, 'V', 'EF', 135,'B20',4,'R01','2024-07-16',474,NULL )
, (NULL, 'V', 'EF', 136,'B20',3,'R01','2022-05-06',475,NULL )
, (NULL, 'V', 'EF', 137,'B20',1,'R01','2022-11-10',476,NULL )
, (NULL, 'V', 'EF', 138,'B20',2,'R02','2022-07-19',477,NULL )
, (NULL, 'V', 'EF', 139,'B20',2,'R02','2023-04-03',478,NULL )
, (NULL, 'V', 'EF', 140,'B20',3,'R02','2023-01-17',479,NULL )
, (NULL, 'V', 'EF', 141,'B20',4,'R02','2022-12-03',480,NULL )
, (NULL, 'V', 'EF', 142,'B20',1,'R02','2024-05-19',481,NULL )
, (NULL, 'V', 'TR', 143,'B20',4,'R02','2023-05-14',482,NULL )
, (NULL, 'V', 'EF', 144,'B20',3,'R02','2024-07-18',483,NULL )
, (NULL, 'V', 'EF', 145,'B20',4,'R02','2022-10-19',484,NULL )
, (NULL, 'V', 'EF', 146,'B20',4,'R02','2023-06-18',485,NULL )
, (NULL, 'V', 'EF', 147,'B20',4,'R02','2022-11-12',486,NULL )
, (NULL, 'V', 'EF', 148,'B20',4,'R02','2024-04-09',487,NULL )
, (NULL, 'V', 'EF', 149,'B20',3,'R02','2022-05-06',488,NULL )
, (NULL, 'V', 'EF', 150,'B20',2,'R02','2022-05-14',489,NULL )
, (NULL, 'V', 'EF', 151,'B20',1,'R02','2024-02-14',490,NULL )
, (NULL, 'V', 'EF', 152,'B20',4,'R02','2023-12-17',491,NULL )
, (NULL, 'V', 'EF', 153,'B20',3,'R02','2023-01-06',492,NULL )
, (NULL, 'V', 'EF', 154,'B20',2,'R02','2023-01-13',493,NULL )
, (NULL, 'V', 'EF', 155,'B20',4,'R11','2023-07-21',494,NULL )
, (NULL, 'V', 'EF', 156,'B20',3,'R11','2023-12-12',495,NULL )
, (NULL, 'V', 'EF', 157,'B20',1,'R11','2023-03-26',496,NULL )
, (NULL, 'V', 'EF', 158,'B20',4,'R11','2023-05-21',497,NULL )
, (NULL, 'V', 'EF', 159,'B20',3,'R11','2023-01-01',498,NULL )
, (NULL, 'V', 'TR', 160,'B20',4,'R11','2024-01-06',499,NULL )
, (NULL, 'V', 'EF', 161,'B20',3,'R11','2024-07-12',500,NULL )
, (NULL, 'V', 'EF', 162,'B20',3,'R11','2024-04-22',501,NULL )
, (NULL, 'V', 'EF', 163,'B20',4,'R11','2022-03-04',502,NULL )
, (NULL, 'V', 'EF', 164,'B20',2,'R11','2023-11-27',503,NULL )
, (NULL, 'V', 'EF', 165,'B20',1,'R11','2022-07-22',504,NULL )
, (NULL, 'V', 'EF', 166,'B20',3,'R11','2024-06-18',505,NULL )
, (NULL, 'V', 'EF', 167,'B20',4,'R11','2022-11-29',506,NULL )
, (NULL, 'V', 'EF', 168,'B20',4,'R11','2023-04-07',507,NULL )
, (NULL, 'V', 'EF', 169,'B20',2,'R11','2023-04-17',508,NULL )
, (NULL, 'V', 'EF', 170,'B20',4,'R11','2024-01-21',509,NULL )
, (NULL, 'V', 'EF', 171,'B20',2,'R11','2024-04-12',510,NULL )
, (NULL, 'V', 'EF', 172,'B20',1,'R11','2023-04-06',511,NULL )
, (NULL, 'V', 'EF', 173,'B20',2,'R11','2022-05-06',512,NULL )
, (NULL, 'V', 'EF', 174,'B20',3,'R11','2024-04-30',513,NULL )
, (NULL, 'V', 'EF', 175,'B20',1,'R01','2023-05-24',514,NULL )
, (NULL, 'V', 'EF', 176,'B20',4,'R01','2022-12-25',515,NULL )
, (NULL, 'V', 'TR', 177,'B20',1,'R01','2023-07-06',516,NULL )
, (NULL, 'V', 'EF', 178,'B20',4,'R01','2024-05-01',517,NULL )
, (NULL, 'V', 'EF', 179,'B20',3,'R01','2023-02-07',518,NULL )
, (NULL, 'V', 'EF', 180,'B20',3,'R01','2022-08-14',519,NULL )
, (NULL, 'V', 'EF', 181,'B20',4,'R01','2022-05-23',520,NULL )
, (NULL, 'V', 'EF', 182,'B20',4,'R01','2022-10-08',521,NULL )
, (NULL, 'V', 'EF', 183,'B20',3,'R01','2022-11-04',522,NULL )
, (NULL, 'V', 'EF', 184,'B20',4,'R01','2023-04-03',523,NULL )
, (NULL, 'V', 'EF', 185,'B20',4,'R01','2022-06-05',524,NULL )
, (NULL, 'V', 'EF', 186,'B20',4,'R01','2022-07-12',525,NULL )
, (NULL, 'V', 'EF', 187,'B20',3,'R01','2022-06-12',526,NULL )
, (NULL, 'V', 'EF', 188,'B20',4,'R01','2023-12-21',527,NULL )
, (NULL, 'V', 'EF', 189,'B20',3,'R01','2023-06-15',528,NULL )
, (NULL, 'V', 'EF', 191,'B20',2,'R01','2023-05-25',529,NULL )
, (NULL, 'V', 'EF', 192,'B20',4,'R01','2023-01-09',530,NULL )
, (NULL, 'V', 'EF', 193,'B20',3,'R01','2022-06-17',531,NULL )
, (NULL, 'V', 'EF', 194,'B20',1,'R01','2023-07-19',532,NULL )
, (NULL, 'V', 'TR', 195,'B20',3,'R01','2023-08-18',533,NULL )
, (NULL, 'V', 'EF', 196,'B20',3,'R01','2023-01-06',534,NULL )
, (NULL, 'V', 'EF', 197,'B20',2,'R01','2022-06-24',535,NULL )
, (NULL, 'V', 'EF', 198,'B20',1,'R02','2023-12-29',536,NULL )
, (NULL, 'V', 'EF', 199,'B20',3,'R02','2024-01-17',537,NULL )
, (NULL, 'V', 'EF', 200,'B20',1,'R02','2023-10-19',538,NULL )
, (NULL, 'V', 'EF', 201,'B20',3,'R02','2022-02-28',539,NULL )
, (NULL, 'V', 'EF', 202,'B20',3,'R02','2023-05-07',540,NULL )
, (NULL, 'V', 'EF', 203,'B20',1,'R02','2022-06-30',541,NULL )
, (NULL, 'V', 'EF', 204,'B20',1,'R02','2023-09-14',542,NULL )
, (NULL, 'V', 'EF', 205,'B20',2,'R02','2022-04-23',543,NULL )
, (NULL, 'V', 'EF', 206,'B20',2,'R02','2022-03-31',544,NULL )
, (NULL, 'V', 'EF', 207,'B20',2,'R02','2023-07-07',545,NULL )
, (NULL, 'V', 'EF', 208,'B20',4,'R02','2023-07-01',546,NULL )
, (NULL, 'V', 'EF', 209,'B20',3,'R02','2023-09-07',547,NULL )
, (NULL, 'V', 'EF', 210,'B20',2,'R02','2022-06-26',548,NULL )
, (NULL, 'V', 'EF', 211,'B20',3,'R02','2023-09-16',549,NULL )
, (NULL, 'V', 'TR', 212,'B20',1,'R02','2022-07-24',550,NULL )
, (NULL, 'V', 'EF', 213,'B20',1,'R02','2023-06-12',551,NULL )
, (NULL, 'V', 'EF', 214,'B20',1,'R02','2023-01-16',552,NULL )
, (NULL, 'V', 'EF', 215,'B20',4,'R02','2024-05-08',553,NULL )
, (NULL, 'V', 'EF', 216,'B20',2,'R02','2022-06-13',554,NULL )
, (NULL, 'V', 'EF', 217,'B20',3,'R02','2023-02-03',555,NULL )
, (NULL, 'V', 'EF', 218,'B20',1,'R02','2023-04-28',556,NULL )
, (NULL, 'V', 'EF', 219,'B20',3,'R02','2022-05-24',557,NULL )
, (NULL, 'V', 'EF', 220,'B20',1,'R02','2024-02-21',558,NULL )
, (NULL, 'V', 'EF', 221,'B20',4,'R02','2022-09-19',559,NULL )
, (NULL, 'V', 'EF', 222,'B20',4,'R11','2022-03-03',560,NULL )
, (NULL, 'V', 'EF', 223,'B20',2,'R11','2024-01-06',561,NULL )
, (NULL, 'V', 'EF', 224,'B20',3,'R11','2024-05-20',562,NULL )
, (NULL, 'V', 'EF', 226,'B20',3,'R11','2022-11-09',563,NULL )
, (NULL, 'V', 'EF', 227,'B20',1,'R11','2024-06-24',564,NULL )
, (NULL, 'V', 'EF', 228,'B20',4,'R11','2023-04-22',565,NULL )
, (NULL, 'V', 'EF', 229,'B20',3,'R11','2024-04-23',566,NULL )
, (NULL, 'V', 'TR', 230,'B20',4,'R11','2023-12-17',567,NULL )
, (NULL, 'V', 'EF', 231,'B20',3,'R11','2023-06-29',568,NULL )
, (NULL, 'V', 'EF', 232,'B20',1,'R11','2024-03-10',569,NULL )
, (NULL, 'V', 'EF', 233,'B20',4,'R11','2024-05-28',570,NULL )
, (NULL, 'V', 'EF', 234,'B20',2,'R11','2022-08-18',571,NULL )
, (NULL, 'V', 'EF', 235,'B20',4,'R11','2022-06-05',572,NULL )
, (NULL, 'V', 'EF', 236,'B20',2,'R11','2022-01-31',573,NULL )
, (NULL, 'V', 'EF', 237,'B20',3,'R11','2022-07-29',574,NULL )
, (NULL, 'V', 'EF', 238,'B20',3,'R11','2022-05-26',575,NULL )
, (NULL, 'V', 'EF', 239,'B20',4,'R11','2023-02-15',576,NULL )
, (NULL, 'V', 'EF', 240,'B20',3,'R11','2024-02-10',577,NULL )
, (NULL, 'V', 'EF', 241,'B20',3,'R11','2022-04-22',578,NULL )
, (NULL, 'V', 'EF', 242,'B20',4,'R11','2024-05-13',579,NULL )
, (NULL, 'V', 'EF', 243,'B20',3,'R01','2022-01-10',580,NULL )
, (NULL, 'V', 'EF', 244,'B20',2,'R01','2022-11-25',581,NULL )
, (NULL, 'V', 'EF', 245,'B20',3,'R01','2024-03-30',582,NULL )
, (NULL, 'V', 'EF', 246,'B20',2,'R01','2022-10-25',583,NULL )
, (NULL, 'V', 'TR', 247,'B20',3,'R01','2022-06-11',584,NULL )
, (NULL, 'V', 'EF', 248,'B20',1,'R01','2023-02-23',585,NULL )
, (NULL, 'V', 'EF', 249,'B20',2,'R01','2024-04-06',586,NULL )
, (NULL, 'V', 'EF', 250,'B20',1,'R01','2022-01-23',587,NULL )
, (NULL, 'V', 'EF', 251,'B20',4,'R01','2022-04-06',588,NULL )
, (NULL, 'V', 'EF', 252,'B20',3,'R01','2023-08-08',589,NULL )
, (NULL, 'V', 'EF', 253,'B20',1,'R01','2022-11-15',590,NULL )
, (NULL, 'V', 'EF', 254,'B20',4,'R01','2022-12-02',591,NULL )
, (NULL, 'V', 'EF', 255,'B20',3,'R01','2023-03-30',592,NULL )
, (NULL, 'V', 'EF', 256,'B20',2,'R01','2023-10-16',593,NULL )
, (NULL, 'V', 'EF', 257,'B20',2,'R01','2023-05-30',594,NULL )
, (NULL, 'V', 'EF', 258,'B20',1,'R01','2024-04-05',595,NULL )
, (NULL, 'V', 'EF', 259,'B20',1,'R01','2022-05-14',596,NULL )
, (NULL, 'V', 'EF', 260,'B20',1,'R01','2024-03-01',597,NULL )
, (NULL, 'V', 'EF', 261,'B20',1,'R01','2022-07-02',598,NULL )
, (NULL, 'V', 'EF', 262,'B20',4,'R01','2022-12-02',599,NULL )
, (NULL, 'V', 'EF', 263,'B20',3,'R01','2023-03-07',600,NULL )
, (NULL, 'V', 'TR', 264,'B20',1,'R01','2022-09-24',601,NULL )
, (NULL, 'V', 'EF', 265,'B20',4,'R01','2024-06-07',602,NULL )
, (NULL, 'V', 'EF', 267,'B20',3,'R01','2022-10-30',603,NULL )
, (NULL, 'V', 'EF', 268,'B20',1,'R01','2023-05-06',604,NULL )
, (NULL, 'V', 'EF', 269,'B20',1,'R01','2022-12-14',605,NULL )
, (NULL, 'V', 'EF', 270,'B20',1,'R01','2023-10-05',606,NULL )
, (NULL, 'V', 'EF', 271,'B20',2,'R01','2022-07-14',607,NULL )
, (NULL, 'V', 'EF', 272,'B20',2,'R01','2023-09-20',608,NULL )
, (NULL, 'V', 'EF', 273,'B20',1,'R01','2022-08-19',609,NULL )
, (NULL, 'V', 'EF', 274,'B20',2,'R01','2024-05-02',610,NULL )
, (NULL, 'V', 'EF', 275,'B20',2,'R01','2023-01-19',611,NULL )
, (NULL, 'V', 'EF', 276,'B20',3,'R01','2024-01-25',612,NULL )
, (NULL, 'V', 'EF', 277,'B20',1,'R01','2023-07-08',613,NULL )
, (NULL, 'V', 'EF', 278,'B20',2,'R01','2024-05-25',614,NULL )
, (NULL, 'V', 'EF', 279,'B20',4,'R01','2022-10-23',615,NULL )
, (NULL, 'V', 'EF', 280,'B20',1,'R01','2022-06-15',616,NULL )
, (NULL, 'V', 'EF', 281,'B20',3,'R01','2023-10-10',617,NULL )
, (NULL, 'V', 'TR', 282,'B20',3,'R01','2023-08-26',618,NULL )
, (NULL, 'V', 'EF', 283,'B20',1,'R01','2024-01-19',619,NULL )
, (NULL, 'V', 'EF', 284,'B20',3,'R01','2022-03-21',620,NULL )
, (NULL, 'V', 'EF', 285,'B20',1,'R01','2023-08-17',621,NULL )
, (NULL, 'V', 'EF', 286,'B20',4,'R01','2023-07-30',622,NULL )
, (NULL, 'V', 'EF', 287,'B20',4,'R01','2023-08-12',623,NULL )
, (NULL, 'V', 'EF', 288,'B20',3,'R01','2022-04-11',624,NULL )
, (NULL, 'V', 'EF', 289,'B20',1,'R01','2023-03-11',625,NULL )
, (NULL, 'V', 'EF', 290,'B20',1,'R01','2024-03-31',626,NULL )
, (NULL, 'V', 'EF', 291,'B20',4,'R01','2023-08-20',627,NULL )
, (NULL, 'V', 'EF', 292,'B20',4,'R01','2023-11-15',628,NULL )
, (NULL, 'V', 'EF', 293,'B20',4,'R01','2022-10-06',629,NULL )
, (NULL, 'V', 'EF', 294,'B20',4,'R01','2023-01-15',630,NULL )
, (NULL, 'V', 'EF', 295,'B20',2,'R01','2024-07-18',631,NULL )
, (NULL, 'V', 'EF', 296,'B20',3,'R01','2022-12-15',632,NULL )
, (NULL, 'V', 'EF', 297,'B20',1,'R01','2023-03-20',633,NULL )
, (NULL, 'V', 'EF', 298,'B20',1,'R01','2022-09-13',634,NULL )
, (NULL, 'V', 'TR', 299,'B20',1,'R01','2022-06-28',635,NULL )
, (NULL, 'V', 'EF', 300,'B20',2,'R01','2023-01-26',636,NULL )
, (NULL, 'V', 'EF', 301,'B20',2,'R01','2023-06-26',637,NULL )
, (NULL, 'V', 'EF', 302,'B20',1,'R02','2023-12-21',638,NULL )
, (NULL, 'V', 'EF', 303,'B20',2,'R02','2024-04-24',639,NULL )
, (NULL, 'V', 'EF', 304,'B20',2,'R02','2023-06-16',640,NULL )
, (NULL, 'V', 'EF', 305,'B20',3,'R02','2023-05-09',641,NULL )
, (NULL, 'V', 'EF', 306,'B20',1,'R02','2024-06-28',642,NULL )
, (NULL, 'V', 'EF', 307,'B20',2,'R02','2023-07-07',643,NULL )
, (NULL, 'V', 'EF', 308,'B20',1,'R02','2023-04-25',644,NULL )
, (NULL, 'V', 'EF', 309,'B20',4,'R02','2023-06-26',645,NULL )
, (NULL, 'V', 'EF', 310,'B20',4,'R02','2022-07-04',646,NULL )
, (NULL, 'V', 'EF', 311,'B20',2,'R02','2024-05-11',647,NULL )
, (NULL, 'V', 'EF', 312,'B20',1,'R02','2022-02-20',648,NULL )
, (NULL, 'V', 'EF', 313,'B20',4,'R02','2024-04-09',649,NULL )
, (NULL, 'V', 'EF', 315,'B20',1,'R02','2023-11-28',650,NULL )
, (NULL, 'V', 'EF', 316,'B20',3,'R02','2023-03-07',651,NULL )
, (NULL, 'V', 'TR', 317,'B20',3,'R02','2022-01-19',652,NULL )
, (NULL, 'V', 'EF', 318,'B20',3,'R02','2024-04-18',653,NULL )
, (NULL, 'V', 'EF', 319,'B20',3,'R02','2023-09-27',654,NULL )
, (NULL, 'V', 'EF', 320,'B20',3,'R02','2023-07-29',655,NULL )
, (NULL, 'V', 'EF', 321,'B20',3,'R02','2023-04-02',656,NULL )
, (NULL, 'V', 'EF', 322,'B20',4,'R02','2024-04-03',657,NULL )
, (NULL, 'V', 'EF', 323,'B20',3,'R02','2023-03-22',658,NULL )
, (NULL, 'V', 'EF', 324,'B20',4,'R02','2023-09-09',659,NULL )
, (NULL, 'V', 'EF', 325,'B20',4,'R02','2023-02-14',660,NULL )
, (NULL, 'V', 'EF', 326,'B20',3,'R11','2022-09-22',661,NULL )
, (NULL, 'V', 'EF', 327,'B20',1,'R11','2023-03-27',662,NULL )
, (NULL, 'V', 'EF', 328,'B20',3,'R11','2022-12-16',663,NULL )
, (NULL, 'V', 'EF', 329,'B20',2,'R11','2023-07-16',664,NULL )
, (NULL, 'V', 'EF', 330,'B20',1,'R11','2023-10-22',665,NULL )
, (NULL, 'V', 'EF', 331,'B20',3,'R11','2023-06-12',666,NULL )
, (NULL, 'V', 'EF', 332,'B20',3,'R11','2023-08-15',667,NULL )
, (NULL, 'V', 'EF', 333,'B20',1,'R11','2023-09-16',668,NULL )
, (NULL, 'V', 'TR', 334,'B20',1,'R11','2024-07-13',669,NULL )
, (NULL, 'V', 'EF', 335,'B20',4,'R11','2022-06-01',670,NULL )
, (NULL, 'V', 'EF', 336,'B20',2,'R11','2022-12-15',671,NULL )
, (NULL, 'V', 'EF', 337,'B20',2,'R11','2023-11-01',672,NULL )
, (NULL, 'V', 'EF', 338,'B20',1,'R11','2022-06-10',673,NULL )
, (NULL, 'V', 'EF', 339,'B20',1,'R11','2024-06-09',674,NULL )
, (NULL, 'V', 'TR', 340,'B20',2,'R11','2023-12-18',675,NULL )
, (NULL, 'V', 'TR', 341,'B20',2,'R11','2024-05-20',676,NULL )
, (NULL, 'V', 'TR', 342,'B20',3,'R11','2024-04-08',677,NULL )
, (NULL, 'V', 'TR', 343,'B20',4,'R11','2022-04-09',678,NULL )
, (NULL, 'V', 'EF', 344,'B20',1,'R11','2024-07-21',679,NULL )
, (NULL, 'V', 'TR', 345,'B20',2,'R11','2022-11-16',680,NULL )
, (NULL, 'V', 'TR', 346,'B20',4,'R11','2023-12-02',681,NULL )
, (NULL, 'V', 'EF', 347,'B20',4,'R11','2023-06-28',682,NULL )
, (NULL, 'V', 'EF', 2,'B20',2,'R01','2024-07-28',1,NULL )
, (NULL, 'V', 'EF', 256,'B20',1,'R01','2024-07-28',2,NULL )
, (NULL, 'V', 'EF', 2,'B20',2,'R01','2024-07-30',1,NULL )
, (NULL, 'V', 'EF', 256,'B20',1,'R01','2024-07-30',2,NULL )
, (NULL, 'V', 'EF', 2,'B20',4,'R01','2023-06-28',100,NULL )
, (NULL, 'V', 'EF', 2,'B20',4,'R01','2023-06-02',200,NULL )
, (NULL, 'V', 'EF', 2,'B20',7,'R01','2023-06-15',200,NULL )
;





-- FUNCIONES


-- Creación función 1
DROP FUNCTION IF EXISTS fn_buscardor_id_cliente;

DELIMITER $$

CREATE FUNCTION fn_buscardor_id_cliente (p_buscador_nombre varchar(100), p_buscador_dnicuit INT ) 
RETURNS INTEGER
READS SQL DATA
BEGIN
	/*
    Función que busca el número de cliente, dado un nombre, dni o cuit.
    Criterios de búsqueda:
    p_buscador_nombre
		ingresar una parte o total del nombre
        Si no se busca por este criterio, ingresar NULL
	p_buscador_dnicuit
		Ingresar DNI o CUIT
        Si no se busca por este criterio, ingresar NULL
    */
    
  	DECLARE v_resultado INT;
        
    SET v_resultado = 	(
						SELECT 	id_cliente
						FROM 	clientes
						WHERE 	apellido_nombre LIKE CONCAT('%',p_buscador_nombre,'%')
						OR 		DNI =  p_buscador_dnicuit 
						OR		CUIT = p_buscador_dnicuit 
                        ); 
        
	RETURN v_resultado;
    
END$$

DELIMITER ;


/* -- Invocación de la función 1
-- SELECT fn_buscardor_id_cliente (null, 15922523) AS id_cliente_buscado;
-- SELECT fn_buscardor_id_cliente ('herrendorf', null) AS id_cliente_buscado;
*/



-- Creación función 2
DROP FUNCTION IF EXISTS fn_saldos;

DELIMITER $$

CREATE FUNCTION fn_saldos (p_id_cliente INT ) 
RETURNS NUMERIC(10,2)
READS SQL DATA
BEGIN
	/*
    Obtiene saldo de deuda de un cliente, ingresando su id_cliente
    p_id_cliente
		Ingresar el id_cliente, o campo id_cliente de la tabla clientes.
    */
    
  	DECLARE v_saldo INT;
        
    SET v_saldo = 	(
						SELECT 	sum(t.cantidad * t.precio) as saldo
						FROM 	transacciones t
                        ,		clientes c
						WHERE 	c.id_cliente = t.id_cliente
                        AND		p_id_cliente = t.id_cliente
                        );
        
	RETURN v_saldo;
    
END$$

DELIMITER ;

/*-- Llamada de la función 2
SELECT	id_cliente
,		fn_saldos(id_cliente) saldo 
FROM clientes;


SELECT	id_cliente
,		fn_saldos(id_cliente) saldo 
FROM 	clientes
WHERE 	id_cliente = 256;
*/



				
DROP FUNCTION IF EXISTS fn_precio_venta;

DELIMITER $$

CREATE FUNCTION fn_precio_venta(	p_id_operacion VARCHAR(1), 
									p_id_cliente INT, 
									p_fecha DATE, 
                                    p_producto VARCHAR(3) )
RETURNS NUMERIC(10,2)    
READS SQL DATA

BEGIN
	/*
    Obtiene el precio de una operación de venta
    p_id_operacion: 'V'
	p_tipo_cliente: se obtiene de la tabla clientes. Los clientes A, se facturan al finalizar el mes (consumos en $0)
    p_fecha: fecha de la transacción
    p_producto: producto vendido
    */
    
    DECLARE v_tipo_cliente VARCHAR(1);
	DECLARE v_precio_obtenido NUMERIC(10,2);
    
    SET v_tipo_cliente = (
							SELECT 	c.id_tipo_cliente
                            FROM	clientes c
                            WHERE	p_id_cliente = c.id_cliente
                            );
                            
	SET	v_precio_obtenido = (
				SELECT 	if(v_tipo_cliente = 'A' AND p_producto = 'B20', 0, p.precio)  -- este valor necesito setear
				FROM 	precios p
				WHERE 	p.id_producto = p_producto
				AND 	p.id_tipo_cliente = v_tipo_cliente
				AND		p.fecha_inicio = (
									select	max(pr.fecha_inicio) 
									FROM 	precios pr 
									WHERE 	pr.fecha_inicio <= p_fecha
                                    AND		pr.id_producto = p_producto
                                    AND		pr.id_tipo_cliente = v_tipo_cliente 
                                    AND 	p_id_operacion = 'V'
									)
							);
                            
RETURN v_precio_obtenido; 

END$$

DELIMITER ;

/*-- Invocación función 3
SELECT 	t.*, fn_precio_venta(t.id_operacion, t.id_cliente, t.fecha, t.id_producto) AS precio_obtenido
FROM	transacciones t;
*/




DROP FUNCTION IF EXISTS fn_precio_abono;

DELIMITER $$

CREATE FUNCTION fn_precio_abono(	p_id_operacion VARCHAR(1), 
									p_id_cliente INT, 
									p_fecha DATE, 
                                    p_producto VARCHAR(3),
                                    p_fecha_inicio DATE,
                                    p_fecha_fin DATE)
RETURNS NUMERIC(10,2)    
READS SQL DATA
BEGIN
	/*
    Obtiene el valor del abono mensual, según los B20 consumidos en cada mes.
		p_id_operacion: 'A'
		p_tipo_cliente: se obtiene de la tabla clientes. Se aplica a los clientes A.
		p_fecha: fecha de la transacción
		p_producto: producto vendido
    */
    
	DECLARE v_bidones_incluidos INT;
    
    DECLARE v_tipo_cliente VARCHAR(1);

	DECLARE v_precio_B20 NUMERIC(10,2);
    DECLARE v_bidones_consumidos INT;
	
    DECLARE v_valor_abono NUMERIC(10,2);
    
    SET v_bidones_incluidos = 6;
    
    SET v_tipo_cliente = (
							SELECT 	c.id_tipo_cliente
                            FROM	clientes c
                            WHERE	p_id_cliente = c.id_cliente
                            );
                            
	SET	v_precio_B20 = (
				SELECT 	p.precio  -- este valor necesito setear
				FROM 	precios p
				WHERE 	p.id_producto = 'B20'
				AND 	p.id_tipo_cliente = v_tipo_cliente
				AND		p.fecha_inicio = (
									select	max(pr.fecha_inicio) 
									FROM 	precios pr 
									WHERE 	pr.fecha_inicio <= p_fecha_fin
                                    AND		pr.id_producto = 'B20'
                                    AND		pr.id_tipo_cliente = v_tipo_cliente 
									) );
	
    SET	v_bidones_consumidos = (
									SELECT 	SUM(t.cantidad)  
									FROM 	transacciones t
									WHERE 	t.id_cliente = p_id_cliente
									AND 	t.id_producto = 'B20'
									AND		t.fecha >= p_fecha_inicio
									AND		t.fecha <= p_fecha_fin 
                                    AND		t.id_operacion = 'V'
                                    GROUP BY	p_id_cliente
								);
	    
        
	IF	v_bidones_consumidos > v_bidones_incluidos 
		THEN	SET v_valor_abono = v_bidones_consumidos * v_precio_B20;
        ELSE	SET v_valor_abono = v_bidones_incluidos * v_precio_B20;
	END IF;
                 
                 
RETURN v_valor_abono; 

END$$

DELIMITER ;






-- STORED PROCEDURES


DROP PROCEDURE IF EXISTS sp_rutas_del_dia;

DELIMITER $$
CREATE PROCEDURE sp_rutas_del_dia (IN p_reparto VARCHAR(3), IN p_dia VARCHAR(1))
BEGIN
	/*
    Permite obtener las rutas del día para todos o para el reparto seleccionado.
    p_reparto
		Ingresar un reparto en particular:
			R01
            R02
            R11
		NULL: obtiene la lista de todos los repartos.
    p_dia
		Código del día que se quiere obtener la ruta:
			A: lunes
            B: martes
            C: miércoles
            D: jueves
            E: viernes
            F: sábado
		NULL: se obtiene la ruta del día actual.
    */
    
    DECLARE v_existe_reparto BOOL;
    DECLARE v_existe_dia BOOL;
    
    DECLARE v_dia VARCHAR(1);
    DECLARE v_reparto VARCHAR(3);
    
    -- control existencia
	IF	p_reparto IS NOT NULL	
	AND	p_reparto NOT IN (SELECT id_reparto FROM rutas)
		THEN	SET v_existe_reparto = False;
		ELSE	SET v_existe_reparto = True;
	END IF;

	IF	p_dia IS NULL
	OR	p_dia IN ((select left(ruta,1) FROM rutas))
		THEN	SET v_existe_dia = True;
		ELSE	SET v_existe_dia = False;
	END IF;
    
    -- Variable día de reparto
    IF	v_existe_dia = False    
		THEN (SELECT 'Día ingresado incorrecto' as msg_error_dia);
        SET v_dia = '0';
	ELSE 
		IF p_dia IS NULL
			THEN
				CASE	dayofweek(current_date())
				WHEN	1	THEN  SET v_dia = 'G';
				WHEN	2	THEN  SET v_dia = 'A';
				WHEN	3	THEN  SET v_dia = 'B';
				WHEN	4	THEN  SET v_dia = 'C';
				WHEN	5	THEN  SET v_dia = 'D';
				WHEN	6	THEN  SET v_dia = 'E';
				WHEN	7	THEN  SET v_dia = 'F';
				END CASE;
			ELSE SET v_dia = p_dia;
		END IF;
	END IF;
    
	IF	v_existe_reparto = False
		THEN (SELECT 'Reparto ingresado incorrecto' as msg_error_reparto); 
        SET v_reparto = '0';
	ELSE SET v_reparto = p_reparto;
	END IF;
    
	CASE 
		WHEN v_reparto IS NULL AND v_dia != '0'
			THEN (	SELECT	r.ruta
                    ,		r.id_reparto
                    ,		r.orden
                    , 		r.id_cliente
                    , 		c.apellido_nombre
                    ,		d.calle
                    ,		d.altura
                    ,		d.barrio
                    ,		l.localidad
                    ,		fn_saldos(r.id_cliente) AS deuda_cliente
					FROM 	rutas r
                    ,		clientes c
                    , 		clientes_domicilios cd
                    ,		domicilios d
                    ,		localidades l
                    WHERE	c.id_cliente = r.id_cliente
					AND		c.id_cliente = cd.id_cliente
                    AND		cd.id_tipo_domicilio = 'A'
                    AND		cd.id_domicilio = d.id_domicilio
                    AND		d.id_localidad = l.id_localidad
					AND 	left(ruta,1) = v_dia)
                    ORDER BY r.id_reparto ASC, r.orden ASC;
		WHEN v_reparto != '0' AND v_dia != '0'
			THEN (	SELECT	r.ruta
                    ,		r.id_reparto
                    ,		r.orden
                    , 		r.id_cliente
                    , 		c.apellido_nombre
                    ,		d.calle
                    ,		d.altura
                    ,		d.barrio
                    ,		l.localidad
                    ,		fn_saldos(r.id_cliente) AS deuda_cliente
					FROM 	rutas r
                    ,		clientes c
                    , 		clientes_domicilios cd
                    ,		domicilios d
                    ,		localidades l
                    WHERE	c.id_cliente = r.id_cliente
					AND		c.id_cliente = cd.id_cliente
                    AND		cd.id_tipo_domicilio = 'A'
                    AND		cd.id_domicilio = d.id_domicilio
                    AND		d.id_localidad = l.id_localidad
					AND 	left(ruta,1) = v_dia
					AND		id_reparto = v_reparto)
                    ORDER BY r.orden ASC;
		ELSE SELECT NULL;
	END CASE;
    
END$$

DELIMITER ;

 -- Invocación SP 1
/*CALL sp_rutas_del_dia(null, 'A');
CALL sp_rutas_del_dia('R01', 'B');
CALL sp_rutas_del_dia('R01', null);
CALL sp_rutas_del_dia(null, null);
*/


DROP PROCEDURE IF EXISTS sp_facturacion_ventas;

DELIMITER $$
CREATE PROCEDURE sp_facturacion_ventas ()
BEGIN
	/*
    Inserta en la tabla transacciones, el precio de cada producto vendido.
    Debe llamarse luego de cada venta insertada.
		p_fecha_inicio: fecha de inicio de facturación.
		p_fecha_fin: fecha límite de facturación.
    */
    
    SET SQL_SAFE_UPDATES = 0;

		UPDATE transacciones t
		SET t.precio = fn_precio_venta(t.id_operacion, t.id_cliente, t.fecha, t.id_producto)
        WHERE t.id_operacion = 'V'
	;

END$$

DELIMITER ;


/* -- Invocación procedimiento
CALL sp_facturacion_ventas();
*/



DROP PROCEDURE IF EXISTS sp_facturacion_abonos;

DELIMITER $$
CREATE PROCEDURE sp_facturacion_abonos ( IN p_fecha_inicio_abono DATE, IN p_fecha_fin_abono DATE )
BEGIN
	/*
    Inserta en la tabla transacciones, la facturación de los abonos mensuales, sumando los consumos del mes.
    Se invoca cada vez que finaliza un mes, para cada cliente "Abono".
		p_fecha_inicio: fecha de inicio de facturación.
		p_fecha_fin: fecha límite de facturación.
    */
 
-- Insertar fila de abono en tabla Transacciones, para cada cliente de abono.

	INSERT INTO transacciones (	id_transaccion
	,							id_operacion
	,							id_medio_pago
	,							id_cliente
	,							id_producto
	,							cantidad
	,							id_reparto
	,							fecha
	,							nro_comprobante
	,							precio )
    (SELECT NULL, 'A', 'CC', id_cliente, NULL, 1, NULL,  date_add(p_fecha_fin_abono, INTERVAL 1 DAY ), NULL, 0
    FROM 	clientes c
	WHERE 	c.id_tipo_cliente = 'A'
    AND		(c.fecha_baja IS NULL OR  c.fecha_baja >= p_fecha_inicio_abono )  
    );
    
    
-- Insertar precio calculado del abono en tabla Transacciones, para cada abono insertado.

	SET SQL_SAFE_UPDATES = 0;

	UPDATE transacciones t
	SET t.precio = fn_precio_abono(t.id_operacion, t.id_cliente, t.fecha, t.id_producto, p_fecha_inicio_abono, p_fecha_fin_abono )
	WHERE t.id_operacion = 'A'
	;

END$$

DELIMITER ;

/* -- Invocación procedimiento
CALL sp_facturacion_abonos( '2023-01-01', '2023-01-31' );
CALL sp_facturacion_abonos( '2023-02-01', '2023-02-28' );
CALL sp_facturacion_abonos( '2023-03-01', '2023-03-31' );
CALL sp_facturacion_abonos( '2023-04-01', '2023-04-30' );
CALL sp_facturacion_abonos( '2023-05-01', '2023-05-31' );
CALL sp_facturacion_abonos( '2023-06-01', '2023-06-30' );
CALL sp_facturacion_abonos( '2023-07-01', '2023-07-31' );
CALL sp_facturacion_abonos( '2023-08-01', '2023-08-31' );
CALL sp_facturacion_abonos( '2023-09-01', '2023-09-30' );
CALL sp_facturacion_abonos( '2023-10-01', '2023-10-31' );
CALL sp_facturacion_abonos( '2023-11-01', '2023-11-30' );
CALL sp_facturacion_abonos( '2023-12-01', '2023-12-31' );
CALL sp_facturacion_abonos( '2024-01-01', '2024-01-31' );
CALL sp_facturacion_abonos( '2024-02-01', '2024-02-29' );
CALL sp_facturacion_abonos( '2024-03-01', '2024-03-31' );
*/







-- TRIGGERS


-- Crear tabla de auditoría de precios
CREATE TABLE log_auditoria (
	id_log INT NOT NULL auto_increment
,	tabla varchar(55) NOT NULL
,	accion varchar(15) NOT NULL
,	mensaje VARCHAR(400) NOT NULL
,	usuario VARCHAR(45) NOT NULL
,	fecha DATETIME not null
,	PRIMARY KEY (id_log)
);


-- Cargar datos de auditoría cuando se actualice un precio

DROP TRIGGER IF EXISTS tr_precios_insert_after;

DELIMITER $$
CREATE TRIGGER tr_precios_insert_after
AFTER INSERT ON precios
FOR EACH ROW 
BEGIN
	INSERT INTO log_auditoria(id_log, tabla, accion, mensaje, usuario, fecha)
    VALUES ( NULL
	,		'precios'
	,		'alta'
    ,		CONCAT(
				'Se agrego un precio nuevo para'
                , NEW.id_producto
                ,' - Tipo de cliente: '
                , NEW.id_tipo_cliente
                , ' - Ingresa en vigencia: '
                , NEW.fecha_inicio
				)
    ,		user()
    ,		now()
    );
    
END$$;

DELIMITER ;



-- Auditoría de modificación en tabla clientes.

DROP TRIGGER IF EXISTS tr_clientes_update_clientes;

DELIMITER $$
CREATE TRIGGER tr_clientes_update_clientes
BEFORE UPDATE ON clientes
FOR EACH ROW 
BEGIN
	INSERT INTO log_auditoria(id_log, tabla, accion, mensaje, usuario, fecha)
    VALUES ( NULL
	,		'clientes'
	,		'modificación'
    ,		CONCAT(
					'Se modificó la información del cliente '
					, NEW.id_cliente
					)
    ,		user()
    ,		now()
    );
    
END$$;

DELIMITER ;


/* -- Prueba
UPDATE	clientes
SET		apellido_nombre = 'Herrendorf Florencia'
WHERE	id_cliente = 256;

SELECT	*
FROM	log_auditoria;
*/





-- VISTAS


-- Clientes activos con localidad del domicilio de atención, datos de contacto, reparto asignado y día de atención.

CREATE OR REPLACE VIEW vw_clientes_activos AS
SELECT 	c.id_cliente
,		c.apellido_nombre
,		c.telefono
,		c.email
,		l.localidad
,		r.id_reparto
,		left(ruta, 1) AS dia_asignado
FROM	clientes c
,		domicilios d
,		clientes_domicilios cd
, 		localidades l
,		repartos r
,		rutas ru
WHERE	c.fecha_baja IS NULL
AND		c.id_cliente = cd.id_cliente
AND		cd.id_tipo_domicilio = 'A'
AND		cd.id_domicilio = d.id_domicilio
AND		d.id_localidad = l.id_localidad
AND		ru.id_reparto = r.id_reparto
AND		c.id_cliente = ru.id_cliente
ORDER BY	l.localidad, c.apellido_nombre  ASC
;



-- Cantidad de clientes por dia, por reparto.

CREATE OR REPLACE VIEW vw_total_clientes_por_reparto AS 
SELECT 	id_reparto
,		ruta
,		count(*) cantidad_clientes
FROM	rutas ru
GROUP BY	id_reparto
,			ruta
ORDER BY	id_reparto, ruta ASC
;

