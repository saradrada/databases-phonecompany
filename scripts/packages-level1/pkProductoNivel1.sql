--Paquete encargado de manejar los procedimientos necesario de los productos de la compañia.
CREATE OR REPLACE PACKAGE pkProducto AS
    --Procedimiento encargado de agregar la informacion de un producto a la base de datos.
    PROCEDURE pInsertarProducto (ivCodigo VARCHAR2, ivDescripcion VARCHAR2);
    --Procedimientoo encargado de modificar la informacion de un producto en especifico.
    PROCEDURE pModificarProducto (ivCodigo VARCHAR2, ivDescripcion VARCHAR2);
    --Procedimiento encargado de modificar la descripcion de un producto en especifico.
    PROCEDURE pModificarDescripcionProducto (ivCodigo VARCHAR2, ivDescripcion VARCHAR2);
    --Procedimiento encargado de borrar un producto a partir de su codigo.
    PROCEDURE pBorrarProducto(ivCodigo VARCHAR2);
    --Funcion encargada de consultar un producto en especifico a partir de su codigo.
    FUNCTION fConsultarProducto (ivCodigo VARCHAR2) return varchar2;
END pkProducto;
/


CREATE OR REPLACE PACKAGE BODY pkProducto AS
    
    PROCEDURE pInsertarProducto( ivCodigo VARCHAR2, ivDescripcion  VARCHAR2)
    IS 
    BEGIN 
        INSERT INTO Producto
        VALUES (ivCodigo ,ivDescripcion);
    
        EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN
        RAISE_APPLICATION_ERROR(-20000,'Ya existe el producto con el código ' || ivCodigo);
    END pInsertarProducto;
    
    
    PROCEDURE pModificarProducto(ivCodigo VARCHAR2, ivDescripcion  VARCHAR2)
    IS
    BEGIN
        UPDATE Producto
        SET descripcion = ivDescripcion
        WHERE codigo = ivCodigo;
        EXCEPTION
        WHEN no_data_found THEN
           RAISE_APPLICATION_ERROR(-20000,'No se encontro el producto con el código '||ivCodigo);
    END pModificarProducto;
    
    
    PROCEDURE pModificarDescripcionProducto(ivCodigo VARCHAR2, ivDescripcion VARCHAR2)
    IS
    BEGIN
        UPDATE Producto
        SET descripcion = ivDescripcion
        WHERE codigo = ivCodigo;
        EXCEPTION
        WHEN no_data_found THEN
           RAISE_APPLICATION_ERROR(-20000,'No se encontro el producto con el código '||ivCodigo);
    END pModificarDescripcionProducto;
    
    
    PROCEDURE pBorrarProducto(ivCodigo VARCHAR2)
    IS
    BEGIN
        DELETE
        FROM Producto
        WHERE Producto.codigo = ivCodigo;
        EXCEPTION
        WHEN no_data_found THEN
        RAISE_APPLICATION_ERROR(-20000,'No se encontro el producto con el código '||ivCodigo);
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
        RAISE_APPLICATION_ERROR(-20000,'No existe el producto con el código '||ivCodigo);
        
    END fConsultarProducto;

END pkProducto;