require 'test_helper'

class ExperienciasControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:experiencias)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create experiencia" do
    assert_difference('Experiencia.count') do
      post :create, :experiencia => { }
    end

    assert_redirected_to experiencia_path(assigns(:experiencia))
  end

  test "should show experiencia" do
    get :show, :id => experiencias(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => experiencias(:one).to_param
    assert_response :success
  end

  test "should update experiencia" do
    put :update, :id => experiencias(:one).to_param, :experiencia => { }
    assert_redirected_to experiencia_path(assigns(:experiencia))
  end

  test "should destroy experiencia" do
    assert_difference('Experiencia.count', -1) do
      delete :destroy, :id => experiencias(:one).to_param
    end

    assert_redirected_to experiencias_path
  end
end
