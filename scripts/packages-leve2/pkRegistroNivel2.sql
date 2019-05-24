CREATE OR REPLACE PACKAGE pkRegistro AS

PROCEDURE pRegistrarSolicitudCreacion (ivCedulaCliente VARCHAR2,ivObservacion VARCHAR2,ivTipoProducto VARCHAR2)
PROCEDURE pRegistrarSolicitudModificacion (ivProductoCodigo VARCHAR2, ivCedulaCliente VARCHAR2, ivObservacion VARCHAR2, ivTipoProducto VARCHAR2 )
PROCEDURE pRegistrarSolicitudCancelacion ( ivProductoCodigo VARCHAR2 , ivCedulaCliente VARCHAR2 , ivObservacion VARCHAR2)
PROCEDURE pRegistrarSolicitudReclamo ( ivProductoCodigo VARCHAR2 , ivCedulaCliente VARCHAR2, ivObservacion VARCHAR2)
FUNCTION fConsultarNumLibre () return  VARCHAR2

END pkRegistro;/



CREATE OR REPLACE PACKAGE BODY pkRegistro AS

FUNCTION  fConsultarNumLibre () return  VARCHAR2
IS
	ovNumero VARCHAR2(50);
	vUltimaSolicitud VARCHAR2(50);	
BEGIN
	SELECT MAX(numSolicitud) INTO vUltimaSolicitud
	FROM Solicitud
	CONVERT(int,vUltimaSolicitud)
	--Verificar que este convert funcione solamente llamandolo
	ovNumero := vUltimaSolicitud+1; 
	return ovNumero;
END



--VERIFICAR COMO HACER LA CREACION 
PROCEDURE pRegistrarSolicitudCreacion (ivCedulaCliente VARCHAR2, ivObservacion VARCHAR2, ivTipoProducto VARCHAR2)
IS
	vNumero VARCHAR2(50);
	vNumero := fConsultarNumLibre();
BEGIN
	pkSolicitudNivel1.pInsertarSolicitud( vNumero,ivObservacion, 'Nuevo' ,ivProductoCodigo VARCHAR2, ivCedulaCliente , 'A0') -- Tipo de registro, quemado en las tablas
END



PROCEDURE pRegistrarSolicitudModificacion (ivProductoCodigo VARCHAR2, ivCedulaCliente VARCHAR2, ivObservacion VARCHAR2, ivTipoProducto VARCHAR2 )
IS
	vNumero VARCHAR2(50);
	vNumero := fConsultarNumLibre();
BEGIN
	pkSolicitudNivel1.pInsertarSolicitud( vNumero, ivObservacion, 'Nuevo' ,ivProductoCodigo, ivCedulaCliente , 'B1') -- Tipo de registro, quemado en las tablas
END



PROCEDURE pRegistrarSolicitudCancelacion ( ivProductoCodigo VARCHAR2 , ivCedulaCliente VARCHAR2 , ivObservacion VARCHAR2)
IS
	vNumero VARCHAR2(50);
	vNumero := fConsultarNumLibre();	
BEGIN
	pkSolicitudNivel1.pInsertarSolicitud( vNumero, ivObservacion, 'Nuevo' ,ivProductoCodigo, ivCedulaCliente , 'C2') -- Tipo de registro, quemado en las tablas
END



PROCEDURE pRegistrarSolicitudReclamo ( ivProductoCodigo VARCHAR2 , ivCedulaCliente VARCHAR2, ivObservacion VARCHAR2)
IS
	vNumero VARCHAR2(50);
	vNumero := fConsultarNumLibre();
BEGIN
	pkSolicitudNivel1.pInsertarSolicitud( vNumero, ivObservacion, 'Nuevo' ,ivProductoCodigo, ivCedulaCliente , 'D3') -- Tipo de registro, quemado en las tablas
END

END pkRegistro;