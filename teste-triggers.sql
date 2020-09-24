set serveroutput on
DELETE FROM BobGangue
  WHERE WARCOD = '5555';

DELETE FROM Laboratorio
  WHERE KingCer = '111';
  
INSERT INTO Bobianos (BobID, Nome, Altura) VALUES ('111111', 'Jack Chan' , 1.75);

DELETE FROM Disputa
  WHERE WARCOD = '3333';
  
UPDATE Bobianos
  SET BobID = '123456'
  WHERE BobID = '111111';
  
INSERT INTO BobGangue (WarCod, Nome) VALUES ('6666', 'Macumbeiros');