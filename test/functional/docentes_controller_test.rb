require 'test_helper'

class DocentesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:docentes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create docente" do
    assert_difference('Docente.count') do
      post :create, :docente => { }
    end

    assert_redirected_to docente_path(assigns(:docente))
  end

  test "should show docente" do
    get :show, :id => docentes(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => docentes(:one).to_param
    assert_response :success
  end

  test "should update docente" do
    put :update, :id => docentes(:one).to_param, :docente => { }
    assert_redirected_to docente_path(assigns(:docente))
  end

  test "should destroy docente" do
    assert_difference('Docente.count', -1) do
      delete :destroy, :id => docentes(:one).to_param
    end

    assert_redirected_to docentes_path
  end
end
