CREATE OR REPLACE PACKAGE pkModificar AS

PROCEDURE pModificarCliente(ivId VARCHAR2, ivContrasenha VARCHAR2,ivNombre VARCHAR2,ivCedula VARCHAR2,ivDireccion VARCHAR2, ivFecha DATE, ivTelefono VARCHAR2);
PROCEDURE pModificarFuncionario(ivId VARCHAR2, ivContrasena VARCHAR2,ivNombre VARCHAR2,ivCedula VARCHAR2,ivDireccion VARCHAR2, ivFecha DATE, ivTelefono VARCHAR2);
PROCEDURE pModificarProducto (ivCodigo VARCHAR2, ivDescripcion VARCHAR2);
PROCEDURE pModificarSolicitud( ivNumeroSolicitud VARCHAR2,ivObservacion  VARCHAR2,ivEstado  VARCHAR2,ivProductoCodigo VARCHAR2,ivCedulaCliente VARCHAR2,ivTipoCodigo VARCHAR2);
PROCEDURE pModificarTipo (ivTipo VARCHAR2, ivDescripcion VARCHAR2);
END pKModificar;
/

CREATE OR REPLACE PACKAGE BODY pkModificar AS 

PROCEDURE pModificarCliente(ivId VARCHAR2, ivContrasenha VARCHAR2,ivNombre VARCHAR2,ivCedula VARCHAR2,ivDireccion VARCHAR2, ivFecha DATE, ivTelefono VARCHAR2)
IS
BEGIN
    pkCliente.pModificarCliente(ivId, ivContrasenha, ivNombre, ivCedula, ivDireccion, ivFecha, ivTelefono);
END pModificarCliente;

PROCEDURE pModificarFuncionario(ivId VARCHAR2, ivContrasena VARCHAR2,ivNombre VARCHAR2,ivCedula VARCHAR2,ivDireccion VARCHAR2, ivFecha DATE, ivTelefono VARCHAR2)
IS
BEGIN 
    pkFuncionario.pModificarFuncionario(ivId,ivContrasena,ivNombre,ivCedula,ivDireccion,ivFecha,ivTelefono);
END pModificarFuncionario;

PROCEDURE pModificarProducto (ivCodigo VARCHAR2, ivDescripcion VARCHAR2)
IS
BEGIN 
    pkProducto.pModificarProducto(ivCodigo,ivDescripcion);
END pModificarProducto;

PROCEDURE pModificarSolicitud( ivNumeroSolicitud VARCHAR2,ivObservacion  VARCHAR2,ivEstado  VARCHAR2,ivProductoCodigo VARCHAR2,ivCedulaCliente VARCHAR2,ivTipoCodigo VARCHAR2)
IS
BEGIN
    pkSolicitud.pModificarSolicitud(ivNumeroSolicitud,ivObservacion,ivEstado,ivProductoCodigo,ivCedulaCliente,ivTipoCodigo);
END pModificarSolicitud;

PROCEDURE pModificarTipo (ivTipo VARCHAR2, ivDescripcion VARCHAR2)
IS
BEGIN
    pkTipo.pModificarDescripcionTipo(ivTipo,ivDescripcion);
END pModificarTipo;


END pkModificar;
