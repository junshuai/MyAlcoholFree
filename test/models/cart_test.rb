require 'test_helper'

class CartTest < ActiveSupport::TestCase
  test "add product with id" do
    cart = carts(:one)
    line_item = cart.add_product_with_id(products(:one).id, 1)
    line_item.save!
    assert_equal line_item.product_id, products(:one).id
    assert_equal line_item.quantity, 1

    line_item = cart.add_product_with_id(products(:one).id, 2)
    line_item.save!
    assert_equal line_item.product_id, products(:one).id
    assert_equal line_item.quantity, 3
  end

  test "total price" do
    cart = carts(:one)
    cart.add_product_with_id(products(:one).id, 97).save!
    cart.add_product_with_id(products(:two).id, 83).save!
    assert_equal cart.total_price, products(:one).price * 97 + products(:two).price * 83
  end
end
