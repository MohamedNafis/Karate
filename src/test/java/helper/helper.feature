Feature: All helper secnario

  @get-student-helper
  Scenario: Validate Students Endpoints Status 200
    #url
    * url urlPath
    Given path '/students'
    When method GET
    Then status 200

  @add-student-helper
  Scenario: Add Student From Json File
    #url, path, firstName, lastName, DOB, deptId, code
    * set payload.firstName = firstName
    * set payload.lastName = lastName
    * set payload.DOB = DOB
    * set payload.deptId = deptId
    Given request payload
    And method POST
    Then status code
