Feature: Checkout without login
  As a customer
  If I checkout without login
  Then I should go the login page

  Background:
    Given there is a product

  Scenario: 
    When I enter the store page
    When I press the "Add to Cart" button
    When I click the "Check out" button
    When I click the "Check out" button
    Then I should go to login page
