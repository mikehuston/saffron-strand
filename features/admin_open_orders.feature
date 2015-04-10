Feature: Admin can view open orders
	As an admin
	So that I can see what orders have been requested
	I want to be able to see all open orders

Background:

	Given a "8" per person budget menu named "Bob's Menu" exists with the following items:
	  | name            | desc    | category | price | food_type |
	  | Mac and Cheese  | organic | Lunch    | 4     | side      |

	Given a "10" per person budget menu named "Cat's Menu" exists with the following items:
	  | name            | desc    | category | price | food_type |
	  |Deli Sandwich    | turkey  | Lunch    | 7     | entree    |

	Given the following orders exist:
	  | user                   | menu        | date_created |
	  | bob@email.com          | Bob's Menu  |  04/01/2015  |
	  | cat@email.com          | Cat's Menu  |  04/02/2015  |

Scenario:
	Given I am a new, authenticated user
	And I am on the admin home page
	When I follow "Orders"
	Then I should be on the Admin Orders page
	And I should see "bob@email.com"
	And I should see "Bob's Menu"
	And I should see "cat@email.com"
	And I should see "Cat's Menu"

Scenario:
	Given I am a new, authenticated user
	And I am on the Admin Orders page
	And I press "Bob's Menu"
	Then I should be on the menu details page for "Bob's Menu"
	And I should see "Budget Per Person: 8"
	And I should see "Mac and Cheese" inside a menu table


