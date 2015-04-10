Feature: Admin can use a dashboard to quickly access different admin features
	As an admin
	So that I can easily navigate about the admin interface
	I want to be able to access different parts of the admin site via a navigation bar

Scenario:
	Given I am a new, authenticated user
	And I am on the admin home page
	Then I should see "Sample Menus"
	When I follow "Sample Menus"
	Then I should be on the Admin Sample Menus page

Scenario:
	Given I am a new, authenticated user
	And I am on the admin home page
	Then I should see "Items"
	When I follow "Items"
	Then I should be on the Admin Items Index page

Scenario:
	Given I am a new, authenticated user
	And I am on the admin home page
	Then I should see "Orders"
	When I follow "Orders"
	Then I should be on the Admin Orders page

Scenario:
	Given I am a new, authenticated user
	And I am on the admin home page
	Then I should see "Settings"
	When I follow "Settings"
	Then I should be on the Admin Settings page


