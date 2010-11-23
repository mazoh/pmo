require 'test_helper'

class LineasControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:lineas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create linea" do
    assert_difference('Linea.count') do
      post :create, :linea => { }
    end

    assert_redirected_to linea_path(assigns(:linea))
  end

  test "should show linea" do
    get :show, :id => lineas(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => lineas(:one).to_param
    assert_response :success
  end

  test "should update linea" do
    put :update, :id => lineas(:one).to_param, :linea => { }
    assert_redirected_to linea_path(assigns(:linea))
  end

  test "should destroy linea" do
    assert_difference('Linea.count', -1) do
      delete :destroy, :id => lineas(:one).to_param
    end

    assert_redirected_to lineas_path
  end
end
