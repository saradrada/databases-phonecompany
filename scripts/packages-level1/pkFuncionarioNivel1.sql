--Paquete encargado de manejar los procedimientos necesario del Funcionario de la compañia
CREATE OR REPLACE PACKAGE pkFuncionario AS
    --Procedimiento encargado de insertar un funcionario a la base de datos con todos sus datos basicos.
    PROCEDURE pInsertarFuncionario(ivId VARCHAR2,ivContrasena VARCHAR2,ivNombre VARCHAR2, ivCedula VARCHAR2,ivDireccion VARCHAR2, ivFecha DATE, ivTelefono VARCHAR2);
    --Procedimiento encargado modifica toda la informacion de un funcionario e especifico a partir de su id.
    PROCEDURE pModificarFuncionario(ivId VARCHAR2, ivContrasena VARCHAR2,ivNombre VARCHAR2,ivCedula VARCHAR2,ivDireccion VARCHAR2, ivFecha DATE, ivTelefono VARCHAR2);
    --Procedimiento encargado de modficar el id de un funcionario a partir de su cedula.
    PROCEDURE pModificarId(ivCedula VARCHAR2 , ivNuevaId VARCHAR2);
   --Procedimiento encargado de modficar el nombre de un funcionario a partir de su cedula.
    PROCEDURE pModificarNombreFuncionario (ivCedula VARCHAR2, ivNuevoNombre VARCHAR2);
    --Procedimiento encargado de modficar la contraseña de un funcionario a partir de su cedula.
    PROCEDURE pModificarContrasenaFuncionario (ivCedula VARCHAR2 , ivNuevaContrasena VARCHAR2);
    --Procedimiento encargado de modficar la direccion de un funcionario a partir de su cedula.
    PROCEDURE pModificarDireccionFuncionario (ivCedula VARCHAR2, ivNuevaDireccion VARCHAR2);
    --Procedimiento encargado de modficar la fecha de nacimiento de un funcionario a partir de su cedula.
    PROCEDURE pModificarFechaNacimientoFuncionario (ivCedula VARCHAR2 , ivNuevaFecha DATE);
    --Procedimiento encargado de modficar el telefono de un funcionario a partir de su cedula.
    PROCEDURE pModificarTelefonoFuncionario(ivCedula VARCHAR2, ivNuevoTelefono VARCHAR2);
    --Procedimiento encargado de eliminar a un funcionario a partir de su cedula.
    PROCEDURE pEliminarFuncionario(ivCedula VARCHAR2);
    --Funcion encargada de consultar toda la informacion de un funcionario a partir de su cedula.
    FUNCTION fConsultarFuncionario(ivCedula VARCHAR2) return VARCHAR2;
END pkFuncionario;
/

