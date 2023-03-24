Feature: Post API Validation

  Background: 
    Given url 'http://localhost:3000'
    And path '/students'
    When header Accept = 'application/json'
    * def payload = read('classpath:students.json')

  Scenario: Add Student Into Students Endpoints
    #Given path '/students'
    #When header Accept = 'application/json'
    * def body  =
      """
      {
              "id": 11,
              "firstName": "Zakir",
              "lastName": "Ahmed",
              "DOB": "06/07/1979",
              "deptId": 150
          }
      """
    And request body
    When method POST
    Then status 201

  @json-payload
  Scenario: Add Student From Json File
    * set payload.firstName = 'Zahid'
    * set payload.lastName = 'Khan'
    * set payload.DOB = '19/10/1933'
    * set payload.deptId = '190'
    Given request payload
    And method POST
    Then status 201

  @data-driven
  Scenario Outline: Add Multiple Students <firstName> <lastName>
    * set payload.firstName = <firstName>
    * set payload.lastName = <lastName>
    * set payload.DOB = <DOB>
    * set payload.deptId = <deptId>
    Given request payload
    And method POST
    Then status 201

    Examples: 
      | firstName | lastName | DOB          | deptId |
      | 'Libon'   | 'Uddin'  | '01/02/1991' |     19 |
      | 'Joni'    | 'Ahmed'  | '02/02/1988' |     12 |
