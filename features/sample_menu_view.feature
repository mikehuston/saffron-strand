Feature: Sample Menu view
  As a user of the site,
  I should be able to see the content of the Sample Menu, which should show sample menus for $8, $10, etc.
  So that I can get an idea of what to order

Background: 
Given a "8" per person budget sample menu named "Sample Lunch Menu" exists with the following items:
  | name            | desc    | category | price | food_type |
  | Mac and Cheese  | organic | Lunch    | 4     | side      |
  | Deli Sandwich   | turkey  | Lunch    | 7     | meat      |

Scenario: I can see the items of the $8 preset menu
  Given I am on the home page
  When I follow "Sample Menu"
  Then I should be on the sample menu page
  Then I should see "Mac and Cheese" inside a menu table
  And I should see "Deli Sandwich" inside a menu table
  And I should see "Budget Per Person: 8"
  And I should see "Name: Sample Lunch Menu"
