INSERT INTO CLIENTE VALUES ('16469817599','Keith','UIY30ONV0FS','1638052477599','6277 Phasellus Ave','18-07-95','8423419479');
INSERT INTO CLIENTE VALUES ('30284227299','Kay','BEP32EWZ3JS','1606021008499','771-8884 Massa. St.','05-07-05','4136361382');
INSERT INTO CLIENTE VALUES ('69776783399','Gareth','TAB56ZLC4LQ','1639020662799','611-6039 Nec, St.','02-10-93','3886127517');
INSERT INTO CLIENTE VALUES ('62330728099','Zeus','RSP12XHK2SQ','1676051487999','411-9700 Fusce St.','20-11-09','4947992985');
INSERT INTO CLIENTE VALUES ('59606875999','Merritt','PFB44CDO7UZ','1633060430199','5765 Mi. St.','19-06-14','3822732341');
COMMIT;

INSERT INTO FUNCIONARIO VALUES ('72450189599','Lane','OIG72DHP3HE','1662062711099','Ap #664-6355 Nullam St.','01-11-13','2661641295');
INSERT INTO FUNCIONARIO VALUES ('39945024299','Barclay','LOF85HAS1MV','1679042607299','Ap #189-7807 Molestie St.','27-05-05','3755568252');
INSERT INTO FUNCIONARIO VALUES ('01325419899','Demetrius','TPC79DHD3RP','1665022703399','2639 Pharetra. Avenue','13-10-02','4524357293');
INSERT INTO FUNCIONARIO VALUES ('42736352299','Basil','NLL65XLJ0RY','1691071986899','P.O. Box 990, 5198 Vulputate Rd.','26-07-15','6531993437');
INSERT INTO FUNCIONARIO VALUES ('21269954699','Thaddeus','MQZ50PCO4AY','1686062535399','834-1598 Magna. Rd.','26-11-91','9187135928');
COMMIT;

INSERT INTO TIPO VALUES ('Creacion', 'Solicitud de creacion.');
INSERT INTO TIPO VALUES ('Modificacion', 'Solicitud de modificacion.');
INSERT INTO TIPO VALUES ('Cancelacion', 'Solicitud de cancelacion.');
INSERT INTO TIPO VALUES ('Da�o', 'Solicitud de da�o.');
INSERT INTO TIPO VALUES ('Reclamo', 'Solicitud de reclamo.');
COMMIT;

INSERT INTO PRODUCTO VALUES ('W4S3O1','Telefonia');
INSERT INTO PRODUCTO VALUES ('S8G3R0','Internet');
INSERT INTO PRODUCTO VALUES ('W0K1Q3','Telefonia e Internet');
COMMIT;

INSERT INTO PRODUCTOCLIENTE VALUES ('WD008','25-07-61','10-06-11','W4S3O1','1638052477599');
INSERT INTO PRODUCTOCLIENTE VALUES ('BT297','01-12-42','06-08-01','W4S3O1','1606021008499');
INSERT INTO PRODUCTOCLIENTE VALUES ('EZ751','11-01-84','08-05-14','W4S3O1','1639020662799');
INSERT INTO PRODUCTOCLIENTE VALUES ('AQ358','03-04-74','02-04-14','S8G3R0','1676051487999');
INSERT INTO PRODUCTOCLIENTE VALUES ('PT114','21-01-60','08-07-04','S8G3R0','1633060430199');
INSERT INTO PRODUCTOCLIENTE VALUES ('IT799','11-09-69','10-06-19','W0K1Q3','1638052477599');
INSERT INTO PRODUCTOCLIENTE VALUES ('JM825','16-01-54','03-03-16','W0K1Q3','1639020662799');
COMMIT;

INSERT INTO SOLICITUD VALUES ('LZH185','observacion','Pendiente','W4S3O1','Creacion','1638052477599');
INSERT INTO SOLICITUD VALUES ('TSB055','observacion','Asignada','W4S3O1','Modificacion','1638052477599');
INSERT INTO SOLICITUD VALUES ('BND403','observacion','Atendida','W4S3O1','Cancelacion','1638052477599');
INSERT INTO SOLICITUD VALUES ('AUJ686','observacion','Anulada','W4S3O1','Da�o','1606021008499'); 
INSERT INTO SOLICITUD VALUES ('MCB700','observacion','Anulada','S8G3R0','Creacion','1606021008499');
INSERT INTO SOLICITUD VALUES ('KQI883','observacion','Anulada','S8G3R0','Modificacion','1606021008499');
INSERT INTO SOLICITUD VALUES ('IPK579','observacion','Asignada','S8G3R0','Cancelacion','1639020662799');
INSERT INTO SOLICITUD VALUES ('FHA309','observacion','Pendiente','W0K1Q3','Creacion','1639020662799');
INSERT INTO SOLICITUD VALUES ('QVW993','observacion','Atendida','W0K1Q3','Modificacion','1676051487999');
INSERT INTO SOLICITUD VALUES ('PCM575','observacion','Asignada','W0K1Q3','Reclamo','1633060430199');
COMMIT;

INSERT INTO ASIGNACION VALUES ('23-04-01','LZH185','1662062711099');
INSERT INTO ASIGNACION VALUES ('01-05-19','TSB055','1679042607299');
INSERT INTO ASIGNACION VALUES ('03-12-04','BND403','1691071986899');
INSERT INTO ASIGNACION VALUES ('05-12-04','MCB700','1686062535399');
INSERT INTO ASIGNACION VALUES ('07-04-02','AUJ686','1686062535399');
INSERT INTO ASIGNACION VALUES ('04-03-99','KQI883','1691071986899');
INSERT INTO ASIGNACION VALUES ('21-04-15','IPK579','1665022703399');
INSERT INTO ASIGNACION VALUES ('11-05-14','FHA309','1679042607299');
INSERT INTO ASIGNACION VALUES ('17-09-10','PCM575','1662062711099');
COMMIT;
