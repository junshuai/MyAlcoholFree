require 'test_helper'

class ProductDetailTest < ActiveSupport::TestCase
  test "product id should be an existing product reference" do
    product = Product.first
    product_detail = ProductDetail.new(product_id: product.id, image_url: 'image.jpg')
    assert product_detail.valid?, product_detail.errors[:product_id]

    product_detail = ProductDetail.new(product_id: -1, image_url: 'image.jpg')
    assert product_detail.invalid?
    assert product_detail.errors[:product_id].any?
  end

  def new_product_detail_with_image_url(image_url)
    product = Product.first
    ProductDetail.new(product_id: product.id,
                      image_url:  image_url)
  end

  test "image url must end with GIF, JPG or PNG" do
    right = %w{ frew.gif fred.jpg fred.png FRED.JPG FRED.Jpg
                http://a.b.c/x/y/z/fred.gif }
    wrong = %w{ fred.doc fred.gif/more fred.gif.more }

    right.each do |image_url|
      assert new_product_detail_with_image_url(image_url).valid?,
             "#{image_url} should be valid"
    end

    wrong.each do |image_url|
      assert new_product_detail_with_image_url(image_url).invalid?,
             "#{image_url} should be invalid"
    end
  end


end
