Feature: Feature: Product Sorting by Price Descending
  As a REST-API endpoint consumer, I want to test sorting of products by "price-desc"
  to ensure the API provides accurate sorting functionality.

  Background:
    Given that I am on the domain "http://localhost:4000"

  Scenario: Get a list of all categories
    When I visit the endpoint "GET" "/api/leftMenu/categorytree"
    Then the status code of the response should be 200
    And the response time should be below 1000 milliseconds
    And there should be at least 15 main categories
    And there should be at least 500 subcategories

  Scenario Outline: Verify sorting by price descending in multiple categories
    When I visit the endpoint "GET" "/api/c/{categoryUrlPart}?size=100&page=0&sort=price-desc"
    Then the status code of the response should be 200
    And the response time should be below 1000 milliseconds
    And the sort parameter in the response should be "price-desc"
    And the products in the response should be sorted by price in descending order

    Examples:
      | {dynamic: 'categoryUrlParts'} |