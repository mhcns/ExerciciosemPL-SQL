----------------------------------------
-- 75, 79, 86, 85

-- Atualiza valores dos ex-membros da gangue retirada e deleta as músicas dela após a deleção
CREATE OR REPLACE TRIGGER delete_gangue
BEFORE DELETE ON BobGangue
FOR EACH ROW
BEGIN
  UPDATE BobFollower
    SET WarCod = NULL
    WHERE WarCod = :OLD.WarCod;
  DELETE FROM Songs_BobGangue WHERE WarCod = :OLD.WarCod;
  dbms_output.put_line('Ex-Gangsters atualizados com sucesso!');
END;
/
-------------------
-- 73, 79, 83

-- Impede a deleção de um labarotório com equipamentos relacionados a ele existentes
CREATE OR REPLACE TRIGGER delete_lab_produtor
BEFORE DELETE ON Laboratorio
FOR EACH ROW
DECLARE
  v_kingcer NUMBER;
BEGIN
  SELECT Count(KingCer) INTO v_kingcer FROM Equipamento WHERE KINGCER = :OLD.KingCer;
   IF v_kingcer > 0 THEN
     RAISE_APPLICATION_ERROR(-20090,'Deletar equipamentos relacionados a tal laboratorio primeiro.');
  END IF;
END;
/
----------------------
-- 78, 81

-- Impede a inserção de um bobiano já existente
CREATE OR REPLACE TRIGGER insert_bobiano_existente
BEFORE INSERT ON Bobianos
FOR EACH ROW
DECLARE
  v_bobid NUMBER;
BEGIN
  SELECT Count(BobID) INTO v_bobid FROM Bobianos WHERE BobID = :NEW.BobID;
  IF v_bobid > 0 THEN
    RAISE_APPLICATION_ERROR(-20157,'Camarada ja existe!');
  END IF;
END;
/
---------------------
-- 77, 82

-- Impede Delete ou Update na tabela Disputa
CREATE OR REPLACE TRIGGER alterar_disputa
BEFORE DELETE OR UPDATE ON Disputa
BEGIN
RAISE_APPLICATION_ERROR(-20151,'Proibido alterar registros de disputas!');
END;
/
--------------------
-- 76

-- Impede alteração no ID dos bobianos
CREATE OR REPLACE TRIGGER ID_bobiano
BEFORE UPDATE ON Bobianos
FOR EACH ROW WHEN (NEW.BOBID != OLD.BOBID)
BEGIN
  RAISE_APPLICATION_ERROR(-20404,'BobID eh unico e inalteravel');
END;
/
-----------------------
-- 74, 84

-- Insere música relacionada à gangue recém inserida
CREATE OR REPLACE TRIGGER insert_song
AFTER INSERT ON BobGangue
FOR EACH ROW
DECLARE
  n_warcod BobGangue.WarCod%TYPE := :NEW.WarCod;
BEGIN
INSERT INTO Songs_BobGangue(WarCod, Song) VALUES (n_warcod,'Unknown');
DBMS_OUTPUT.PUT_LINE('Musica "Unknown" adicionada à Gangue de WarCod: '||n_warcod);
END;
/