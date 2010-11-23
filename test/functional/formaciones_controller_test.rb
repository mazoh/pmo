require 'test_helper'

class FormacionesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:formaciones)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create formacion" do
    assert_difference('Formacion.count') do
      post :create, :formacion => { }
    end

    assert_redirected_to formacion_path(assigns(:formacion))
  end

  test "should show formacion" do
    get :show, :id => formaciones(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => formaciones(:one).to_param
    assert_response :success
  end

  test "should update formacion" do
    put :update, :id => formaciones(:one).to_param, :formacion => { }
    assert_redirected_to formacion_path(assigns(:formacion))
  end

  test "should destroy formacion" do
    assert_difference('Formacion.count', -1) do
      delete :destroy, :id => formaciones(:one).to_param
    end

    assert_redirected_to formaciones_path
  end
end
