require 'test_helper'

class TurnosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @turno = turnos(:one)
  end

  test 'should get index' do
    get turnos_url
    assert_response :success
  end

  test 'should get new' do
    get new_turno_url
    assert_response :success
  end

  test 'should create turno' do
    assert_difference('Turno.count') do
      post turnos_url,
           params: { turno: { campus: @turno.campus, comuna: @turno.comuna, descripcion: @turno.descripcion,
                              dia: @turno.dia, direccion_conductor: @turno.direccion_conductor, hora_llegada: @turno.hora_llegada, nombre_completo: @turno.nombre_completo, num_pasajeros: @turno.num_pasajeros } }
    end

    assert_redirected_to turno_url(Turno.last)
  end

  test 'should show turno' do
    get turno_url(@turno)
    assert_response :success
  end

  test 'should get edit' do
    get edit_turno_url(@turno)
    assert_response :success
  end

  test 'should update turno' do
    patch turno_url(@turno),
          params: { turno: { campus: @turno.campus, comuna: @turno.comuna, descripcion: @turno.descripcion,
                             dia: @turno.dia, direccion_conductor: @turno.direccion_conductor, hora_llegada: @turno.hora_llegada, nombre_completo: @turno.nombre_completo, num_pasajeros: @turno.num_pasajeros } }
    assert_redirected_to turno_url(@turno)
  end

  test 'should destroy turno' do
    assert_difference('Turno.count', -1) do
      delete turno_url(@turno)
    end

    assert_redirected_to turnos_url
  end
end
