CREATE OR REPLACE PACKAGE pkProducto AS
PROCEDURE pInsertarProducto (ivCodigo VARCHAR2, ivDescripcion VARCHAR2);
PROCEDURE pModificarProducto (ivCodigo VARCHAR2, ivDescripcion VARCHAR2);
PROCEDURE pModificarDescripcionProducto (ivCodigo VARCHAR2, ivDescripcion VARCHAR2);
PROCEDURE pBorrarProducto(ivCodigo VARCHAR2);
FUNCTION fConsultarProducto (ivCodigo VARCHAR2) return varchar2;
END pkProducto;

CREATE OR REPLACE PACKAGE BODY pkProducto AS

PROCEDURE pInsertarProducto( ivCodigo VARCHAR2, ivDescripcion  VARCHAR2)
IS 
BEGIN 
	INSERT INTO Producto
	VALUES (ivCodigo ,ivDescripcion);

	EXCEPTION
	WHEN DUP_VAL_ON_INDEX THEN
	RAISE_APPLICATION_ERROR(-20000,'Ya existe el producto con el código: ' || ivCodigo);
END pInsertarProducto;


PROCEDURE pModificarProducto(ivCodigo VARCHAR2, ivDescripcion  VARCHAR2)
IS
BEGIN
	UPDATE Producto
	SET descripcion = ivDescripcion
	WHERE codigo = ivCodigo;
	EXCEPTION
	WHEN no_data_found THEN
	   RAISE_APPLICATION_ERROR(-20000,'No se encontro el producto con el código : '||ivCodigo);
END pModificarProducto;


PROCEDURE pModificarDescripcionProducto(ivCodigo VARCHAR2, ivDescripcion VARCHAR2)
IS
BEGIN
	UPDATE Producto
	SET descripcion = ivDescripcion
	WHERE codigo = ivCodigo;
	EXCEPTION
	WHEN no_data_found THEN
	   RAISE_APPLICATION_ERROR(-20000,'No se encontro el producto con el código : '||ivCodigo);
END pModificarDescripcionProducto;


PROCEDURE pBorrarProducto(ivCodigo VARCHAR2)
IS
BEGIN
	DELETE
	FROM Producto
	WHERE Producto.codigo = ivCodigo;
	EXCEPTION
	WHEN no_data_found THEN
	RAISE_APPLICATION_ERROR(-20000,'No se encontro el producto con el código : '||ivCodigo);
END pBorrarProducto;



FUNCTION fConsultarProducto(ivCodigo VARCHAR2) return varchar2
IS
	ovProducto VARCHAR2(400);
	vDescripcion VARCHAR2(50)	;

	
BEGIN
	SELECT descripcion INTO vDescripcion 
	FROM Producto WHERE codigo = ivCodigo; 
    

	ovProducto := ivCodigo ||','|| vDescripcion;
	return ovProducto;

	EXCEPTION
	WHEN no_data_found THEN
	RAISE_APPLICATION_ERROR(-20000,'No existe el producto con el código : '||ivCodigo);
	
END fConsultarProducto;

END pkProducto;