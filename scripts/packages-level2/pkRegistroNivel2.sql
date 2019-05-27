CREATE OR REPLACE PACKAGE pkRegistro AS

PROCEDURE pRegistrarSolicitudCreacion (ivProductoCodigo VARCHAR2, ivCedulaCliente VARCHAR2,ivObservacion VARCHAR2,ivTipoProducto VARCHAR2);
PROCEDURE pRegistrarSolicitudModificacion (ivProductoCodigo VARCHAR2, ivCedulaCliente VARCHAR2, ivObservacion VARCHAR2, ivTipoProducto VARCHAR2 );
PROCEDURE pRegistrarSolicitudCancelacion ( ivProductoCodigo VARCHAR2 , ivCedulaCliente VARCHAR2 , ivObservacion VARCHAR2);
PROCEDURE pRegistrarSolicitudReclamo ( ivProductoCodigo VARCHAR2 , ivCedulaCliente VARCHAR2, ivObservacion VARCHAR2);
PROCEDURE pRegistrarCliente (ivId VARCHAR2,ivContrasenha VARCHAR2,ivNombre VARCHAR2, ivCedula VARCHAR2,ivDireccion VARCHAR2, ivFecha DATE, ivTelefono VARCHAR2);
PROCEDURE pRegistrarFuncionario(ivId VARCHAR2,ivContrasena VARCHAR2,ivNombre VARCHAR2, ivCedula VARCHAR2,ivDireccion VARCHAR2, ivFecha DATE, ivTelefono VARCHAR2);
PROCEDURE pRegistrarProducto(ivCodigo VARCHAR2, ivDescripcion VARCHAR2);
FUNCTION fConsultarNumLibre return  VARCHAR2;
END pkRegistro;
/


CREATE OR REPLACE PACKAGE BODY pkRegistro AS

FUNCTION  fConsultarNumLibre return  VARCHAR2
IS
	ovNumero VARCHAR2(50);
	vUltimaSolicitud VARCHAR2(50);	
BEGIN
	SELECT CAST(MAX(numeroSolicitud) AS int) INTO vUltimaSolicitud
	FROM Solicitud;

	--Verificar que este convert funcione solamente llamandolo
	ovNumero := vUltimaSolicitud+1; 
	return ovNumero;
END fConsultarNumLibre;



--VERIFICAR COMO HACER LA CREACION 
PROCEDURE pRegistrarSolicitudCreacion (ivProductoCodigo VARCHAR2,ivCedulaCliente VARCHAR2, ivObservacion VARCHAR2, ivTipoProducto VARCHAR2)
IS
	vNumero VARCHAR2(50);
BEGIN
    vNumero := fConsultarNumLibre;
	pkSolicitud.pInsertarSolicitud( vNumero,ivObservacion, 'Nuevo' ,ivProductoCodigo, ivCedulaCliente , 'A0'); -- Tipo de registro, quemado en las tablas
END pRegistrarSolicitudCreacion;



PROCEDURE pRegistrarSolicitudModificacion (ivProductoCodigo VARCHAR2, ivCedulaCliente VARCHAR2, ivObservacion VARCHAR2, ivTipoProducto VARCHAR2 )
IS
	vNumero VARCHAR2(50);
BEGIN
    vNumero := fConsultarNumLibre();
	pkSolicitud.pInsertarSolicitud( vNumero, ivObservacion, 'Nuevo' ,ivProductoCodigo, ivCedulaCliente , 'B1'); -- Tipo de registro, quemado en las tablas
END pRegistrarSolicitudModificacion;



PROCEDURE pRegistrarSolicitudCancelacion ( ivProductoCodigo VARCHAR2 , ivCedulaCliente VARCHAR2 , ivObservacion VARCHAR2)
IS
	vNumero VARCHAR2(50);
BEGIN
    vNumero := fConsultarNumLibre();	
	pkSolicitud.pInsertarSolicitud( vNumero, ivObservacion, 'Nuevo' ,ivProductoCodigo, ivCedulaCliente , 'C2'); -- Tipo de registro, quemado en las tablas
END pRegistrarSolicitudCancelacion;



PROCEDURE pRegistrarSolicitudReclamo ( ivProductoCodigo VARCHAR2 , ivCedulaCliente VARCHAR2, ivObservacion VARCHAR2)
IS
	vNumero VARCHAR2(50);
BEGIN
    vNumero := fConsultarNumLibre();
	pkSolicitud.pInsertarSolicitud( vNumero, ivObservacion, 'Nuevo' ,ivProductoCodigo, ivCedulaCliente , 'D3'); -- Tipo de registro, quemado en las tablas
END pRegistrarSolicitudReclamo;


PROCEDURE pRegistrarCliente (ivId VARCHAR2,ivContrasenha VARCHAR2,ivNombre VARCHAR2, ivCedula VARCHAR2,ivDireccion VARCHAR2, ivFecha DATE, ivTelefono VARCHAR2)
IS
BEGIN
    pkCliente.pInsertarCliente(ivId,ivNombre,ivContrasenha,ivCedula,ivDireccion,ivFecha,ivTelefono);
END pRegistrarCliente;



PROCEDURE pRegistrarFuncionario(ivId VARCHAR2,ivContrasena VARCHAR2,ivNombre VARCHAR2, ivCedula VARCHAR2,ivDireccion VARCHAR2, ivFecha DATE, ivTelefono VARCHAR2)
IS
BEGIN
    pkFuncionario.pInsertarFuncionario(ivId,ivNombre,ivContrasena,ivCedula,ivDireccion,ivFecha,ivTelefono);
END pRegistrarFuncionario;



PROCEDURE pRegistrarProducto(ivCodigo VARCHAR2, ivDescripcion VARCHAR2)
IS
BEGIN
    pkProducto.pInsertarProducto(ivCodigo ,ivDescripcion);
END pRegistrarProducto;


END pkRegistro;