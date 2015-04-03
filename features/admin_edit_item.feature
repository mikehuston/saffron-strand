Feature: admin can edit existing food items on menu

Background: items have been added to the database

  Given the following items exist:
  | name                   | desc        | category 	| price |
  | Tomato Soup            | organic     | Lunch		| 4     |

Scenario: edit as an admin
	Given I am a new, authenticated admin user
	And I am on the details page for "Tomato Soup"
	Then I should see "Tomato Soup"
	When I follow "Edit"
	Then I should be on the edit item page for "Tomato Soup"
	When I fill in "Name" with "Organic Tomato Soup"
	And I press "Update Item Info"
	Then I should be on the Admin Items Index page
	And I should see "Organic Tomato Soup"