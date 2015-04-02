Feature: User can 

As a user of the site
So that I have an entry point into planning my catering event
I should see a "Get Started" button on the home page

Scenario:
	Given I am a new, authenticated user
	And I am on the home page
	Then I should see "Get Started"
	When I follow "Get Started"
	Then I should be on the New Event page
	And I should see "Please Enter your Event Details"
