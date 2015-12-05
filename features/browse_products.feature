Feature: Browse Products
  As a customer
  I want to browse products
  So that I buy something

  Background:
    Given there are the following products titled b, a, c

  Scenario: Browse products ordered alphabetically
    When I enter the store page
    Then the products should be listed and ordered alphabetically
