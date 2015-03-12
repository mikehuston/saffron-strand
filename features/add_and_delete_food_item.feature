Feature: admin can add and delete food items from menu

  Given the following recipes exist:
  | name                   | description | category 	| price
  | Tomato Soup            | organic     | lunch		| 4

Scenario: add new food item to menu
	Given I am on the menu page
	When I follow "Add new food item"
	Then I should be on the New Food Item page
	When I fill in "Name" with "Turkey Sandwich"
	And I fill in "Category" with "lunch"
	And I press "Save Changes"
	Then I should be the menu page
	And then I should see "Food Item 'Turkey Sandwich' was successfully created"

Scenario: delete new food item from menu
	Given that I am on the details page for "Tomato Soup"
	When I press "Delete"
	Then I should be on the menu page
	And I should see "Food Item 'Tomato Soup' deleted"
	And I should not see "Tomato Soup"