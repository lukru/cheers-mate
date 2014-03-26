require 'test_helper'

class DrinksControllerTest < ActionController::TestCase
  setup do
    @drink = drinks(:one)
    @user = @drink.user
    sign_in @user
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:drinks)
  end

  test "should get just the drinks for the current user" do
    get :index, :user_id => true
    assert_response :success
    drinks = assigns(:drinks)
    assert_not_nil drinks
    drinks.each do |drink|
      assert_equal(@user.id, drink.user_id)
    end
  end


  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create drink" do
    assert_difference('Drink.count') do
      post :create, drink: { price: @drink.price, description: @drink.description, location: @drink.location, name: @drink.name }
    end

    assert_redirected_to drink_path(assigns(:drink))
  end

  test "should show drink" do
    get :show, id: @drink
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @drink
    assert_response :success
  end

  test "should update drink" do
    patch :update, id: @drink, drink: { price: @drink.price, description: @drink.description, location: @drink.location, name: @drink.name }
    assert_redirected_to drink_path(assigns(:drink))
  end

  test "should destroy drink" do
    assert_difference('Drink.count', -1) do
      delete :destroy, id: @drink
    end

    assert_redirected_to drinks_path
  end
end
