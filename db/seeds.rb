# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Item.create(name: 'Chicken Parm', desc: 'delish food', price: 10, category: 'Dinner', food_type: 'Meat')
Item.create(name: 'Eggs and Bacon', desc: 'American breakfast', price: 6, category: 'Breakfast', food_type: 'Meat')
Item.create(name: 'Roast Beef Sandwich', desc: 'better than Subway', price: 7, category: 'Lunch', food_type: 'Meat')
Item.create(name: 'Caesar salad', desc: 'healthy side for your meal', price: 4, category: 'Dinner', food_type: 'Side')

