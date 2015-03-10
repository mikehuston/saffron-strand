
#adds items in the menu list to the database

Given /the following recipes exist/ do |recipe_table|
  recipe_table.hashes.each do |recipe|
    Items.create!(recipe)
  end
end


