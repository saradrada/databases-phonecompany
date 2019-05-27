CREATE OR REPLACE PACKAGE pkAsignacionNivel2 AS

    --Representa el procedimiento de asignar una solicitud al funcionario
    --Entrada: El numero de la solicitud
    PROCEDURE pAsignarSolicitud ( ivNumSolicitud IN SOLICITUD.NUMEROSOLICITUD%TYPE );
    
    --Representa el procedimiento de realizar una asignacion directa con el funcionario
    --Entrada: El número de la solicitud y la cedula del funcionario
    PROCEDURE pAsignacionDirecta(vNumeroSolicitud IN SOLICITUD.NUMEROSOLICITUD%TYPE,vCedulaFuncionario IN FUNCIONARIO.CEDULA%TYPE);
   
    --Represeta el procedimiento de asignacion cuando existen muchas asiganciones
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
  
        cursor cuSolicitudes is
       select NUMEROSOLICITUD, FECHA 
       from SOLICITUD INNER JOIN ASIGNACION ON SOLICITUD.NUMEROSOLICITUD=ASIGNACION.SOLICITUD_NUMEROSOLICITUD
       where estado = 'Pendiente'
       and (sysdate - FECHA) >= 4 ; 
        BEGIN
      for solicitud in cuSolicitudes Loop
         pAsignarSolicitud(solicitud.NUMEROSOLICITUD);    
      end loop;
    exception
  when others then raise_application_error(-20000, 'error en asignar masiva: '||sqlerrm);

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
   

