CREATE TABLE Clientes (
  idCliente INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(20) NULL,
  telefono INTEGER UNSIGNED NULL,
  PRIMARY KEY(idCliente)
);

CREATE TABLE Costos_Produccion (
  idcostos_produccion INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  costo_produccion DECIMAL(10, 2) NULL,
  PRIMARY KEY(idcostos_produccion)
);

CREATE TABLE Costos_Venta (
  idcostos_venta INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  costo_venta DECIMAL(10, 2) NULL,
  PRIMARY KEY(idcostos_venta)
);

CREATE TABLE Ingredientes (
  idIngrediente INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  nombre_ingrediente VARCHAR(15) NULL,
  costo_ingrediente VARCHAR(15) NULL,
  PRIMARY KEY(idIngrediente)
);

CREATE TABLE Ingredientes_has_Costos_Produccion (
  idcostos_produccion INTEGER UNSIGNED NOT NULL,
  idIngrediente INTEGER UNSIGNED NOT NULL,
  PRIMARY KEY(idcostos_produccion, idIngrediente)
);

CREATE TABLE Inventario (
  idInventario INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  idPan INTEGER UNSIGNED NOT NULL,
  cantidad_en_stock INTEGER UNSIGNED NULL,
  cantidad_venta DECIMAL(10, 2) NULL,
  fecha  TIMESTAMP NULL,
  tipo_movimiento ENUM('entrada','salida') NULL,
  PRIMARY KEY(idInventario)
);

CREATE TABLE Panes (
  idPan INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  idVenta INTEGER UNSIGNED NOT NULL,
  idPedido INTEGER UNSIGNED NOT NULL,
  idcostos_produccion INTEGER UNSIGNED NOT NULL,
  idcostos_venta INTEGER UNSIGNED NOT NULL,
  nombre VARCHAR(15) NULL,
  precio DECIMAL(10, 2) NULL,
  descripcion TEXT NULL,
  PRIMARY KEY(idPan)
);

CREATE TABLE Pedidos (
  idPedido INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  idVenta INTEGER UNSIGNED NOT NULL,
  idCliente INTEGER UNSIGNED NOT NULL,
  nombre_pedido VARCHAR(25) NULL,
  fecha_entrega DATE NULL,
  cantidad VARCHAR(60) NULL,
  notas VARCHAR(60) NULL,
  fecha_pedido TIMESTAMP NULL,
  PRIMARY KEY(idPedido)
);

CREATE TABLE Usuarios (
  idUsuario INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(15) NULL,
  apellido_paterno VARCHAR(15) NULL,
  apellido_materno VARCHAR(15) NULL,
  numero VARCHAR(15) NULL,
  PRIMARY KEY(idUsuario)
);

CREATE TABLE Usuarios_Contrasena (
  idUsuario INTEGER UNSIGNED NOT NULL,
  contrasena VARCHAR(25) NOT NULL,
  PRIMARY KEY(idUsuario)
);

CREATE TABLE Ventas (
  idVenta INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  fecha DATE NULL,
  cantidad VARCHAR(25) NULL,
  subtotal DECIMAL(10, 3) NULL,
  PRIMARY KEY(idVenta)
);


