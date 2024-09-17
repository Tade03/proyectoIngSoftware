CREATE TABLE Clientes (
  idCliente INTEGER(10) INTEGER NOT NULL,
  nombre VARCHAR(20) NULL,
  telefono NUMERIC(10) NULL,
  CONSTRAINT pk_idCliente PRIMARY KEY(idCliente)
);

CREATE TABLE Colonias (
  idColonias INTEGER UNSIGNED NOT NULL,
  nombre_colonia VARCHAR(25) NULL,
  CONSTRAINT pk_idColonia PRIMARY KEY(idColonias)
);

CREATE TABLE Costos_Produccion (
  idcostos_produccion INTEGER UNSIGNED NOT NULL,
  costo_produccion DECIMAL(10, 2) NULL,
  CONSTRAINT pk_costos_produccion PRIMARY KEY(idcostos_produccion)
);

CREATE TABLE Costos_Venta (
  idcostos_venta INTEGER(5) NOT NULL,
  costo_venta DECIMAL(10, 2) NULL,
  CONSTRAINT pk_idCostos_venta PRIMARY KEY(idcostos_venta)
);

CREATE TABLE Direcciones (
  idDirecciones INTEGER UNSIGNED NOT NULL,
  idColonias INTEGER UNSIGNED NOT NULL,
  calle VARCHAR(25) NULL,
  numero NUMERIC(4) NULL,
  cod_postal NUMERIC(4) NULL,
  CONSTRAINT pk_idDirecciones PRIMARY KEY(idDirecciones),
  CONSTRAINT fk_idColonias FOREIGN KEY(idColonias) REFERENCES Colonias(idColonias)
);

CREATE TABLE Pedidos (
  idPedido INTEGER UNSIGNED NOT NULL,
  idCliente INTEGER UNSIGNED NOT NULL,
  nombre_pedido TIMESTAMP NULL,
  fecha_entrega DATE NULL,
  cantidad INTEGER(60) UNSIGNED NULL,
  notas VARCHAR(60) NULL,
  fecha_pedido TIMESTAMP NULL,
  CONSTRAINT pk_idPedido PRIMARY KEY(idPedido),
  CONSTRAINT fk_idCliente FOREIGN KEY(idCliente) REFERENCES Clientes(idCliente)
);

CREATE TABLE Direcciones_has_Pedidos (
  idDirecciones INTEGER UNSIGNED NOT NULL,
  idPedido INTEGER UNSIGNED NOT NULL,
  PRIMARY KEY(idDirecciones, idPedido),
  CONSTRAINT fk_idDirecciones_nm FOREIGN KEY(idDirecciones) REFERENCES Direcciones(idDirecciones),
  CONSTRAINT fk_idPedido_nm FOREIGN KEY(idPedido) REFERENCES Pedidos(idPedido)
);

CREATE TABLE Ingredientes (
  idIngrediente INTEGER UNSIGNED NOT NULL,
  nombre_ingrediente VARCHAR(15) NULL,
  costo_ingrediente VARCHAR(15) NULL,
  CONSTRAINT pk_idIngredientes PRIMARY KEY(idIngrediente)
);

CREATE TABLE Ingredientes_has_Costos_Produccion (
  idcostos_produccion INTEGER UNSIGNED NOT NULL,
  idIngrediente INTEGER UNSIGNED NOT NULL,
  PRIMARY KEY(idcostos_produccion, idIngrediente),
  CONSTRAINT fk_idIngrediente_nm FOREIGN KEY(idIngrediente) REFERENCES Ingredientes(idIngrediente),
  CONSTRAINT fk_costos_produccion_nm FOREIGN KEY(idcostos_produccion) REFERENCES Costos_Produccion(idcostos_produccion)

);

CREATE TABLE Inventario (
  idInventario INTEGER UNSIGNED NOT NULL,
  cantidad_en_stock INTEGER UNSIGNED NULL,
  cantidad_venta DECIMAL(10, 2) NULL,
  fecha  TIMESTAMP NULL,
  tipo_movimiento ENUM('entrada','salida') NULL,
  CONSTRAINT pk_idInventario PRIMARY KEY(idInventario)
);

CREATE TABLE Ventas (
  idVenta INTEGER UNSIGNED NOT NULL,
  idUsuario INTEGER UNSIGNED NOT NULL,
  idPedido INTEGER UNSIGNED NOT NULL,
  fecha DATE NULL,
  cantidad INTEGER(25) UNSIGNED NULL,
  subtotal DECIMAL(10, 3) NULL,
  CONSTRAINT pk_idVentas PRIMARY KEY(idVenta),
  CONSTRAINT fk_idUsuario FOREIGN KEY(idUsuario) REFERENCES Usuarios(idUsuario),
  CONSTRAINT fk_idPedido FOREIGN KEY(idPedido) REFERENCES Pedidos(idPedido)
);


CREATE TABLE Inventario_has_Ventas (
  idVenta INTEGER UNSIGNED NOT NULL,
  idInventario INTEGER UNSIGNED NOT NULL,
  PRIMARY KEY(idVenta, idInventario),
  CONSTRAINT fk_idVenta_nm FOREIGN KEY(idVenta) REFERENCES Ventas(idVenta),
  CONSTRAINT fk_idInventario_nm FOREIGN KEY(idInventario) REFERENCES Inventario(idInventario)
);

CREATE TABLE Panes (
  codigobarra INTEGER UNSIGNED NOT NULL,
  idVenta INTEGER UNSIGNED NOT NULL,
  idcostos_produccion INTEGER UNSIGNED NOT NULL,
  idcostos_venta INTEGER UNSIGNED NOT NULL,
  nombre VARCHAR(15) NULL,
  precio DECIMAL(10, 2) NULL,
  descripcion TEXT NULL,
  CONSTRAINT pk_codigoBarra PRIMARY KEY(codigobarra),
  CONSTRAINT fk_idVenta FOREIGN KEY(idVenta) REFERENCES Ventas(idVenta),
  CONSTRAINT fk_idCostos_produccion FOREIGN KEY(idcostos_produccion) REFERENCES Costos_Produccion(idcostos_produccion),
  CONSTRAINT fk_idCostos_venta FOREIGN KEY(idcostos_venta) REFERENCES Costos_Venta(idcostos_venta)
);

CREATE TABLE Ticket (
  idTicket INTEGER UNSIGNED NOT NULL,
  idVenta INTEGER UNSIGNED NOT NULL,
  productos VARCHAR(255) NULL,
  subtotal DECIMAL(10,2) NULL,
  iva DECIMAL(10,2) NULL,
  CONSTRAINT pk_idTiket PRIMARY KEY(idTicket),
  CONSTRAINT fk_idVenta FOREIGN KEY(idVenta) REFERENCES Ventas(idVenta)
);

CREATE TABLE Usuarios (
  idUsuario INTEGER UNSIGNED NOT NULL,
  nombre VARCHAR(15) NULL,
  apellido_paterno VARCHAR(15) NULL,
  apellido_materno VARCHAR(15) NULL,
  numero VARCHAR(15) NULL,
  telefono VARCHAR(10) NULL,
  CONSTRAINT pk_IdUsuario PRIMARY KEY(idUsuario)
);

CREATE TABLE Usuarios_Contrasena (
  idUsuario INTEGER UNSIGNED NOT NULL,
  contrasena VARCHAR(25) NOT NULL,
  CONSTRAINT fk_idUsuario FOREIGN KEY(idUsuario) REFERENCES Usuarios(idUsuario)
);