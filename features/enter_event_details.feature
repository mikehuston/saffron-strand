Feature: User can 

As a user of the site
So that I provide my event details and start planning for my catering event
I should be able to submit a form with basic information about my event

Scenario:
	Given I am on the New Event page
	And I fill in "Name" with "Wedding"
	And I select "10" from "Budget Per Person"
	And I press "Create Event"
	Then I should be on the Customize Order page
