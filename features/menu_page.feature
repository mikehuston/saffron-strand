Feature: Be able to go to the menu page and view the menus for lunch, dinner, etc.

As a customer of Saffron Strand Catering
I want to view items for particular meal of the day 
So that I can choose food items for this specific timing of my event

Background:
	Given the following recipes exist:
  	| name                   | description | category 	| price
  	| Mac and Cheese         | organic     | lunch 		| 5
	| Deli Sandwich 		 | turkey 	   | lunch 		| 7

Scenario: Go to the menu page and click on lunch menu
	When I go to the home page
	And I follow "Menu"
	Then I should be on the menu page
	When I follow "Lunch"
	Then I should see the recipe "Mac and Cheese"
	And I should see the recipe "Deli Sandwhich"
	And I should not see the recipe "Oatmeal"
