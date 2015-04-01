Feature: Admin can add pictures to items

As an admin of the site
I want to be able to upload and associate images with a food item
So that I can show customers my delicious catering offerings

Scenario: Admin can add image to food item

	Given I am a new, authenticated admin user
	And I am on the Admin New Item page
	When I fill in "Name" with "Turkey Sandwich"
	And I upload an image file
	And I press "Create Item"
	Then I should be on the Admin Items Index page
	And the "Turkey Sandwich" item should have an image

Scenario: Admin cannot add non image file to food item image

	Given I am a new, authenticated admin user
	And I am on the Admin New Item page
	When I fill in "Name" with "Tomato Soup"
	And I upload a file that is not an image
	And I press "Create Item"
	Then I should be on the Admin New Item page
