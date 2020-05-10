--PUNTO 2 TALLER LAB BD ***--
--POR: ARCANGEL MARIN Y DIEGO CHAVARRIA---

--SE CREA LA TABLA--
CREATE TABLE mesada (
    id_receptor NUMBER(8) PRIMARY KEY,
    id_benefactor NUMBER(8) REFERENCES mesada,
    valor NUMBER(6)
);
--Se hacen los insert
INSERT INTO mesada VALUES (10, null, 0);
INSERT INTO mesada VALUES (20, 10, 70);
INSERT INTO mesada VALUES (30, 10, 80);
INSERT INTO mesada VALUES (40, 20, 90);
INSERT INTO mesada VALUES (50, 20, 20);
INSERT INTO mesada VALUES (60, 40, 20);      
INSERT INTO mesada VALUES (70, 50, 55);
INSERT INTO mesada VALUES (80, 30, 25);

accept x number prompt 'Por favor ingrese el id de un benefactor : '  -- Generamos una entrada por teclado
DECLARE
    --Declaramos sursores que almacenaran las consulas
    cursor benefactor(w_benefactor1 mesada.id_benefactor%TYPE) is select * from mesada where id_benefactor = w_benefactor1;
    cursor benefactor2(w_benefactor mesada.id_benefactor%TYPE) is select valor from mesada where id_benefactor = w_benefactor;
    w_vrbenefactor mesada.valor%type;
    w_vrderivado number;
    w_auxBenefactor mesada.id_benefactor%TYPE;
    w_aux number;
    w_total number;
BEGIN
    w_auxBenefactor := &x;
    w_vrbenefactor := 0;
    w_vrderivado := 0;
    w_aux := 0;
    for elemento in benefactor(w_auxBenefactor) loop --se  recorre cada elemento benefactor que cumple con la condicion del id.
        w_vrbenefactor := w_vrbenefactor + elemento.valor;
       
       open benefactor2(elemento.id_receptor); --se abre el segundo cursor que traerá el valor de los receptores que han sido benefactor segun el id
       fetch benefactor2 into w_aux;
       while benefactor2%found loop
       fetch benefactor2 into w_aux;
         
         w_vrderivado := w_vrderivado + w_aux;  -- se suman los valores de la segunda generacion de benefactores.
         w_aux := 0;
         fetch benefactor2 into w_aux;
        end loop;
       close benefactor2;
      
    end loop;
    w_total := w_vrbenefactor + w_vrderivado;
    dbms_output.put_line('El valor de mesadas que se derivan a partir del benefactor con ID '|| w_auxBenefactor ||' es:'); 
    dbms_output.put_line(w_total);
END;