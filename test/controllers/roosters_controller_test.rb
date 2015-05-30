require 'test_helper'

class RoostersControllerTest < ActionController::TestCase
  setup do
    @rooster = roosters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:roosters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rooster" do
    assert_difference('Rooster.count') do
      post :create, rooster: { item_id: @rooster.item_id, number_of_orders: @rooster.number_of_orders, ttl: @rooster.ttl }
    end

    assert_redirected_to rooster_path(assigns(:rooster))
  end

  test "should show rooster" do
    get :show, id: @rooster
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rooster
    assert_response :success
  end

  test "should update rooster" do
    patch :update, id: @rooster, rooster: { item_id: @rooster.item_id, number_of_orders: @rooster.number_of_orders, ttl: @rooster.ttl }
    assert_redirected_to rooster_path(assigns(:rooster))
  end

  test "should destroy rooster" do
    assert_difference('Rooster.count', -1) do
      delete :destroy, id: @rooster
    end

    assert_redirected_to roosters_path
  end
end
