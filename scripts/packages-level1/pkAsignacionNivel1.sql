CREATE OR REPLACE PACKAGE pkAsignacion AS

PROCEDURE pInsertarAsignacion (ivFecha Date, ivSolicitudNumero VARCHAR2, ivFuncionarioCedula VARCHAR2);
PROCEDURE pModificarAsignacion (ivFecha Date, ivSolicitudNumero VARCHAR2, ivFuncionarioCedula VARCHAR2);
PROCEDURE pBorrarAsignacion (ivSolicitudNumero VARCHAR2, ivFuncionarioCedula VARCHAR2);
FUNCTION fConsultarAsignacion (ivSolicitudNumero VARCHAR2, ivFuncionarioCedula VARCHAR2) return varchar2;

END pkAsignacion;
/

CREATE OR REPLACE PACKAGE BODY pkAsignacion AS

PROCEDURE pInsertarAsignacion(ivFecha Date, ivSolicitudNumero VARCHAR2, ivFuncionarioCedula VARCHAR2)
IS 
BEGIN 
	INSERT INTO Asignacion
	VALUES (ivFecha ,ivSolicitudNumero,ivFuncionarioCedula );
END pInsertarAsignacion;


PROCEDURE pModificarAsignacion(ivFecha Date, ivSolicitudNumero VARCHAR2, ivFuncionarioCedula VARCHAR2)
IS
BEGIN
	UPDATE Asignacion
	SET fecha = ivFecha
	WHERE Solicitud_numeroSolicitud = ivSolicitudNumero
    AND Funcionario_cedula = ivFuncionarioCedula;
	EXCEPTION
	WHEN no_data_found THEN
	   RAISE_APPLICATION_ERROR(-20000,'No se encontro asignación con número de solicitud: '||ivSolicitudNumero);
END pModificarAsignacion;

PROCEDURE pBorrarAsignacion(ivSolicitudNumero VARCHAR2, ivFuncionarioCedula VARCHAR2)
IS
BEGIN
	DELETE
	FROM Asignacion
	WHERE Asignacion.solicitud_numerosolicitud = ivSolicitudNumero
    AND asignacion.funcionario_cedula = ivFuncionarioCedula;
	EXCEPTION
	WHEN no_data_found THEN
	RAISE_APPLICATION_ERROR(-20000,'No se encontro asignación con número de solicitud: '||ivSolicitudNumero);
END pBorrarAsignacion;

FUNCTION fConsultarAsignacion(ivSolicitudNumero VARCHAR2, ivFuncionarioCedula VARCHAR2) return varchar2
IS
	ovAsignacion VARCHAR2(400);
	vFecha DATE	;

	
BEGIN
	SELECT fecha INTO vFecha 
	FROM Asignacion 
	WHERE Asignacion.solicitud_numerosolicitud = ivSolicitudNumero
    AND asignacion.funcionario_cedula = ivFuncionarioCedula;
    

	ovAsignacion := vFecha ||','|| ivSolicitudNumero ||','|| ivFuncionarioCedula;
	return ovAsignacion;

	EXCEPTION
	WHEN no_data_found THEN
	RAISE_APPLICATION_ERROR(-20000,'No se encontro asignación con número de solicitud: '||ivSolicitudNumero);
	
END fConsultarAsignacion;


END pkAsignacion;