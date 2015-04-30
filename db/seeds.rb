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

# item1 = Item.create(name: 'Chicken Parm', desc: 'delish food', price: 10, category: 'Dinner', food_type: 'Meat')
# item2 = Item.create(name: 'Eggs and Bacon', desc: 'American breakfast', price: 6, category: 'Breakfast', food_type: 'Meat')
# item3 = Item.create(name: 'Roast Beef Sandwich', desc: 'better than Subway', price: 7, category: 'Lunch', food_type: 'Meat')
# item4 = Item.create(name: 'Caesar Salad', desc: 'healthy side for your meal', price: 4, category: 'Dinner', food_type: 'Side')
# item5 = Item.create(name: 'Filet Mignon', desc: 'grass fed beef', price: 12, category: 'Dinner', food_type: 'Meat')
# item6 = Item.create(name: 'Mixed Green Salad', desc: 'healthy side for your meal', price: 4, category: 'Dinner', food_type: 'Side')
# item7 = Item.create(name: 'Green Beans', desc: 'fresh and local', price: 4, category: 'Lunch', food_type: 'Side')

# menu1 = Menu.create name: 'Sample $8 Menu', budget_per_person: 8, sample: true
# menu1.items << item6
# menu1.items << item7
# menu1.items << item4

# menu2 = Menu.create name: 'Sample $15 Menu', budget_per_person: 15, sample: true
# menu2.items << item4
# menu2.items << item7
# menu2.items << item5

def create_item_helper name, food_type
	item = Item.create name: name, food_type: food_type
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
	create_item_helper i, 'Appetizer'
end

entrees = ["Roasted Chicken with Lemon Herb Sauce",
		"Fiesta Shredded Chicken",
		"Asian Flank Steak",
		"Pork Carnitas",
		"Polynesian Pulled Pork",
		"Meat Lasagna",
		"Vegetable Lasagna"]

entrees.each do |i|
	create_item_helper i, 'Entree'
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
	create_item_helper i, 'Side'
end

desserts = ["Blueberry Crumble",
			"Peach Cobbler",
			"Lemon Bundt Cake"]

desserts.each do |d|
	Item.create name: d, food_type: 'Dessert'
end

User.destroy_all :email =~ /@saffron.test/
User.create!(:email => 'testuser@saffron.test', :password => 'password', :password_confirmation => 'password')
User.create!(:email => 'testadmin@saffron.test', :password => 'password', :password_confirmation => 'password', :admin => true)

Menu.create!(:name => "Appetizer Galore", :budget_per_person => 7, :sample => true)