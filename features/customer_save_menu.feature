Feature: Customer can save order
  As a customer
  So that I can go back to a specific order
  I want to be able to login and save my order

Scenario: I can save my order after customizing a menu
  Given that I am on the Customized Order Page
  And I have selected the $8 option
  When I select "Steak" within meat
  And I select "Salad" within sides
  When I press "Save Order"
  Then I should see "You're order has been saved"
  
Scenario: I can see saved order from tab
  When I follow "My Orders"
  And I press "Previous Orders"
  Then I should see a list of previous orders
  When I click on the first order
  Then I should be on the Customized Order Page

Scenario: Can only save order if signed in 
  Given that I am not logged in
  And I am on the Customized Order Page
  And I press "Save Order"
  Then I should be on the login page