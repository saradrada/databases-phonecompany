CREATE OR REPLACE PACKAGE pkConsulta AS

FUNCTION fConsultarCliente (ivCedula VARCHAR2) return  VARCHAR2;
FUNCTION fConsultarFuncionario (ivCedula VARCHAR2) return  VARCHAR2;
FUNCTION fConsultarSolicitud_Funcionario (ivCedulaFuncionario VARCHAR2) return  VARCHAR2;
FUNCTION fConsultarSolicitud_Estado (ivCedulaFuncionario VARCHAR2) return  VARCHAR2;
FUNCTION fConsultarSolicitud_Tipo (ivCedulaFuncionario VARCHAR2) return  VARCHAR2;
FUNCTION fConsultarSolicitud_Cliente (ivCedulaFuncionario VARCHAR2) return  VARCHAR2;

END pkConsulta;
/

CREATE OR REPLACE PACKAGE BODY pkConsulta AS

FUNCTION fConsultarCliente (ivCedula VARCHAR2) return  VARCHAR2
IS
    ovCliente VARCHAR2(100);
BEGIN
    SELECT pkCliente.fConsultarCliente(ivCedula) INTO ovCliente
    FROM dual; 
END fConsultarCliente;

FUNCTION fConsultarFuncionario (ivCedula VARCHAR2) return  VARCHAR2
IS
    ovFuncionario VARCHAR2(100);
BEGIN
    SELECT pkFuncionario.fConsultarFuncionario(ivCedula) INTO ovFuncionario
    FROM dual; 
END fConsultarFuncionario;


END pkConsulta;
