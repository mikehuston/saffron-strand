Feature: User can sign in.

Scenario: End user Login
  Given I am a user with email "user@test.com" and password "user1234"
  And I am on the Sign In page
  Then I should see "Sign in"
  When I fill in "Email" with "user@test.com"
  And I fill in "Password" with "user1234"
  And I press "Sign in"
  Then I should not see "Sign in"