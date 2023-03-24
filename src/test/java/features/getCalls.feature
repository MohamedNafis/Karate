Feature: Get API Validation

Background: 
Given url 'http://localhost:3000'

@get-student
Scenario: Validate Students Endpoints Status 200
Given path '/students'
When method GET
Then status 200




Scenario: Vatidate Country Endpoints Status 200
Given path '/countries'
When method GET
Then status 200
And match response[0].id == 1
And match response[3].lastName == 'Shafqat'
And match response[3].countryName == 'UK'

