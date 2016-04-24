require 'test_helper'

class TravelsControllerTest < ActionController::TestCase
  setup do
    @travel = travels(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:travels)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create travel" do
    assert_difference('Travel.count') do
      post :create, travel: { city_id: @travel.city_id, description: @travel.description, finalDate: @travel.finalDate, finalOdometer: @travel.finalOdometer, fuel_id: @travel.fuel_id, initialDate: @travel.initialDate, lodging_id: @travel.lodging_id, meal_id: @travel.meal_id, tollBoth_id: @travel.tollBoth_id, user_id: @travel.user_id, vehicle_id: @travel.vehicle_id }
    end

    assert_redirected_to travel_path(assigns(:travel))
  end

  test "should show travel" do
    get :show, id: @travel
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @travel
    assert_response :success
  end

  test "should update travel" do
    patch :update, id: @travel, travel: { city_id: @travel.city_id, description: @travel.description, finalDate: @travel.finalDate, finalOdometer: @travel.finalOdometer, fuel_id: @travel.fuel_id, initialDate: @travel.initialDate, lodging_id: @travel.lodging_id, meal_id: @travel.meal_id, tollBoth_id: @travel.tollBoth_id, user_id: @travel.user_id, vehicle_id: @travel.vehicle_id }
    assert_redirected_to travel_path(assigns(:travel))
  end

  test "should destroy travel" do
    assert_difference('Travel.count', -1) do
      delete :destroy, id: @travel
    end

    assert_redirected_to travels_path
  end
end
