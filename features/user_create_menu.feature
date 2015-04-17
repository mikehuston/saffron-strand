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

Scenario:
  When I press "Save changes"
  Then I should be on the Sign In page
  When I fill in "Email" with "user@test.com"
  And I fill in "Password" with "user1234"
  And I press "Log in"
  Then I should be on the Custom Order page
  And I shouold see "Please select 2 Entrees"

Scenario:
  When I check "Red Thai"
  And I check "Chinese"
  When I press "Save changes"
  Then I should be on the Sign In page
  When I fill in "Email" with "user@test.com"
  And I fill in "Password" with "user1234"
  And I press "Log in"
  Then I should be on the Custom Order page
  And I shouold see "Please select 2 Entrees"

Scenario: Should be able to see 8$ menu items
  Given budget per person is 8
  And I am on the Customized Order Page
  Then I should see 2 items with food_type "Entree"
  Then I should see 1 item with food_type "Salad/B"
  Then I should see 1 item with food_type "Veg"
  Then I should see 1 item with food_type "Meat"
  Then I should not see "Beverage"
  Then I should not see "Dessert"

Scenario: Should be able to see 12$ menu items
  Given budget per person is 12
  And I am on the Customized Order Page
  Then I should see 2 items with food_type "Appetizer"
  Then I should see 3 items with food_type "Entree"
  Then I should see 1 item with food_type "Salad/B"
  Then I should see "Veg"
  Then I should see "Meat"
  Then I should see 2 items with food_type "Side"
  Then I should see "Beverage"
  Then I should see "Dessert"

Scenario: Should be able to see 15$ menu items
  Given budget per person is 15
  And I am on the Customized Order Page
  Then I should see 3 items with food_type "Appetizer"
  Then I should see 4 items with food_type "Entree"
  Then I should see 1 item with food_type "Salad/B"
  Then I should see "Veg"
  Then I should see "Meat"
  Then I should see 3 items with food_type "Side"
  Then I should see "Beverage"
  Then I should see "Dessert"



