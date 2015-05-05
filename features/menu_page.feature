Feature: Be able to go to the menu page and view the menus for lunch, dinner, etc.

As a customer of Saffron Strand Catering
I want to view items for particular meal of the day 
So that I can choose food items for this specific timing of my event

Background: items have been added to the database
	Given the following recipes exist:
  | name                   	| desc     | category 	| price |
  | Mac and Cheese         	| organic  | Lunch			| 4     |
  | Deli Sandwich 		   		| turkey 	 | Lunch 			| 7     |
  | Steak		 		   					| medium 	 | Dinner 		| 11    |


	And I am a new, authenticated user

Scenario: Go to the menu page and click on lunch menu
	When I go to the home page
	And I follow "Menu"
	Then I should be on the Breakfast Menu page
	When I follow "Lunch"
	Then I should see the recipe "Mac and Cheese"
	And I should see the recipe "Deli Sandwich"
	And I should not see the recipe "Oatmeal"

Scenario: Go to the menu page and click on dinner menu
	When I go to the home page
	And I follow "Menu"
	Then I should be on the Breakfast Menu page
	When I follow "Dinner"
	Then I should see the recipe "Steak"
	And I should not see the recipe "Deli Sandwich"

