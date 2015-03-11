Feature: Be able to route to the home page and see the correct link

As a customer or admin of Saffron
I should be able to route to the home page 
And I should see all the links to Menu and Contact Info

Scenario:
	Given I am a, new authenticaed user
	And I am on the home page
	Then I should see the "Menu" link
	And I should see the "Contact Info" link
	And I should not see the "Lunch" link