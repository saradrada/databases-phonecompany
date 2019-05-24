CREATE OR REPLACE PACKAGE pkAtention AS

PROCEDURE pAtencion ( ivCedulaFuncionario VARCHAR2, ivNumeroSolicitud VARCHAR2)
FUNCTION fValidarSolicitudFuncionario (ivCedulaFuncionario VARCHAR2 , ivNumeroSolicitud VARCHAR2) return BOOLEAN

END pkAtention;/


CREATE OR REPLACE PACKAGE BODY pkAtention AS

FUNCTION  fValidarSolicitudFuncionario (ivCedulaFuncionario VARCHAR2 , ivNumeroSolicitud VARCHAR2) return  VARCHAR2
IS
	ovValidacion BOOLEAN; 
	vFuncionario VARCHAR2 (50);
	
BEGIN
	SELECT s.cedulaFuncionario INTO vFuncionario
	FROM Solicitud s
	WHERE s.num
END


PROCEDURE pAtencion ( ivCedulaFuncionario VARCHAR2, ivNumeroSolicitud VARCHAR2)
IS
BEGIN
	

END



END pkAtention;