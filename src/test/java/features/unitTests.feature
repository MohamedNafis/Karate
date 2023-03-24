Feature: Unit Tests

  Background: 
    * def utils = Java.type('javaUtils.JavaUtils')

  Scenario: Using java method getMyName
    * def getMyName = utils.getMyName()
    * print getMyName

  Scenario: Useing java method get CurrentDate
    * def getCurrentDate = utils.getDate()
    * print getCurrentDate

  
  Scenario: Calling another scenario from different feature file
    * def getStudents = call read('classpath:features/getCalls.feature@get-student')
    * print getStudents.response
    
    @helper
    Scenario: Calling another scenario from different feature file
    * def getStudents = call read('classpath:helper/helper.feature@get-student-helper'){'urlPath':'http://localhost:3000'}
    * print getStudents.response