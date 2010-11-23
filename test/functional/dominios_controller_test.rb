require 'test_helper'

class DominiosControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dominios)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dominio" do
    assert_difference('Dominio.count') do
      post :create, :dominio => { }
    end

    assert_redirected_to dominio_path(assigns(:dominio))
  end

  test "should show dominio" do
    get :show, :id => dominios(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => dominios(:one).to_param
    assert_response :success
  end

  test "should update dominio" do
    put :update, :id => dominios(:one).to_param, :dominio => { }
    assert_redirected_to dominio_path(assigns(:dominio))
  end

  test "should destroy dominio" do
    assert_difference('Dominio.count', -1) do
      delete :destroy, :id => dominios(:one).to_param
    end

    assert_redirected_to dominios_path
  end
end
