Feature: Customer can save order
  As a customer
  So that I can go back to a specific order
  I want to be able to login and save my order

Background: items have been added to the database and event details page submitted
  Given the following items exist:
  | name           | desc    | category | price | food_type |
  | Red Thai       | medium  | Dinner   | 16    | Entree    |
  | Chinese        | medium  | Dinner   | 13    | Entree    |
  | Indian         | medium  | Dinner   | 15    | Entree    |
  Given I am a new, authenticated user
  And I am on the New Event page
  And I fill in "Name" with "Wedding"
  And I select "8" from "Budget Per Person"
  And I fill in "Head Count" with "100"
  And I press "Create Event"

Scenario: I can save my order after customizing a menu and see it under My Orders
  Given I am on the Custom Order page
  When I check "Red Thai"
  And I check "Chinese"
  When I press "Save Order"
  Then I should be on the Show Event page
  Then I should see "Red Thai"
  And I should see "Chinese"
  When I follow "My Orders"
  Then I should be on the Saved Orders page
  And I should see "Wedding"
  When I follow "Wedding"
  Then I should be on the Show Event page

Scenario: Can only save order if signed in
  Given I logged out
  And I am on the New Event page
  And I fill in "Name" with "Wedding"
  And I select "8" from "Budget Per Person"
  And I fill in "Head Count" with "100"
  And I press "Create Event"
  Then I should be on the Custom Order page
  When I press "Save Order"
  Then I should be on the Sign In page