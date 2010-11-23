require 'test_helper'

class AcademicosControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:academicos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create academico" do
    assert_difference('Academico.count') do
      post :create, :academico => { }
    end

    assert_redirected_to academico_path(assigns(:academico))
  end

  test "should show academico" do
    get :show, :id => academicos(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => academicos(:one).to_param
    assert_response :success
  end

  test "should update academico" do
    put :update, :id => academicos(:one).to_param, :academico => { }
    assert_redirected_to academico_path(assigns(:academico))
  end

  test "should destroy academico" do
    assert_difference('Academico.count', -1) do
      delete :destroy, :id => academicos(:one).to_param
    end

    assert_redirected_to academicos_path
  end
end
