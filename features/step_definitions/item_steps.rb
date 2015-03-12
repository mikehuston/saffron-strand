Given /the following items exist/ do |items_table|
  items_table.hashes.each do |item|
  	Item.create!(item)
  end
end

Then /^I should see the "(.*)" link/ do |link|
	page.should have_link(link)
end

Then /^I should not see the "(.*)" link/ do |link|
	page.should_not have_link(link)
end