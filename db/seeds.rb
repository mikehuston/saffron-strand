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
			"Tuna Cutlets",
			"Smoked Salmon Tea Sandwiches",
			"Almond Chicken Salad Tea Sandwiches",
			"Sweet and Sour Meatballs"]

appetizers.each do |i|
	create_item_helper i, 'Appetizer'
end

fp = Item.find_by_name("Fruit Plate")
fp.desc = "Wedges of fresh pineapple, cantaloupe, slicies of kiwis, berries and grapes."
fp.save

entrees = ["Roasted Chicken with Lemon Herb Sauce",
		"Asian Flank Steak",
		"Pork Carnitas",
		"Vegetable Lasagna"]

entrees.each do |i|
	create_item_helper i, 'Entree'
end

afs = Item.find_by_name("Asian Flank Steak")
afs.desc = "This entree is excellent for summer entertaining."
afs.save

sides = ["Spiced Green Beans",
		"Asian Style Slaw",
		"Miso Cucumber Salad"]

sides.each do |i|
	create_item_helper i, 'Side'
end

desserts = ["Blueberry Crumble",
			"Lemon Bundt Cake"]

desserts.each do |i|
	Item.create name: i, food_type: 'Dessert'
end

User.destroy_all :email =~ /@saffron.test/
User.create!(:email => 'testuser@saffron.test', :password => 'password', :password_confirmation => 'password')
User.create!(:email => 'testadmin@saffron.test', :password => 'password', :password_confirmation => 'password', :admin => true)