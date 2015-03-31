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

When /^I upload an image file$/ do
	attach_file(:item_image, File.join(Rails.root, 'features/data', 'turkeysandwich.jpeg'))
end

When /^I upload a file that is not an image$/ do
	attach_file(:item_image, File.join(Rails.root, 'features/data', 'pdf-sample.pdf'))
end

Then /^the "(.*)" item should have an image$/ do |item_name|
	item = Item.where(name: item_name)[0]
	assert(item.image != nil)
end

Then /^the "(.*)" item should not be valid$/ do |item_name|
	item = Item.where(name: item_name)[0]
	assert(item.valid? == false)
end