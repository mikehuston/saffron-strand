Feature: Admin can add admin
	As a Saffron Strand admin
	So that I can create other admin accounts for Saffron Strand employees
	I want to be able to give certain registered users admin access

	When I am on the admin settings page
	And I follow 'Add an admin users'
	Then I should be on the admin settings add admin page

Background: 

	Given the following users exist:
	  | name                | email               | password | password_confirmation |
	  | Testy McFutureAdmin | example@example.com | pass1234 | pass1234              |
	  
Scenario: admin can add other admin users

	Given I am a new, authenticated admin user
	And I am on the admin settings add admin page
	When I make "Testy McFutureAdmin" an admin user
	Then I should be on the admin settings add admin page
	And "Testy McFutureAdmin" should be an admin user
	And I should not see "Testy McFutureAdmin"
