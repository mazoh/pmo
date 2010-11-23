require 'test_helper'

class PublicacionesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:publicaciones)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create publicacion" do
    assert_difference('Publicacion.count') do
      post :create, :publicacion => { }
    end

    assert_redirected_to publicacion_path(assigns(:publicacion))
  end

  test "should show publicacion" do
    get :show, :id => publicaciones(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => publicaciones(:one).to_param
    assert_response :success
  end

  test "should update publicacion" do
    put :update, :id => publicaciones(:one).to_param, :publicacion => { }
    assert_redirected_to publicacion_path(assigns(:publicacion))
  end

  test "should destroy publicacion" do
    assert_difference('Publicacion.count', -1) do
      delete :destroy, :id => publicaciones(:one).to_param
    end

    assert_redirected_to publicaciones_path
  end
end
