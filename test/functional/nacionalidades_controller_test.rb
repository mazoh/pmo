require 'test_helper'

class NacionalidadesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:nacionalidades)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create nacionalidad" do
    assert_difference('Nacionalidad.count') do
      post :create, :nacionalidad => { }
    end

    assert_redirected_to nacionalidad_path(assigns(:nacionalidad))
  end

  test "should show nacionalidad" do
    get :show, :id => nacionalidades(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => nacionalidades(:one).to_param
    assert_response :success
  end

  test "should update nacionalidad" do
    put :update, :id => nacionalidades(:one).to_param, :nacionalidad => { }
    assert_redirected_to nacionalidad_path(assigns(:nacionalidad))
  end

  test "should destroy nacionalidad" do
    assert_difference('Nacionalidad.count', -1) do
      delete :destroy, :id => nacionalidades(:one).to_param
    end

    assert_redirected_to nacionalidades_path
  end
end
