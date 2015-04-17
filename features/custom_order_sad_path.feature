Feature:

Scenario:
	Given I am a new, authenticated user
	And I am on the New Event page
	And I fill in "Name" with "Wedding"
	And I select "7" from "Budget Per Person"
	And I fill in "Head Count" with "100"
	And I press "Create Event"
	Then I should be on the Custom Order page
	When I press "Save changes"
	Then I should be on the Custom Order page
