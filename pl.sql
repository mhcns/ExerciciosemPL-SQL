set serveroutput on
-----------------------
-- 48, 49

-- cria 2 variaveis (altura, BobID) e corrige a altura do bobiano BobID ou o adiciona no BD caso não esteja
DECLARE 
  n_altura NUMBER(3,2):= 1.90;
  n_BobID VARCHAR2(6) := '909090';
BEGIN
UPDATE Bobianos
  SET Altura = n_altura
  WHERE BobID = n_BobID;
EXCEPTION
 WHEN NO_DATA_FOUND THEN
    INSERT INTO Bobianos(BobID,Nome,Altura)
      VALUES(n_BobID,'LiuKang',n_altura);
END;
/
------------------------------------------------
--Adiciona a coluna 'Tamanho' na tabela bobianos.
ALTER TABLE Bobianos 
  ADD Tamanho VARCHAR2(5);
--------------------------------------
-- 59, 50, 51, 53

-- Adiciona valores à coluna 'Tamanho' de acordo com a altura do bobiano.
DECLARE 
  CURSOR c_alt IS SELECT Altura, BobID FROM Bobianos;
  v_altura BOBIANOS.ALTURA%TYPE;
  v_BobID BOBIANOS.BOBID%TYPE;
BEGIN
  OPEN c_alt;
  LOOP
    FETCH c_alt INTO v_altura, v_BobID;
    EXIT WHEN c_alt%NOTFOUND;
    IF v_altura >= 1.90 THEN UPDATE Bobianos SET TAMANHO='Alto' WHERE v_BobID=BobID;
    ELSIF v_altura < 1.65 THEN UPDATE Bobianos SET TAMANHO='Baixo' WHERE v_BobID=BobID;
    ELSE UPDATE Bobianos SET TAMANHO='Medio' WHERE v_BobID=BobID;
    END IF;
  END LOOP;
  CLOSE c_alt;
END;
/
-----------------------------------------
-- 56, 58

-- Mostra número de bobianos 
DECLARE
  qtdbob NUMBER;
BEGIN
SELECT COUNT(*) INTO qtdbob FROM Bobianos;
dbms_output.put_line('populacao atual no mundo de bob: '||qtdbob);
END;
/
--------------------------------------------
-- 55, 62

-- Nome dos Bobianos
DECLARE 
BEGIN
  dbms_output.put_line('Nome dos bobianos:');
  FOR v_reg IN (SELECT Nome FROM Bobianos) LOOP
    dbms_output.put_line(v_reg.nome);
  END LOOP;
END;
/
-----------------------------------------------
-- 57

-- Mostra equipamentos produzidos pelo laboratório '111'
DECLARE 
CURSOR c_reg IS
SELECT EqID, Peso, Poder FROM Equipamento
  WHERE KingCer = '111';
v_reg c_reg%ROWTYPE;
BEGIN
  OPEN c_reg;
  LOOP
    FETCH c_reg INTO v_reg;
    EXIT WHEN c_reg%NOTFOUND;
    dbms_output.put_line('EqID: '||v_reg.EqID||', Peso: '||v_reg.Peso||' e Poder: '||v_reg.Poder);
  END LOOP;
  CLOSE c_reg;
END;
/