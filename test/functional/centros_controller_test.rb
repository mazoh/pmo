require 'test_helper'

class CentrosControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:centros)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create centro" do
    assert_difference('Centro.count') do
      post :create, :centro => { }
    end

    assert_redirected_to centro_path(assigns(:centro))
  end

  test "should show centro" do
    get :show, :id => centros(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => centros(:one).to_param
    assert_response :success
  end

  test "should update centro" do
    put :update, :id => centros(:one).to_param, :centro => { }
    assert_redirected_to centro_path(assigns(:centro))
  end

  test "should destroy centro" do
    assert_difference('Centro.count', -1) do
      delete :destroy, :id => centros(:one).to_param
    end

    assert_redirected_to centros_path
  end
end
