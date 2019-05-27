
CREATE OR REPLACE PACKAGE "PKCONSULTA" AS 


FUNCTION fConsultarCliente (ivCedula VARCHAR2) return  VARCHAR2;
FUNCTION fConsultarFuncionario (ivCedula VARCHAR2) return  VARCHAR2;

FUNCTION fConsultarSolicitud_Funcionario (ivCedulaFuncionario VARCHAR2) return  VARCHAR2;
FUNCTION fConsultarSolicitud_Estado (ivEstado VARCHAR2) return  VARCHAR2;

FUNCTION fNumeroSolicitudesPorTipo(ivtipo solicitud.tipo_tipo%type) return NUMBER;
FUNCTION fConsultarSolicitud_Tipo (ivtipo VARCHAR2 ) return  VARCHAR2;

FUNCTION fNumeroSolicitudesPorCliente(ivCliente SOLICITUD.Cliente_Cedula%type) return NUMBER;
FUNCTION fConsultarSolicitud_Cliente(ivCliente VARCHAR2 ) return  VARCHAR2;
  
  END PKCONSULTA;
  /

CREATE OR REPLACE PACKAGE BODY PKCONSULTA AS

FUNCTION fConsultarCliente (ivCedula VARCHAR2) return  VARCHAR2
IS
    ovCliente VARCHAR2(100);
BEGIN
    SELECT pkCliente.fConsultarCliente(ivCedula) INTO ovCliente
    FROM dual; 
    return ovcliente;
END fConsultarCliente;

FUNCTION fConsultarFuncionario (ivCedula VARCHAR2) return  VARCHAR2
IS
    ovFuncionario VARCHAR2(100);
BEGIN
    SELECT pkFuncionario.fConsultarFuncionario(ivCedula) INTO ovFuncionario
    FROM dual; 
END fConsultarFuncionario;


FUNCTION fConsultarSolicitud_Funcionario(ivCedulaFuncionario VARCHAR2) return varchar2
IS
    vSolicitudes VARCHAR2(500);
    CURSOR cuConsulta IS
    SELECT Solicitud_numeroSolicitud
    FROM Asignacion 
    WHERE Funcionario_cedula = ivCedulaFuncionario;
BEGIN
    FOR rc IN cuConsulta LOOP
    vSolicitudes := vSolicitudes ||','|| rc.Solicitud_numeroSolicitud;
    END LOOP;
    RETURN vSolicitudes;
    
    EXCEPTION
    WHEN no_data_found THEN
    RAISE_APPLICATION_ERROR(-2000,'No se encontro ninguna asignacion con el numero de solicitud: '||ivCedulaFuncionario);

END fConsultarSolicitud_Funcionario;


FUNCTION fConsultarSolicitud_Estado (ivEstado VARCHAR2) RETURN VARCHAR2
IS
    Vaux Solicitud.NUMEROSOLICITUD%TYPE;
    Vaux2 Solicitud.OBSERVACION%TYPE;
    Vaux3 Solicitud.ESTADO%TYPE;
    Vaux4 Solicitud.PRODUCTO_CODIGO%TYPE;
    Vaux5 Solicitud.TIPO_TIPO%TYPE;
    Vaux6 Solicitud.CLIENTE_CEDULA%TYPE;
    vSolicitudes VARCHAR2 (4000);
    CURSOR cuConsulta IS
           select NUMEROSOLICITUD 
           from Solicitud
           where estado = ivEstado;
    CURSOR cuConsulta2 IS
            select OBSERVACION 
            from Solicitud
            where estado = ivEstado;
    CURSOR cuConsulta3 IS
            select ESTADO 
            from Solicitud
            where estado = ivEstado;
    CURSOR cuConsulta4 IS
            select PRODUCTO_CODIGO 
            from Solicitud
            where estado = ivEstado;
    CURSOR cuConsulta5 IS
            select TIPO_TIPO 
            from Solicitud
            where estado = ivEstado;
            
    CURSOR cuConsulta6 IS
            select CLIENTE_CEDULA 
            from Solicitud
            where estado = ivEstado;
