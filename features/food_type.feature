Feature: Add food type field to Items
  As an admin of the site
  When I add a new food item
  There should be a field that denotes the 'type' of food, such as meats, starches, sides, etc.

Background: items have been added to the database
	Given the following recipes exist:
  | name                   | desc        | category 	| price | type |
  | Mac and Cheese         | organic     | Lunch		| 4     | side |
  | Deli Sandwich 		   | turkey 	 | Lunch 		| 7     | meat |
  | Steak		 		   | medium 	 | Dinner 		| 11    | meat |

Scenario: Should be able to see food type field 
  Given I am a new, authenticated admin user
  When I go to the edit page of a food item
  Then I should see the form field 'food type'

Scenario: Should be able to see food type field in food table
  Given I am a new, authenticated admin user
  When I go to the menu list
  Then I should see 'type' within the items table