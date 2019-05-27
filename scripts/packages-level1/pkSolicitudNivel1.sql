CREATE OR REPLACE PACKAGE pkSolicitud AS
PROCEDURE pInsertarSolicitud( ivNumeroSolicitud VARCHAR2,ivObservacion  VARCHAR2,ivEstado  VARCHAR2,ivProductoCodigo VARCHAR2,ivCedulaCliente VARCHAR2,ivTipoCodigo VARCHAR2);
PROCEDURE pModificarSolicitud( ivNumeroSolicitud VARCHAR2,ivObservacion  VARCHAR2,ivEstado  VARCHAR2,ivProductoCodigo VARCHAR2,ivCedulaCliente VARCHAR2,ivTipoCodigo VARCHAR2);
PROCEDURE pModificarObservacionSolicitud(ivNumeroSolicitud VARCHAR2, ivObservacion VARCHAR2);
PROCEDURE pModificarEstadoSolicitud(ivNumeroSolicitud VARCHAR2, ivEstado VARCHAR2);
PROCEDURE pModificarClienteIdSolicitud(ivNumeroSolicitud VARCHAR2, ivCedulaCliente VARCHAR2);
PROCEDURE pModificarProductoCodigoSolicitud(ivNumeroSolicitud VARCHAR2, ivProductoCodigo VARCHAR2);
PROCEDURE pModificarTipoCodigoSolicitud(ivNumeroSolicitud VARCHAR2, ivTipoCodigo VARCHAR2);
PROCEDURE borrarSolicitud(ivNumeroSolicitud VARCHAR2);
FUNCTION fConsultarSolicitud (ivNumeroSolicitud VARCHAR2) return varchar2;
END pkSolicitud;
/



CREATE OR REPLACE PACKAGE BODY pkSolicitud AS

FUNCTION fConsultarSolicitud(ivNumeroSolicitud VARCHAR2) return varchar2
IS
	ovSolicitud VARCHAR2(400);
	vObservacion VARCHAR2(50);
	vEstado VARCHAR2(30);
	vProductoCodigo VARCHAR2(30);
	vTipoTipo VARCHAR2(30);
	vCedula VARCHAR2 (30);
	
BEGIN
	SELECT observacion INTO vObservacion 
	FROM Solicitud WHERE numeroSolicitud = ivNumeroSolicitud; 
	SELECT estado INTO vEstado
	FROM Solicitud WHERE numeroSolicitud = ivNumeroSolicitud;
	SELECT Cliente_cedula INTO vCedula
	FROM Solicitud WHERE numeroSolicitud = ivNumeroSolicitud;
	SELECT Producto_codigo INTO vProductoCodigo
	FROM Solicitud WHERE numeroSolicitud = ivNumeroSolicitud;
	SELECT Tipo_tipo INTO vTipoTipo
	FROM Solicitud WHERE numeroSolicitud = ivNumeroSolicitud;

	ovSolicitud := ivNumeroSolicitud ||','|| vObservacion ||','|| vEstado ||','|| vProductoCodigo ||','|| vTipoTipo || ',' || vCedula ;
	return ovSolicitud;

	EXCEPTION
	WHEN no_data_found THEN
	RAISE_APPLICATION_ERROR(-20000,'No existe ninguna solicitud con el codigo '||ivNumeroSolicitud);
	
END fConsultarSolicitud;



PROCEDURE pInsertarSolicitud( ivNumeroSolicitud VARCHAR2,ivObservacion  VARCHAR2,ivEstado  VARCHAR2,ivProductoCodigo VARCHAR2,ivCedulaCliente VARCHAR2,ivTipoCodigo VARCHAR2)
IS
BEGIN 
	INSERT INTO Solicitud
	VALUES (ivNumeroSolicitud ,ivObservacion ,ivEstado ,ivProductoCodigo ,ivCedulaCliente ,ivTipoCodigo);

	EXCEPTION
	WHEN DUP_VAL_ON_INDEX THEN
	RAISE_APPLICATION_ERROR(-20000,'Ya hay una solicitud con el codigo ' || ivNumeroSolicitud);
END pInsertarSolicitud;



