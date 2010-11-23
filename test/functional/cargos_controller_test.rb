require 'test_helper'

class CargosControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cargos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cargo" do
    assert_difference('Cargo.count') do
      post :create, :cargo => { }
    end

    assert_redirected_to cargo_path(assigns(:cargo))
  end

  test "should show cargo" do
    get :show, :id => cargos(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => cargos(:one).to_param
    assert_response :success
  end

  test "should update cargo" do
    put :update, :id => cargos(:one).to_param, :cargo => { }
    assert_redirected_to cargo_path(assigns(:cargo))
  end

  test "should destroy cargo" do
    assert_difference('Cargo.count', -1) do
      delete :destroy, :id => cargos(:one).to_param
    end

    assert_redirected_to cargos_path
  end
end
