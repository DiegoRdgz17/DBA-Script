
CREATE TABLE CLIENTE(
  CLIENTE_ID INT NOT NULL PRIMARY KEY
  Nombre VARCHAR(50) NOT NULL,
  Correo VARCHAR(50) NOT NULL UNIQUE,
  Contraseña VARCHAR(20) NOT NULL,
  Telefono VARCHAR(20),
  Direccion VARCHAR(50)
);

CREATE TABLE CUENTA(
  CUENTA_ID INT NOT NULL PRIMARY KEY,
  CLIENTE_ID INT NOT NULL,
  FOREIGN KEY (CLIENTE_ID) REFERENCES CLIENTE(CLIENTE_ID)
);

CREATE TABLE FACTURA(
  FACTURA_ID INT NOT NULL PRIMARY KEY,
  CUENTA_ID INT NOT NULL,
  AGENDA_ID INT,
  EXC_ID INT,
  FOREIGN KEY (CUENTA_ID) REFERENCES CUENTA(CUENTA_ID),
  FOREIGN KEY (AGENDA_ID) REFERENCES AGENDA(AGENDA_ID),
  FOREIGN KEY (EXC_ID) REFERENCES EXC(EXC_ID)
);

CREATE TABLE AGENDA(
  AGENDA_ID INT NOT NULL PRIMARY KEY
);

CREATE TABLE PRODUCTO(
  PRODUCTO_ID INT NOT NULL PRIMARY KEY
);

CREATE TABLE DETALLE_FACTURA(
  DETALLE_FACTURA_ID INT NOT NULL PRIMARY KEY,
  FACTURA_ID INT NOT NULL,
  PRODUCTO_ID INT NOT NULL,
  FOREIGN KEY (FACTURA_ID) REFERENCES FACTURA(FACTURA_ID),
  FOREIGN KEY (PRODUCTO_ID) REFERENCES PRODUCTO(PRODUCTO_ID)
);

CREATE TABLE CONCEPTO(
  CONCEPTO_ID INT NOT NULL PRIMARY KEY
);

CREATE TABLE TARIFA(
  TARIFA_ID INT NOT NULL PRIMARY KEY,
  CONCEPTO_ID INT NOT NULL,
  FOREIGN KEY (CONCEPTO_ID) REFERENCES CONCEPTO(CONCEPTO_ID)
);

CREATE TABLE ORDEN_SERVICIO(
  ORDEN_SERVICIO_ID INT NOT NULL PRIMARY KEY,
  CUENTA_ID INT NOT NULL,
  EXC_ID INT,
  TARIFA_ID INT NOT NULL,
  FOREIGN KEY (CUENTA_ID) REFERENCES CUENTA(CUENTA_ID),
  FOREIGN KEY (EXC_ID) REFERENCES EXC(EXC_ID),
  FOREIGN KEY (TARIFA_ID) REFERENCES TARIFA(TARIFA_ID)
);

CREATE TABLE EXC(
  EXC_ID INT NOT NULL PRIMARY KEY
);

