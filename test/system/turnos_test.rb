require 'application_system_test_case'

class TurnosTest < ApplicationSystemTestCase
  setup do
    @turno = turnos(:one)
  end

  test 'visiting the index' do
    visit turnos_url
    assert_selector 'h1', text: 'Turnos'
  end

  test 'creating a Turno' do
    visit turnos_url
    click_on 'New Turno'

    fill_in 'Campus', with: @turno.campus
    fill_in 'Comuna', with: @turno.comuna
    fill_in 'Descripcion', with: @turno.descripcion
    fill_in 'Dia', with: @turno.dia
    fill_in 'Direccion conductor', with: @turno.direccion_conductor
    fill_in 'Hora llegada', with: @turno.hora_llegada
    fill_in 'Nombre completo', with: @turno.nombre_completo
    fill_in 'Num pasajeros', with: @turno.num_pasajeros
    click_on 'Create Turno'

    assert_text 'Turno was successfully created'
    click_on 'Back'
  end

  test 'updating a Turno' do
    visit turnos_url
    click_on 'Edit', match: :first

    fill_in 'Campus', with: @turno.campus
    fill_in 'Comuna', with: @turno.comuna
    fill_in 'Descripcion', with: @turno.descripcion
    fill_in 'Dia', with: @turno.dia
    fill_in 'Direccion conductor', with: @turno.direccion_conductor
    fill_in 'Hora llegada', with: @turno.hora_llegada
    fill_in 'Nombre completo', with: @turno.nombre_completo
    fill_in 'Num pasajeros', with: @turno.num_pasajeros
    click_on 'Update Turno'

    assert_text 'Turno was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Turno' do
    visit turnos_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Turno was successfully destroyed'
  end
end
