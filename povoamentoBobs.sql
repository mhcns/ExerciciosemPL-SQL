--INSERINDO BOBIANOS x15

INSERT INTO Bobianos (BobID, Nome, Altura) VALUES ('111111', 'Magrelin' , 1.75);
INSERT INTO Bobianos (BobID, Nome, Altura) VALUES ('222222', 'Gordin' , 1.82);
INSERT INTO Bobianos (BobID, Nome, Altura) VALUES ('333333', 'Cabecon' , 1.90);
INSERT INTO Bobianos (BobID, Nome, Altura) VALUES ('444444', 'Sangroku' , 2.02);
INSERT INTO Bobianos (BobID, Nome, Altura) VALUES ('555555', 'Kiondaessa' , 1.69);
INSERT INTO Bobianos (BobID, Nome, Altura) VALUES ('121212', 'Rato' , 1.77);
INSERT INTO Bobianos (BobID, Nome, Altura) VALUES ('232323', 'Careca' , 1.82);
INSERT INTO Bobianos (BobID, Nome, Altura) VALUES ('343434', 'Beco' , 1.91);
INSERT INTO Bobianos (BobID, Nome, Altura) VALUES ('454545', 'Bagre' , 2.05);
INSERT INTO Bobianos (BobID, Nome, Altura) VALUES ('565656', 'CatingadeSuvaco' , 1.67);

INSERT INTO Bobianos (BobID, Nome, Altura) VALUES ('666666', 'Leonaldo' , 1.77);
INSERT INTO Bobianos (BobID, Nome, Altura) VALUES ('777777', 'PeitodeVeia' , 1.69);
INSERT INTO Bobianos (BobID, Nome, Altura) VALUES ('888888', 'Melambe' , 1.80);
INSERT INTO Bobianos (BobID, Nome, Altura) VALUES ('999999', 'Soltapeido' , 1.65);
INSERT INTO Bobianos (BobID, Nome, Altura) VALUES ('000000', 'CabecadeCampo' , 1.92);

--INSERINDO BobGangue

INSERT INTO BobGangue (WarCod, Nome) VALUES ('1111', 'Xupetas');
INSERT INTO BobGangue (WarCod, Nome) VALUES ('2222', 'Fodinhas');
INSERT INTO BobGangue (WarCod, Nome) VALUES ('3333', 'Tocadores');
INSERT INTO BobGangue (WarCod, Nome) VALUES ('4444', 'Manes');
INSERT INTO BobGangue (WarCod, Nome) VALUES ('5555', 'Costalarga');

--INSERINDO BobFollower x10 pra ter 2 bobs por gangue.

INSERT INTO BobFollower (BobID, LvSign, CodEns, WarCod) VALUES ('111111' , 'tatuagem' , '011111', '1111');
INSERT INTO BobFollower (BobID, LvSign, CodEns, WarCod) VALUES ('222222' , 'tatuagem' , '022222', '1111');
INSERT INTO BobFollower (BobID, LvSign, CodEns, WarCod) VALUES ('333333' , 'tatuagem' , '033333', '2222');
INSERT INTO BobFollower (BobID, LvSign, CodEns, WarCod) VALUES ('444444' , 'tatuagem' , '044444', '2222');
INSERT INTO BobFollower (BobID, LvSign, CodEns, WarCod) VALUES ('555555' , 'tatuagem' , '055555', '3333');

INSERT INTO BobFollower (BobID, LvSign, CodEns, WarCod) VALUES ('121212' , 'tatuagem1' , '066666', '3333');
INSERT INTO BobFollower (BobID, LvSign, CodEns, WarCod) VALUES ('232323' , 'tatuagem1' , '077777', '4444');
INSERT INTO BobFollower (BobID, LvSign, CodEns, WarCod) VALUES ('343434' , 'tatuagem1' , '088888', '4444');
INSERT INTO BobFollower (BobID, LvSign, CodEns, WarCod) VALUES ('454545' , 'tatuagem1' , '099999', '5555');
INSERT INTO BobFollower (BobID, LvSign, CodEns, WarCod) VALUES ('565656' , 'tatuagem1' , '012121', '5555');

--INSERINDO BobHater

INSERT INTO BobHater (BobId, HtSign) VALUES ('666666', 'corte');
INSERT INTO BobHater (BobId, HtSign) VALUES ('777777', 'corte');
INSERT INTO BobHater (BobId, HtSign) VALUES ('888888', 'corte');
INSERT INTO BobHater (BobId, HtSign) VALUES ('999999', 'corte');
INSERT INTO BobHater (BobId, HtSign) VALUES ('000000', 'corte');

