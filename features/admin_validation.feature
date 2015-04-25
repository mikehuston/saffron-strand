Feature: User cannot see admin pages

As an user of the site
So that admin pages are protected
Non admin cannot access admin pages

Scenario: User cannot access admin pages

	Given I am a new, authenticated user
	And I am on the Admin New Item page
	Then I should be on the home page

Scenario: Non signed in users cannot acess admin pages

	Given I am on the Admin New Item page
	Then I should be on the Sign In page
