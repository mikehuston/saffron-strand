Feature: User can log in.

Scenario: End user Login
  Given I am a user with email "user@test.com" and password "user123"
  And I am on the Sign In page
  Then I should see "Log in"
  When I fill in "Email" with "user@test.com"
  And I fill in "Password" with "user123"
  And I press "Log in"
  Then I should not see "Log in"