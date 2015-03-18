Feature: Admin can add pictures to items

As an admin of the site
I want to be able to upload and associate images with a food item
So that I can show customers my delicious catering offerings

Scenario: Admin can add image to food item
	As an admin of the site
	When I am on the edit page for an item
	Then I should see "Upload Picture"
	When I upload a picture
	And I click "Save"
	Then I click "Show" for that item
	Then I should see the picture