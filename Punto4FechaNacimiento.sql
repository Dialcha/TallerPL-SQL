DECLARE
    w_fecha_nacimiento DATE;
    w_fecha_actual DATE;
    w_meses_entre NUMBER;
    w_edad NUMBER;
BEGIN
    w_fecha_nacimiento := '10/05/1994';
    select CURRENT_TIMESTAMP into w_fecha_actual from dual;
    w_meses_entre := MONTHS_BETWEEN(w_fecha_actual, w_fecha_nacimiento);
    w_edad := TRUNC(w_meses_entre / 12);
    dbms_output.put_line(w_edad);
END;