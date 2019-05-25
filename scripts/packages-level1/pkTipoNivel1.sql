CREATE OR REPLACE PACKAGE pkTipo AS
PROCEDURE pInsertarTipo (ivTipo VARCHAR2, ivDescripcion VARCHAR2);
PROCEDURE pModificarTipo (ivTipo VARCHAR2, ivDescripcion VARCHAR2);
PROCEDURE pModificarDescripcionTipo (ivTipo VARCHAR2, ivDescripcion VARCHAR2);
PROCEDURE pBorrarTipo(ivTipo VARCHAR2);
FUNCTION fConsultarTipo (ivTipo VARCHAR2) return varchar2;
END pkTipo;

CREATE OR REPLACE PACKAGE BODY pkTipo AS

PROCEDURE pInsertarTipo( ivTipo VARCHAR2, ivDescripcion  VARCHAR2)
IS 
BEGIN 
	INSERT INTO Tipo
	VALUES (ivTipo ,ivDescripcion);

	EXCEPTION
	WHEN DUP_VAL_ON_INDEX THEN
	RAISE_APPLICATION_ERROR(-20000,'Ya existe el tipo: ' || ivTipo);
END pInsertarTipo;


PROCEDURE pModificarSolicitud(ivTipo VARCHAR2, ivDescripcion  VARCHAR2)
IS
BEGIN
	UPDATE Tipo
	SET descripcion = ivDescripcion
	WHERE tipo = ivTipo;
	EXCEPTION
	WHEN no_data_found THEN
	   RAISE_APPLICATION_ERROR(-20000,'No se encontro el tipo : '||ivTipo);
END pModificarSolicitud;


PROCEDURE pModificarDescripcionTipo(ivTipo VARCHAR2, ivDescripcion VARCHAR2)
IS
BEGIN
	UPDATE Tipo
	SET descripcion = ivDescripcion
	WHERE tipo = ivTipo;
	EXCEPTION
	WHEN no_data_found THEN
	   RAISE_APPLICATION_ERROR(-20000,'No se encontro el tipo : '||ivTipo);
END pModificarDescripcionTipo;


PROCEDURE pBorrarTipo(ivTipo VARCHAR2)
IS
BEGIN
	DELETE
	FROM Tipo
	WHERE Tipo.tipo = ivTipo;
	EXCEPTION
	WHEN no_data_found THEN
	RAISE_APPLICATION_ERROR(-20000,'No se encontro el tipo : '||ivTipo);
END pBorrarTipo;



FUNCTION fConsultarTipo(ivTipo VARCHAR2) return varchar2
IS
	ovTipo VARCHAR2(400);
	vDescripcion VARCHAR2(50)	;

	
BEGIN
	SELECT descripcion INTO vDescripcion 
	FROM Tipo WHERE tipo = ivTipo; 
    

	ovTipo := ivTipo ||','|| vDescripcion;
	return ovTipo;

	EXCEPTION
	WHEN no_data_found THEN
	RAISE_APPLICATION_ERROR(-20000,'No existe el tipo: '||ivTipo);
	
END fConsultarTipo;

END pkTipo;