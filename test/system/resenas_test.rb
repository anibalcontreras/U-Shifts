require 'application_system_test_case'

class ResenasTest < ApplicationSystemTestCase
  setup do
    @resena = resenas(:one)
  end

  test 'visiting the index' do
    visit resenas_url
    assert_selector 'h1', text: 'Resenas'
  end

  test 'creating a Resena' do
    visit resenas_url
    click_on 'New Resena'

    fill_in 'Descripcion', with: @resena.descripcion
    fill_in 'Resenado', with: @resena.resenado
    fill_in 'Resenador', with: @resena.resenador
    fill_in 'Valoracion', with: @resena.valoracion
    click_on 'Create Resena'

    assert_text 'Resena was successfully created'
    click_on 'Back'
  end

  test 'updating a Resena' do
    visit resenas_url
    click_on 'Edit', match: :first

    fill_in 'Descripcion', with: @resena.descripcion
    fill_in 'Resenado', with: @resena.resenado
    fill_in 'Resenador', with: @resena.resenador
    fill_in 'Valoracion', with: @resena.valoracion
    click_on 'Update Resena'

    assert_text 'Resena was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Resena' do
    visit resenas_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Resena was successfully destroyed'
  end
end