BEGIN
    open cuConsulta;
    open cuConsulta2;
    open cuConsulta3;
    open cuConsulta4;
    open cuConsulta5;
    open cuConsulta6;
    loop
         fetch cuConsulta into Vaux;
         fetch cuConsulta2 into Vaux2;
         fetch cuConsulta3 into Vaux3;
         fetch cuConsulta4 into Vaux4;
         fetch cuConsulta5 into Vaux5;
         fetch cuConsulta6 into Vaux6;
         
        vSolicitudes := vSolicitudes||'NumSolicitud: '||Vaux||', Observacion: '||Vaux2||', Estado: '||Vaux3||', CodigoProducto: '||Vaux4||', Tipo: '||Vaux5||', CedulaCliente: '||Vaux6||CHR(10);
        EXIT when cuConsulta6%notfound;
    end loop;
    close cuConsulta6;
    close cuConsulta5;
    close cuConsulta4;
    close cuConsulta3;
    close cuConsulta2;
    close cuConsulta;
    return vSolicitudes;
    DBMS_OUTPUT.PUT_LINE(vSolicitudes);
    EXCEPTION
    WHEN no_data_found THEN
    DBMS_OUTPUT.PUT_LINE ('Registro no encontrado');
END fConsultarSolicitud_Estado;




FUNCTION fnumeroSolicitudesPorTipo(ivtipo solicitud.tipo_tipo%type) return number IS
numerosol number(10);
BEGIN
  SELECT count(*) into numerosol
  FROM SOLICITUD sol
  WHERE sol.tipo_tipo = ivtipo;
  RETURN numerosol;
EXCEPTION
  WHEN others THEN raise_application_error(-20000, 'No hay solicitudes con ese tipo. ');
END;
FUNCTION fConsultarSolicitud_Tipo (ivtipo VARCHAR2) RETURN VARCHAR2
IS
    Vaux Solicitud.NUMEROSOLICITUD%TYPE;
    Vaux2 Solicitud.OBSERVACION%TYPE;
    Vaux3 Solicitud.ESTADO%TYPE;
    Vaux4 Solicitud.PRODUCTO_CODIGO%TYPE;
    Vaux5 Solicitud.TIPO_TIPO%TYPE;
    Vaux6 Solicitud.CLIENTE_CEDULA%TYPE;
    vSolicitudes VARCHAR2 (4000);
    CURSOR cuConsulta IS
           select NUMEROSOLICITUD 
           from Solicitud
           where tipo_tipo = ivtipo;
    CURSOR cuConsulta2 IS
            select OBSERVACION 
            from Solicitud
            where tipo_tipo = ivtipo;
    CURSOR cuConsulta3 IS
            select ESTADO 
            from Solicitud
            where tipo_tipo = ivtipo;
    CURSOR cuConsulta4 IS
            select PRODUCTO_CODIGO 
            from Solicitud
            where tipo_tipo = ivtipo;
    CURSOR cuConsulta5 IS
            select TIPO_TIPO 
            from Solicitud
            where tipo_tipo = ivtipo;
            
    CURSOR cuConsulta6 IS
            select CLIENTE_CEDULA 
            from Solicitud
            where tipo_tipo = ivtipo;
