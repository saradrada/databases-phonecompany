-- Generado por Oracle SQL Developer Data Modeler 18.3.0.268.1208
--   en:        2019-05-17 18:54:52 COT
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g



CREATE TABLE asignacion ( 
--  Fecha de la asignacion
    fecha                       DATE NOT NULL,
    solicitud_numerosolicitud   VARCHAR2(30) NOT NULL,
    funcionario_id              VARCHAR2(30) NOT NULL
);

CREATE UNIQUE INDEX asignacion__idx ON
    asignacion (
        solicitud_numerosolicitud
    ASC );

CREATE TABLE cliente (
    id                 VARCHAR2(30) NOT NULL,
    nombre             VARCHAR2(30) NOT NULL,
    contraseña         VARCHAR2(30) NOT NULL,
    cedula             VARCHAR2(30) NOT NULL,
    direccion          VARCHAR2(50) NOT NULL,
    fecha_nacimiento   DATE NOT NULL,
    telefono           VARCHAR2(30) NOT NULL
);

COMMENT ON COLUMN cliente.id IS
    'Identificador del cliente.';

COMMENT ON COLUMN cliente.nombre IS
    'Nombre del cliente.';

COMMENT ON COLUMN cliente.contraseña IS
    'Contraseña del cliente.';

COMMENT ON COLUMN cliente.cedula IS
    'Cedula del cliente.';

COMMENT ON COLUMN cliente.direccion IS
    'Direccion del cliente.';

COMMENT ON COLUMN cliente.fecha_nacimiento IS
    'Fecha de nacimiento del cliente.';

COMMENT ON COLUMN cliente.telefono IS
    'Telefono del cliente.';

ALTER TABLE cliente ADD CONSTRAINT cliente_pk PRIMARY KEY ( id );

CREATE TABLE funcionario (
    id                 VARCHAR2(30) NOT NULL,
    nombre             VARCHAR2(30) NOT NULL,
    contraseña         VARCHAR2(30) NOT NULL,
    cedula             VARCHAR2(30) NOT NULL,
    direccion          VARCHAR2(50) NOT NULL,
    fecha_nacimiento   DATE NOT NULL,
    telefono           VARCHAR2(30) NOT NULL
);

COMMENT ON COLUMN funcionario.id IS
    'Identificacion del funcionario.';

COMMENT ON COLUMN funcionario.nombre IS
    'Nombre del funcionario';

COMMENT ON COLUMN funcionario.contraseña IS
    'Contraseña del funcionario.';

COMMENT ON COLUMN funcionario.cedula IS
    'Cedula del funcionario.';

COMMENT ON COLUMN funcionario.direccion IS
    'Direccion del funcionario.';

COMMENT ON COLUMN funcionario.fecha_nacimiento IS
    'Fecha de nacimiento del funcionario.';

COMMENT ON COLUMN funcionario.telefono IS
    'Telefono del funcionario.';

ALTER TABLE funcionario ADD CONSTRAINT funcionario_pk PRIMARY KEY ( id );

CREATE TABLE producto (
    codigo        VARCHAR2(30) NOT NULL,
    descripcion   VARCHAR2(50) NOT NULL
);

COMMENT ON COLUMN producto.codigo IS
    'Codigo del producto.';

COMMENT ON COLUMN producto.descripcion IS
    'Descripcion del producto.';

ALTER TABLE producto ADD CONSTRAINT producto_pk PRIMARY KEY ( codigo );

CREATE TABLE productocliente (
    numeroproducto    VARCHAR2(30) NOT NULL,
    fecha_citacion    DATE NOT NULL,
    fecha_retiro      DATE NOT NULL,
    cliente_id        VARCHAR2(30) NOT NULL,
    producto_codigo   VARCHAR2(30) NOT NULL
);

COMMENT ON COLUMN productocliente.numeroproducto IS
    'Numero de producto.';

COMMENT ON COLUMN productocliente.fecha_citacion IS
    'Fecha de la citacion del proyecto.';

