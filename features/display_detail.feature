Feature: Display detail
  As a customer
  I want to browse the detail for products
  So that I know more information about products

  Background:
    Given there is a product with detail

  Scenario: Click the product image to show the detail
    When I enter the store page
    When I click the product image
    Then I should enter the product detail page
