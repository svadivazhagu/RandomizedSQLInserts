/* the char lengths were kind of just guessed on */

/* Employee */
CREATE TABLE Employee(
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
CREATE TABLE Room(
    Num INTEGER NOT NULL PRIMARY KEY,
    Occupied CHAR(1) NOT NULL,
    CONSTRAINT CHK_Occupied CHECK (Occupied = 0 OR Occupied = 1) /*if occupied, 1, if not, 0 */ 
);

CREATE TABLE EquipmentType(
    Id VARCHAR(20) NOT NULL PRIMRAY KEY,
    Description VARCHAR(20), /* May or may not have a description */
    ModelType VARCHAR2(20) NOT NULL,
    Instructions VARCHAR2(500) /* May or may not have instructions */

);

CREATE TABLE Equipment(
    Serial VARCHAR(20) NOT NULL PRIMARY KEY,
    TypeId VARCHAR(20) NOT NULL,
    PurchaseYear DATE NOT NULL,
    LastInspection DATE,
    RoomNum INTEGER NOT NULL,
    FOREIGN KEY (RoomNum) REFERENCES Room(Num),
    FOREIGN KEY (TypeId) REFERENCES EquipmentType(Id)
    CONSTRAINT CHK_Equipment CHECK (LastInspection >= PurchaseYear)
);

CREATE TABLE RoomService(
    RoomNum INTEGER NOT NULL,
    Service CHAR(20) NOT NULL,
    CONSTRAINT PK_RoomService PRIMARY KEY (RoomNum, Service),
    FOREIGN KEY (RoomNum) REFERENCES Room(Num)
);

CREATE TABLE RoomAccess(
    RoomNum INTEGER NOT NULL,
    EmpId INTEGER NOT NULL,
    CONSTRAINT PK_RoomAccess PRIMARY KEY (RoomNum, EmpId),
    FOREIGN KEY (RoomNum) REFERENCES Room(Num),
    FOREIGN KEY (EmpId) REFERENCES Employee(Id)
);

CREATE TABLE Patient(
    SSN VARCHAR(9) NOT NULL PRIMARY KEY, /* Assuming it's format 123456789 */
    FirstName VARCHAR(15) NOT NULL,
    LastName VARCHAR(30) NOT NULL,
    Address VARCHAR(30) NOT NULL,
    TelNum VARCHAR(10) NOT NULL /* Assuming it's format 1234567890 */
);

CREATE TABLE Doctor(
    Id INTEGER NOT NULL PRIMARY KEY,
    FirstName VARCHAR(15) NOT NULL,
    LastName VARCHAR(30) NOT NULL,
    Gender CHAR(1) NOT NULL, /*Assuming either M or F */
    Specialty VARCHAR(30) NOT NULL, /*If no specialty, assuming can mark as such */
    CONSTRAINT CHK_Gender CHECK (Gender = 'M' OR Gender = 'F')
);

CREATE TABLE Admission(
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

CREATE TABLE Examine(
    DoctorId INTEGER NOT NULL,
    AdmissionNum INTEGER NOT NULL,
    Comments VARCHAR(300), /* assuming not every exam requires a comment. doc can leave no comment (null) */
    CONSTRAINT PK_Examine PRIMARY KEY (DoctorId, AdmissionNum),
    FOREIGN KEY (DoctorId) REFERENCES Doctor(Id),
    FOREIGN KEY (AdmissionNum) REFERENCES Admission(AdmissionNum)
);

CREATE TABLE StayIn(
    AdmissionNum INTEGER NOT NULL,
    RoomNum INTEGER NOT NULL,
    StartDate DATE NOT NULL,
    EndDate DATE, /* assuming patient can stay at hospital indefinitely */
    CONSTRAINT PK_StayIn PRIMARY KEY (AdmissionNum, RoomNum, StartDate),
    FOREIGN KEY (AdmissionNum) REFERENCES Admission(AdmissionNum),
    FOREIGN KEY (RoomNum) REFERENCES Room(RoomNum)
);

/* Part 2 Phase 2 */

-- Problem 1
Select Room.Num
From Room
Where Occupied = 1;

--2
SELECT Id