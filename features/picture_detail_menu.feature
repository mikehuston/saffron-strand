Feature: User can 

As an user of the site
So that I can see what menu items look like
I should be able to view details and pictures of the item when I click 'show' on the menu

Scenario: User can view pictures 

	Given I am a new, authenticated user
	And I am on the Menu page
	And I click the show button on an item
	Then the item should have an image

