CREATE TABLE mesada (
    id_receptor NUMBER(8) PRIMARY KEY,
    id_benefactor NUMBER(8) REFERENCES mesada,
    valor NUMBER(6)
);

INSERT INTO mesada VALUES (10, null, 0);
INSERT INTO mesada VALUES (20, 10, 70);
INSERT INTO mesada VALUES (30, 10, 80);
INSERT INTO mesada VALUES (40, 20, 90);
INSERT INTO mesada VALUES (50, 20, 20);
INSERT INTO mesada VALUES (60, 40, 20);      
INSERT INTO mesada VALUES (70, 50, 55);
INSERT INTO mesada VALUES (80, 30, 25);

DECLARE
    cursor benefactor is select * from mesada where id_benefactor = 50;
    w_vrbenefactor mesada.valor%type;
    w_vrderivado number;
    w_aux number;
    w_total number;
BEGIN
    w_vrbenefactor := 0;
    w_vrderivado := 0;
    w_aux := 0;
    for elemento in benefactor loop
        w_vrbenefactor := w_vrbenefactor + elemento.valor;
        select sum(valor) into w_aux from mesada where id_benefactor = elemento.id_receptor;
        w_vrderivado := w_vrderivado + w_aux;
    end loop;
    w_total := w_vrbenefactor + w_vrderivado;
    dbms_output.put_line(w_total);
END;






