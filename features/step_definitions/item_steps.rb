Given /the following items exist/ do |items_table|
  items_table.hashes.each do |item|
  	Item.create!(item)
  end
end