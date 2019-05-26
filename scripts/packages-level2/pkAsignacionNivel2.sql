CREATE OR REPLACE PACKAGE pkAsignacionNivel2 AS

   
    PROCEDURE pAsignarSolicitud ( ivNumSolicitud IN SOLICITUD.NUMEROSOLICITUD%TYPE );
    PROCEDURE pAsignacionMasiva;
    PROCEDURE pAsignacionDirecta(vNumeroSolicitud IN SOLICITUD.NUMEROSOLICITUD%TYPE, 
                                 vCedulaFuncionario IN FUNCIONARIO.CEDULA%TYPE);
END pkAsignacionNivel2;
/


CREATE OR REPLACE PACKAGE BODY pkAsignacionNivel2 IS
   

--Es utilizado por el trigger de asignacion
    PROCEDURE pAsignarSolicitud (ivNumSolicitud IN SOLICITUD.NUMEROSOLICITUD%TYPE ) 
   IS
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
         when others then raise_application_error(-20000, 'error en asignar solicitud: '||sqlerrm);
    end pasignarSolicitud;


    PROCEDURE pAsignacionMasiva 
       IS
     
        cursor cuSolicitudes is
       select codigo 
       from SOLICITUD
       where estado = 'Pendiente'
       and (sysdate - Fecha) >= 4; 
        BEGIN
      for solicitud in cuSolicitudes Loop
         pasignarSolicitud(solicitud.codigo);    
      end loop;
        exception
            when others then raise_application_error(-20000, 'error en asignar masiva: '||sqlerrm);
    END pAsignacionMasiva;

    PROCEDURE pAsignacionDirecta(ivCodigoSolicitud IN solicitud.numerosolicitud%TYPE, 
                             ivCedulaFuncionario IN FUNCIONARIO.CEDULA%TYPE)
        IS
        begin
        PKASIGNACION.pInsertarAsignacion(sysdate, ivCodigoSolicitud,ivCedulaFuncionario);
        UPDATE SOLICITUD SET SOLICITUD.ESTADO = 'Asignada' WHERE SOLICITUD.NumeroSolicitud=ivCodigoSolicitud;
        exception 
        when others then raise_application_error(-20000, 'Ocurrio un error en asignacion directa: '||sqlerrm);
    END pAsignacionDirecta; 
    
END pkAsignacionNivel2;

CREATE OR REPLACE TRIGGER trg_asignacionAutomatica
    AFTER 
    INSERT ON SOLICITUD
    declare
    numero number;
        BEGIN
            select SEC_SOLICITUD.currval into numero from dual;
        pkAsignacionNivel2.pAsignarSolicitud(numero);
    END trg_asignacionAutomatica;