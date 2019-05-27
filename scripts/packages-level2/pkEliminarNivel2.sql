CREATE OR REPLACE PACKAGE pkEliminar AS

PROCEDURE pEliminarCliente (ivCedulaCliente VARCHAR2);
PROCEDURE pEliminarFuncionario (ivCedulaFuncionario VARCHAR2);
PROCEDURE pEliminarSolicitud (ivNumeroSolicitud VARCHAR2);
PROCEDURE pEliminarProducto (ivCodigoProducto VARCHAR2);
PROCEDURE pEliminarAsignacion (ivNumeroSolicitud VARCHAR2, ivCedulaFuncionario VARCHAR2);
PROCEDURE pEliminarProductoCliente (ivNumeroProducto VARCHAR2);
PROCEDURE pEliminarTipo (ivTipo VARCHAR2);
END pkRegistro;
/


PROCEDURE pEliminarCliente (ivCedulaCliente VARCHAR2)
IS
BEGIN
    pkCliente.pEliminarCliente(ivCedulaCliente);
END pEliminarCliente;


PROCEDURE pEliminarFuncionario (ivCedulaFuncionario VARCHAR2)
IS
BEGIN
    pkFuncionario.pEliminarFuncionario(ivCedulaFuncionario);
END pEliminarFuncionario;


PROCEDURE pEliminarSolicitud (ivNumeroSolicitud VARCHAR2)
IS
BEGIN
    pkSolicitud.borrarSolicitud(ivNumeroSolicitud);
END pEliminarSolicitud;

PROCEDURE pEliminarProducto (ivCodigoProducto VARCHAR2)
IS
BEGIN
    pkProducto.pBorrarProducto(ivCododigoProducto);
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
END pEliminarTipo;


