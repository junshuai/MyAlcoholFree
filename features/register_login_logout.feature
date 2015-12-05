Feature: Register, login and logout
  As a customer
  I want to register, login and logout
  So that I can buy something

  Background:
    Given a user is logged in as "user"

  Scenario: 
    When I click the "Logout" button
    Then I should logout
