Feature: User doesn't overwrite saved event without being prompted

As a user
So that I don't lose my order while making my customized order
I should see an option to save or cancel my order when I am directed to another page.

Background:

	Given a "8" per person budget menu named "Bob's Menu" exists with the following items:
	  | name            | desc    | category | price | food_type  |
	  | Steak           | organic | Lunch    | 4     | Entree     |
	  | Fish            | organic | Lunch    | 4     | Entree     |

	Given a "12" per person budget menu named "Cat's Menu" exists with the following items:
	  | name            | desc    | category | price | food_type  |
	  | Deli Sandwich   | turkey  | Lunch    | 7     | Entree     |
	  | Steak           | organic | Lunch    | 4     | Entree     |
	  | Fish            | organic | Lunch    | 4     | Entree     |
	  | Fries           | organic | Lunch    | 4     | Appetizer  |	 
	  | Chicken Wings   | organic | Lunch    | 4     | Appetizer  |	 
	  | Celery          | organic | Lunch    | 4     | Side       |
  	  | Broccoli        | organic | Lunch    | 4     | Side       | 
  	  | Cake            | organic | Lunch    | 4     | Dessert    | 

	Given the following users exist:
	  | name | email         | password | password_confirmation |
	  | Bob  | bob@email.com | password | password              |

	Given the following events exist:
	  | user                   | menu        |  name            | head_count |
	  | bob@email.com          | Bob's Menu  |  Bob's Birthday  |     15     |

Scenario: User sees a pop up if he/she tries to save an order when a saved order exists
	Given I am a new, authenticated user
	And I am on the custom order page
	And I select "8" from "Budget Per Person"
  	And I fill in "Head Count" with "100"
  	And I press "Create Event"
  	Given I am on the Custom Order page
  	When I check "Red Thai"
  	And I check "Chinese"
 	When I press "Save Order"
 	Then I should see a confirmation window
 	And I should see "Delete existing event?"