require 'rails_helper'

feature 'admin register recipe type' do
  scenario 'successfully' do

    #simula ação do usuário
    visit root_path
    click_on "Cadastrar Tipo de Receita"
    fill_in "Nome", with: 'Entrada'
    click_on 'Enviar'

    #expectativa do usuário após a ação
    expect(page).to have_css('h1', text: 'Entrada')
  end

  scenario 'and must fill in name' do

    visit root_path
    click_on "Cadastrar Tipo de Receita"
    fill_in "Nome", with: ''
    click_on 'Enviar'

    #expectativa do usuário após a ação
    expect(page).to have_content('Você deve informar o nome do tipo de receita')
  end

  scenario 'and checks uniqueness' do

    visit root_path
    click_on "Cadastrar Tipo de Receita"
    fill_in "Nome", with: 'Entrada'
    click_on 'Enviar'

    visit root_path
    click_on "Cadastrar Tipo de Receita"
    fill_in "Nome", with: 'Entrada'
    click_on 'Enviar'

    #expectativa do usuário após a ação
    expect(page).to have_content('Tipo de receita já cadastrado')
  end



end
