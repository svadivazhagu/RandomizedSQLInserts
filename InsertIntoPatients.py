#svadivazhagu, feb2020
#code to create strings to insert random data for X amount of fake patients

import faker
from random import randint, choice


def printPatient(numPatients):
    for i in range(numPatients):
        person = faker.Faker()
        ssn = "'" + str(randint(100000000, 999999999)) + "'"
        fname = "'" + person.name().split(' ')[0] + "'"
        lname = "'" + person.name().split(' ')[1] + "'"
        addy = "'" + str(person.address()[:randint(20, 35)]) + "'"
        telnum = "'" + str(randint(100000000, 9999999999)) + "'"

        print('INSERT INTO Patient'
              + '('
              + 'SSN'
              + ','
              + 'FirstName'
              + ','
              + 'LastName'
              + ','
              + 'Address'
              + ','
              + 'TelNum'
              + ') '
              + 'VALUES'
              + '('
              + ssn
              + ','
              + fname
              + ','
              + lname
              + ','
              + addy
              + ','
              + telnum
              + ');')


def printDoctors(numDoctors):
    for i in range(numDoctors):
        person = faker.Faker()
        id = "'" + str(randint(10000, 99999)) + "'"
        fname = "'" + person.name().split(' ')[0] + "'"
        lname = "'" + person.name().split(' ')[1] + "'"
        gender = choice(['M', 'F'])
        speciality = choice(['General', 'Eye', 'Nose', 'Mouth', 'Hair', 'Lips', 'Back', 'Lungs', 'Brain', 'Chest', 'Legs'])
        print('INSERT INTO Doctor'
              + '('
              + 'Id'
              + ','
              + 'FirstName'
              + ','
              + 'LastName'
              + ','
              + 'Gender'
              + ','
              + 'Specialty'
              + ') '
              + 'VALUES'
              + '('
              + id
              + ','
              + fname
              + ','
              + lname
              + ','
              + gender
              + ','
              + speciality
              + ');')

def printRooms(numRooms):
    for i in range(numRooms):
        room_num = "'" + str(randint(100, 999)) + "'"
        occupied = "'" + str(randint(0, 1)) + "'"
        print('INSERT INTO Room'
            + '('
            + 'Num'
            + ','
            + 'Occupied'
            + ') '
            + 'VALUES'
            + '('
            + room_num
            + ','
            + occupied
            + ');')



def printRoomService(numRoomService):
    for i in range(numRoomService):
        room_num = "'" + str(randint(100, 999)) + "'"
        service =  "'" + choice(['Emergency', 'Maternity', 'Nursing', 'Surgery', 'Pharmacy']) + "'"
        print('INSERT INTO RoomService'
              + '('
              + 'RoomNum'
              + ','
              + 'Service'
              + ') '
              + 'VALUES'
              + '('
              + room_num
              + ','
              + service
              + ');')




printRooms(10)
printPatient(10)
printDoctors(10)

