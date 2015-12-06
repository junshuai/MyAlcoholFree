require 'test_helper'

class LineItemsControllerTest < ActionController::TestCase
  setup do
    @line_item = line_items(:one)
  end

  test "should create line_item" do
    assert_difference('LineItem.count') do
      post :create, product_id: products(:one).id
    end

    assert_redirected_to product_path(products(:one).id)
  end

  test "should update line_item" do
    patch :update, id: @line_item, line_item: { cart_id: @line_item.cart_id, product_id: @line_item.product_id }
    assert_redirected_to line_item_path(assigns(:line_item))
  end

  test "should destroy line_item" do
    assert_difference('LineItem.count', -1) do
      delete :destroy, id: @line_item
    end

    assert_redirected_to cart_url(session[:cart_id])
  end
end
