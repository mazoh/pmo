require 'test_helper'

class HerramientasControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:herramientas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create herramienta" do
    assert_difference('Herramienta.count') do
      post :create, :herramienta => { }
    end

    assert_redirected_to herramienta_path(assigns(:herramienta))
  end

  test "should show herramienta" do
    get :show, :id => herramientas(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => herramientas(:one).to_param
    assert_response :success
  end

  test "should update herramienta" do
    put :update, :id => herramientas(:one).to_param, :herramienta => { }
    assert_redirected_to herramienta_path(assigns(:herramienta))
  end

  test "should destroy herramienta" do
    assert_difference('Herramienta.count', -1) do
      delete :destroy, :id => herramientas(:one).to_param
    end

    assert_redirected_to herramientas_path
  end
end
