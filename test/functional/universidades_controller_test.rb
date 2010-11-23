require 'test_helper'

class UniversidadesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:universidades)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create universidad" do
    assert_difference('Universidad.count') do
      post :create, :universidad => { }
    end

    assert_redirected_to universidad_path(assigns(:universidad))
  end

  test "should show universidad" do
    get :show, :id => universidades(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => universidades(:one).to_param
    assert_response :success
  end

  test "should update universidad" do
    put :update, :id => universidades(:one).to_param, :universidad => { }
    assert_redirected_to universidad_path(assigns(:universidad))
  end

  test "should destroy universidad" do
    assert_difference('Universidad.count', -1) do
      delete :destroy, :id => universidades(:one).to_param
    end

    assert_redirected_to universidades_path
  end
end
