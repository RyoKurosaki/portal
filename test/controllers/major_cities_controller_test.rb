require 'test_helper'

class MajorCitiesControllerTest < ActionController::TestCase
  setup do
    @major_city = major_cities(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:major_cities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create major_city" do
    assert_difference('MajorCity.count') do
      post :create, major_city: {  }
    end

    assert_redirected_to major_city_path(assigns(:major_city))
  end

  test "should show major_city" do
    get :show, id: @major_city
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @major_city
    assert_response :success
  end

  test "should update major_city" do
    patch :update, id: @major_city, major_city: {  }
    assert_redirected_to major_city_path(assigns(:major_city))
  end

  test "should destroy major_city" do
    assert_difference('MajorCity.count', -1) do
      delete :destroy, id: @major_city
    end

    assert_redirected_to major_cities_path
  end
end
