/* ---------------------------------------------------- */
/*  Generated by Enterprise Architect Version 14.0 		*/
/*  Created On : 03-feb.-2021 9:20:37 p. m. 				*/
/*  DBMS       : PostgreSQL 						*/
/* ---------------------------------------------------- */

/* Drop Tables */

DROP TABLE IF EXISTS CATEGORIA CASCADE
;

DROP TABLE IF EXISTS CLIENTE CASCADE
;

DROP TABLE IF EXISTS PRODUCTO CASCADE
;

DROP TABLE IF EXISTS TELEFONO_CLIENTE CASCADE
;

DROP TABLE IF EXISTS VENTA CASCADE
;

DROP TABLE IF EXISTS VENTA_PRODUCTO CASCADE
;

/* Create Tables */

CREATE TABLE CATEGORIA
(
	ID_Categoria integer NOT NULL,	-- Identificador &#250;nico para Categor&#237;a
	Nombre varchar(50) NOT NULL,	-- Nombre del conjunto general de la categor&#237;a
	Descripcion varchar(100) NOT NULL	-- Breve descripci&#243;n acerca de la categor&#237;a
)
;

CREATE TABLE CLIENTE
(
	ID_Cliente integer NOT NULL,	-- Identificador &#250;nico para cliente
	Nombre varchar(50) NOT NULL,	-- Nombre del cliente
	Calle varchar(15) NOT NULL,	-- Dato de direcci&#243;n del cliente
	Numero varchar(15) NOT NULL,	-- Dato de direcci&#243;n del cliente
	Barrio varchar(25) NOT NULL	-- Nombre del barrio donde esta ubicado el cliente
)
;

CREATE TABLE PRODUCTO
(
	ID_Producto integer NOT NULL,	-- Identificador &#250;nico para Producto
	Nombre varchar(50) NOT NULL,	-- Nombre del producto
	Precio_actual integer NOT NULL,	-- Precio actual del producto
	Stock integer NOT NULL,	-- Cantidad de producto disponible
	ID_Categoria integer NOT NULL,	-- Identificador &#250;nico para Categor&#237;a
	Descrpcion varchar(200) NOT NULL
)
;

CREATE TABLE TELEFONO_CLIENTE
(
	ID_Cliente integer NOT NULL,	-- Identificador &#250;nico para Cliente
	Telefono integer NOT NULL	-- N&#250;mero telef&#243;nico del cliente
)
;

CREATE TABLE VENTA
(
	ID_Venta integer NOT NULL,	-- Identificador unico para registro de venta
	Fecha date NOT NULL,	-- Fecha exacta en el que se realiz&#243; la venta
	Valor_Envio integer NOT NULL,	-- Porcentaje descuento
	Valor_total integer NULL,	-- Monto total de la venta
	ID_Cliente integer NOT NULL,	-- Identificador &#250;nico del cliente que realiz&#243; la venta
	Metodo_Pago varchar(50) NOT NULL,
	Estado varchar(20) NOT NULL
)
;

CREATE TABLE VENTA_PRODUCTO
(
	ID_Venta integer NOT NULL,	-- Identificador &#250;nico para Venta
	ID_Producto integer NOT NULL,	-- Identificador &#250;nico para Producto
	Cantidad_vendida integer NOT NULL,	-- Representa las unidades vendidades del producto en la venta.
	Monto_total integer NOT NULL	-- Es el total de los precios por producto registrados en la venta.
)
;

/* Create Primary Keys, Indexes, Uniques, Checks */

ALTER TABLE CATEGORIA ADD CONSTRAINT PK_CATEGORIA
	PRIMARY KEY (ID_Categoria)
;

ALTER TABLE CLIENTE ADD CONSTRAINT PK_CLIENTE
	PRIMARY KEY (ID_Cliente)
;

ALTER TABLE PRODUCTO ADD CONSTRAINT PK_PRODUCTO
	PRIMARY KEY (ID_Producto)
;

CREATE INDEX IXFK_PRODUCTO_CATEGORIA ON PRODUCTO (ID_Categoria ASC)
;

ALTER TABLE TELEFONO_CLIENTE ADD CONSTRAINT PK_TELEFONO_CLIENTE
	PRIMARY KEY (ID_Cliente,Telefono)
;

CREATE INDEX IXFK_TELEFONO_CLIENTE_CLIENTE ON TELEFONO_CLIENTE (ID_Cliente ASC)
;

ALTER TABLE VENTA ADD CONSTRAINT PK_VENTA
	PRIMARY KEY (ID_Venta)
;

CREATE INDEX IXFK_VENTA_CLIENTE ON VENTA (ID_Cliente ASC)
;

ALTER TABLE VENTA_PRODUCTO ADD CONSTRAINT PK_VENTA_PRODUCTO
	PRIMARY KEY (ID_Venta,ID_Producto)
;

CREATE INDEX IXFK_VENTA_PRODUCTO_PRODUCTO ON VENTA_PRODUCTO (ID_Producto ASC)
;

CREATE INDEX IXFK_VENTA_PRODUCTO_VENTA ON VENTA_PRODUCTO (ID_Venta ASC)
;

