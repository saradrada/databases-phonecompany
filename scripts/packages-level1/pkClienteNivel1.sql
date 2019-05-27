CREATE OR REPLACE PACKAGE pkCliente AS
PROCEDURE pInsertarCliente(ivId VARCHAR2,ivContrasenha VARCHAR2,ivNombre VARCHAR2, ivCedula VARCHAR2,ivDireccion VARCHAR2, ivFecha DATE, ivTelefono VARCHAR2);
PROCEDURE pModificarCliente(ivId VARCHAR2, ivContrasenha VARCHAR2,ivNombre VARCHAR2,ivCedula VARCHAR2,ivDireccion VARCHAR2, ivFecha DATE, ivTelefono VARCHAR2);
PROCEDURE pModificarNombreCliente (ivCedula VARCHAR2, ivNuevoNombre VARCHAR2);
PROCEDURE pModificarId(ivCedula VARCHAR2 , ivNuevaId VARCHAR2);
PROCEDURE pModificarContrasenaCliente (ivCedula VARCHAR2 , ivNuevaContrasena VARCHAR2);
PROCEDURE pModificarDireccionCliente (ivCedula VARCHAR2, ivNuevaDireccion VARCHAR2);
PROCEDURE pModificarFechaNacimientoCliente (ivCedula VARCHAR2 , ivNuevaFecha DATE);
PROCEDURE pModificarTelefonoCliente (ivCedula VARCHAR2, ivNuevoTelefono VARCHAR2);
PROCEDURE pEliminarCliente (ivCedula VARCHAR2);
FUNCTION fConsultarCliente(ivCedula VARCHAR2) return VARCHAR2;
END pkCliente;
/

CREATE OR REPLACE PACKAGE BODY pkCliente AS

FUNCTION fConsultarCliente(ivCedula VARCHAR2) return VARCHAR2
IS
	ovCliente			VARCHAR2(400);
	vId                 VARCHAR2(30);
    vContrasena         VARCHAR2(30);
	vCedula				VARCHAR2(30);
	vNombre             VARCHAR2(30);
    vDireccion          VARCHAR2(50);
    vFecha_nacimiento   DATE;
    vTelefono           VARCHAR2(30); 
BEGIN
	SELECT contraseña INTO vContrasena
	FROM Cliente WHERE cedula = ivCedula;
	SELECT nombre INTO vNombre
	FROM Cliente WHERE cedula = ivCedula;
	SELECT direccion INTO vDireccion
	FROM Cliente WHERE cedula = ivCedula;
	SELECT fecha_nacimiento INTO vFecha_nacimiento
	FROM Cliente WHERE cedula = ivCedula;
	SELECT telefono INTO vTelefono
	FROM Cliente WHERE cedula = ivCedula;
	
	ovCliente := vNombre || ',' || vContrasena || ',' || vCedula || ',' || vDireccion || ',' || vFecha_nacimiento || ',' || vTelefono;
	return ovCliente;
	
	EXCEPTION
	WHEN no_data_found THEN
	RAISE_APPLICATION_ERROR(-20000,'No existe ningun cliente con la cedula '||ivCedula);
	
END fConsultarCliente;


PROCEDURE pInsertarCliente(ivId VARCHAR2,ivContrasenha VARCHAR2,ivNombre VARCHAR2, ivCedula VARCHAR2,ivDireccion VARCHAR2, ivFecha DATE, ivTelefono VARCHAR2)
IS
BEGIN
    INSERT INTO Cliente 
    VALUES(ivId,ivNombre,ivContrasenha,ivCedula,ivDireccion,ivFecha,ivTelefono);
	EXCEPTION
	WHEN DUP_VAL_ON_INDEX THEN
	RAISE_APPLICATION_ERROR(-20000,'Ya existe un cliente con la misma cedula ' || ivCedula);
END pInsertarCliente;



