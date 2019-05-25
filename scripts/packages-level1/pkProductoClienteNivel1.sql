CREATE OR REPLACE PACKAGE pkProductoCliente AS

PROCEDURE pInsertarProductoCliente( ivNumeroProducto VARCHAR2,ivFechaCitacion Date,ivFechaRetiro Date, ivProductoCodigo VARCHAR2,ivCedulaCliente VARCHAR2);
PROCEDURE pModificarProductoCliente( ivNumeroProducto VARCHAR2,ivFechaCitacion Date,ivFechaRetiro Date, ivProductoCodigo VARCHAR2,ivCedulaCliente VARCHAR2);
PROCEDURE pModificarFechaCitacionProductoCliente (ivNumeroProducto VARCHAR2,ivFechaCitacion Date);
PROCEDURE pModificarFechaRetiroProductoCliente (ivNumeroProducto VARCHAR2,ivFechaRetiro Date);
PROCEDURE pModificarProductoCodigoProductoCliente (ivNumeroProducto VARCHAR2, ivProductoCodigo VARCHAR2);
PROCEDURE pModificarClienteCedulaProductoCliente (ivNumeroProducto VARCHAR2, ivCedulaCliente VARCHAR2);
PROCEDURE pBorrarProductoCliente(ivNumeroProducto VARCHAR2);
FUNCTION fConsultarProductoCliente (ivNumeroProducto VARCHAR2) return varchar2;

END pkProductoCliente;

CREATE OR REPLACE PACKAGE BODY pkProductoCliente AS

PROCEDURE pInsertarProductoCliente(ivNumeroProducto VARCHAR2,ivFechaCitacion Date,ivFechaRetiro Date, ivProductoCodigo VARCHAR2,ivCedulaCliente VARCHAR2)
IS
BEGIN 
	INSERT INTO ProductoCliente
	VALUES (ivNumeroProducto ,ivFechaCitacion ,ivFechaRetiro , ivProductoCodigo ,ivCedulaCliente );

	EXCEPTION
	WHEN DUP_VAL_ON_INDEX THEN
	RAISE_APPLICATION_ERROR(-20000,'Ya hay una producto-cliente con el número de producto: ' || ivNumeroProducto);
END pInsertarProductoCliente;


PROCEDURE pModificarProductoCliente(ivNumeroProducto VARCHAR2,ivFechaCitacion Date,ivFechaRetiro Date, ivProductoCodigo VARCHAR2,ivCedulaCliente VARCHAR2)
IS
BEGIN
	UPDATE ProductoCliente
	SET fecha_citacion = ivFechaCitacion,        
		fecha_retiro = ivFechaRetiro,        
		Producto_codigo = ivProductoCodigo,
		Cliente_cedula =ivCedulaCliente        
	WHERE numeroProducto = ivNumeroProducto;
	EXCEPTION
	WHEN no_data_found THEN
	   RAISE_APPLICATION_ERROR(-20000,'No se encontro ningún producto-cliente con el número de producto: '||ivNumeroProducto);
END pModificarProductoCliente;


PROCEDURE pModificarFechaCitacionProductoCliente(ivNumeroProducto VARCHAR2,ivFechaCitacion Date)
IS
BEGIN
	UPDATE ProductoCliente
	SET fecha_citacion = ivFechaCitacion
	WHERE numeroProducto = ivNumeroProducto;
	EXCEPTION
	WHEN no_data_found THEN
	RAISE_APPLICATION_ERROR(-20000,'No se encontro ningún producto-cliente con el número de producto: '||ivNumeroProducto);
END pModificarFechaCitacionProductoCliente;


PROCEDURE pModificarFechaRetiroProductoCliente(ivNumeroProducto VARCHAR2,ivFechaRetiro Date)
IS
BEGIN
	UPDATE ProductoCliente
	SET fecha_retiro = ivFechaRetiro
	WHERE numeroProducto = ivNumeroProducto;
	EXCEPTION
	WHEN no_data_found THEN
	RAISE_APPLICATION_ERROR(-20000,'No se encontro ningún producto-cliente con el número de producto: '||ivNumeroProducto);
END pModificarFechaRetiroProductoCliente;


PROCEDURE pModificarProductoCodigoProductoCliente(ivNumeroProducto VARCHAR2, ivProductoCodigo VARCHAR2)
IS
BEGIN
	UPDATE ProductoCliente
	SET Producto_codigo = ivProductoCodigo
	WHERE numeroProducto = ivNumeroProducto;
	EXCEPTION
	WHEN no_data_found THEN
	RAISE_APPLICATION_ERROR(-20000,'No se encontro ningún producto-cliente con el número de producto: '||ivNumeroProducto);
END pModificarProductoCodigoProductoCliente;



PROCEDURE pModificarClienteCedulaProductoCliente(ivNumeroProducto VARCHAR2, ivCedulaCliente VARCHAR2)
IS
BEGIN
	UPDATE ProductoCliente
	SET Cliente_cedula = ivCedulaCliente
	WHERE numeroProducto = ivNumeroProducto;
	EXCEPTION
	WHEN no_data_found THEN
	RAISE_APPLICATION_ERROR(-20000,'No se encontro ningún producto-cliente con el número de producto: '||ivNumeroProducto);
END pModificarClienteCedulaProductoCliente;

PROCEDURE pBorrarProductoCliente(ivNumeroProducto VARCHAR2)
IS
BEGIN
	DELETE
	FROM ProductoCliente
	WHERE ProductoCliente.numeroProducto = ivNumeroProducto;
	EXCEPTION
	WHEN no_data_found THEN
	RAISE_APPLICATION_ERROR(-20000,'No se encontro ningún producto-cliente con el número de producto: '||ivNumeroProducto);
END pBorrarSolicitud;


FUNCTION fConsultarProductoCliente(ivNumeroProducto VARCHAR2) return varchar2
IS
	ovProductoCliente VARCHAR2(400);    
    vFechaCitacion Date;
    vFechaRetiro Date;
    vProductoCodigo VARCHAR2(30);
    vCedulaCliente VARCHAR2(30);

	
BEGIN
	SELECT fecha_citacion INTO vFechaCitacion 
	FROM ProductoCliente WHERE fecha_citacion = vFechaCitacion; 
	
    SELECT fecha_retiro INTO vFechaRetiro 
	FROM ProductoCliente WHERE fecha_retiro = vFechaRetiro; 
    
    SELECT Producto_codigo INTO vProductoCodigo 
	FROM ProductoCliente WHERE Producto_codigo = vProductoCodigo; 
    
    SELECT Cliente_cedula INTO vCedulaCliente 
	FROM ProductoCliente WHERE Cliente_cedula = vCedulaCliente;    

	ovProductoCliente := ivNumeroProducto ||','|| vFechaCitacion ||','|| vFechaRetiro ||','|| vProductoCodigo ||','|| vCedulaCliente ;
	return ovProductoCliente;

	EXCEPTION
	WHEN no_data_found THEN
	RAISE_APPLICATION_ERROR(-20000,'No existe ninguna solicitud con el codigo: '||ivNumeroProducto);
	
END fConsultarProductoCliente;


END pkProductoCliente;


