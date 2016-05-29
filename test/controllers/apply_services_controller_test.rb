require 'test_helper'

class ApplyServicesControllerTest < ActionController::TestCase
  setup do
    @apply_service = apply_services(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:apply_services)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create apply_service" do
    assert_difference('ApplyService.count') do
      post :create, apply_service: { activity_service_id: @apply_service.activity_service_id, email: @apply_service.email, expected_date: @apply_service.expected_date, name: @apply_service.name, tel: @apply_service.tel }
    end

    assert_redirected_to apply_service_path(assigns(:apply_service))
  end

  test "should show apply_service" do
    get :show, id: @apply_service
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @apply_service
    assert_response :success
  end

  test "should update apply_service" do
    patch :update, id: @apply_service, apply_service: { activity_service_id: @apply_service.activity_service_id, email: @apply_service.email, expected_date: @apply_service.expected_date, name: @apply_service.name, tel: @apply_service.tel }
    assert_redirected_to apply_service_path(assigns(:apply_service))
  end

  test "should destroy apply_service" do
    assert_difference('ApplyService.count', -1) do
      delete :destroy, id: @apply_service
    end

    assert_redirected_to apply_services_path
  end
end