CREATE OR REPLACE PACKAGE BODY pkFuncionario AS
    FUNCTION fConsultarFuncionario(ivCedula VARCHAR2) return VARCHAR2
    IS
        ovFuncionario		VARCHAR2(400);
        vId                 VARCHAR2(30);
        vContrasena         VARCHAR2(30);
        vCedula				VARCHAR2(30);
        vNombre             VARCHAR2(30);
        vDireccion          VARCHAR2(50);
        vFecha_nacimiento   DATE;
        vTelefono           VARCHAR2(30); 
    
    
    BEGIN
    
        SELECT contraseña INTO vContrasena
        FROM Funcionario WHERE cedula = ivCedula;
        SELECT id INTO vId
        FROM Funcionario WHERE cedula = ivCedula;
        SELECT nombre INTO vNombre
        FROM Funcionario WHERE cedula = ivCedula;
        SELECT direccion INTO vDireccion
        FROM Funcionario WHERE cedula = ivCedula;
        SELECT fecha_nacimiento INTO vFecha_nacimiento
        FROM Funcionario WHERE cedula = ivCedula;
        SELECT telefono INTO vTelefono
        FROM Funcionario WHERE cedula = ivCedula;
        
        ovFuncionario := vId || ',' || vNombre || ',' || vContrasena || ',' || vCedula || ',' || vDireccion || ',' || vFecha_nacimiento || ',' || vTelefono;
        return ovFuncionario;
        
        EXCEPTION
        WHEN no_data_found THEN
        RAISE_APPLICATION_ERROR(-20000,'No existe ningun Funcionario con la cedula '||ivCedula);
        
    END fConsultarFuncionario;
    
    PROCEDURE pInsertarFuncionario(ivId VARCHAR2,ivContrasena VARCHAR2,ivNombre VARCHAR2, ivCedula VARCHAR2,ivDireccion VARCHAR2, ivFecha DATE, ivTelefono VARCHAR2)
    IS
    BEGIN
        INSERT INTO Funcionario
        VALUES(ivId,ivNombre,ivContrasena,ivCedula,ivDireccion,ivFecha,ivTelefono);
    
        EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN
        RAISE_APPLICATION_ERROR(-20000,'Ya existe un Funcionario con la misma cedula ' || ivCedula);
    END pInsertarFuncionario;
    
    PROCEDURE pEliminarFuncionario (ivCedula VARCHAR2)
    IS
    BEGIN
        DELETE 
        FROM Funcionario
        WHERE cedula = ivCedula;
        
        
        EXCEPTION
        WHEN no_data_found THEN
        RAISE_APPLICATION_ERROR(-20000,'No existe ningun Funcionario con la misma cedula '||ivCedula);
    END pEliminarFuncionario;
    
    
    
    PROCEDURE pModificarFuncionario(ivId VARCHAR2, ivContrasena VARCHAR2,ivNombre VARCHAR2,ivCedula VARCHAR2, ivDireccion VARCHAR2, ivFecha DATE, ivTelefono VARCHAR2)
    IS
    BEGIN
        UPDATE Funcionario
        SET contraseña = ivContrasena,
            nombre = ivNombre,
            direccion = ivDireccion,
            fecha_nacimiento = ivFecha,
            telefono = ivTelefono
        WHERE cedula = ivCedula;
        
    
        EXCEPTION
        WHEN no_data_found THEN
           RAISE_APPLICATION_ERROR(-20000,'No se encontro ningun Funcionario con la misma cedula '||ivCedula);
    
    END pModificarFuncionario;
    
    
    PROCEDURE pModificarId(ivCedula VARCHAR2 , ivNuevaId VARCHAR2)
    IS
    BEGIN
        UPDATE Funcionario
        SET id = ivNuevaId
        WHERE cedula = ivCedula;
        
        EXCEPTION
        WHEN no_data_found THEN
           RAISE_APPLICATION_ERROR(-20000,'No se encontro ningun Funcionario con la misma cedula '||ivCedula);
    END pModificarId;

    PROCEDURE pModificarNombreFuncionario (ivCedula VARCHAR2, ivNuevoNombre VARCHAR2)
    IS
    BEGIN
        UPDATE Funcionario
        SET nombre = ivNuevoNombre
        WHERE cedula = ivCedula;
        
        EXCEPTION
        WHEN no_data_found THEN
           RAISE_APPLICATION_ERROR(-20000,'No se encontro ningun Funcionario con la misma cedula '||ivCedula);
    END pModificarNombreFuncionario;
    
    
    
    PROCEDURE pModificarContrasenaFuncionario (ivCedula VARCHAR2 , ivNuevaContrasena VARCHAR2)
    IS
    BEGIN
        UPDATE Funcionario
        SET contraseña = ivNuevaContrasena
        WHERE cedula = ivCedula;
        
        EXCEPTION
        WHEN no_data_found THEN
           RAISE_APPLICATION_ERROR(-20000,'No se encontro ningun Funcionario con la misma cedula '||ivCedula);
    END pModificarContrasenaFuncionario;
    
    PROCEDURE pModificarDireccionFuncionario (ivCedula VARCHAR2, ivNuevaDireccion VARCHAR2)
    IS
    BEGIN
        UPDATE Funcionario
        SET direccion = ivNuevaDireccion
        WHERE cedula = ivCedula;
        
        EXCEPTION
        WHEN no_data_found THEN
           RAISE_APPLICATION_ERROR(-20000,'No se encontro ningun Funcionario con la misma cedula '||ivCedula);
    END pModificarDireccionFuncionario;
    
    PROCEDURE pModificarFechaNacimientoFuncionario (ivCedula VARCHAR2 , ivNuevaFecha DATE)
    IS
    BEGIN
        UPDATE Funcionario
        SET fecha_nacimiento = ivNuevaFecha
        WHERE cedula = ivCedula;
        
        EXCEPTION
        WHEN no_data_found THEN
           RAISE_APPLICATION_ERROR(-20000,'No se encontro ningun Funcionario con la misma cedula '||ivCedula);
    END pModificarFechaNacimientoFuncionario;
    
    PROCEDURE pModificarTelefonoFuncionario (ivCedula VARCHAR2, ivNuevoTelefono VARCHAR2)
    IS
    BEGIN
        UPDATE Funcionario
        SET telefono = ivNuevoTelefono
        WHERE cedula = ivCedula;
        
        EXCEPTION
        WHEN no_data_found THEN
           RAISE_APPLICATION_ERROR(-20000,'No se encontro ningun Funcionario con la misma cedula '||ivCedula);
    END pModificarTelefonoFuncionario;

END pkFuncionario;