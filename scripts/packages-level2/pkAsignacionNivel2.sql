CREATE OR REPLACE PACKAGE pkAsignacionNivel2 AS

   
    PROCEDURE pAsignarSolicitud ( ivNumSolicitud IN SOLICITUD.NUMEROSOLICITUD%TYPE );
     PROCEDURE pAsignacionDirecta(vNumeroSolicitud IN SOLICITUD.NUMEROSOLICITUD%TYPE, 
                                 vCedulaFuncionario IN FUNCIONARIO.CEDULA%TYPE);
    PROCEDURE pAsignacionMasiva;
   
END pkAsignacionNivel2;
/


CREATE OR REPLACE PACKAGE BODY pkAsignacionNivel2 IS
   

--Es utilizado por el trigger de asignacion
    PROCEDURE pAsignarSolicitud (ivNumSolicitud IN SOLICITUD.NUMEROSOLICITUD%TYPE ) 
   IS
   ovNumber number;
    BEGIN
    FOR i IN (SELECT FUNCIONARIO.CEDULA FROM FUNCIONARIO) LOOP
        SELECT COUNT(FUNCIONARIO.CEDULA)INTO ovNumber FROM FUNCIONARIO INNER JOIN SOLICITUD ON FUNCIONARIO.CEDULA=SOLICITUD.CLIENTE_CEDULA
        WHERE FUNCIONARIO.CEDULA=i.CEDULA;
        IF ovNumber <=3 THEN
            INSERT INTO ASIGNACION values(sysdate,ivNumSolicitud,i.CEDULA);
            UPDATE SOLICITUD SET SOLICITUD.ESTADO = 'Asignada' WHERE SOLICITUD.NumeroSolicitud=ivNumSolicitud;
            EXIT;
        END IF;
    END LOOP;
        exception
         when others then raise_application_error(-20000, 'error en asignar solicitud '||sqlerrm);
    end pasignarSolicitud;

 PROCEDURE pAsignacionDirecta(vNumeroSolicitud IN SOLICITUD.NUMEROSOLICITUD%TYPE, 
                                 vCedulaFuncionario IN FUNCIONARIO.CEDULA%TYPE)
        IS
        begin
        PKASIGNACION.pInsertarAsignacion(sysdate, vNumeroSolicitud,vCedulaFuncionario);
        UPDATE SOLICITUD SET SOLICITUD.ESTADO = 'Asignada' WHERE SOLICITUD.NumeroSolicitud=vNumeroSolicitud;
        exception 
        when others then raise_application_error(-20000, 'Ocurrio un error en asignacion directa '||sqlerrm);
    END pAsignacionDirecta; 
    
    PROCEDURE pAsignacionMasiva 
       IS
      FOR i IN (SELECT solicitud.numerosolicitud,ASIGNACION.fecha FROM ASIGNACION INNER JOIN SOLICITUD ON ASIGNACION.SOLICITUD_NUMEROSOLICITUD=solicitud.numerosolicitud) LOOP
        SELECT ASIGNACION.fecha INTO ovDate FROM ASIGNACION 
        WHERE SOLICITUD.numerosolicitud=i.numerosolicitud;
        IF SYSDATE-ovDate>=4 THEN
            pkAsignacionNivel2.pAsignarSolicitud(i.numerosolicitud);
        END IF;
    END LOOP;
        exception
            when others then raise_application_error(-20000, 'error en asignar masiva '||sqlerrm);
    END pAsignacionMasiva;

   
    
END pkAsignacionNivel2;
/
CREATE OR REPLACE TRIGGER trg_asignacionAutomatica
    AFTER 
    INSERT ON SOLICITUD
    declare
    vNumeroSolicitud VARCHAR2(10);
        BEGIN
          SELECT numeroSolicitud INTO vNumeroSolicitud
   FROM SOLICITUD;
        pkAsignacionNivel2.pAsignarSolicitud(vNumeroSolicitud);
    END trg_asignacionAutomatica;
   

