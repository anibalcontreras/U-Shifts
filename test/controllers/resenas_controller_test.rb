require 'test_helper'

class ResenasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @resena = resenas(:one)
  end

  test 'should get index' do
    get resenas_url
    assert_response :success
  end

  test 'should get new' do
    get new_resena_url
    assert_response :success
  end

  test 'should create resena' do
    assert_difference('Resena.count') do
      post resenas_url,
           params: { resena: { descripcion: @resena.descripcion, resenado: @resena.resenado,
                               resenador: @resena.resenador, valoracion: @resena.valoracion } }
    end

    assert_redirected_to resena_url(Resena.last)
  end

  test 'should show resena' do
    get resena_url(@resena)
    assert_response :success
  end

  test 'should get edit' do
    get edit_resena_url(@resena)
    assert_response :success
  end

  test 'should update resena' do
    patch resena_url(@resena),
          params: { resena: { descripcion: @resena.descripcion, resenado: @resena.resenado,
                              resenador: @resena.resenador, valoracion: @resena.valoracion } }
    assert_redirected_to resena_url(@resena)
  end

  test 'should destroy resena' do
    assert_difference('Resena.count', -1) do
      delete resena_url(@resena)
    end

    assert_redirected_to resenas_url
  end
end
