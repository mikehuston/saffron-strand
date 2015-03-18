Feature: User can 

As a user of the site
So that I have an entry point into planning my catering event
I should see a "Get Started" button on the home page

Scenario:
	Given that I am on the home page
	I should see "Get Started"
	When I follow "Get Started"
	Then I should be on the Event Inquiry page
	And I should see "Please Enter your Event Details"
