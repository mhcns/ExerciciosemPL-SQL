--52 e 54.
-- pequena função pra demonstar o uso de case e while

CREATE OR REPLACE FUNCTION p_i(p_i Number)
RETURN Number IS
retorno Number;
ind Number := 0;
BEGIN
CASE p_i
    WHEN 4 THEN retorno := 1;
    ELSE retorno:= p_i;
END CASE;
WHILE retorno*2 < p_i*p_i*2
LOOP
retorno := retorno*2;
ind := ind + 1;
END LOOP;
    RETURN ind;
END p_i;
/

DECLARE
    lala NUMBER;
    func NUMBER;
BEGIN
  SELECT Altura INTO lala FROM Bobianos WHERE BobID = '111111';
  func := p_i(lala);
  dbms_output.put_line('Quantos loops foram necessários para que mult sucessivas de 2 chegasse no seu quadrado? ->>>> '  ||func);
END;
/

--61
--Mostra o nome e altura de determinado bob

DECLARE
    Bnome VARCHAR2(10);
    CURSOR  c_emp (c_emp_id VARCHAR2) IS SELECT Nome, Altura FROM Bobianos WHERE BobID = c_emp_id;
BEGIN
  FOR i IN c_emp('111111') LOOP
  Bnome := i.Nome;
  dbms_output.put_line('Nome do bob é ' ||Bnome|| ' Cuja altura é ' ||i.Altura);
  END LOOP;
END;
/


---------------------------------------------------------
--Funções, Procedimentos e Package

--64
CREATE OR REPLACE PROCEDURE InsereBob(
  p_bobid IN BobFollower.BobID%TYPE,
  p_lvsign IN BobFollower.LvSign%TYPE,
  p_codens IN BobFollower.CodEns%TYPE,
  p_warcod IN BobFollower.WarCod%TYPE) IS
  --inserir na tabela BobFollower
  BEGIN
      INSERT INTO BobFollower (BobID, LvSign, CodEns, WarCod) 
      VALUES (p_bobid, p_lvsign, p_codens, p_warcod);
      COMMIT;
  END InsereBob;
/

BEGIN
  InsereBob('777777' , 'tatuagem' , '023232', '1111');
END;
----------------------

--63
--Mostra determinada msg
CREATE OR REPLACE PROCEDURE teste1 IS
  var_name VARCHAR2(30) := ' Sem Parametros';
BEGIN
  dbms_output.put_line('Procedure'||var_name);
END teste1;
/

EXEC teste1;
--------------------------------------------

--64 , 65 , 67  e 56 (recupera)
--pega determinado BobID e devolve o nome correspondente
CREATE OR REPLACE PROCEDURE pega_nome(
  p_teste IN Bobianos.BobID%Type,
  pega_nome OUT Bobianos.Nome%Type) IS
BEGIN
  SELECT Nome INTO pega_nome FROM Bobianos --56
   WHERE BobID = p_teste;
END;
/

DECLARE
  BobNome VARCHAR2(20);
BEGIN
    pega_nome('111111', BobNome);
    dbms_output.put_line('Seu nome é '||BobNome);
END;
/ 
  
--------------------------------------------
--66 e 67.
-- dobra a altura dos bobianos
CREATE OR REPLACE PROCEDURE bob_altura(
  p_bob IN Bobianos.BobID%Type,
  altura_inc IN OUT Bobianos.Altura%Type) IS
BEGIN
  SELECT Altura INTO altura_inc FROM Bobianos
   WHERE BobID = p_bob;
     altura_inc := altura_inc * 2;
END;
/

DECLARE
  CURSOR update_sal IS SELECT BobID, Altura FROM Bobianos;
  BobAlt DECIMAL(3,2);
BEGIN
 FOR emp_alt IN update_sal LOOP
 BobAlt := emp_alt.Altura;
  bob_altura(emp_alt.BobID , emp_alt.Altura);
  dbms_output.put_line('A altura de ' ||emp_alt.BobID|| 
  ' aumentou de ' ||BobAlt|| ' para ' ||emp_alt.Altura);
  END LOOP;
END;
/

------------------------------------------------

/*--68
-- Seleciona maior altura e soma + 1
CREATE OR REPLACE FUNCTION f1 
RETURN VARCHAR2 IS
retorno VARCHAR2(20);
BEGIN
  SELECT MAX(Altura) INTO retorno FROM Bobianos;
    retorno := retorno +1;
    RETURN retorno;
END f1;
/*/

--69 e 70.
--Pega determinado Bobiano e retorna sua altura dobrada
CREATE OR REPLACE FUNCTION f2(
  f_id IN Bobianos.BobID%TYPE,
  f_alt OUT Bobianos.Altura%TYPE
)
RETURN Number IS
retorno Number;
BEGIN
    SELECT Altura INTO f_alt FROM Bobianos
        WHERE BobID = f_id;
  SELECT Altura INTO retorno FROM Bobianos
    WHERE BobID = f_id;
      retorno := retorno + f_alt;
      RETURN retorno;
END f2;
/

DECLARE
 test number;
 c number;
BEGIN
 c := f2('111111' , test);
 dbms_output.put_line('vale ' || c);