COMMENT ON COLUMN productocliente.fecha_retiro IS
    'Fecha de retiro.';

CREATE TABLE solicitud (
    numerosolicitud   VARCHAR2(30) NOT NULL,
    observacion       VARCHAR2(50) NOT NULL,
    estado            VARCHAR2(30) NOT NULL,
    cliente_id        VARCHAR2(30) NOT NULL,
    producto_codigo   VARCHAR2(30) NOT NULL,
    tipo_tipo         VARCHAR2(30) NOT NULL
);

COMMENT ON COLUMN solicitud.numerosolicitud IS
    'Numero de la solicitud.';

COMMENT ON COLUMN solicitud.observacion IS
    'Observacion de la solicitud.';

COMMENT ON COLUMN solicitud.estado IS
    'Estado de la solicitud.';

ALTER TABLE solicitud ADD CONSTRAINT solicitud_pk PRIMARY KEY ( numerosolicitud );

CREATE TABLE tipo (
    tipo          VARCHAR2(30) NOT NULL,
    descripcion   VARCHAR2(50) NOT NULL
);

COMMENT ON COLUMN tipo.tipo IS
    'Tipo de la solicitud.';

COMMENT ON COLUMN tipo.descripcion IS
    'Descripcion de la solicitud.';

ALTER TABLE tipo ADD CONSTRAINT tipo_pk PRIMARY KEY ( tipo );

ALTER TABLE asignacion
    ADD CONSTRAINT asignacion_funcionario_fk FOREIGN KEY ( funcionario_id )
        REFERENCES funcionario ( id );

ALTER TABLE asignacion
    ADD CONSTRAINT asignacion_solicitud_fk FOREIGN KEY ( solicitud_numerosolicitud )
        REFERENCES solicitud ( numerosolicitud );

ALTER TABLE productocliente
    ADD CONSTRAINT productocliente_cliente_fk FOREIGN KEY ( cliente_id )
        REFERENCES cliente ( id );

ALTER TABLE productocliente
    ADD CONSTRAINT productocliente_producto_fk FOREIGN KEY ( producto_codigo )
        REFERENCES producto ( codigo );

ALTER TABLE solicitud
    ADD CONSTRAINT solicitud_cliente_fk FOREIGN KEY ( cliente_id )
        REFERENCES cliente ( id );

ALTER TABLE solicitud
    ADD CONSTRAINT solicitud_producto_fk FOREIGN KEY ( producto_codigo )
        REFERENCES producto ( codigo );

ALTER TABLE solicitud
    ADD CONSTRAINT solicitud_tipo_fk FOREIGN KEY ( tipo_tipo )
        REFERENCES tipo ( tipo );

ALTER TABLE asignacion
    ADD CONSTRAINT asignacion_funcionario_fk FOREIGN KEY ( funcionario_id )
        REFERENCES funcionario ( id );

ALTER TABLE asignacion
    ADD CONSTRAINT asignacion_solicitud_fk FOREIGN KEY ( solicitud_numerosolicitud )
        REFERENCES solicitud ( numerosolicitud );

ALTER TABLE productocliente
    ADD CONSTRAINT productocliente_cliente_fk FOREIGN KEY ( cliente_id )
        REFERENCES cliente ( id );

ALTER TABLE productocliente
    ADD CONSTRAINT productocliente_producto_fk FOREIGN KEY ( producto_codigo )
        REFERENCES producto ( codigo );

ALTER TABLE solicitud
    ADD CONSTRAINT solicitud_cliente_fk FOREIGN KEY ( cliente_id )
        REFERENCES cliente ( id );

ALTER TABLE solicitud
    ADD CONSTRAINT solicitud_producto_fk FOREIGN KEY ( producto_codigo )
        REFERENCES producto ( codigo );

ALTER TABLE solicitud
    ADD CONSTRAINT solicitud_tipo_fk FOREIGN KEY ( tipo_tipo )
        REFERENCES tipo ( tipo );



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                             7
-- CREATE INDEX                             1
-- ALTER TABLE                             19
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
