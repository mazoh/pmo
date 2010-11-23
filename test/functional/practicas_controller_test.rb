require 'test_helper'

class PracticasControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:practicas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create practica" do
    assert_difference('Practica.count') do
      post :create, :practica => { }
    end

    assert_redirected_to practica_path(assigns(:practica))
  end

  test "should show practica" do
    get :show, :id => practicas(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => practicas(:one).to_param
    assert_response :success
  end

  test "should update practica" do
    put :update, :id => practicas(:one).to_param, :practica => { }
    assert_redirected_to practica_path(assigns(:practica))
  end

  test "should destroy practica" do
    assert_difference('Practica.count', -1) do
      delete :destroy, :id => practicas(:one).to_param
    end

    assert_redirected_to practicas_path
  end
end
