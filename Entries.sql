--Room

INSERT INTO Room(Num,Occupied) VALUES('379','0');
INSERT INTO Room(Num,Occupied) VALUES('810','1');
INSERT INTO Room(Num,Occupied) VALUES('756','0');
INSERT INTO Room(Num,Occupied) VALUES('429','1');
INSERT INTO Room(Num,Occupied) VALUES('609','0');
INSERT INTO Room(Num,Occupied) VALUES('419','1');
INSERT INTO Room(Num,Occupied) VALUES('710','0');
INSERT INTO Room(Num,Occupied) VALUES('974','1');
INSERT INTO Room(Num,Occupied) VALUES('288','1');
INSERT INTO Room(Num,Occupied) VALUES('567','1');

--Patient

INSERT INTO Patient(SSN,FirstName,LastName,Address,TelNum) VALUES('217979887','David','Gilbert','31463 Karina Parkways
East Nico','8848766085');
INSERT INTO Patient(SSN,FirstName,LastName,Address,TelNum) VALUES('837597468','Jeremy','Sims','986 Steven Lights Apt. ','2758418292');
INSERT INTO Patient(SSN,FirstName,LastName,Address,TelNum) VALUES('438886469','Kimberly','Wilcox','655 Martinez Turnpike Suite 071
J','9119577718');
INSERT INTO Patient(SSN,FirstName,LastName,Address,TelNum) VALUES('203353790','Jessica','Allen','166 Brian Crest Suite 250
P','3820571014');
INSERT INTO Patient(SSN,FirstName,LastName,Address,TelNum) VALUES('642480422','Howard','Reyes','90056 Mccullough Vista Suite','8160853343');
INSERT INTO Patient(SSN,FirstName,LastName,Address,TelNum) VALUES('884526500','Alexander','Dixon','2513 Williams Light Apt. 515
So','4375126750');
INSERT INTO Patient(SSN,FirstName,LastName,Address,TelNum) VALUES('179930171','Jim','Jordan','30250 Julie Prairie Suite 552
Port ','6821375512');
INSERT INTO Patient(SSN,FirstName,LastName,Address,TelNum) VALUES('805749960','Jon','Cole','0610 Juarez Crescent A','8500388514');
INSERT INTO Patient(SSN,FirstName,LastName,Address,TelNum) VALUES('917256878','Ronald','Thompson','2696 Madison Turnpike
Williamsside','7784139553');
INSERT INTO Patient(SSN,FirstName,LastName,Address,TelNum) VALUES('153529013','Eric','Gamble','66605 Wall Center Apt. 7','4734814940');

--Doctor

INSERT INTO Doctor(Id,FirstName,LastName,Gender,Specialty) VALUES('13658','Ashley','Li',F,Lungs);
INSERT INTO Doctor(Id,FirstName,LastName,Gender,Specialty) VALUES('55696','Benjamin','Stewart',F,Eye);
INSERT INTO Doctor(Id,FirstName,LastName,Gender,Specialty) VALUES('86451','Dale','Williams',F,Hair);
INSERT INTO Doctor(Id,FirstName,LastName,Gender,Specialty) VALUES('37279','Thomas','Kelly',F,Mouth);
INSERT INTO Doctor(Id,FirstName,LastName,Gender,Specialty) VALUES('62670','Dan','Wood',F,Chest);
INSERT INTO Doctor(Id,FirstName,LastName,Gender,Specialty) VALUES('46192','Gregory','Conrad',F,Hair);
INSERT INTO Doctor(Id,FirstName,LastName,Gender,Specialty) VALUES('59938','Hunter','Lynch',F,Hair);
INSERT INTO Doctor(Id,FirstName,LastName,Gender,Specialty) VALUES('43712','Daniel','Shea',F,Legs);
INSERT INTO Doctor(Id,FirstName,LastName,Gender,Specialty) VALUES('51353','Danielle','Cooper',M,Hair);
INSERT INTO Doctor(Id,FirstName,LastName,Gender,Specialty) VALUES('24651','Janet','Ashley',F,Hair);


--RoomService
INSERT INTO RoomService(RoomNum, Service) VALUES('379', 'Emergency')
INSERT INTO RoomService(RoomNum, Service) VALUES('379', 'Surgery')
INSERT INTO RoomService(RoomNum, Service) VALUES('810', 'Nursing')
INSERT INTO RoomService(RoomNum, Service) VALUES('810', 'Maternity')
INSERT INTO RoomService(RoomNum, Service) VALUES('756', 'Pharmacy')
INSERT INTO RoomService(RoomNum, Service) VALUES('756', 'ICU')
INSERT INTO RoomService(RoomNum, Service) VALUES('429','Operating');
INSERT INTO RoomService(RoomNum, Service) VALUES('609','Morgues');
INSERT INTO RoomService(RoomNum, Service) VALUES('419','Xray');
INSERT INTO RoomService(RoomNum, Service) VALUES('710','Waiting');





