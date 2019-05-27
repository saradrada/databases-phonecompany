--borrar jobs
begin
dbms_scheduler.drop_job(job_name => 'job_AsignacionMasiva');
dbms_scheduler.drop_job(job_name => 'job_AtencionMasiva');
end;
/
--job de asignacion masiva
BEGIN
DBMS_SCHEDULER.CREATE_JOB (
   job_name             => 'job_AsignacionMasiva',
   job_type             => 'PLSQL_BLOCK',
   job_action           => 'BEGIN pkAsignacionNivel2.pAsignacionMasiva; END;',
   start_date           =>  SYSDATE,
   repeat_interval      => 'FREQ=DAILY;INTERVAL=2',
   enabled              =>  TRUE,
   comments             => 'Cada 2 dias se ejecuta'); 
END;
/

--job de atencion masiva
BEGIN
DBMS_SCHEDULER.CREATE_JOB (
   job_name             => 'job_AtencionMasiva',
   job_type             => 'PLSQL_BLOCK',
   job_action           => 'BEGIN PK_LOGICA_ATENCION.pAtencionMasiva; END;',
   start_date           =>  SYSDATE,
   repeat_interval      => 'FREQ=weekly;INTERVAL=1',
   enabled              =>  TRUE,
   comments             => 'Cada semana se ejecuta'); 
END;
/

