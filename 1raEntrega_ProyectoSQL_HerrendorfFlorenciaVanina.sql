-- CREACIÓN DE LA BASE DE DATOS

CREATE DATABASE Reparto_Agua;


-- CREACIÓN DE LAS TABLAS

USE Reparto_Agua;

CREATE TABLE vehiculos (
id_patente		VARCHAR(7)	NOT NULL UNIQUE,
marca			VARCHAR(20)	NOT NULL,
modelo			VARCHAR(20)	NOT NULL,
anio 			INT 		NOT NULL,
color 			VARCHAR(15)	NOT NULL,
fecha_compra	DATE 		NOT NULL,
fecha_venta		DATE,
primary key		(id_patente)
);

CREATE TABLE localidades (
id_localidad	int	NOT NULL AUTO_INCREMENT UNIQUE,
localidad		varchar(40) NOT NULL,
provincia		varchar(40) NOT NULL,
PRIMARY KEY		(id_localidad)
);

CREATE TABLE domicilios (
id_domicilio 	int				NOT NULL	AUTO_INCREMENT UNIQUE,
latitud			numeric(17,13)	NOT NULL,
longitud		numeric(17,13)	NOT NULL,
calle			varchar(30)		NOT NULL,
altura			int,
barrio			varchar(30),
otro			varchar(30),
id_localidad	int, 
PRIMARY KEY		(id_localidad),
FOREIGN KEY 	(id_localidad) REFERENCES localidades(id_localidad)
);

CREATE TABLE repartidores (
id_repartidor		int			NOT NULL	AUTO_INCREMENT UNIQUE,
apellido_nombre		varchar(50)	NOT NULL,
DNI					int			NOT NULL,
CUIT				int			NOT NULL,
fecha_nacimiento	date		NOT NULL,
genero				varchar(1)	CONSTRAINT CHECK (genero IN('F', 'M', 'O')),
id_domicilio		int			NOT NULL,
estado_civil		varchar(30)	default 'Sin especificar' 
CONSTRAINT CHECK (estado_civil IN('Soltero', 'Casado', 'Viudo', 'Sin especificar')),
fecha_ingreso		date		NOT NULL,
fecha_baja			date,
telefono			int			NOT NULL,
email				varchar(50)	NOT NULL,
PRIMARY KEY			(id_repartidor),
FOREIGN KEY (id_domicilio) REFERENCES domicilios(id_domicilio)
);	

CREATE TABLE repartos (
id_reparto				varchar(3) NOT NULL UNIQUE,
id_vehiculo_asignado	varchar(7) NOT NULL,
id_repartidor_asignado	int			NOT NULL,
PRIMARY KEY	(id_reparto),
FOREIGN KEY	(id_vehiculo_asignado) REFERENCES vehiculos(id_patente),
FOREIGN KEY	(id_repartidor_asignado) REFERENCES repartidores(id_repartidor)
);

CREATE TABLE tipos_domicilios (
id_tipo_domicilio	varchar(1)	NOT NULL	UNIQUE,
tipo_domicilio		varchar(20)	NOT NULL	DEFAULT	'Real',
PRIMARY KEY	(id_tipo_domicilio)
);

CREATE TABLE tipos_clientes (
id_tipo_cliente	varchar(1)	NOT NULL	unique,
tipo_cliente	varchar(20)	NOT NULL,
PRIMARY KEY	(id_tipo_cliente)
);

CREATE TABLE clientes (
id_cliente			int			NOT NULL	AUTO_INCREMENT	unique,
apellido_nombre		varchar(30)	NOT NULL,
DNI					int			NOT NULL,
CUIT				int			NOT NULL,
fecha_nacimiento	date		NOT NULL,
genero				varchar(1)	CONSTRAINT CHECK (genero IN('F', 'M', 'O')),
estado_civil		varchar(30)	default 'Sin especificar' 
CONSTRAINT CHECK (estado_civil IN('Soltero', 'Casado', 'Viudo', 'Sin especificar')),
fecha_alta			date		NOT NULL,
fecha_baja			date,
id_tipo_cliente		varchar(1)	NOT NULL,
telefono			int			NOT NULL,
email				varchar(50)	NOT NULL,
PRIMARY KEY	(id_cliente),
FOREIGN KEY (id_tipo_cliente) REFERENCES tipos_clientes(id_tipo_cliente)
);

