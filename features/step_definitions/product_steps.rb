Given /^there are the following products titled (.+)$/ do |titles|
  titles.split(', ').each do |title|
    Product.create!(title: title, thumbnail_url: 'img.jpg', price: '0.1', supplier: 'apple')
  end
end

Then /^the products should be listed and ordered alphabetically$/ do
  titles = page.all('div.product').map do |product|
    product.find('.title').text
  end
  titles.should == titles.sort
end

Given /^there is a product$/ do
  FactoryGirl.create(:product)
end

Given /^there is a product with detail$/ do
  product = FactoryGirl.create(:product)
  ProductDetail.create!(product_id: product.id, image_url: 'img.jpg')
end

When /^I click the product image$/ do
  page.first('div.product').first('a').click
end

Then /^I should enter the product detail page$/ do
  page.has_content?('title')
end

When /^I press the "Add to Cart" button$/ do
  page.first('div.product').first('input.btn').click
  visit('/')
end
