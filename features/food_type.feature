Feature: Add food type field to Items
  As an admin of the site
  When I add a new food item
  There should be a field that denotes the 'type' of food, such as Entrees, starches, sides, etc.

Background: items have been added to the database
  Given the following items exist:
  | name           | desc    | category | price | food_type |
  | Mac and Cheese | organic | Lunch    | 4     | side      |
  | Deli Sandwich  | turkey  | Lunch    | 7     | Entree      |
  | Steak          | medium  | Dinner   | 11    | Entree      |

Scenario: Should be able to see food type field 
  Given I am a new, authenticated admin user
  And I am on the edit item page for "Mac and Cheese"
  Then I should see a field for "Type"

Scenario: Should be able to see food type field in food table
  Given I am a new, authenticated admin user
  And I am on the Admin Items Index page
  Then I should see "Type" inside the items table