Feature: admin can add to menu

Scenario: add new food item to menu
	Given I am a new, authenticated admin user
	And I am on the Admin Items Index page
	When I follow "Add new item"
	Then I should be on the Admin New Item page
	When I fill in "Name" with "Turkey Sandwich"
	And I select "Lunch" from "Category"
	And I select "Meat" from "Type"
	And I press "Create Item"
	Then I should be on the Admin Items Index page
	And I should see "Turkey Sandwich"
	And I should see "Meat"