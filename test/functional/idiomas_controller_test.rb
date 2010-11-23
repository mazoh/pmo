require 'test_helper'

class IdiomasControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:idiomas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create idioma" do
    assert_difference('Idioma.count') do
      post :create, :idioma => { }
    end

    assert_redirected_to idioma_path(assigns(:idioma))
  end

  test "should show idioma" do
    get :show, :id => idiomas(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => idiomas(:one).to_param
    assert_response :success
  end

  test "should update idioma" do
    put :update, :id => idiomas(:one).to_param, :idioma => { }
    assert_redirected_to idioma_path(assigns(:idioma))
  end

  test "should destroy idioma" do
    assert_difference('Idioma.count', -1) do
      delete :destroy, :id => idiomas(:one).to_param
    end

    assert_redirected_to idiomas_path
  end
end
