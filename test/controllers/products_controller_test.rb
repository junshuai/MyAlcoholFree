require 'test_helper'

class ProductsControllerTest < ActionController::TestCase
  setup do
    @product = products(:one)
    @update = {
      title:        'Romance en Rose Organic',
      description:  'A premium quality de-alcoholised organic rosé wine from Bordeaux.',
      thumbnail_url:    'http://www.alcoholfree.co.uk/images/romance_en_rose_site_thumb180.jpg',
      price:        7.99,
      supplier:     'apple'
    }
  end

=begin
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:products)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create product" do
    assert_difference('Product.count') do
      post :create, product: @update
    end

    product = Product.where(title: @update[:title]).first
    assert_redirected_to new_product_detail_path(product_id: product.id)
  end
=end

  test "should show product" do
    get :show, id: @product
    assert_response :success
  end

=begin
  test "should get edit" do
    get :edit, id: @product
    assert_response :success
  end

  test "should update product" do
    patch :update, id: @product, product: @update
    assert_redirected_to product_path(assigns(:product))
  end

  test "should destroy product" do
    assert_difference('Product.count', -1) do
      delete :destroy, id: @product
    end

    assert_redirected_to products_path
  end
=end
end
