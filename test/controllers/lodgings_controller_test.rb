require 'test_helper'

class LodgingsControllerTest < ActionController::TestCase
  setup do
    @lodging = lodgings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:lodgings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create lodging" do
    assert_difference('Lodging.count') do
      post :create, lodging: { date: @lodging.date, hotelName: @lodging.hotelName, hotelPhone: @lodging.hotelPhone, total: @lodging.total, travel_id: @lodging.travel_id }
    end

    assert_redirected_to lodging_path(assigns(:lodging))
  end

  test "should show lodging" do
    get :show, id: @lodging
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @lodging
    assert_response :success
  end

  test "should update lodging" do
    patch :update, id: @lodging, lodging: { date: @lodging.date, hotelName: @lodging.hotelName, hotelPhone: @lodging.hotelPhone, total: @lodging.total, travel_id: @lodging.travel_id }
    assert_redirected_to lodging_path(assigns(:lodging))
  end

  test "should destroy lodging" do
    assert_difference('Lodging.count', -1) do
      delete :destroy, id: @lodging
    end

    assert_redirected_to lodgings_path
  end
end
