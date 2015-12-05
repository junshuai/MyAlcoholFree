Feature: Add to cart
  As a customer
  I want to add products to my cart
  So that I can place the order

  Background:
    Given there is a product

  Scenario: Click the "Add to Cart" button to add the product to the cart
    When I enter the store page
    When I press the "Add to Cart" button
    Then there should be the product in the cart
