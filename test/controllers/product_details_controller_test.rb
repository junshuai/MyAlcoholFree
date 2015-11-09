require 'test_helper'

class ProductDetailsControllerTest < ActionController::TestCase
  setup do
    @product_detail = product_details(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:product_details)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create product_detail" do
    assert_difference('ProductDetail.count') do
      post :create, product_detail: { alcohol_by_volume: @product_detail.alcohol_by_volume, calories_in_kcal_per_100ml: @product_detail.calories_in_kcal_per_100ml, country_of_origin: @product_detail.country_of_origin, grape_type: @product_detail.grape_type, image_url: @product_detail.image_url, long_description: @product_detail.long_description, manufacturer: @product_detail.manufacturer, product_id: @product_detail.product_id, volume_in_liter: @product_detail.volume_in_liter }
    end

    assert_redirected_to product_detail_path(assigns(:product_detail))
  end

  test "should show product_detail" do
    get :show, id: @product_detail
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @product_detail
    assert_response :success
  end

  test "should update product_detail" do
    patch :update, id: @product_detail, product_detail: { alcohol_by_volume: @product_detail.alcohol_by_volume, calories_in_kcal_per_100ml: @product_detail.calories_in_kcal_per_100ml, country_of_origin: @product_detail.country_of_origin, grape_type: @product_detail.grape_type, image_url: @product_detail.image_url, long_description: @product_detail.long_description, manufacturer: @product_detail.manufacturer, product_id: @product_detail.product_id, volume_in_liter: @product_detail.volume_in_liter }
    assert_redirected_to product_detail_path(assigns(:product_detail))
  end

  test "should destroy product_detail" do
    assert_difference('ProductDetail.count', -1) do
      delete :destroy, id: @product_detail
    end

    assert_redirected_to product_details_path
  end
end
