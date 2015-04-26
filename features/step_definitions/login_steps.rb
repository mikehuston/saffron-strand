# Source: https://github.com/plataformatec/devise/wiki/How-To:-Test-with-Cucumber

Given /^I logged out/ do
  click_link "Logout"
end

Given /^I am not authenticated$/ do
  visit('/users/sign_out') # ensure that at least
end

Given /^I am a user with email "(.*)" and password "(.*)"$/ do |email, password|
  User.new(:email => email, :password => password, :password_confirmation => password).save!
end

Given /^I am a new, authenticated user$/ do
  email = 'testing@man.net'
  password = 'secretpass'
  User.new(:email => email, :password => password, :password_confirmation => password).save!

  visit '/users/sign_in'
  fill_in "user_email", :with => email
  fill_in "user_password", :with => password
  click_button "Log in"

end

Given /^I am a new, authenticated admin user$/ do
  email = 'admin@test.com'
  password = 'admin123'
  User.new(:email => email, :password => password, :password_confirmation => password, :admin => true).save!

  visit '/users/sign_in'
  fill_in "user_email", :with => email
  fill_in "user_password", :with => password
  click_button "Log in"

end