DROP TABLE Country;
DROP TABLE Venue;
DROP TABLE Medal;
DROP TABLE Group;
DROP TABLE Athlete;
DROP TABLE In_Group;
DROP TABLE Ind_Participate;
DROP TABLE Group_Participate;
DROP TABLE Event;
DROP TABLE Sport_Type;
DROP TABLE Highlight;

commit;


CREATE TABLE Country
    (name CHAR(20) NOT NULL PRIMARY KEY ,
    gold INTEGER,
    silver INTEGER,
    bronze INTEGER,
    isHost_flag BIT);

CREATE TABLE Venue
  (vname CHAR(30) NOT NULL PRIMARY KEY,
   location CHAR(30),
   capacity INTEGER,
   size CHAR(20));

CREATE TABLE Medal
  (type CHAR(1) NOT NULL,
   stname CHAR(30) NOT NULL,
   athleteid INTEGER,
   groupid INTEGER,
   PRIMARY KEY(type, stname),
   FOREIGN KEY (stname) REFERENCES Sport_Type,
   ON DELETE CASCADE
   ON UPDATE CASCADE
   FOREIGN KEY (athleteid) REFERENCES Athlete,
   ON DELETE SET NULL
   ON UPDATE CASCADE
   FOREIGN KEY (groupid) REFERENCES Group
   ON DELETE SET NULL
   ON UPDATE CASCADE);

CREATE TABLE Athlete
   (athleteid INTEGER NOT NULL PRIMARY KEY,
   countryname CHAR(20),
   sport_category CHAR(30),
   name CHAR(20) NOT NULL,
   sex CHAR(6),
   height INTEGER,
   weight INTEGER,
   date_of_birth DATE,
   FOREIGN KEY(countryname) REFERENCES Country
   ON UPDATE CASCADE);

CREATE TABLE Group
  (groupid INTEGER NOT NULL PRIMARY KEY,
   countryname CHAR(20) NOT NULL,
   sport_category CHAR(30),
   sex CHAR(6),
   FOREIGN KEY(countryName) REFERENCES Country
   ON UPDATE CASCADE);

CREATE TABLE In_Group
   (groupid INTEGER NOT NULL,
   athleteid INTEGER NOT NULL,
   PRIMARY KEY(groupid, athleteid),
   FOREIGN KEY(groupid) REFERENCES Group
   ON DELETE CASCADE,
   ON UPDATE CASCADE,
   FOREIGN KEY(athleteid) REFERENCES Athlete
   ON DELETE CASCADE
   ON UPDATE CASCADE);

CREATE TABLE Ind_Participate
  (eventname CHAR(30) NOT NULL,
  athleteid INTEGER NOT NULL,
  performance INTEGER,
  PRIMARY KEY(eventname, athleteid),
  FOREIGN KEY(eventname) REFERENCES Event
  ON UPDATE CASCADE,
  FOREIGN KEY(athleteid) REFERENCES Athlete
  ON DELETE SET NULL
  ON UPDATE CASCADE);

CREATE TABLE Group_Participate
  (eventname CHAR(30) NOT NULL,
  groupid INTEGER NOT NULL,
  performance INTEGER,
  PRIMARY KEY(eventname, groupid),
  FOREIGN KEY(eventname) REFERENCES Event,
  ON UPDATE CASCADE
  FOREIGN KEY(groupid) REFERENCES Group
  ON DELETE SET NULL
  ON UPDATE CASCADE);

CREATE TABLE Event
  (eventname CHAR(30) NOT NULL PRIMARY KEY,
  stname CHAR(30),
  date DATE,
  isfinal_flag BIT,
  FOREIGN KEY(stname) REFERENCES Sport_type
  ON DELETE SET NULL
  ON UPDATE CASCADE);

CREATE TABLE Sport_Type
  (stname CHAR(30) NOT NULL PRIMARY KEY,
  sport_category CHAR(30),
  vname CHAR(30),
  FOREIGN KEY(vname) REFERENCES Venue
  ON DELETE SET NULL
  ON UPDATE CASCADE);

CREATE TABLE Highlight
  (hlid INTEGER NOT NULL,
  eventname CHAR(30) NOT NULL,
  description CHAR(100),
  PRIMARY KEY(hlid, eventname),
  FOREIGN KEY(eventname) REFERENCES Event
  ON DELETE CASCADE
  ON UPDATE CASCADE);

commit;


insert into Country
  values('USA',3,1,2,0);

insert into Country
  values('China',2,2,0,0);

insert into Country
  values('UK',1,2,0,0);

insert into Country
  values('Canada',1,0,1,0);

insert into Country
  values('Japan',0,1,3,0);

insert into Country
  values('Wakanda',0,1,1,1);

insert into Venue
  values('Hogwarts','New Scotland',50000,20000);

insert into Venue
  values('Death Star', 'Galaxy', 100000,40000);

insert into Venue
  values('Summoner Rift', 'Freljord', 20000, 30000);

insert into Medal
  values('g','Male 100m Sprint',1,NULL);

insert into Medal
  values('s','Male 100m Sprint',10,NULL);

insert into Medal
  values('b','Male 100m Sprint',20,NULL);

insert into Medal
  values('g','Quidditch',NULL,1);

insert into Medal
  values('s','Quidditch',NULL,2);

insert into Medal
  values('b','Quidditch',NULL,3);

insert into Athlete
  values(1,'USA','Superman','Male',180,130,TO_DATE('01-JAN-1900', 'DD-MON-YYY'))

insert into Athlete
  values(16,'China','Quidditch','Zihao Jian','Male',170,200,TO_DATE('05-APR-1997', 'DD-MON-YYY'));

insert into Athlete
  values(17,'China','Quidditch','Kai Ming','Male',177,120,TO_DATE('25-JUL-1993', 'DD-MON-YYYY'));

insert into Group
  values(1,'China','Quidditch','Mixed');

insert into In_Group
  values(1,16);

insert into In_Group
  values(1,17);

insert into Ind_Participate
  values('Male 100m Sprint Final',1,1);

insert into Group_Participate
  values('Quidditch Final',1,1);

insert into Group_Participate
  values('Quidditch Semifinal CNvCA',1,1);

insert into Event
  values('Male 100m Sprint Final','Male 100m Sprint',TO_DATE('01-JUL-2020', 'DD-MON-YYYY'),1);

insert into Event
  values('Quidditch Final','Quidditch',TO_DATE('03-JUL-2020', 'DD-MON-YYYY'),1);

insert into Event
  values('Quidditch Semifinal CNvCA','Quidditch',TO_DATE('02-JUL-2020', 'DD-MON-YYYY'),0);

insert into Sport_Type
  values('Male 100m Sprint','Sprint','Death Star');

insert into Sport_Type
  values('Quidditch','Quidditch','Hogwarts');

insert into Highlight
  values(1,'Quidditch Final','Ming Kai is kicked by Harry Potter');