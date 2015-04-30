# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all
Event.destroy_all
Menu.destroy_all
Item.destroy_all

def create_item_helper name, food_type, category
	item = Item.create name: name, food_type: food_type, category: category
	fname = 'app/assets/images/' + name.downcase.gsub(' ', '_') + '.jpg'
	begin
		item.image = Rails.root.join(fname).open
		item.save!
	rescue Exception => e
		puts e
	end
end

appetizers = ["Vegetable Plate",
			"Fruit Plate",
			"Cheese Plate",
			"Chips and Salsa",
			"Chicken and Shrimp Lumpia",
			"Sundried Tomato and Basil Tea Sandwiches",
			"Smoked Salmon Tea Sandwiches",
			"Almond Chicken Salad Tea Sandwiches",
			"Stuffed Mushrooms",
			"Sweet and Sour Meatballs",
			"Tuna Cutlets"]

appetizers.each do |i|
	create_item_helper i, 'Appetizer', 'Cocktail Party'
end

entrees = ["Roasted Chicken with Lemon Herb Sauce",
		"Fiesta Shredded Chicken",
		"Asian Flank Steak",
		"Pork Carnitas",
		"Polynesian Pulled Pork",
		"Meat Lasagna",
		"Vegetable Lasagna",
		"Apricot Chicken",
		"Pumpkin Curry",
		"Cashew Beef Stir Fry"]

entrees.each do |i|
	create_item_helper i, 'Entree', 'Dinner'
end

sides = ["Spiced Green Beans",
		"Almond Green Beans",
		"Corn Casserole",
		"Vegetarian Dirty Rice",
		"Wild Rice with Mushrooms",
		"Toasted Almond Currant Rice Pilaf",
		"Indian Fried Rice",
		"Pesto Pasta",
		"Pasta al Pomodoro",
		"Roasted Root Vegetables",
		"Spinach Apple Salad",
		"Sesame Peanut Noodle Salad",
		"Cucumber Salad",
		"Carrot Raisin Salad",
		"Firecracker Salad",
		"Cranberry Almond Salad",
		"Tri-Color Slaw",
		"Asian Style Slaw",
		"Miso Cucumber Salad"]

sides.each do |i|
	create_item_helper i, 'Side', 'Lunch'
end

desserts = ["Blueberry Crumble",
			"Peach Cobbler",
			"Lemon Bundt Cake"]

desserts.each do |d|
	Item.create name: d, food_type: 'Dessert', category: 'Dinner'
end

app_menu = Menu.create name: 'Sample Appetizer Menu', budget_per_person: 7, sample: true
app_menu.items << Item.find_by_name(["Vegetable Plate", "Sundried Tomato and Basil Tea Sandwiches",
							"Chips and Salsa", "Stuffed Mushrooms", "Chicken and Shrimp Lumpia", "Tuna Cutlets"])

eight_menu = Menu.create name: 'Sample $8 Menu', budget_per_person: 8, sample: true
eight_menu.items << Item.find_by_name(["Roasted Chicken with Lemon Herb Sauce", "Vegetable Lasagna"])

twelve_menu = Menu.create name: 'Sample $12 Menu', budget_per_person: 12, sample: true
twelve_menu.items << Item.find_by_name(["Sweet and Sour Meatballs", "Stuffed Mushrooms", "Tuna Cutlets",
							"Apricot Chicken", "Pumpkin Curry", "Cashew Beef Stir Fry",
							"Toasted Almond Currant Stir Fry", "Spiced Green Beans", "Peach Cobbler"])

fifteen_menu = Menu.create name: 'Sample $15 Menu', budget_per_person: 15, sample: true
fifteen_menu.items << Item.find_by_name(["Fruit Plate", "Cheese Plate", "Smoked Salmon Tea Sandwiches",
							"Asian Flank Steak", "Chicken Pastry Puff", "Eggplant Parmesan",
							"Parsley and Garlic Fettuccine", "Roasted Root Vegetables",
							"Cranberry Almond Salad", "Wild Rice with Mushrooms", "Lemon Bundt Cake",
							"Peach Cobbler"])

User.destroy_all :email =~ /@saffron.test/
User.create!(:email => 'testuser@saffron.test', :password => 'password', :password_confirmation => 'password')
User.create!(:email => 'testadmin@saffron.test', :password => 'password', :password_confirmation => 'password', :admin => true)
