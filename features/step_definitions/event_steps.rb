Given /the following events exist/ do |events_table|
	events_table.hashes.each do |hash|
		event = Event.new
		event.name = hash[:name]
		event.menu = Menu.find_by_name(hash[:menu])
		event.user = User.find_by_email(hash[:user])
		event.head_count = hash[:head_count].to_i
		event.save!
	end

end