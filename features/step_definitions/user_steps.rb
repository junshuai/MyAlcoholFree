Given /^a user is logged in as "(.*)"$/ do |username|
  @current_user = User.create!(
    :username => username,
    :password => 'password',
    :password_confirmation => 'password',
  )

  visit "/login"
  fill_in("username", :with => username) 
  fill_in("password", :with => 'password') 
  click_button("Login")
end

Given /^there is a user$/ do
  FactoryGirl.create(:user)
end

When /^I click the "Logout" button$/ do
  click_link("Logout")
end

Then /^I should logout$/ do
  visit('/')
  page.has_content?('Login')
end
