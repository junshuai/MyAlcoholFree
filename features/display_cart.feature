Feature: Display the cart
  As a customer
  I want to see my cart
  So that I can check what I am going to buy

  Background:
    Given there is a product

  Scenario: Click the "Add to Cart" button to add the product to the cart
    When I enter the store page
    When I press the "Add to Cart" button
    Then I should see the cart
