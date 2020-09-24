DROP TABLE Encomenda;
DROP TABLE Equipamento;
DROP TABLE Laboratorio;
DROP TABLE Disputa;
DROP TABLE Base;
DROP TABLE Songs_BobGangue;
DROP TABLE BobHater;
DROP TABLE BobFollower;
DROP TABLE BobGangue;
DROP TABLE Bobianos;


create table Bobianos(
  BobID VARCHAR2(6),
  Nome VARCHAR2(40) NOT NULL,
  Altura Decimal(3,2) NOT NULL, -- 1 digito depois outro digito
  constraint Bobianos_pkey
    primary key (BobID)
);
    
create table BobGangue(
  WarCod VARCHAR2(4),
  Nome VARCHAR(30) NOT NULL,
  constraint BobGangue_pkey
    primary key (WarCod)
);

create table BobFollower(
  BobID VARCHAR2(6),
  LvSign VARCHAR2(10),
  CodEns VARCHAR2(6),
  WarCod VARCHAR2(4),
  constraint BobFollower_pkey
    primary key (BobID),
  constraint BobFollower_fkey1
    foreign key (BobID) references Bobianos(BobID),
  constraint BobFollower_fkey2
    foreign key (WarCod) references BobGangue(WarCod),
  constraint BobFollower_const1 
    unique (CodEns)
);
    
create table BobHater(
  BobID VARCHAR2(6),
  HtSign VARCHAR2(10),
  constraint BobHater_pkey
    primary key (BobID),
  constraint BobHater_fkey
    foreign key (BobID) references Bobianos(BobID)
);
    
create table Songs_BobGangue(
  WarCod VARCHAR2(4), --alterada de 6 para 4
  Song VARCHAR2(40),
  constraint Songs_BobGangue_pkey
    primary key (WarCod, Song),
  constraint Songs_BobGangue_fkey
    foreign key (WarCod) references BobGangue (WarCod)
);
    
create table Base(
  KingCod VARCHAR2(5),
  Area number NOT NULL,
  StatusVal number NOT NULL,
  constraint Base_pkey
    primary key (KingCod)
);
    
create table Disputa(
  BobID VARCHAR2(6),
  WarCod VARCHAR(4), --alterada de 6 para 4
  KingCod VARCHAR2(5),
  DataDisp date,
  constraint Disputa_pkey
    primary key (BobID, WarCod, KingCod, DataDisp),
  constraint Disputa_fkey1
    foreign key (BobID) references BobHater(BobID),
  constraint Disputa_fkey2
    foreign key (WarCod) references BobGangue(WarCod),
  constraint Disputa_fkey3
    foreign key (KingCod) references Base(KingCod)
);
  
create table Laboratorio(
  KingCer VARCHAR2(3),
  Custo number(10,2) NOT NULL,
  CEP VARCHAR2(8) NOT NULL,
  Numero number(3) NOT NULL,
  constraint Laboratorio_pkey
    primary key (KingCer)
);

create table Equipamento(
  KingCer VARCHAR2(3),
  EqID VARCHAR2(3),
  Peso number(3)NOT NULL,
  Poder number(3)NOT NULL,
  constraint Equipamento_pkey
    primary key (KingCer, EqID),
  constraint Equipamento_fkey
    foreign key (KingCer) references Laboratorio(KingCer),
  constraint Equipamento_const
    unique (EqID)
);

create table Encomenda(
  BobID VARCHAR2(6),
  EqID VARCHAR2(3),
  TipoServ VARCHAR2(6) NOT NULL,
  constraint Encomenda_pkey
    primary key (BobID, EqID),
  constraint Encomenda_fkey1
    foreign key (BobID) references BobHater(BobID),
  constraint Encomenda_fkey2
    foreign key (EqID) references Equipamento(EqID),
  constraint Encomenda_const
    unique (EqID)
);
