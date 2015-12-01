require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  test "product attributes must not be empty" do
    product = Product.new
    assert product.invalid?
    assert product.errors[:title].any?
    assert product.errors[:price].any?
    assert product.errors[:thumbnail_url].any?
    assert product.errors[:supplier].any?
  end

  test "product price must be not negative" do
    product = Product.new(title:          'Romance en Rouge Organic Red',
                          description:    'A premium-quality organic de-alcoholised red wine.',
                          thumbnail_url:  'http://www.alcoholfree.co.uk/images/romance_en_rouge_4_thumb180.jpg',
                          supplier:       'apple')

    product.price = -1
    assert product.invalid?
    assert_equal ["must be greater than or equal to 0.0"], product.errors[:price]

    product.price = 0
    assert product.valid?

    product.price = 1
    assert product.valid?
  end

  def new_product_with_thumbnail_url(thumbnail_url)
    Product.new(title:          'Romance en Blanc Organic White',
                description:    'A premium-quality de-alcoholised organic dry white.',
                price:          7.99,
                thumbnail_url:  thumbnail_url,
                supplier:       'apple')
  end

  test "thumbnail url must end with GIF, JPG or PNG" do
    right = %w{ frew.gif fred.jpg fred.png FRED.JPG FRED.Jpg
                http://a.b.c/x/y/z/fred.gif }
    wrong = %w{ fred.doc fred.gif/more fred.gif.more }

    right.each do |thumbnail_url|
      assert new_product_with_thumbnail_url(thumbnail_url).valid?,
             "#{thumbnail_url} should be valid"
    end

    wrong.each do |thumbnail_url|
      assert new_product_with_thumbnail_url(thumbnail_url).invalid?,
             "#{thumbnail_url} should be invalid"
    end
  end

  test "product is not valid without a unique title" do
    product = Product.new(title:          products(:one).title,
                          description:    'some description',
                          price:          5.99,
                          thumbnail_url:  'fred.gif')
    assert product.invalid?
    assert_equal ["has already been taken"], product.errors[:title]
  end
end
