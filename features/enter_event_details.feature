Feature: User can 

As a user of the site
So that I provide my event details and start planning for my catering event
I should be able to submit a form with basic information about my event

Scenario:
	Given I am on the Event Inquiry page
	And I fill in "Event Type" with "Wedding"
	And I select "$10pp" from "Budget"
	And I press "Submit"
	Then I should be on the Customize Order page
	And I should see "Mac and Cheese"
	And I should not see "Steak"
