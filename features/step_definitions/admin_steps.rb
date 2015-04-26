When /^I make "(.*)" an admin user$/ do |user_name|
	user = User.find_by_name(user_name)
	within(:css, "tr#" + user.id.to_s) do
		click_link('Make Admin')
	end
end

Then /"(.*)" should be an admin user$/ do |user_name|
	user = User.find_by_name(user_name)
	assert(user.admin? == true)
end