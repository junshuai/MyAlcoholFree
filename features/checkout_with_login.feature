Feature: Checkout with login
  As a customer
  I want to checkout with login
  So that I can place the order

  Background:
    Given there is a product
    Given a user is logged in as "user"

  Scenario: 
    When I enter the store page
    When I press the "Add to Cart" button
    When I click the "Check out" button
    When I click the "Check out" button
    Then I should see the place order page
