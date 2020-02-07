/* the char lengths were kind of just guessed on */
/*ALL THE create tables are its own file so we can copy into sqlplus on WPI server and run it */
/*Part 1 of phase 2 Team 37 Surya Vadivazhagu & James Flynn */

-- Drop the tables first
DROP TABLE Employee CASCADE CONSTRAINTS;
DROP TABLE Room CASCADE CONSTRAINTS;
DROP TABLE Equipment CASCADE CONSTRAINTS;
DROP TABLE EquipmentType CASCADE CONSTRAINTS;
DROP TABLE RoomAccess CASCADE CONSTRAINTS;
DROP TABLE RoomService CASCADE CONSTRAINTS;
DROP TABLE Patient CASCADE CONSTRAINTS;
DROP TABLE Doctor CASCADE CONSTRAINTS;
DROP TABLE Admission CASCADE CONSTRAINTS;
DROP TABLE Examine CASCADE CONSTRAINTS;
DROP TABLE StayIn CASCADE CONSTRAINTS;


/* Employee */
create table Employee(
    ID INTEGER NOT NULL PRIMARY KEY,
    FName VARCHAR(30) NOT NULL,
    LName VARCHAR(30) NOT NULL,
    Salary FLOAT NOT NULL,
    JobTitle VARCHAR(30) NOT NULL,
    OfficeNum VARCHAR(5) NOT NULL UNIQUE,   /* Two employee's can't have the same office so it has to be unique */
    EmpRank INTEGER NOT NULL, /* 0 = Regular, 1  = Division Manager, 2 = General Manager */
    SupervisorId INTEGER, /*It's not NOT NULL because General Manager doesn't have a manager so this would be NULL for them. */
    CONSTRAINT CHK_EmpRank CHECK (EmpRank = 0 OR EmpRank = 1 OR EmpRank = 2)
);

/* Room entity */
create table Room(
    Num INTEGER NOT NULL PRIMARY KEY,
    Occupied CHAR(1) NOT NULL,
    CONSTRAINT CHK_Occupied CHECK (Occupied = 0 OR Occupied = 1) /*if occupied, 1, if not, 0 */
);

create table EquipmentType(
    Id VARCHAR(20) NOT NULL PRIMARY KEY,
    Description VARCHAR(20), /* May or may not have a description */
    ModelType VARCHAR(20) NOT NULL,
    Instructions VARCHAR(500) /* May or may not have instructions */
);

create table Equipment(
    Serial VARCHAR(20) NOT NULL PRIMARY KEY,
    TypeId VARCHAR(20) NOT NULL,
    PurchaseYear DATE NOT NULL,
    LastInspection DATE,
    RoomNum INTEGER NOT NULL,
    FOREIGN KEY (RoomNum) REFERENCES Room(Num),
    FOREIGN KEY (TypeId) REFERENCES EquipmentType(Id),
    CONSTRAINT CHK_Equipment CHECK (LastInspection >= PurchaseYear)
);

create table RoomService(
    RoomNum INTEGER NOT NULL,
    Service CHAR(20) NOT NULL,
    CONSTRAINT PK_RoomService PRIMARY KEY (RoomNum, Service),
    FOREIGN KEY (RoomNum) REFERENCES Room(Num)
);

create table RoomAccess(
    RoomNum INTEGER NOT NULL,
    EmpId INTEGER NOT NULL,
    CONSTRAINT PK_RoomAccess PRIMARY KEY (RoomNum, EmpId),
    FOREIGN KEY (RoomNum) REFERENCES Room(Num),
    FOREIGN KEY (EmpId) REFERENCES Employee(Id)
);

create table Patient(
    SSN VARCHAR(9) NOT NULL PRIMARY KEY, /* Assuming it's format 123456789 */
    FirstName VARCHAR(15) NOT NULL,
    LastName VARCHAR(30) NOT NULL,
    Address VARCHAR(30) NOT NULL,
    TelNum VARCHAR(10) NOT NULL /* Assuming it's format 1234567890 */
);

create table Doctor(
    Id INTEGER NOT NULL PRIMARY KEY,
    FirstName VARCHAR(15) NOT NULL,
    LastName VARCHAR(30) NOT NULL,
    Gender CHAR(1) NOT NULL, /*Assuming either M or F */
    Specialty VARCHAR(30) NOT NULL, /*If no specialty, assuming can mark as such */
    CONSTRAINT CHK_Gender CHECK (Gender = 'M' OR Gender = 'F')
);

