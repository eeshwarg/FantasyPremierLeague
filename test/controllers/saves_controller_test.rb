require 'test_helper'

class SavesControllerTest < ActionController::TestCase
  setup do
    @safe = saves(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:saves)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create safe" do
    assert_difference('Safe.count') do
      post :create, safe: { game_id: @safe.game_id, player_id: @safe.player_id, sTime: @safe.sTime }
    end

    assert_redirected_to safe_path(assigns(:safe))
  end

  test "should show safe" do
    get :show, id: @safe
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @safe
    assert_response :success
  end

  test "should update safe" do
    patch :update, id: @safe, safe: { game_id: @safe.game_id, player_id: @safe.player_id, sTime: @safe.sTime }
    assert_redirected_to safe_path(assigns(:safe))
  end

  test "should destroy safe" do
    assert_difference('Safe.count', -1) do
      delete :destroy, id: @safe
    end

    assert_redirected_to saves_path
  end
end
