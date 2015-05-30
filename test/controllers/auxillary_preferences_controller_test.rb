require 'test_helper'

class AuxillaryPreferencesControllerTest < ActionController::TestCase
  setup do
    @auxillary_preference = auxillary_preferences(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:auxillary_preferences)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create auxillary_preference" do
    assert_difference('AuxillaryPreference.count') do
      post :create, auxillary_preference: { first_item_id: @auxillary_preference.first_item_id, rank: @auxillary_preference.rank, second_item_id: @auxillary_preference.second_item_id }
    end

    assert_redirected_to auxillary_preference_path(assigns(:auxillary_preference))
  end

  test "should show auxillary_preference" do
    get :show, id: @auxillary_preference
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @auxillary_preference
    assert_response :success
  end

  test "should update auxillary_preference" do
    patch :update, id: @auxillary_preference, auxillary_preference: { first_item_id: @auxillary_preference.first_item_id, rank: @auxillary_preference.rank, second_item_id: @auxillary_preference.second_item_id }
    assert_redirected_to auxillary_preference_path(assigns(:auxillary_preference))
  end

  test "should destroy auxillary_preference" do
    assert_difference('AuxillaryPreference.count', -1) do
      delete :destroy, id: @auxillary_preference
    end

    assert_redirected_to auxillary_preferences_path
  end
end
