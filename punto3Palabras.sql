--***PUNTO 3 TALLER LAB BASES DE DATOS ****---
--- ** POR: ARCANGEL MARIN Y DIEGO ALEXANDER CHAVARRIA ***---

--CREACION TABLA "abecedario" . 10 Columnas 
DROP TABLE abecedario;
CREATE TABLE abecedario(
letra CHAR NOT NULL PRIMARY KEY,
fila1 VARCHAR2(7) NOT NULL,
fila2 VARCHAR2(7) NOT NULL,
fila3 VARCHAR2(7) NOT NULL,
fila4 VARCHAR2(7) NOT NULL,
fila5 VARCHAR2(7) NOT NULL,
fila6 VARCHAR2(7) NOT NULL,
fila7 VARCHAR2(7) NOT NULL,
fila8 VARCHAR2(7) NOT NULL,
fila9 VARCHAR2(7) NOT NULL
);

--INSERT CON LAS ESTRUCTURAS DE CADA LETRA
insert INTO abecedario VALUES('A',' AAAAA ','A     A','A     A','A     A','AAAAAAA','A     A','A     A','A     A','A     A');
insert INTO abecedario VALUES('B','BBBBB  ','B    B ','B     B','B     B','BBBBBBB','B     B','B     B','B    B ','BBBBB  ');
insert INTO abecedario VALUES('C','  CCC  ',' C   C ','C     C','C      ','C      ','C      ','C      ',' C   C ','  CCC  ');
insert INTO abecedario VALUES('D','DDDDD  ','D    D ','D     D','D     D','D     D','D     D','D     D','D    D ','DDDDD  ');
insert INTO abecedario VALUES('E','EEEEEEE','E      ','E      ','E      ','EEEE   ','E      ','E      ','E      ','EEEEEEE');
insert INTO abecedario VALUES('F','FFFFFFF','F      ','F      ','F      ','FFFF   ','F      ','F      ','F      ','F      ');
insert INTO abecedario VALUES('G','  GGG  ',' G   G ','G     G','G      ','G   GGG','G     G','G     G',' G   G ','  GGG  ');
insert INTO abecedario VALUES('H','H     H','H     H','H     H','H     H','HHHHHHH','H     H','H     H','H     H','H     H');
insert INTO abecedario VALUES('I',' IIIII ','  III  ','  III  ','  III  ','  III  ','  III  ','  III  ','  III  ',' IIIII ');
insert INTO abecedario VALUES('J','      J','      J','      J','      J','J     J','J     J',' J    J','  J   J','   JJJ ');
insert INTO abecedario VALUES('K','K     K','K    K ','K   K  ','K  K   ','KKK    ','K  K   ','K   K  ','K    K ','K     K');
insert INTO abecedario VALUES('L','L      ','L      ','L      ','L      ','L      ','L      ','L      ','L      ','LLLLLLL');
insert INTO abecedario VALUES('M','M     M','MM   MM','M M M M','M  M  M','M     M','M     M','M     M','M     M','M     M');
insert INTO abecedario VALUES('N','N     N','NN    N','N N   N','N  N  N','N   N N','N    NN','N     N','N     N','N     N');
insert INTO abecedario VALUES('O','  OOO  ',' O   O ','O     O','O     O','O     O','O     O','O     O',' O   O ','  OOO  ');
insert INTO abecedario VALUES('P','PPPPP  ','P    P ','P     P','P     P','PPPPPP ','P      ','P      ','P      ','P      ');
insert INTO abecedario VALUES('Q','  QQQ  ',' Q   Q ','Q     Q','Q     Q','Q     Q','Q     Q','Q   Q Q',' Q   QQ','  QQQ Q');
insert INTO abecedario VALUES('R','RRRRR  ','R    R ','R     R','R     R','RRRRRR ','R  R   ','R   R  ','R    R ','R     R');
insert INTO abecedario VALUES('S','  SSSS ',' S    S','S      ',' S     ','  SSSS ','     S ','      S',' S   S ',' SSSS  ');
insert INTO abecedario VALUES('T','TTTTTTT','   T   ','   T   ','   T   ','   T   ','   T   ','   T   ','   T   ','   T   ');
insert INTO abecedario VALUES('U','U     U','U     U','U     U','U     U','U     U','U     U','U     U',' U   U ','  UUU  ');
insert INTO abecedario VALUES('V','V     V','       ','       ',' V   V ','       ','  V V  ','       ','       ','   V   ');
insert INTO abecedario VALUES('W','W     W','W     W','W     W','W     W','W     W','W  W  W','W W W W','WW   WW','W     W');
insert INTO abecedario VALUES('X','XX   XX','X     X',' X   X ','  X X  ','   X   ','  X X  ',' X   X ','X     X','XX   XX');
insert INTO abecedario VALUES('Y','YY   YY','Y     Y',' Y   Y ','  Y Y  ','   Y   ','   Y   ','   Y   ','   Y   ','   Y   ');
insert INTO abecedario VALUES('Z','ZZZZZZZ','      Z','     Z ','    Z  ','   Z   ','  Z    ',' Z     ','Z      ','ZZZZZZZ');

