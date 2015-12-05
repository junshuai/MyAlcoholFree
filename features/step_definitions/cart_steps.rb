Then(/^there should be the product in the cart$/) do
  visit('/')
  item_title = page.first('div#cart').find('.item_title').text
  item_title.should == page.first('div.product').find('.title').text
end

Then(/^I should see the cart$/) do
  visit('/')
  page.all('div#cart')
end