END;
/
---------
--71
--Pega determinado bobiano e Dobra a altura e a soma + 2
CREATE OR REPLACE FUNCTION f3(
  f_id IN Bobianos.BobID%TYPE,
  f_alt IN OUT Bobianos.Altura%TYPE
)
RETURN Number IS
retorno Number;
BEGIN 
  SELECT Altura INTO f_alt FROM Bobianos
   WHERE BobID = f_id;
    f_alt := f_alt + 2;
  SELECT Altura INTO retorno FROM Bobianos
    WHERE BobID = f_id;
      retorno := f_alt + retorno;
      RETURN retorno;
END f3;
/

DECLARE
  BobAlt DECIMAL(3,2);
  test number;
BEGIN
  test := f3('111111' , BobAlt);
  dbms_output.put_line('A altura de ' ||test);
END;
/

-----
--72 e 90.
--Cadastro Bobiano : Adiciona , Deleta, Lista um pre determinado Bob com altura aumentada 
CREATE OR REPLACE PACKAGE CadastroBob AS
  FUNCTION cresceBob(
    b_id IN Bobianos.BobID%Type)
    RETURN DECIMAL;

  PROCEDURE addBob (
    b_id2 IN Bobianos.BobID%Type,
    b_nome2 IN Bobianos.Nome%Type,
    b_altura2 IN Bobianos.Altura%TYPE);

  PROCEDURE delBob(b_id IN Bobianos.BobID%Type);
  
  PROCEDURE listaFst;
    
END CadastroBob;
/

CREATE OR REPLACE PACKAGE BODY CadastroBob AS
  FUNCTION cresceBob(
    b_id IN Bobianos.BobID%Type)
  RETURN DECIMAL IS
  retorno DECIMAL(3,2);
  BEGIN
  SELECT Altura INTO retorno FROM Bobianos
    WHERE BobID = b_id;
        retorno := retorno + 2;
        RETURN retorno;
  END cresceBob;

  PROCEDURE addBob (
    b_id2 IN Bobianos.BobID%Type,
    b_nome2 IN Bobianos.Nome%Type,
    b_altura2 IN Bobianos.Altura%TYPE)
  IS
  BEGIN
    INSERT INTO Bobianos (BobID, Nome, Altura) VALUES (b_id2, b_nome2, b_altura2);
  END addBob;

  PROCEDURE delBob(b_id IN Bobianos.BobID%Type)
  IS
  BEGIN
    DELETE FROM Bobianos
    WHERE BobID = b_id;
  END delBob;
  
  PROCEDURE listaFst
  IS
  teste number;
  BEGIN
    teste := cresceBob('898900'); --func no proc
     dbms_output.put_line('A altura desse bob aumentada é ' ||teste);
  END listaFst;
  
END CadastroBob;
/

--Executar um por vez.
BEGIN
    CadastroBob.addBob('898900', 'Jumento' , 3);
    CadastroBob.delBob('898900');
    CadastroBob.listaFst;
END;
/
  

---------------------------------------
-- 87 , 63
-- função (sem parametros) que pega a menor altura e retorna ela somada mais 0.2
-- o select mostrará os bobianos cuja altura ultrapassa o requesito anterior.

CREATE OR REPLACE FUNCTION double_alt 
RETURN Number
IS retorno Number;
BEGIN
SELECT Altura INTO retorno FROM Bobianos
  WHERE Altura IN (SELECT MIN(Altura) FROM Bobianos);
  RETURN retorno + 0.2;
END double_alt;
/

SELECT * FROM Bobianos
 WHERE ALTURA > double_alt();

------------
--88, 68
-- Pega uma determinada coluna de Bobianos, e a partir dela, modifica um valor/devolve-se o nome do referente Bobiano.
CREATE OR REPLACE PROCEDURE teste100 (
   employee_in IN Bobianos%ROWTYPE, --registro aqui
   teste10 OUT Bobianos.Nome%TYPE)
IS
BEGIN
  SELECT Nome INTO teste10 FROM Bobianos
    WHERE BobID = employee_in.BobID;
END;
/

DECLARE
    bobinho Bobianos%ROWTYPE;
    BobNome VARCHAR2(10);
BEGIN
    bobinho.BobID := '111111';
   teste100(bobinho , BobNome);
   dbms_output.put_line('O nome desse bob é ' ||BobNome);
END;
/

----------
--89
--Retorna o Bobiano de maior altura.
CREATE OR REPLACE FUNCTION mund_v
RETURN Bobianos%ROWTYPE
IS retorno Bobianos%ROWTYPE;
BEGIN
  SELECT * INTO retorno FROM Bobianos
    WHERE ALTURA IN (SELECT MAX(ALTURA) FROM Bobianos);
    RETURN retorno;
END mund_v;
/

DECLARE
    bobinho Bobianos%ROWTYPE;
BEGIN
    bobinho := mund_v();
   dbms_output.put_line('O nome desse bob é ' ||bobinho.Nome|| ' e sua altura é ' ||bobinho.Altura);
END;
/

----------------------------------------------------------------------------------

--91
--Caso tente atualizar BobID , não poderá, pois é PK
--De resto, pode.

CREATE OR REPLACE VIEW bob_view AS SELECT * FROM Bobianos;

CREATE OR REPLACE TRIGGER trig_view 
INSTEAD OF UPDATE ON bob_view
DECLARE
  b_error VARCHAR2(30);
BEGIN
  IF UPDATING('BobID')
  then
    b_error := 'cant, its a PK';
    raise_application_error(-20999, b_error);
  END IF;
END;
/

UPDATE bob_view SET BobID = '122222' --da erro
   WHERE BobID = '111111';

UPDATE bob_view SET Altura = 2.4 --atualiza ok
    WHERE BobID = '111111';
