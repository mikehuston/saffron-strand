Given /a "(.*)" per person budget sample menu named "(.*)" exists with the following items/ do |budget_per_person, name, items_table|
  menu = Menu.create! budget_per_person: budget_per_person.to_i, name: name, sample: true
  items_table.hashes.each do |item_hash|
    item = Item.create! item_hash
    menu.items << item
  end
end

Given /a "(.*)" per person budget sample menu named "(.*)" exists with the following items/ do |budget_per_person, name, items_table|
  menu = Menu.create! budget_per_person: budget_per_person.to_i, name: name
  items_table.hashes.each do |item_hash|
    item = Item.create! item_hash
    menu.items << item
  end
end

Then /^I should see "(.*)" inside a menu table$/ do |text|
  page.should have_css("table.sample_menu", :text => text)
end

Then /^I should not see "(.*)" inside a menu table$/ do |text|
  page.should have_no_css("table.sample_menu", :text => text)
end

Then /^I should see a "(.*)" button$/ do |name|
  find_button(name).should_not be_nil
end

#adds items in the menu list to the database
Given /the following recipes exist/ do |recipe_table|
  recipe_table.hashes.each do |recipe|
    Item.create!(recipe)
  end
end

Then /^(?:|I )should see the recipe "([^"]*)"$/ do |text|
  if page.respond_to? :should
    page.should have_content(text)
  else
    assert page.has_content?(text)
  end
end

Then /^(?:|I )should not see the recipe "([^"]*)"$/ do |text|
  if page.respond_to? :should
    page.should have_no_content(text)
  else
    assert page.has_no_content?(text)
  end
end
