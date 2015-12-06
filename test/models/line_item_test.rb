require 'test_helper'

class LineItemTest < ActiveSupport::TestCase
  test "total price" do
    primary_factor = 89
    line_item = carts(:one).add_product_with_id(products(:one).id, primary_factor)
    line_item.save!
    assert_equal line_item.total_price, products(:one).price * primary_factor
  end
end
