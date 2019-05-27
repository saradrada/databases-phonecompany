CREATE OR REPLACE PACKAGE pkAtention AS

PROCEDURE pAtencion ( ivCedulaFuncionario VARCHAR2, ivNumeroSolicitud VARCHAR2);
FUNCTION fValidarSolicitudFuncionario (ivCedulaFuncionario VARCHAR2 , ivNumeroSolicitud VARCHAR2) return BOOLEAN;
PROCEDURE patencionMasiva;

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

PROCEDURE pAtencionMasiva 
IS
  
        cursor cuSolicitudes is
       select NUMEROSOLICITUD, FECHA 
       from SOLICITUD INNER JOIN ASIGNACION ON SOLICITUD.NUMEROSOLICITUD=ASIGNACION.SOLICITUD_NUMEROSOLICITUD
       where estado = 'Asignada'  and tipo = 'DANHO' or tipo = 'RECLAMO'
       and (sysdate - FECHA) >= 4 ; 
        BEGIN
      for solicitud in cuSolicitudes Loop
        pAtencion ( asignacion.FUNCIONARIO_CEDULA, solicitud.SOLICITUD_NUMEROSOLICITUD);    
      end loop;
    exception
  when others then raise_application_error(-20000, 'error en asignar masiva: '||sqlerrm);

END patencionMasiva;




END pkAtention;