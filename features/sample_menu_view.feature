Feature: Sample Menu view
  As a user of the site,
  I should be able to see the content of the Sample Menu, which should show sample menus for $8, $10, etc.
  So that I can get an idea of what to order

Background: 
Given we have this preset menu for the $8 option:
  | name                   | desc        | category 	| price | type |
  | Mac and Cheese         | organic     | Lunch		| 4     | side |
  | Deli Sandwich 		   | turkey 	 | Lunch 		| 7     | meat |

Scenario: I can see the items of the $8 preset menu
  Given that I am a user of the site
  And I am on the home page
  And I follow 'Sample Menu'
  Then I should be on the 'Sample Menu' page
  Then I should see 'Mac and Cheese' within the table
  And I should see 'Deli Sandwich' within the table

