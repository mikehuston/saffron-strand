Feature: User can create custom menus
  As a user of the site
  When I create an event
  There should be a field that denotes the 'type' of food, such as meats, starches, sides, etc.

Background: items have been added to the database
  Given the following items exist:
  | name           | desc    | category | price | food_type |
  | Mac and Cheese | organic | Dinner   | 4     | Side      |
  | Crackers       | organic | Dinner   | 5     | Side      |
  | Oreo           | organic | Dinner   | 3     | Side      |
  | Mash Potato    | organic | Dinner   | 7     | Side      |
  | Deli Sandwich  | turkey  | Dinner   | 7     | Meat      |
  | Steak          | medium  | Dinner   | 11    | Meat      |
  | Chicken        | medium  | Dinner   | 5     | Appetizer |
  | Sticks         | medium  | Dinner   | 9     | Appetizer |
  | Fish           | medium  | Dinner   | 2     | Appetizer |
  | Fingers        | medium  | Dinner   | 12    | Appetizer |
  | Mushy          | medium  | Dinner   | 15    | Appetizer |
  | Rooms          | medium  | Dinner   | 17    | Appetizer |
  | Beef           | medium  | Dinner   | 11    | Appetizer |
  | Rolls          | medium  | Dinner   | 5     | Appetizer |
  | Mushrooms      | medium  | Dinner   | 9     | Veg       |
  | Paneer         | medium  | Dinner   | 6     | Veg       |
  | Okra           | medium  | Dinner   | 14    | Veg       |
  | Tomato         | medium  | Dinner   | 12    | Veg       |
  | Green          | medium  | Dinner   | 13    | Salad/B   |
  | Red            | medium  | Dinner   | 13    | Salad/B   |
  | Red Thai       | medium  | Dinner   | 16    | Entree    |
  | Chinese        | medium  | Dinner   | 13    | Entree    |
  | Indian         | medium  | Dinner   | 15    | Entree    |
  | Juice          | medium  | Dinner   | 3     | Beverage  |
  | Cream          | medium  | Dinner   | 4     | Dessert   |

  Given I am a user with email "user@test.com" and password "user1234"
  And I am on the New Event page
  And I fill in "Name" with "Wedding"
  And I select "8" from "Budget Per Person"
  And I fill in "Head Count" with "100"
  And I press "Create Event"
  Then I should be on the Custom Order page

Scenario: User submits empty custom order form
  When I press "Save Order"
  Then I should be on the Sign In page
  When I fill in "Email" with "user@test.com"
  And I fill in "Password" with "user1234"
  And I press "Log in"
  Then I should be on the Custom Order page
  And I should see "Please select 2 Entrees"

Scenario: User correctly completes custom order form and saves order
  When I check "Red Thai"
  And I check "Chinese"
  When I press "Save Order"
  Then I should be on the Sign In page
  When I fill in "Email" with "user@test.com"
  And I fill in "Password" with "user1234"
  And I press "Log in"
  Then I should be on the Show Event page
  Then I should see "Red Thai"
  And I should see "Chinese"

Scenario: User selects too many items for a custom order
  When I check "Red Thai"
  And I check "Chinese"
  And I check "Indian"
  When I press "Save Order"
  Then I should be on the Sign In page
  When I fill in "Email" with "user@test.com"
  And I fill in "Password" with "user1234"
  And I press "Log in"
  Then I should be on the Custom Order page
  And I should see "Please select 2 Entrees"

Scenario: Should see only appetizers for $7 budget
  Given I am on the New Event page
  And I fill in "Name" with "Party"
  And I select "7" from "Budget Per Person"
  And I fill in "Head Count" with "100"
  And I press "Create Event"
  Then I should be on the Custom Order Page
  And I should not see "Entree(s)"
  And I should see "6 Appetizer(s)"
  And I should not see "Side(s)"
  And I should not see "Dessert(s)"
  And I should see "Chicken"

Scenario: Should see only entrees for $8 budget
  Given I am on the New Event page
  And I fill in "Name" with "Wedding"
  And I select "8" from "Budget Per Person"
  And I fill in "Head Count" with "100"
  And I press "Create Event"
  Then I should be on the Custom Order Page
  And I should see "2 Entree(s)"
  And I should not see "Appetizer(s)"
  And I should not see "Side(s)"
  And I should not see "Dessert(s)"

Scenario: Should see sides, entrees, appetizers, and desserts for $12 budget
  Given I am on the New Event page
  And I fill in "Name" with "Sweet Sixteen"
  And I select "12" from "Budget Per Person"
  And I fill in "Head Count" with "200"
  And I press "Create Event"
  Then I should be on the Custom Order Page
  And I should see "3 Entree(s)"
  And I should see "2 Appetizer(s)"
  And I should see "1 Dessert(s)"
  And I should see "2 Side(s)"

Scenario: Should see sides, entrees, appetizers, and desserts for $15 budget
  Given I am on the New Event page
  And I fill in "Name" with "Bar Mitzvah"
  And I select "15" from "Budget Per Person"
  And I fill in "Head Count" with "250"
  And I press "Create Event"
  Then I should be on the Custom Order Page
  And I should see "4 Entree(s)"
  And I should see "3 Appetizer(s)"
  And I should see "2 Dessert(s)"
  And I should see "3 Side(s)"

