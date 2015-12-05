When(/^I search for Product whose title contains "(.*?)"$/) do |query|
  visit('/')
  fill_in('query', with: query)
  click_button('search')
end

Then(/^the results must be products titled (.+)$/) do |expected_titles|
  sleep 0.5 
  titles = page.all('div.product').map { |product|
    product.find('.title').text
  }

  expected_titles.split(", ").to_a.should == titles
end
