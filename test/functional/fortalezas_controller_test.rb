require 'test_helper'

class FortalezasControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fortalezas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fortaleza" do
    assert_difference('Fortaleza.count') do
      post :create, :fortaleza => { }
    end

    assert_redirected_to fortaleza_path(assigns(:fortaleza))
  end

  test "should show fortaleza" do
    get :show, :id => fortalezas(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => fortalezas(:one).to_param
    assert_response :success
  end

  test "should update fortaleza" do
    put :update, :id => fortalezas(:one).to_param, :fortaleza => { }
    assert_redirected_to fortaleza_path(assigns(:fortaleza))
  end

  test "should destroy fortaleza" do
    assert_difference('Fortaleza.count', -1) do
      delete :destroy, :id => fortalezas(:one).to_param
    end

    assert_redirected_to fortalezas_path
  end
end
