require 'test_helper'

class TollBothsControllerTest < ActionController::TestCase
  setup do
    @toll_both = toll_boths(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:toll_boths)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create toll_both" do
    assert_difference('TollBoth.count') do
      post :create, toll_both: { date: @toll_both.date, total: @toll_both.total, travel_id: @toll_both.travel_id }
    end

    assert_redirected_to toll_both_path(assigns(:toll_both))
  end

  test "should show toll_both" do
    get :show, id: @toll_both
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @toll_both
    assert_response :success
  end

  test "should update toll_both" do
    patch :update, id: @toll_both, toll_both: { date: @toll_both.date, total: @toll_both.total, travel_id: @toll_both.travel_id }
    assert_redirected_to toll_both_path(assigns(:toll_both))
  end

  test "should destroy toll_both" do
    assert_difference('TollBoth.count', -1) do
      delete :destroy, id: @toll_both
    end

    assert_redirected_to toll_boths_path
  end
end
