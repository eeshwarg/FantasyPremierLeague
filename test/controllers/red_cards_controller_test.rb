require 'test_helper'

class RedCardsControllerTest < ActionController::TestCase
  setup do
    @red_card = red_cards(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:red_cards)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create red_card" do
    assert_difference('RedCard.count') do
      post :create, red_card: { game_id: @red_card.game_id, player_id: @red_card.player_id, rTime: @red_card.rTime }
    end

    assert_redirected_to red_card_path(assigns(:red_card))
  end

  test "should show red_card" do
    get :show, id: @red_card
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @red_card
    assert_response :success
  end

  test "should update red_card" do
    patch :update, id: @red_card, red_card: { game_id: @red_card.game_id, player_id: @red_card.player_id, rTime: @red_card.rTime }
    assert_redirected_to red_card_path(assigns(:red_card))
  end

  test "should destroy red_card" do
    assert_difference('RedCard.count', -1) do
      delete :destroy, id: @red_card
    end

    assert_redirected_to red_cards_path
  end
end
