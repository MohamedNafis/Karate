Feature: Get API Validation

  Background: 
    Given url baseUrl

  @get-student
  Scenario: Validate Students Endpoints Status 200
    * def pathUrl = constant.studentsEndpoint
    Given path pathUrl
    When method GET
    Then status 200

  @get-countries
  Scenario: Vatidate Country Endpoints Status 200
    * def pathUrl = constant.countriesEndpoint
    Given path pathUrl
    When retry until responseStatus == 200
    And method GET
    #Then status 200
    And match response[0].id == 1
    And match response[3].lastName == 'Shafqat'
    And match response[3].countryName == 'USA'
