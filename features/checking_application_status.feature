Feature: Checking Application Status
  We need a simple route that can give us current application information

  Scenario: Application Health Checking
    Given an application is running
    When a health check call is made
    Then the user receives a health check response