PROCEDURE pEliminarCliente (ivCedula VARCHAR2)
IS
BEGIN
	DELETE 
	FROM Cliente
	WHERE cedula = ivCedula;
    
    
	EXCEPTION
	WHEN no_data_found THEN
	RAISE_APPLICATION_ERROR(-20000,'No existe ningun cliente con la misma cedula '||ivCedula);
END pEliminarCliente;



PROCEDURE pModificarCliente(ivId VARCHAR2, ivContrasenha VARCHAR2,ivNombre VARCHAR2,ivCedula VARCHAR2, ivDireccion VARCHAR2, ivFecha DATE, ivTelefono VARCHAR2)
IS
BEGIN
    UPDATE Cliente
    SET contraseña = ivContrasenha,
		nombre = ivNombre,
		direccion = ivDireccion,
		fecha_nacimiento = ivFecha,
		telefono = ivTelefono
    WHERE cedula = ivCedula;
	

	EXCEPTION
	WHEN no_data_found THEN
	   RAISE_APPLICATION_ERROR(-20000,'No se encontro ningun cliente con la misma cedula '||ivCedula);

END pModificarCliente;



PROCEDURE pModificarId(ivCedula VARCHAR2 , ivNuevaId VARCHAR2)
IS
BEGIN
	UPDATE Cliente
    SET id = ivNuevaId
    WHERE cedula = ivCedula;
	
	EXCEPTION
	WHEN no_data_found THEN
	   RAISE_APPLICATION_ERROR(-20000,'No se encontro ningun cliente con la misma cedula '||ivCedula);
END pModificarId;



PROCEDURE pModificarNombreCliente (ivCedula VARCHAR2, ivNuevoNombre VARCHAR2)
IS
BEGIN
    UPDATE Cliente
    SET nombre = ivNuevoNombre
    WHERE cedula = ivCedula;
	
	EXCEPTION
	WHEN no_data_found THEN
	   RAISE_APPLICATION_ERROR(-20000,'No se encontro ningun cliente con la misma cedula '||ivCedula);
END pModificarNombreCliente;





PROCEDURE pModificarContrasenaCliente (ivCedula VARCHAR2 , ivNuevaContrasena VARCHAR2)
IS
BEGIN
    UPDATE Cliente
    SET contraseña = ivNuevaContrasena
    WHERE cedula = ivCedula;
	
	EXCEPTION
	WHEN no_data_found THEN
	   RAISE_APPLICATION_ERROR(-20000,'No se encontro ningun cliente con la misma cedula '||ivCedula);
END pModificarContrasenaCliente;



PROCEDURE pModificarDireccionCliente (ivCedula VARCHAR2, ivNuevaDireccion VARCHAR2)
IS
BEGIN
    UPDATE Cliente
    SET direccion = ivNuevaDireccion
    WHERE cedula = ivCedula;
	
	EXCEPTION
	WHEN no_data_found THEN
	   RAISE_APPLICATION_ERROR(-20000,'No se encontro ningun cliente con la misma cedula '||ivCedula);
END pModificarDireccionCliente;


PROCEDURE pModificarFechaNacimientoCliente (ivCedula VARCHAR2 , ivNuevaFecha DATE)
IS
BEGIN
    UPDATE Cliente
    SET fecha_nacimiento = ivNuevaFecha
    WHERE cedula = ivCedula;
	
	EXCEPTION
	WHEN no_data_found THEN
	   RAISE_APPLICATION_ERROR(-20000,'No se encontro ningun cliente con la misma cedula '||ivCedula);
END pModificarFechaNacimientoCliente;



PROCEDURE pModificarTelefonoCliente (ivCedula VARCHAR2, ivNuevoTelefono VARCHAR2)
IS
BEGIN
    UPDATE Cliente
    SET telefono = ivNuevoTelefono
    WHERE cedula = ivCedula;
	
	EXCEPTION
	WHEN no_data_found THEN
	   RAISE_APPLICATION_ERROR(-20000,'No se encontro ningun cliente con la misma cedula '||ivCedula);
END pModificarTelefonoCliente;

END pkCliente;