require 'test_helper'

class BikesControllerTest < ActionController::TestCase
  setup do
    @bike = bikes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bikes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bike" do
    assert_difference('Bike.count') do
      post :create, bike: { category: @bike.category, description: @bike.description, image_url: @bike.image_url, name: @bike.name, price: @bike.price, subcategory: @bike.subcategory }
    end

    assert_redirected_to bike_path(assigns(:bike))
  end

  test "should show bike" do
    get :show, id: @bike
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bike
    assert_response :success
  end

  test "should update bike" do
    patch :update, id: @bike, bike: { category: @bike.category, description: @bike.description, image_url: @bike.image_url, name: @bike.name, price: @bike.price, subcategory: @bike.subcategory }
    assert_redirected_to bike_path(assigns(:bike))
  end

  test "should destroy bike" do
    assert_difference('Bike.count', -1) do
      delete :destroy, id: @bike
    end

    assert_redirected_to bikes_path
  end
end
