Feature: Be able to go to the menu page and view the menus for lunch, dinner, etc.

As a customer of Saffron Strand Catering
I want to view items for particular meal of the day 
So that I can choose food items for this specific timing of my event

Background:
	Given the following lunch menu exist:
	Mac and Cheese
	Deli Sandwich

Scenario: Go to the menu page and click on lunch menu
	When I go to the home page
	And I follow "Menu"
	Then I should be on the menu page
	When I follow "Lunch"
	Then I should see the recipe "Mac and Cheese"
	And I should see the recipe "Deli Sandwhich"
	And I should not see the recipe "Oatmeal"
