Feature: User can click a button to start their menu building process
	As a user of the site
	So that I have an entry point into planning my catering event
	I should see a "Get Started" button on the home page

Scenario:
	Given I am a new, authenticated user
	And I am on the home page
	Then I should see a "Get Started" button
	When I press "Get Started"
	Then I should be on the New Event page
	And I should see "Please Enter your Event Details"

Scenario:
	Given I am a new, authenticated user
	And I am on the sample menu page
	Then I should see a "Get Started" button
	When I press "Get Started"
	Then I should be on the New Event page
	And I should see "Please Enter your Event Details"