--INSERINDO Songs_BobGangue

INSERT INTO Songs_BobGangue (WarCod, Song) VALUES ('1111' , 'Killing o nome');
INSERT INTO Songs_BobGangue (WarCod, Song) VALUES ('2222' , 'People do sol');
INSERT INTO Songs_BobGangue (WarCod, Song) VALUES ('3333' , 'Testify');
INSERT INTO Songs_BobGangue (WarCod, Song) VALUES ('4444' , 'Radio Guerrirela');
INSERT INTO Songs_BobGangue (WarCod, Song) VALUES ('5555' , 'Wake up');

--INSERINDO Base

INSERT INTO Base (KingCod, Area, StatusVal) VALUES ('11111',700,6);
INSERT INTO Base (KingCod, Area, StatusVal) VALUES ('22222',400,4);
INSERT INTO Base (KingCod, Area, StatusVal) VALUES ('33333',900,5);
INSERT INTO Base (KingCod, Area, StatusVal) VALUES ('44444',1400,8);
INSERT INTO Base (KingCod, Area, StatusVal) VALUES ('55555',350,2);

--INSERINDO Disputa

INSERT INTO Disputa (BobID, WarCod, KingCod, DataDisp) VALUES ('666666','1111','11111',to_date('01/01/2017', 'dd/mm/yyyy'));
INSERT INTO Disputa (BobID, WarCod, KingCod, DataDisp) VALUES ('777777','1111','11111',to_date('01/01/2017', 'dd/mm/yyyy'));
INSERT INTO Disputa (BobID, WarCod, KingCod, DataDisp) VALUES ('999999','3333','22222',to_date('06/04/2017', 'dd/mm/yyyy'));
INSERT INTO Disputa (BobID, WarCod, KingCod, DataDisp) VALUES ('777777','4444','55555',to_date('20/03/2017', 'dd/mm/yyyy'));
INSERT INTO Disputa (BobID, WarCod, KingCod, DataDisp) VALUES ('888888','4444','55555',to_date('20/03/2017', 'dd/mm/yyyy'));

--INSERINDO Laboratorio

INSERT INTO Laboratorio (KingCer, Custo, CEP, Numero) VALUES ('111',100000,'11111111',111);
INSERT INTO Laboratorio (KingCer, Custo, CEP, Numero) VALUES ('222',50000,'22222222',222);
INSERT INTO Laboratorio (KingCer, Custo, CEP, Numero) VALUES ('333',70000,'33333333',333);
INSERT INTO Laboratorio (KingCer, Custo, CEP, Numero) VALUES ('444',120000,'44444444',444);
INSERT INTO Laboratorio (KingCer, Custo, CEP, Numero) VALUES ('555',100000,'55555555',555);

--INSERINDO Equipamento

INSERT INTO Equipamento (KingCer, EqID, Peso, Poder) VALUES ('111','111',10,10);
INSERT INTO Equipamento (KingCer, EqID, Peso, Poder) VALUES ('111','222',5,7);
INSERT INTO Equipamento (KingCer, EqID, Peso, Poder) VALUES ('222','333',30,45);
INSERT INTO Equipamento (KingCer, EqID, Peso, Poder) VALUES ('333','444',12,15);
INSERT INTO Equipamento (KingCer, EqID, Peso, Poder) VALUES ('333','555',2,10);
INSERT INTO Equipamento (KingCer, EqID, Peso, Poder) VALUES ('444','666',100,200);
INSERT INTO Equipamento (KingCer, EqID, Peso, Poder) VALUES ('555','777',50,70);
INSERT INTO Equipamento (KingCer, EqID, Peso, Poder) VALUES ('555','888',4,10);

--INSERINDO Encomenda

INSERT INTO Encomenda (BobID, EqID, TipoServ) VALUES ('666666','222','SEDEX');
INSERT INTO Encomenda (BobID, EqID, TipoServ) VALUES ('777777','555','PAC');
INSERT INTO Encomenda (BobID, EqID, TipoServ) VALUES ('888888','777','SEDEX');
INSERT INTO Encomenda (BobID, EqID, TipoServ) VALUES ('999999','111','SEDEX');
INSERT INTO Encomenda (BobID, EqID, TipoServ) VALUES ('000000','333','PAC');