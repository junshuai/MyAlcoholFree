When(/^I click the "Check out" button$/) do
  find('input[value="Check out"]').click
end

Then(/^I should see the place order page$/) do
  uri = URI.parse(current_url)
  "#{uri.path}".should == new_order_path
end

Then(/^I should go to login page$/) do
  uri = URI.parse(current_url)
  "#{uri.path}".should == login_path
end