CREATE TABLE clientes_domicilios (
id_cliente			int			NOT NULL,
id_tipo_domicilio	varchar(1)	NOT NULL,
id_domicilio		int			NOT NULL,
PRIMARY KEY (id_cliente, id_tipo_domicilio),
FOREIGN KEY (id_domicilio) REFERENCES domicilios(id_domicilio)
);

CREATE TABLE rutas (
id_ruta		varchar(5)	NOT NULL UNIQUE,
id_reparto	varchar(3)	NOT NULL,
id_cliente	int			NOT NULL,
PRIMARY KEY (id_ruta),
FOREIGN KEY (id_reparto) REFERENCES repartos(id_reparto),
FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

CREATE TABLE dispensers (
id_dispenser	int			NOT NULL AUTO_INCREMENT UNIQUE,
nro_serie		varchar(20)	NOT NULL,
marca			varchar(20)	NOT NULL,
estado			varchar(10)	NOT NULL,
fecha_compra	date 		NOT NULL,
fecha_baja		date,
PRIMARY KEY (id_dispenser)
);

CREATE TABLE productos (
id_producto	varchar(3)	NOT NULL	UNIQUE,
producto	varchar(20)	NOT NULL	UNIQUE,
PRIMARY KEY (id_producto)
);

CREATE TABLE medios_pago (
id_medio_pago	int			NOT NULL	AUTO_INCREMENT	UNIQUE,
medio_pago		varchar(20)	NOT NULL,
PRIMARY KEY (id_medio_pago)
);

CREATE TABLE operaciones (
id_operacion	varchar(1)	NOT NULL	UNIQUE,
operacion		varchar(20)	NOT NULL	UNIQUE,
PRIMARY KEY (id_operacion)
);

CREATE TABLE precios (
id_precio		int				NOT NULL 	AUTO_INCREMENT	UNIQUE,
fecha_inicio	date			NOT NULL,
id_producto		varchar(3)		NOT NULL,
id_tipo_cliente	varchar(1)		NOT NULL,
precio			numeric(20,2)	default 0,
PRIMARY KEY (id_precio),
FOREIGN KEY (id_producto) REFERENCES productos(id_producto),
FOREIGN KEY (id_tipo_cliente) REFERENCES tipos_clientes(id_tipo_cliente)
);

CREATE TABLE transacciones (
id_transaccion	int				NOT NULL 	AUTO_INCREMENT	UNIQUE,
id_operacion	varchar(1)		NOT NULL,
id_medio_pago	int				NOT NULL,
id_cliente		int				NOT NULL,
id_producto		varchar(3)		NOT NULL,
id_reparto		varchar(3)		NOT NULL,
fecha			date			NOT NULL,
nro_comprobante	int				NOT NULL,
precio			numeric(20,2)	NOT NULL,
PRIMARY KEY (id_transaccion),
FOREIGN KEY (id_operacion) REFERENCES operaciones(id_operacion),
FOREIGN KEY (id_medio_pago) REFERENCES medios_pago(id_medio_pago),
FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
FOREIGN KEY (id_producto) REFERENCES productos(id_producto),
FOREIGN KEY (id_reparto) REFERENCES repartos(id_reparto),
FOREIGN KEY (id_producto) REFERENCES precios(id_producto)
);


ALTER TABLE domicilios 
CHANGE COLUMN latitud latitud DECIMAL(17,13) NULL ,
CHANGE COLUMN longitud longitud DECIMAL(17,13) NULL ;

ALTER TABLE domicilios 
DROP PRIMARY KEY,
ADD PRIMARY KEY (id_domicilio),
ADD FOREIGN KEY (id_localidad) REFERENCES localidades(id_localidad);

ALTER TABLE domicilios 
CHANGE COLUMN calle	calle varchar(100)	NOT NULL;



-- CARGA DE LAS TABLAS (a continuar)