/* Create Foreign Key Constraints */

ALTER TABLE PRODUCTO ADD CONSTRAINT FK_PRODUCTO_CATEGORIA
	FOREIGN KEY (ID_Categoria) REFERENCES CATEGORIA (ID_Categoria) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE TELEFONO_CLIENTE ADD CONSTRAINT FK_TELEFONO_CLIENTE_CLIENTE
	FOREIGN KEY (ID_Cliente) REFERENCES CLIENTE (ID_Cliente) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE VENTA ADD CONSTRAINT FK_VENTA_CLIENTE
	FOREIGN KEY (ID_Cliente) REFERENCES CLIENTE (ID_Cliente) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE VENTA_PRODUCTO ADD CONSTRAINT FK_VENTA_PRODUCTO_PRODUCTO
	FOREIGN KEY (ID_Producto) REFERENCES PRODUCTO (ID_Producto) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE VENTA_PRODUCTO ADD CONSTRAINT FK_VENTA_PRODUCTO_VENTA
	FOREIGN KEY (ID_Venta) REFERENCES VENTA (ID_Venta) ON DELETE No Action ON UPDATE No Action
;

/* Create Table Comments, Sequences for Autonumber Columns */

COMMENT ON TABLE CATEGORIA
	IS 'Esta tabla representa el conjunto general que clasifica a los productos.'
;

COMMENT ON COLUMN CATEGORIA.ID_Categoria
	IS 'Identificador &#250;nico para Categor&#237;a'
;

COMMENT ON COLUMN CATEGORIA.Nombre
	IS 'Nombre del conjunto general de la categor&#237;a'
;

COMMENT ON COLUMN CATEGORIA.Descripcion
	IS 'Breve descripci&#243;n acerca de la categor&#237;a'
;

COMMENT ON TABLE CLIENTE
	IS 'Registra la informaci&#243;n personal y de manejo de saldo del cliente.'
;

COMMENT ON COLUMN CLIENTE.ID_Cliente
	IS 'Identificador &#250;nico para cliente'
;

COMMENT ON COLUMN CLIENTE.Nombre
	IS 'Nombre del cliente'
;

COMMENT ON COLUMN CLIENTE.Calle
	IS 'Dato de direcci&#243;n del cliente'
;

COMMENT ON COLUMN CLIENTE.Numero
	IS 'Dato de direcci&#243;n del cliente'
;

COMMENT ON COLUMN CLIENTE.Barrio
	IS 'Nombre del barrio donde esta ubicado el cliente'
;

COMMENT ON TABLE PRODUCTO
	IS 'Esta tabla contiene la informacion acerca del producto, como precios, stocks, etc.'
;

COMMENT ON COLUMN PRODUCTO.ID_Producto
	IS 'Identificador &#250;nico para Producto'
;

COMMENT ON COLUMN PRODUCTO.Nombre
	IS 'Nombre del producto'
;

COMMENT ON COLUMN PRODUCTO.Precio_actual
	IS 'Precio actual del producto'
;

COMMENT ON COLUMN PRODUCTO.Stock
	IS 'Cantidad de producto disponible'
;

COMMENT ON COLUMN PRODUCTO.ID_Categoria
	IS 'Identificador &#250;nico para Categor&#237;a'
;

COMMENT ON TABLE TELEFONO_CLIENTE
	IS 'En esta tabla se almacena los telefonos de cada cliente'
;

COMMENT ON COLUMN TELEFONO_CLIENTE.ID_Cliente
	IS 'Identificador &#250;nico para Cliente'
;

COMMENT ON COLUMN TELEFONO_CLIENTE.Telefono
	IS 'N&#250;mero telef&#243;nico del cliente'
;

COMMENT ON TABLE VENTA
	IS 'Se registra cada una de las ventas realizadas en el negocio'
;

COMMENT ON COLUMN VENTA.ID_Venta
	IS 'Identificador unico para registro de venta'
;

COMMENT ON COLUMN VENTA.Fecha
	IS 'Fecha exacta en el que se realiz&#243; la venta'
;

COMMENT ON COLUMN VENTA.Valor_Envio
	IS 'Porcentaje descuento'
;

COMMENT ON COLUMN VENTA.Valor_total
	IS 'Monto total de la venta'
;

COMMENT ON COLUMN VENTA.ID_Cliente
	IS 'Identificador &#250;nico del cliente que realiz&#243; la venta'
;

COMMENT ON TABLE VENTA_PRODUCTO
	IS 'Esta tabla registra los productos correspondientes a cada venta.'
;

COMMENT ON COLUMN VENTA_PRODUCTO.ID_Venta
	IS 'Identificador &#250;nico para Venta'
;

COMMENT ON COLUMN VENTA_PRODUCTO.ID_Producto
	IS 'Identificador &#250;nico para Producto'
;

COMMENT ON COLUMN VENTA_PRODUCTO.Cantidad_vendida
	IS 'Representa las unidades vendidades del producto en la venta.'
;

COMMENT ON COLUMN VENTA_PRODUCTO.Monto_total
	IS 'Es el total de los precios por producto registrados en la venta.'
;
