# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

item1 = Item.create(name: 'Chicken Parm', desc: 'delish food', price: 10, category: 'Dinner', food_type: 'Meat')
item2 = Item.create(name: 'Eggs and Bacon', desc: 'American breakfast', price: 6, category: 'Breakfast', food_type: 'Meat')
item3 = Item.create(name: 'Roast Beef Sandwich', desc: 'better than Subway', price: 7, category: 'Lunch', food_type: 'Meat')
item4 = Item.create(name: 'Caesar Salad', desc: 'healthy side for your meal', price: 4, category: 'Dinner', food_type: 'Side')
item5 = Item.create(name: 'Filet Mignon', desc: 'grass fed beef', price: 12, category: 'Dinner', food_type: 'Meat')
item6 = Item.create(name: 'Mixed Green Salad', desc: 'healthy side for your meal', price: 4, category: 'Dinner', food_type: 'Side')
item7 = Item.create(name: 'Green Beans', desc: 'fresh and local', price: 4, category: 'Lunch', food_type: 'Side')


menu1 = Menu.create name: 'Sample $8 Menu', budget_per_person: 8
menu1.items << item6
menu1.items << item7
menu1.items << item4

menu2 = Menu.create name: 'Sample $15 Menu', budget_per_person: 8
menu2.items << item4
menu2.items << item7
menu2.items << item5
