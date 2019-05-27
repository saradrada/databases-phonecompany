CREATE OR REPLACE PACKAGE pkRegistro AS

    --Representa el procedimiento del registro de la creacion de una solicitud
    --Entrada: Codigo del producto, cedula de cliente, observacion, tipo del producto 
    PROCEDURE pRegistrarSolicitudCreacion (ivProductoCodigo VARCHAR2, ivCedulaCliente VARCHAR2,ivObservacion VARCHAR2,ivTipoProducto VARCHAR2);
   
    --Representa el procedimiento del registro de la modificacion de una solicitud
    --Entrada: Codigo del producto, cedula de cliente, observacion  
    PROCEDURE pRegistrarSolicitudModificacion (ivProductoCodigo VARCHAR2, ivCedulaCliente VARCHAR2, ivObservacion VARCHAR2);
    
    --Representa el procedimiento del registro de la cancelacion de una solicitud
    --Entrada: Codigo del producto, cedula de cliente, observacion  
    PROCEDURE pRegistrarSolicitudCancelacion ( ivProductoCodigo VARCHAR2 , ivCedulaCliente VARCHAR2 , ivObservacion VARCHAR2);
    
    --Representa el procedimiento del registro del reclamo de una solicitud
    --Entrada: Codigo del producto, cedula de cliente, observacion  
    PROCEDURE pRegistrarSolicitudReclamo ( ivProductoCodigo VARCHAR2 , ivCedulaCliente VARCHAR2, ivObservacion VARCHAR2);
    
    --Representa el procedimiento del registro de un cliente 
    --Entrada: Un identificador , cedula de cliente, contraseña, cedula, nombre, direccion, fecha de namcimiento  y telefono del cliente
    PROCEDURE pRegistrarCliente (ivId VARCHAR2,ivContrasenha VARCHAR2,ivNombre VARCHAR2, ivCedula VARCHAR2,ivDireccion VARCHAR2, ivFecha DATE, ivTelefono VARCHAR2);
    
    --Representa el procedimiento del registro de un funcionario 
    --Entrada: Un identificador , cedula de cliente, contraseña, cedula, nombre, direccion, fecha de namcimiento  y telefono del cliente  
    PROCEDURE pRegistrarFuncionario(ivId VARCHAR2,ivContrasena VARCHAR2,ivNombre VARCHAR2, ivCedula VARCHAR2,ivDireccion VARCHAR2, ivFecha DATE, ivTelefono VARCHAR2);
    
    --Representa el procedimiento del registro de un producto
    --Entrada: El codigo del producto, una breve descripcion  
    PROCEDURE pRegistrarProducto(ivCodigo VARCHAR2, ivDescripcion VARCHAR2);
    
    FUNCTION fConsultarNumLibre return  VARCHAR2;

END pkRegistro;
/


CREATE OR REPLACE PACKAGE BODY pkRegistro AS
    
    FUNCTION  fConsultarNumLibre return  VARCHAR2
    IS
        ovNumero VARCHAR2(50);
        vUltimaSolicitud VARCHAR2(50);	
    BEGIN
        SELECT CAST(MAX(numeroSolicitud) AS int) INTO vUltimaSolicitud
        FROM Solicitud;
    
    
        ovNumero := vUltimaSolicitud+1; 
        return ovNumero;
    END fConsultarNumLibre;
    
    
    
    PROCEDURE pRegistrarSolicitudCreacion (ivProductoCodigo VARCHAR2,ivCedulaCliente VARCHAR2, ivObservacion VARCHAR2, ivTipoProducto VARCHAR2)
    IS
        vNumero VARCHAR2(50);
    BEGIN
        vNumero := fConsultarNumLibre;
        pkSolicitud.pInsertarSolicitud( vNumero,ivObservacion, 'Nuevo' ,ivProductoCodigo, ivCedulaCliente , 'Creacion');
    END pRegistrarSolicitudCreacion;
    
    
    
    PROCEDURE pRegistrarSolicitudModificacion (ivProductoCodigo VARCHAR2, ivCedulaCliente VARCHAR2, ivObservacion VARCHAR2 )
    IS
        vNumero VARCHAR2(50);
    BEGIN
        vNumero := fConsultarNumLibre();
        pkSolicitud.pInsertarSolicitud( vNumero, ivObservacion, 'Nuevo' ,ivProductoCodigo, ivCedulaCliente , 'Modificacion');
    END pRegistrarSolicitudModificacion;
    
    
    
    PROCEDURE pRegistrarSolicitudCancelacion ( ivProductoCodigo VARCHAR2 , ivCedulaCliente VARCHAR2 , ivObservacion VARCHAR2)
    IS
        vNumero VARCHAR2(50);
    BEGIN
        vNumero := fConsultarNumLibre();	
        pkSolicitud.pInsertarSolicitud( vNumero, ivObservacion, 'Nuevo' ,ivProductoCodigo, ivCedulaCliente , 'Cancelacion'); -- Tipo de registro, quemado en las tablas
    END pRegistrarSolicitudCancelacion;
    
    
    
    PROCEDURE pRegistrarSolicitudReclamo ( ivProductoCodigo VARCHAR2 , ivCedulaCliente VARCHAR2, ivObservacion VARCHAR2)
    IS
        vNumero VARCHAR2(50);
    BEGIN
        vNumero := fConsultarNumLibre();
        pkSolicitud.pInsertarSolicitud( vNumero, ivObservacion, 'Nuevo' ,ivProductoCodigo, ivCedulaCliente , 'Reclamo'); -- Tipo de registro, quemado en las tablas
    END pRegistrarSolicitudReclamo;
    
    
    PROCEDURE pRegistrarCliente (ivId VARCHAR2,ivContrasenha VARCHAR2,ivNombre VARCHAR2, ivCedula VARCHAR2,ivDireccion VARCHAR2, ivFecha DATE, ivTelefono VARCHAR2)
    IS
    BEGIN
        pkCliente.pInsertarCliente(ivId,ivNombre,ivContrasenha,ivCedula,ivDireccion,ivFecha,ivTelefono);
    END pRegistrarCliente;
    
    
    
    PROCEDURE pRegistrarFuncionario(ivId VARCHAR2,ivContrasena VARCHAR2,ivNombre VARCHAR2, ivCedula VARCHAR2,ivDireccion VARCHAR2, ivFecha DATE, ivTelefono VARCHAR2)
    IS
    BEGIN
        pkFuncionario.pInsertarFuncionario(ivId,ivNombre,ivContrasena,ivCedula,ivDireccion,ivFecha,ivTelefono);
    END pRegistrarFuncionario;
    
    
    
    PROCEDURE pRegistrarProducto(ivCodigo VARCHAR2, ivDescripcion VARCHAR2)
    IS
    BEGIN
        pkProducto.pInsertarProducto(ivCodigo ,ivDescripcion);
    END pRegistrarProducto;
    

END pkRegistro;