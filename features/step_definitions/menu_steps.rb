
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
