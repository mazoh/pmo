require 'test_helper'

class PrototiposControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:prototipos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create prototipo" do
    assert_difference('Prototipo.count') do
      post :create, :prototipo => { }
    end

    assert_redirected_to prototipo_path(assigns(:prototipo))
  end

  test "should show prototipo" do
    get :show, :id => prototipos(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => prototipos(:one).to_param
    assert_response :success
  end

  test "should update prototipo" do
    put :update, :id => prototipos(:one).to_param, :prototipo => { }
    assert_redirected_to prototipo_path(assigns(:prototipo))
  end

  test "should destroy prototipo" do
    assert_difference('Prototipo.count', -1) do
      delete :destroy, :id => prototipos(:one).to_param
    end

    assert_redirected_to prototipos_path
  end
end
