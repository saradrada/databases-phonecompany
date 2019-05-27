
CREATE OR REPLACE PACKAGE pkConsulta AS 


FUNCTION fConsultarCliente (ivCedula VARCHAR2) return  VARCHAR2;
FUNCTION fConsultarFuncionario (ivCedula VARCHAR2) return  VARCHAR2;
FUNCTION fConsultarSolicitud (ivNumeroSolicitud VARCHAR2) return VARCHAR2;

FUNCTION fConsultarSolicitud_Funcionario (ivCedulaFuncionario VARCHAR2) return  VARCHAR2;

FUNCTION fNumeroSolicitudesPorEstado(ivEstado Solicitud.estado%type) return NUMBER;
FUNCTION fConsultarSolicitud_Estado (ivEstado VARCHAR2) return  VARCHAR2;

FUNCTION fNumeroSolicitudesPorTipo(ivtipo solicitud.tipo_tipo%type) return NUMBER;
FUNCTION fConsultarSolicitud_Tipo (ivtipo VARCHAR2 ) return  VARCHAR2;

FUNCTION fNumeroSolicitudesPorCliente(ivCliente SOLICITUD.Cliente_Cedula%type) return NUMBER;
FUNCTION fConsultarSolicitud_Cliente(ivCliente VARCHAR2 ) return  VARCHAR2;
  
END pkConsulta;
/

CREATE OR REPLACE PACKAGE BODY pkConsulta AS

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
    return ovFuncionario;
END fConsultarFuncionario;


FUNCTION fConsultarSolicitud (ivNumeroSolicitud VARCHAR2) return VARCHAR2
IS
    ovSolicitud			VARCHAR2(400);
    vObservacion        VARCHAR2(30);
	vEstado				VARCHAR2(30);
	vProductoCodigo     VARCHAR2(30);
    vTipo               VARCHAR2(50);
    vCliente            VARCHAR(50);
    
    BEGIN
    
	SELECT observacion INTO vObservacion
	FROM Solicitud WHERE numeroSolicitud = ivNumeroSolicitud;
	SELECT estado INTO vEstado
	FROM Solicitud WHERE numeroSolicitud = ivNumeroSolicitud;
	SELECT Producto_codigo INTO vProductoCodigo
	FROM Solicitud WHERE numeroSolicitud = ivNumeroSolicitud;
	SELECT Tipo_tipo INTO vTipo
	FROM Solicitud WHERE numeroSolicitud = ivNumeroSolicitud;
	SELECT Cliente_cedula INTO vCliente
	FROM Solicitud WHERE numeroSolicitud = ivNumeroSolicitud;
	
 
    ovSolicitud := vObservacion||','||vEstado||','||vProductoCodigo||','||vTipo||','||vCliente||CHR(10);
    return ovSolicitud;
	

	EXCEPTION
	WHEN no_data_found THEN
	RAISE_APPLICATION_ERROR(-20000,'No existe ninguna solicitud con el codigo '||ivNumeroSolicitud);
    
    
END fConsultarSolicitud;
   

FUNCTION fConsultarSolicitud_Funcionario(ivCedulaFuncionario VARCHAR2) return VARCHAR2
IS
    ovSolicitudes VARCHAR2(500);
    CURSOR cuConsulta IS
    SELECT Solicitud_numeroSolicitud
    FROM Asignacion 
    WHERE Funcionario_cedula = ivCedulaFuncionario;    
    
BEGIN
    FOR rc IN cuConsulta LOOP
    ovSolicitudes := ovSolicitudes ||''|| rc.Solicitud_numeroSolicitud ||','|| fConsultarSolicitud(rc.Solicitud_numeroSolicitud)||CHR(10);
    END LOOP;
    RETURN ovSolicitudes;
    
    EXCEPTION
    WHEN no_data_found THEN
    RAISE_APPLICATION_ERROR(-2000,'No se encontro ninguna asignacion al funcionario: '||ivCedulaFuncionario);

END fConsultarSolicitud_Funcionario;


FUNCTION fNumeroSolicitudesPorEstado(ivEstado SOLICITUD.estado%type) return NUMBER IS
numerosol number(10);
BEGIN
  SELECT count(*) into numerosol
  FROM SOLICITUD sol
  WHERE sol.estado = ivEstado;
  RETURN numerosol;
EXCEPTION
  WHEN others THEN raise_application_error(-20000, 'No hay solicitudes con ese tipo. ');
END;

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
    FOR i IN 1..fnumeroSolicitudesPorEstado(ivEstado) LOOP
         fetch cuConsulta into Vaux;
         fetch cuConsulta2 into Vaux2;
         fetch cuConsulta3 into Vaux3;
         fetch cuConsulta4 into Vaux4;
         fetch cuConsulta5 into Vaux5;
         fetch cuConsulta6 into Vaux6;
         
        vSolicitudes := vSolicitudes||''||Vaux||','||Vaux2||','||Vaux3||','||Vaux4||','||Vaux5||','||Vaux6||CHR(10);
        EXIT when cuConsulta6%notfound;
    END LOOP;
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
END;

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
         
        vSolicitudes := vSolicitudes||''||Vaux||','||Vaux2||','||Vaux3||','||Vaux4||','||Vaux5||','||Vaux6||CHR(10);
      
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
         
        vSolicitudes := vSolicitudes||''||Vaux||','||Vaux2||','||Vaux3||','||Vaux4||','||Vaux5||','||Vaux6||CHR(10);
      
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