PROCEDURE borrarSolicitud(ivNumeroSolicitud VARCHAR2)
IS
BEGIN
	DELETE
	FROM Solicitud
	WHERE Solicitud.numeroSolicitud = ivNumeroSolicitud;
	EXCEPTION
	WHEN no_data_found THEN
	RAISE_APPLICATION_ERROR(-20000,'No se encontro ninguna solicitud con el codigo '||ivNumeroSolicitud);
END borrarSolicitud;



PROCEDURE pModificarSolicitud( ivNumeroSolicitud VARCHAR2,ivObservacion  VARCHAR2,ivEstado  VARCHAR2,ivProductoCodigo VARCHAR2,ivCedulaCliente VARCHAR2,ivTipoCodigo VARCHAR2)
IS
BEGIN
	UPDATE Solicitud
	SET observacion = ivObservacion,
		estado = ivEstado,
		cliente_cedula = ivCedulaCliente,
		producto_codigo = ivProductoCodigo,
		tipo_tipo = ivTipoCodigo
	WHERE numerosolicitud = ivNumeroSolicitud;
	EXCEPTION
	WHEN no_data_found THEN
	   RAISE_APPLICATION_ERROR(-20000,'No se encontro ninguna solicitud con el codigo '||ivNumeroSolicitud);
END pModificarSolicitud;



PROCEDURE pModificarObservacionSolicitud(ivNumeroSolicitud VARCHAR2, ivObservacion VARCHAR2)
IS
BEGIN
	UPDATE Solicitud
	SET observacion =ivObservacion
	WHERE numeroSolicitud = ivNumeroSolicitud;
	EXCEPTION
	WHEN no_data_found THEN
	RAISE_APPLICATION_ERROR(-20000,'No se encontro ninguna solicitud con el codigo '||ivNumeroSolicitud);
END pModificarObservacionSolicitud;



PROCEDURE pModificarEstadoSolicitud(ivNumeroSolicitud VARCHAR2, ivEstado VARCHAR2)
IS
BEGIN
	UPDATE Solicitud
	SET estado =ivEstado
	WHERE numeroSolicitud = ivNumeroSolicitud;
	EXCEPTION
	WHEN no_data_found THEN
	RAISE_APPLICATION_ERROR(-20000,'No se encontro ninguna solicitud con el codigo '||ivNumeroSolicitud);
END pModificarEstadoSolicitud;



PROCEDURE pModificarClienteIdSolicitud(ivNumeroSolicitud VARCHAR2, ivCedulaCliente VARCHAR2)
IS
BEGIN
	UPDATE Solicitud
	SET Cliente_cedula =ivCedulaCliente
	WHERE numeroSolicitud = ivNumeroSolicitud;
	EXCEPTION
	WHEN no_data_found THEN
	RAISE_APPLICATION_ERROR(-20000,'No se encontro ninguna solicitud con el codigo '||ivNumeroSolicitud);
END pModificarClienteIdSolicitud;



PROCEDURE pModificarProductoCodigoSolicitud(ivNumeroSolicitud VARCHAR2, ivProductoCodigo VARCHAR2)
IS
BEGIN
	UPDATE Solicitud
	SET Producto_codigo =ivProductoCodigo
	WHERE numeroSolicitud = ivNumeroSolicitud;
	EXCEPTION
	WHEN no_data_found THEN
	RAISE_APPLICATION_ERROR(-20000,'No se encontro ninguna solicitud con el codigo '||ivNumeroSolicitud);
END pModificarProductoCodigoSolicitud;



PROCEDURE pModificarTipoCodigoSolicitud(ivNumeroSolicitud VARCHAR2, ivTipoCodigo VARCHAR2)
IS
BEGIN
	UPDATE Solicitud
	SET Tipo_tipo = ivTipoCodigo
	WHERE numeroSolicitud = ivNumeroSolicitud;
	EXCEPTION
	WHEN no_data_found THEN
	RAISE_APPLICATION_ERROR(-20000,'No se encontro ninguna solicitud con el codigo '||ivNumeroSolicitud);
END pModificarTipoCodigoSolicitud;

END pkSolicitud;