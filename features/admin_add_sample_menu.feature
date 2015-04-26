Feature: admin can create a new sample menu

Background: items have been added to the database

  Given the following items exist:
  | name                   | desc        | category 	| price |
  | Tomato Soup            | organic     | Lunch		| 4     |

Scenario: add new food item to menu
	Given I am a new, authenticated admin user
	And I am on the New Sample Menu page
	When I fill in "Name" with "Sample Menu"
	And I select "12" from "Budget Per Person"
	And I check "Tomato Soup"
	And I press "Create Menu"
	Then I should be on the Admin Sample Menus page
	And I should see "Budget Per Person: 12"
  	And I should see "Sample Menu"
  	And I should see "Tomato Soup" inside a menu table