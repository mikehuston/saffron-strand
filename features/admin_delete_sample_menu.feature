Feature: admin can delete an existing sample menu

Background:

	Given a "8" per person budget menu named "Sample Lunch Menu" exists with the following items:
	  | name            | desc    | category | price | food_type |
	  | Mac and Cheese  | organic | Lunch    | 4     | side      |
	  | Deli Sandwich   | turkey  | Lunch    | 7     | meat      |

	Scenario: add new food item to menu
		Given I am a new, authenticated admin user
		And I am on the Admin Sample Menus page
		Then I should see "Sample Lunch Menu"
		When I press "Delete"
		Then I should be on the Admin Sample Menus page
	  	And I should not see "Name: Sample Lunch Menu"
