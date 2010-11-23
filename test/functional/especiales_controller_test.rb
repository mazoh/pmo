require 'test_helper'

class EspecialesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:especiales)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create especial" do
    assert_difference('Especial.count') do
      post :create, :especial => { }
    end

    assert_redirected_to especial_path(assigns(:especial))
  end

  test "should show especial" do
    get :show, :id => especiales(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => especiales(:one).to_param
    assert_response :success
  end

  test "should update especial" do
    put :update, :id => especiales(:one).to_param, :especial => { }
    assert_redirected_to especial_path(assigns(:especial))
  end

  test "should destroy especial" do
    assert_difference('Especial.count', -1) do
      delete :destroy, :id => especiales(:one).to_param
    end

    assert_redirected_to especiales_path
  end
end