BEGIN
    open cuConsulta;
    open cuConsulta2;
    open cuConsulta3;
    open cuConsulta4;
    open cuConsulta5;
    open cuConsulta6;
    FOR i IN 1..fnumeroSolicitudesPorTipo(ivtipo) LOOP
      
    
         fetch cuConsulta into Vaux;
         fetch cuConsulta2 into Vaux2;
         fetch cuConsulta3 into Vaux3;
         fetch cuConsulta4 into Vaux4;
         fetch cuConsulta5 into Vaux5;
         fetch cuConsulta6 into Vaux6;
         
        vSolicitudes := vSolicitudes||'NumSolicitud: '||Vaux||', Observacion: '||Vaux2||', Estado: '||Vaux3||', CodigoProducto: '||Vaux4||', Tipo: '||Vaux5||', CedulaCliente: '||Vaux6||CHR(10);
      
    end LOOP;
   
    close cuConsulta;
     close cuConsulta6;
    close cuConsulta5;
    close cuConsulta4;
    close cuConsulta3;
    close cuConsulta2;
    return vSolicitudes;
    DBMS_OUTPUT.PUT_LINE(vSolicitudes);
    EXCEPTION
    WHEN no_data_found THEN
    DBMS_OUTPUT.PUT_LINE ('Registro no encontrado');
END;


FUNCTION fNumeroSolicitudesPorCliente(ivCliente SOLICITUD.Cliente_Cedula%type) return NUMBER IS
numerosol number(10);
BEGIN
  SELECT count(*) into numerosol
  FROM SOLICITUD sol
  WHERE sol.cliente_cedula = ivCliente;
  RETURN numerosol;
EXCEPTION
  WHEN others THEN raise_application_error(-20000, 'No hay solicitudes con ese tipo. ');
END;

FUNCTION fConsultarSolicitud_Cliente(ivCliente VARCHAR2 ) return  VARCHAR2
IS
    Vaux Solicitud.NUMEROSOLICITUD%TYPE;
    Vaux2 Solicitud.OBSERVACION%TYPE;
    Vaux3 Solicitud.ESTADO%TYPE;
    Vaux4 Solicitud.PRODUCTO_CODIGO%TYPE;
    Vaux5 Solicitud.TIPO_TIPO%TYPE;
    Vaux6 Solicitud.CLIENTE_CEDULA%TYPE;
    vSolicitudes VARCHAR2 (4000);
    CURSOR cuConsulta IS
           select NUMEROSOLICITUD 
           from Solicitud
           where cliente_cedula = ivCliente;
    CURSOR cuConsulta2 IS
            select OBSERVACION 
            from Solicitud
            where cliente_cedula = ivCliente;
    CURSOR cuConsulta3 IS
            select ESTADO 
            from Solicitud
            where cliente_cedula = ivCliente;
    CURSOR cuConsulta4 IS
            select PRODUCTO_CODIGO 
            from Solicitud
            where cliente_cedula = ivCliente;
    CURSOR cuConsulta5 IS
            select TIPO_TIPO 
            from Solicitud
            where cliente_cedula = ivCliente;
            
    CURSOR cuConsulta6 IS
            select CLIENTE_CEDULA 
            from Solicitud
            where cliente_cedula = ivCliente;
BEGIN
    open cuConsulta;
    open cuConsulta2;
    open cuConsulta3;
    open cuConsulta4;
    open cuConsulta5;
    open cuConsulta6;
    FOR i IN 1..fnumeroSolicitudesPorCliente(ivCliente) LOOP
      
    
         fetch cuConsulta into Vaux;
         fetch cuConsulta2 into Vaux2;
         fetch cuConsulta3 into Vaux3;
         fetch cuConsulta4 into Vaux4;
         fetch cuConsulta5 into Vaux5;
         fetch cuConsulta6 into Vaux6;
         
        vSolicitudes := vSolicitudes||'NumSolicitud: '||Vaux||', Observacion: '||Vaux2||', Estado: '||Vaux3||', CodigoProducto: '||Vaux4||', Tipo: '||Vaux5||', CedulaCliente: '||Vaux6||CHR(10);
      
    end LOOP;
   
    close cuConsulta;
     close cuConsulta6;
    close cuConsulta5;
    close cuConsulta4;
    close cuConsulta3;
    close cuConsulta2;
    return vSolicitudes;
    DBMS_OUTPUT.PUT_LINE(vSolicitudes);
    EXCEPTION
    WHEN no_data_found THEN
    DBMS_OUTPUT.PUT_LINE ('Registro no encontrado');
END;

END pkConsulta;
/