--ALGORITMO PARA ESCRIBIR PALABRA EN LETRAS -----
accept x char prompt 'Por favor Ingrese una palabra de MAXIMO 8 Caracteres y minimo 1: '  -- Generamos una entrada por teclado

DECLARE 
palabra VARCHAR2(50); -- almacenara la palabra
letra1 CHAR ; -- almacenara cada letra de la palabra
tama number(2); -- tamaño de la palabra
linea_escribir VARCHAR2(68); -- string de cada linea a escribir maximo deberan ser 80 caracteres incluyendo espacios

--cada filaPalabra_# almacena la concatenacion de cada linea
filaPalabra_1 abecedario.fila1%TYPE;
filaPalabra_2 abecedario.fila2%TYPE;
filaPalabra_3 abecedario.fila3%TYPE;
filaPalabra_4 abecedario.fila4%TYPE;
filaPalabra_5 abecedario.fila5%TYPE;
filaPalabra_6 abecedario.fila6%TYPE;
filaPalabra_7 abecedario.fila7%TYPE;
filaPalabra_8 abecedario.fila8%TYPE;
filaPalabra_9 abecedario.fila9%TYPE;
n number; -- Controla el numero de la fila 1..9


BEGIN
    
    palabra := UPPER('&x'); 
    tama := LENGTH(palabra);
    
    
    FOR fila IN 1..9 LOOP --Recorremos cada fila o linea del texto
        n := fila;
        linea_escribir := ''; -- receteamos el texto de la linea a escribir
        
        FOR i IN 1..tama LOOP --Recorremos la palabra 
            letra1 := substr(palabra,i,1);
            
            
           CASE n  --Casos de fila 1 .. 9
            WHEN 1 THEN
                SELECT ab.fila1 into filaPalabra_1 FROM abecedario ab WHERE UPPER(ab.letra) = UPPER(letra1); --Extrae la el valor de la fila1 donde la letra corresponde.
                linea_escribir := linea_escribir || filaPalabra_1 ||' ';
                
            WHEN 2 THEN
                SELECT ab.fila2 into filaPalabra_2 FROM abecedario ab WHERE ab.letra = letra1;
                linea_escribir := linea_escribir || filaPalabra_2 ||' ' ;
            WHEN 3 THEN
                SELECT ab.fila3 into filaPalabra_3 FROM abecedario ab WHERE ab.letra = letra1;
                linea_escribir := linea_escribir || filaPalabra_3 ||' ';
            WHEN 4 THEN
                SELECT ab.fila4 into filaPalabra_4 FROM abecedario ab WHERE ab.letra = letra1;
                linea_escribir := linea_escribir || filaPalabra_4 ||' ';
            WHEN 5 THEN
                SELECT ab.fila5 into filaPalabra_5 FROM abecedario ab WHERE ab.letra = letra1;
                linea_escribir := linea_escribir || filaPalabra_5 ||' ';
            WHEN 6 THEN
                SELECT ab.fila6 into filaPalabra_6 FROM abecedario ab WHERE ab.letra = letra1;
                linea_escribir := linea_escribir || filaPalabra_6 ||' ';
            WHEN 7 THEN
                SELECT ab.fila7 into filaPalabra_7 FROM abecedario ab WHERE ab.letra = letra1;
                linea_escribir := linea_escribir || filaPalabra_7 ||' ';
            WHEN 8 THEN
                SELECT ab.fila8 into filaPalabra_8 FROM abecedario ab WHERE ab.letra = letra1;
                linea_escribir := linea_escribir || filaPalabra_8 ||' ';
            WHEN 9 THEN
                SELECT ab.fila9 into filaPalabra_9 FROM abecedario ab WHERE ab.letra = letra1;
                linea_escribir := linea_escribir || filaPalabra_9 || ' ';
           END CASE;
           
        end LOOP; --FIN LOOP palabra
        dbms_output.put_line('--- ' || linea_escribir);  -- Se imprime cada fila.
        
    END LOOP; -- FIN LOOP filas
    

END;

