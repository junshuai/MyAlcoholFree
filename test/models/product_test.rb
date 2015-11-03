require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  test "product attributes must not be empty" do
    product = Product.new
    assert product.invalid?
    assert product.errors[:title].any?
    assert product.errors[:description].any?
    assert product.errors[:price].any?
    assert product.errors[:image_url].any?
  end

  test "product price must be not negative" do
    product =Product.new(title: 'Romance en Rouge Organic Red',
                         description: 'A premium-quality organic de-alcoholised red wine. A rich bouquet with fine aromas of blackcurrant and delicate herbs.',
                         image_url: 'http://www.alcoholfree.co.uk/images/romance_en_rouge_4_thumb180.jpg')

    product.price = -1
    assert product.invalid?
    assert_equal ["must be greater than or equal to 0.0"], product.errors[:price]

    product.price = 0
    assert product.valid?

    product.price = 1
    assert product.valid?
  end

  def new_product_with_image_url(image_url)
    Product.new(title:       'Romance en Blanc Organic White',
                description: 'A premium-quality de-alcoholised organic dry white. An excellent blend of Sauvignon blanc and Sémillon.',
                price:       7.99,
                image_url:   image_url)
  end

  test "image url must end with GIF, JPG or PNG" do
    right = %w{ frew.gif fred.jpg fred.png FRED.JPG FRED.Jpg
                http://a.b.c/x/y/z/fred.gif }
    wrong = %w{ fred.doc fred.gif/more fred.gif.more }

    right.each do |image_url|
      assert new_product_with_image_url(image_url).valid?,
             "#{image_url} should be valid"
    end

    wrong.each do |image_url|
      assert new_product_with_image_url(image_url).invalid?,
             "#{image_url} should be invalid"
    end
  end

  test "product is not valid without a unique title" do
    product = Product.new(title:        products(:one).title,
                          description:  'some description',
                          price:        5.99,
                          image_url:    'fred.gif')
    assert product.invalid?
    assert_equal ["has already been taken"], product.errors[:title]
  end
end
