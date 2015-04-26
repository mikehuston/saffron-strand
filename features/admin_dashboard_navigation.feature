Feature: Admin can use a dashboard to quickly access different admin features
	As an admin
	So that I can easily navigate about the admin interface
	I want to be able to access different parts of the admin site via a navigation bar

Background: The user is and admin user
	Given I am a new, authenticated admin user
	And I am on the admin home page

Scenario:
	Then I should see "Sample Menu"
	When I follow "Sample Menu"
	Then I should be on the Admin Sample Menus page

Scenario:
	Then I should see "Menu"
	When I follow "Menu"
	Then I should be on the Admin Items Index page

Scenario:
	Then I should see "Events"
	When I follow "Events"
	Then I should be on the Admin Events page

Scenario:
	Then I should see "Settings"
	When I follow "Settings"
	Then I should be on the Admin Settings page

Scenario:
	Then I logged out
	Then I go to the Admin Settings page
	Then I should be on the Sign In page



