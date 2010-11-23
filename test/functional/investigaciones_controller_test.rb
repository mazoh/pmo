require 'test_helper'

class InvestigacionesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:investigaciones)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create investigacion" do
    assert_difference('Investigacion.count') do
      post :create, :investigacion => { }
    end

    assert_redirected_to investigacion_path(assigns(:investigacion))
  end

  test "should show investigacion" do
    get :show, :id => investigaciones(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => investigaciones(:one).to_param
    assert_response :success
  end

  test "should update investigacion" do
    put :update, :id => investigaciones(:one).to_param, :investigacion => { }
    assert_redirected_to investigacion_path(assigns(:investigacion))
  end

  test "should destroy investigacion" do
    assert_difference('Investigacion.count', -1) do
      delete :destroy, :id => investigaciones(:one).to_param
    end

    assert_redirected_to investigaciones_path
  end
end