create table Admission(
    AdmissionNum INTEGER NOT NULL PRIMARY KEY,
    AdmissionDate DATE NOT NULL,
    LeaveDate DATE, /*Assuming that a patient's leave date isn't always known */
    TotalPayment REAL NOT NULL,
    InsurancePayment REAL, /*Not all patients have insurance, so can be null */
    PatientSSN VARCHAR(9) NOT NULL,
    FutureVisit DATE, /*patient doesn't always need a future visit can be null */
    FOREIGN KEY (PatientSSN) REFERENCES Patient(SSN),
    CONSTRAINT CHK_Admission CHECK (AdmissionDate<=LeaveDate),
    CONSTRAINT CHK_Future CHECK (LeaveDate<FutureVisit),
    CONSTRAINT CHK_Payment CHECK (InsurancePayment<=TotalPayment)
);

create table Examine(
    DoctorId INTEGER NOT NULL,
    AdmissionNum INTEGER NOT NULL,
    Comments VARCHAR(300), /* assuming not every exam requires a comment. doc can leave no comment (null) */
    CONSTRAINT PK_Examine PRIMARY KEY (DoctorId, AdmissionNum),
    FOREIGN KEY (DoctorId) REFERENCES Doctor(Id),
    FOREIGN KEY (AdmissionNum) REFERENCES Admission(AdmissionNum)
);

create table StayIn(
    AdmissionNum INTEGER NOT NULL,
    RoomNum INTEGER NOT NULL,
    StartDate DATE NOT NULL,
    EndDate DATE, /* assuming patient can stay at hospital indefinitely */
    CONSTRAINT PK_StayIn PRIMARY KEY (AdmissionNum, RoomNum, StartDate),
    FOREIGN KEY (AdmissionNum) REFERENCES Admission(AdmissionNum),
    FOREIGN KEY (RoomNum) REFERENCES Room(Num)
);

--Part 3 Data insertion

--Doctor
insert into Doctor(Id,FirstName,LastName,Gender,Specialty) values('59835','Amanda','Green','F','Nose');
insert into Doctor(Id,FirstName,LastName,Gender,Specialty) values('48396','Curtis','Cordova','M','Lungs');
insert into Doctor(Id,FirstName,LastName,Gender,Specialty) values('33951','Tiffany','Park','M','General');
insert into Doctor(Id,FirstName,LastName,Gender,Specialty) values('15844','Terri','Wolfe','F','Mouth');
insert into Doctor(Id,FirstName,LastName,Gender,Specialty) values('73205','Richard','Nichols','M','Brain');
insert into Doctor(Id,FirstName,LastName,Gender,Specialty) values('67393','Blake','Preston','F','Back');
insert into Doctor(Id,FirstName,LastName,Gender,Specialty) values('16729','Sandra','Romero','M','Nose');
insert into Doctor(Id,FirstName,LastName,Gender,Specialty) values('91088','Stephanie','Washington','M','Mouth');
insert into Doctor(Id,FirstName,LastName,Gender,Specialty) values('61531','Chris','Johnson','M','Nose');
insert into Doctor(Id,FirstName,LastName,Gender,Specialty) values('67914','David','Weaver','F','Chest');


--Patient
insert into Patient(SSN,FirstName,LastName,Address,TelNum) values('100081645','William','Jacobs','07809 Sanchez Falls Apt.','5281819495');
insert into Patient(SSN,FirstName,LastName,Address,TelNum) values('749960232','Shannon','Johnson','987 Ethan Avenue','8566653428');
insert into Patient(SSN,FirstName,LastName,Address,TelNum) values('129896304','Dawn','Sherman','PSC 8224, Box 9826','7630264412');
insert into Patient(SSN,FirstName,LastName,Address,TelNum) values('236056202','Bobby','Garcia','60143 Smith Fields','6282007745');
insert into Patient(SSN,FirstName,LastName,Address,TelNum) values('986031220','Michael','Jackson','928 Patel Estates Leeches','7035758669');
insert into Patient(SSN,FirstName,LastName,Address,TelNum) values('249175256','Chris','Suarez','86570 Gardner Mission Apt.','6581046444');
insert into Patient(SSN,FirstName,LastName,Address,TelNum) values('743450197','Austin','Collins','73304 Marsh Orchard North W','1066168043');
insert into Patient(SSN,FirstName,LastName,Address,TelNum) values('559207164','Mrs.','Morales','3937 Timothy Mountains','911009678');
insert into Patient(SSN,FirstName,LastName,Address,TelNum) values('760907382','Anne','Phillips','80292 John Forges','8056277602');
insert into Patient(SSN,FirstName,LastName,Address,TelNum) values('324402615','David','Wolf','41208 Thompson Turnpike','390194562');

