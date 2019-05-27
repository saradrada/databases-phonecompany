CREATE OR REPLACE PACKAGE pkEliminar AS

PROCEDURE pEliminarCliente (ivCedulaCliente VARCHAR2);
PROCEDURE pEliminarFuncionario (ivCedulaFuncionario VARCHAR2);
PROCEDURE pEliminarSolicitud (ivNumeroSolicitud VARCHAR2);
PROCEDURE pEliminarProducto (ivCodigoProducto VARCHAR2);
PROCEDURE pBorrarAsignacion (ivNumeroSolicitud VARCHAR2, ivCedulaFuncionario VARCHAR2);
PROCEDURE pEliminarProductoCliente (ivNumeroProducto VARCHAR2);
PROCEDURE pEliminarTipo (ivTipo VARCHAR2);
END pkEliminar;
/

CREATE OR REPLACE PACKAGE BODY pkEliminar AS

PROCEDURE pEliminarCliente (ivCedulaCliente VARCHAR2)
IS
BEGIN
    pkCliente.pEliminarCliente(ivCedulaCliente);
    EXCEPTION
    WHEN OTHERS THEN
	RAISE_APPLICATION_ERROR(-20000,'El cliente con cedula '||ivCedulaCliente||' no se puede eliminar debido a que tiene varias solicitudes asociadas');
END pEliminarCliente;


PROCEDURE pEliminarFuncionario (ivCedulaFuncionario VARCHAR2)
IS
BEGIN
    pkFuncionario.pEliminarFuncionario(ivCedulaFuncionario);
    EXCEPTION
    WHEN OTHERS THEN
	RAISE_APPLICATION_ERROR(-20000,'El Funcionario con cedula '||ivCedulaFuncionario||' no se puede eliminar debido a que tiene varias solicitudes asociadas');
END pEliminarFuncionario;


PROCEDURE pEliminarSolicitud (ivNumeroSolicitud VARCHAR2)
IS
BEGIN
    pkSolicitud.borrarSolicitud(ivNumeroSolicitud);
    EXCEPTION
    WHEN OTHERS THEN
	RAISE_APPLICATION_ERROR(-20000,'La solicitud '||ivNumeroSolicitud||' no se puede eliminar debido a que se encuentra asignada a un funcionario');
END pEliminarSolicitud;

PROCEDURE pEliminarProducto (ivCodigoProducto VARCHAR2)
IS
BEGIN
    pkProducto.pBorrarProducto(ivCodigoProducto);
    EXCEPTION
    WHEN OTHERS THEN
	RAISE_APPLICATION_ERROR(-20000,'El Producto  '||ivCodigoProducto||' no se puede eliminar debido a que esta asociado a varios clientes');
END pEliminarProducto;

PROCEDURE pEliminarAsignacion (ivNumeroSolicitud VARCHAR2, ivCedulaFuncionario VARCHAR2)
IS
BEGIN
    pkAsignacion.pBorrarAsignacion(ivNumeroSolicitud, ivCedulaFuncionario);
END pEliminarAsignacion;


PROCEDURE pEliminarProductoCliente (ivNumeroProducto VARCHAR2)
IS
BEGIN
    pkProductoCliente.pBorrarProductoCliente(ivNumeroProducto);
END pEliminarProductoCliente;

PROCEDURE pEliminarTipo (ivTipo VARCHAR2)
IS
BEGIN
    pkTipo.pBorrarTipo(ivTipo);
    EXCEPTION
    WHEN OTHERS THEN
	RAISE_APPLICATION_ERROR(-20000,' No se puede eliminar debido a que varias solicitudes son de tipo ' ||ivTipo);
END pEliminarTipo;

END pkEliminar;
