require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  test "order attributes must not be empty" do
    order = Order.new
    assert order.invalid?
    assert order.errors[:name].any?
    assert order.errors[:address].any?
    assert order.errors[:email].any?
  end

  test "pay type should be Check, Credit card or Purchase order" do
    order = orders(:one)

    order.pay_type = 'Check'
    assert order.valid?

    order.pay_type = 'Credit card'
    assert order.valid?

    order.pay_type = 'Purchase order'
    assert order.valid?

    order.pay_type = 'Robbery'
    assert order.invalid?
    assert order.errors[:pay_type].any?
  end

  test "add line items from cart" do
    cart = carts(:one)
    cart.add_product_with_id(products(:one).id, 2).save!
    cart.add_product_with_id(products(:two).id, 3).save!

    order = orders(:one)
    order.add_line_items_from_cart(cart)

    assert_equal order.line_items.length, 2
  end
end
