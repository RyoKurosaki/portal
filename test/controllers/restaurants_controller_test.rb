require 'test_helper'

class RestaurantsControllerTest < ActionController::TestCase
  setup do
    @restaurant = restaurants(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:restaurants)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create restaurant" do
    assert_difference('Restaurant.count') do
      post :create, restaurant: { access: @restaurant.access, address: @restaurant.address, average_price: @restaurant.average_price, cards_accepted: @restaurant.cards_accepted, close: @restaurant.close, cuisines: @restaurant.cuisines, detail: @restaurant.detail, hours: @restaurant.hours, japanese_name: @restaurant.japanese_name, kid_friendly: @restaurant.kid_friendly, name: @restaurant.name, smoking: @restaurant.smoking, tel: @restaurant.tel, tel_note: @restaurant.tel_note }
    end

    assert_redirected_to restaurant_path(assigns(:restaurant))
  end

  test "should show restaurant" do
    get :show, id: @restaurant
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @restaurant
    assert_response :success
  end

  test "should update restaurant" do
    patch :update, id: @restaurant, restaurant: { access: @restaurant.access, address: @restaurant.address, average_price: @restaurant.average_price, cards_accepted: @restaurant.cards_accepted, close: @restaurant.close, cuisines: @restaurant.cuisines, detail: @restaurant.detail, hours: @restaurant.hours, japanese_name: @restaurant.japanese_name, kid_friendly: @restaurant.kid_friendly, name: @restaurant.name, smoking: @restaurant.smoking, tel: @restaurant.tel, tel_note: @restaurant.tel_note }
    assert_redirected_to restaurant_path(assigns(:restaurant))
  end

  test "should destroy restaurant" do
    assert_difference('Restaurant.count', -1) do
      delete :destroy, id: @restaurant
    end

    assert_redirected_to restaurants_path
  end
end
