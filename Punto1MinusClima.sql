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


-- Creación de la tabla auxiliar climaexistentecopia
CREATE TABLE climaexistentecopia(
 pais VARCHAR2(15),
 dpto VARCHAR2(15),
 clima VARCHAR2(15)
);

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
    for clim in c1 loop -- En este cursor se captura el clima (c1 clima)
        w_clima := clim.clima; 
        for elemento in c2 loop -- En este cursor se capturan el país y el departamento y se combinan con el clima que haya en la iteración
            w_pais := elemento.pais;
            w_dpto := elemento.dpto;
            for elemen in c3 loop -- Este cursor se declaró para ver si esa combinación de clima con ciudad y país existe
                if(elemen.pais || elemen.dpto || elemen.clima = w_pais || w_dpto || w_clima)then
                    w_check_igual := 1;
                end if;
            end loop;
            if w_check_igual = 0 then
                INSERT INTO climaexistentecopia VALUES (w_pais, w_dpto, w_clima);
            end if;
            w_check_igual := 0;
        end loop;
    end loop;
    DELETE FROM climaexistentecopia
        WHERE rowid not in
       (SELECT MIN(rowid)
          FROM climaexistentecopia
         GROUP BY pais, dpto, clima);
    execute immediate 'select * from climaexistentecopia order by 1, 2, 3';
END;


drop table climaexistentecopia;