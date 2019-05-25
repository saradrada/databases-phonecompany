CREATE OR REPLACE PACKAGE pkAtention AS

PROCEDURE pAtencion ( ivCedulaFuncionario VARCHAR2, ivNumeroSolicitud VARCHAR2);
FUNCTION fValidarSolicitudFuncionario (ivCedulaFuncionario VARCHAR2 , ivNumeroSolicitud VARCHAR2) return BOOLEAN;

END pkAtention;
/


CREATE OR REPLACE PACKAGE BODY pkAtention AS

FUNCTION  fValidarSolicitudFuncionario (ivCedulaFuncionario VARCHAR2 , ivNumeroSolicitud VARCHAR2) return  BOOLEAN
IS
	ovValidacion BOOLEAN; 
	vFuncionario VARCHAR2 (50);
	
BEGIN

    IF EXISTS(
        SELECT *
        FROM Asignacion 
        WHERE Solicitud_numeroSolicitud = ivNumeroSolicitud AND Funcionario_cedula = ivCedulaFuncionario
    ) 
    THEN 
        return TRUE;
    ELSE
        return FALSE;
    END IF;

END fValidarSolicitudFuncionario;


PROCEDURE pAtencion ( ivCedulaFuncionario VARCHAR2, ivNumeroSolicitud VARCHAR2)
IS
    vValidacion BOOLEAN;
BEGIN
	vValidacion := fValidarSolicitudFuncionario(ivCedulaFuncionario,ivNumeroSolicitud);
END pAtencion;



END pkAtention;