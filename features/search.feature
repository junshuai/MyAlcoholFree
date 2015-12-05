Feature: Search
  As a customer
  I want to be able to search for products by titles
  So that I can quickly find products of interest

  Background:
    Given there are the following products titled aaa, bbb, cxx, dxd, eee

  Scenario: Find Products by the title
    When I search for Product whose title contains "x"
    Then the results must be products titled cxx, dxd
