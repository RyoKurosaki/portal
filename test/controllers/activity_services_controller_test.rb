require 'test_helper'

class ActivityServicesControllerTest < ActionController::TestCase
  setup do
    @activity_service = activity_services(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:activity_services)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create activity_service" do
    assert_difference('ActivityService.count') do
      post :create, activity_service: { amount: @activity_service.amount, category: @activity_service.category, photo: @activity_service.photo, plan: @activity_service.plan }
    end

    assert_redirected_to activity_service_path(assigns(:activity_service))
  end

  test "should show activity_service" do
    get :show, id: @activity_service
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @activity_service
    assert_response :success
  end

  test "should update activity_service" do
    patch :update, id: @activity_service, activity_service: { amount: @activity_service.amount, category: @activity_service.category, photo: @activity_service.photo, plan: @activity_service.plan }
    assert_redirected_to activity_service_path(assigns(:activity_service))
  end

  test "should destroy activity_service" do
    assert_difference('ActivityService.count', -1) do
      delete :destroy, id: @activity_service
    end

    assert_redirected_to activity_services_path
  end
end
