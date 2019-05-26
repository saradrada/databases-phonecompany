CREATE OR REPLACE PACKAGE pkAsignacion AS

PROCEDURE pAsignacion (ivFecha DATE, ivFuncionarioId VARCHAR2, ivNumSolicitud VARCHAR2)

END pkAsignacion;/


CREATE OR REPLACE PACKAGE BODY pkAsignacion AS

PROCEDURE pAsignacion (ivFecha DATE, ivFuncionarioId VARCHAR2, ivNumSolicitud VARCHAR2)
IS 
BEGIN
	pkAsignacionNivel1 (ivFecha, ivFuncionarioId, ivNumSolicitud)
END 

	
END pkAsignacion;