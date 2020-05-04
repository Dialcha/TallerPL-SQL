-- Creacion de la tabla
DROP TABLE climaexistente;
CREATE TABLE climaexistente(
 pais VARCHAR2(15),
 dpto VARCHAR2(15),
 clima VARCHAR2(15),
 PRIMARY KEY(pais,dpto,clima)
);


-- Inserts en la tabla
INSERT INTO climaexistente VALUES('Colombia','Antioquia','Templado');
INSERT INTO climaexistente VALUES('Colombia','Antioquia','Cálido');
INSERT INTO climaexistente VALUES('Colombia','Bolívar','Cálido');
INSERT INTO climaexistente VALUES('Colombia','Bolívar','Horneante');
INSERT INTO climaexistente VALUES('Colombia','Nariño','Templado');
INSERT INTO climaexistente VALUES('Colombia','Nariño','Glacial');



-- Consulta original
SELECT c1.pais, c1.dpto, c2.clima
FROM climaexistente c1, climaexistente c2
MINUS
SELECT *
FROM climaexistente
ORDER BY 1,2,3;

-- Bloque PL/SQL
DECLARE
    w_pais climaexistente.pais%type;
    w_dpto climaexistente.dpto%type;
    w_clima climaexistente.clima%type;
    w_check_igual number(1);
    cursor c1 is select * from climaexistente;
    cursor c2 is select * from climaexistente;
    cursor c3 is select * from climaexistente;
BEGIN
    w_check_igual := 0;
    for clim in c1 loop
        w_clima := clim.clima;
        for elemento in c2 loop
            w_pais := elemento.pais;
            w_dpto := elemento.dpto;
            for elemen in c3 loop
                if(elemen.pais || elemen.dpto || elemen.clima = w_pais || w_dpto || w_clima)then
                    w_check_igual := 1;
                end if;
            end loop;
            if w_check_igual = 0 then
                dbms_output.put_line(w_pais || w_dpto || w_clima);
            end if;
            w_check_igual := 0;
        end loop;
    end loop;
END;