--Room
insert into Room(Num,Occupied) values('172','1');
insert into Room(Num,Occupied) values('800','1');
insert into Room(Num,Occupied) values('335','1');
insert into Room(Num,Occupied) values('586','0');
insert into Room(Num,Occupied) values('879','0');
insert into Room(Num,Occupied) values('461','1');
insert into Room(Num,Occupied) values('782','0');
insert into Room(Num,Occupied) values('678','1');
insert into Room(Num,Occupied) values('871','1');
insert into Room(Num,Occupied) values('636','1');

--Room 172
insert into RoomService(RoomNum, Service) values (172, 'Emergency');
insert into RoomService(RoomNum, Service) values (172, 'Surgery');

--Room800
insert into RoomService(RoomNum, Service) values (800, 'Pharmacy');
insert into RoomService(RoomNum, Service) values (800, 'Billing');

--Rooom335
insert into RoomService(RoomNum, Service) values (335, 'Waiting Room');
insert into RoomService(RoomNum, Service) values (335, 'Morgue');


--EquipmentType
insert into EquipmentType(Id, Description, ModelType, Instructions) values ('100', 'Surgical', 'Damaging', 'Be Careful');
insert into EquipmentType(Id, Description, ModelType, Instructions) values ('200', 'Stitching', 'Healing', 'Take Care');
insert into EquipmentType(Id, Description, ModelType, Instructions) values ('300', 'Pills', 'Treatment', 'No OD');

--Equipment todo
insert into Equipment(Serial, TypeId, PurchaseYear, LastInspection, RoomNum) values ('1', '100', )

--Admission todo
insert into Admission(admissionnum, admissiondate, leavedate, totalpayment, insurancepayment, patientssn, futurevisit) values ()

--Employee todo

    -- 10Regular todo
    insert into Employee(id, fname, lname, salary, jobtitle, officenum, emprank, supervisorid) values ()

    --4 division manager todo

    --2 general manager todo


--End Part 3, Begin Part 2.
---------------------------------------------------------------------------------------------------------------------------------

--1
SELECT Room.Num
FROM Room
WHERE Occupied = 1;

--2
SELECT Employee.ID, Employee.FName, Employee.LName, Employee.Salary
FROM Employee
WHERE SupervisorId = 10
AND
JobTitle = 'Regular'

--3
Select PatientSSN, Sum(InsurancePayment) AS Total
From Admission
Group By PatientSSN
Union
(Select SSN AS PatientSSN, 0 AS Total
From Patient
Minus
(Select PatientSSN, 0 AS Total
From Admission));


--4
Select SSN, FirstName, LastName, Visits
From Patient NATURAL JOIN (
Select PatientSSN AS SSN, Count(*) AS Visits
From Admission
Group By PatientSSN)
Union
(Select SSN, FirstName, LastName, 0 AS Visits
From Patient
Minus
(Select SSN, FirstName, LastName, Visits
From Patient NATURAL JOIN (
Select PatientSSN AS SSN, 0 AS Visits
From Admission)));

--5
SELECT RoomNum
FROM Equipment
WHERE SERIAL = 0;

--6
Select EmpId, Max(Rooms)
From
(Select EmpId, Count(RoomNum) AS Rooms
From RoomAccess
Group By EmpID)
Group By EmpID;

--7
Select JobTitle AS Type, Count(JobTitle) AS Count
From Employee
Group By JobTitle;

--8
Select SSN, FirstName, LastName, FutureVisit
From Patient NATURAL JOIN (
    Select PatientSSN as SSN, FutureVisit
    From Admission);

--9
Select ID, ModelType, Units
From EquipmentType NATURAL JOIN (
    Select TypeID AS ID, Count(*) as Units
    From Equipment
    Group By TypeID)
Where Units > 3;

--10
Select Max(FutureVisit)
From Admission
Where PatientSSN = '111-22-3333';

--11
Select DoctorID
From
    (Select DoctorID, Count(AdmissionNum) as Examinations
    From Examine NATURAL JOIN (
        Select AdmissionNum AS AdmissionNum
        From Admission
        Where PatientSSN = '111-22-3333')
    Group By DoctorID)
Where Examinations > 2;

--12
Select TypeID
From Equipment
Where PurchaseYear = TO_DATE('2010', 'yyyy')
Intersect
    (Select TypeID
    From Equipment
    Where PurchaseYear = TO_DATE('2011', 'yyyy'));


