Feature: Calling Unknown Routes
  We have to handle calls to unknown routes

  Scenario: Unknown Route Was Called
    Given an unknown route
    When a request is made
    Then the user receives an error response
