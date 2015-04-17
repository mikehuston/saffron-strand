Feature: admin can edit an existing sample menu

Background: 

	Given the following items exist:
	  | name                   | desc        | category 	| price |
	  | Deli Sandwich          | turkey      | Lunch        | 7     |

	Given a "8" per person budget sample menu named "Sample Lunch Menu" exists with the following items:
	  | name            | desc    | category | price | food_type |
	  | Mac and Cheese  | organic | Lunch    | 4     | side      |
	  
Scenario: edit as an admin
	Given I am a new, authenticated admin user
	And I am on the Admin Sample Menus page
	Then I should see "Sample Lunch Menu"
	When I follow "Edit"
	Then I should be on the edit menu page for "Sample Lunch Menu"
	And I should see "Sample Lunch Menu"
	And the "Mac and Cheese" checkbox should be checked
	And the "Deli Sandwich" checkbox should not be checked
	When I fill in "Name" with "Sample Dinner Menu"
	And I select "15" from "Budget Per Person"
	And I uncheck "Mac and Cheese"
	And I check "Deli Sandwich"
	And I press "Update Menu"
	Then I should be on the Admin Sample Menus page
	And I should see "Name: Sample Dinner Menu"
	And I should see "Budget Per Person: 15"
  	And I should not see "Mac and Cheese" inside a menu table
  	And I should see "Deli Sandwich" inside a menu table