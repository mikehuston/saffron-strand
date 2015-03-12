Feature: admin can edit existing food items on menu

  Given the following movies exist:
  | name                   | description | category 	| price
  | Tomato Soup            | organic     | lunch		| 4

Scenario: edit as an admin
	Given that I am on the details page for "Tomato Soup"
	When I press "Edit"
	Then I should be on the edit page for "Tomato Soup"
	When I fill in "Title" with "Organic Tomato Soup"
	And I press "Update"
	Then I should be on the home page
	And I should see "Food Item 'Oranic Tomato Soup'" updated