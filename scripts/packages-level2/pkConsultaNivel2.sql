CREATE OR REPLACE PACKAGE pkConsulta AS

FUNCTION fConsultarCliente (ivCedula VARCHAR2) return  VARCHAR2;
FUNCTION fConsultarFuncionario (ivCedula VARCHAR2) return  VARCHAR2;
FUNCTION fConsultarSolicitud_Funcionario (ivCedulaFuncionario VARCHAR2) return  VARCHAR2;
FUNCTION fConsultarSolicitud_Estado (ivCedulaFuncionario VARCHAR2) return  VARCHAR2;
FUNCTION fConsultarSolicitud_Tipo (ivCedulaFuncionario VARCHAR2) return  VARCHAR2;
FUNCTION fConsultarSolicitud_Cliente (ivCedulaFuncionario VARCHAR2) return  VARCHAR2;



END pkRegistro;
/


