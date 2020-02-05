#svadivazhagu, feb2020
#code to create strings to insert random data for X amount of fake patients

import faker
from random import randint


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



