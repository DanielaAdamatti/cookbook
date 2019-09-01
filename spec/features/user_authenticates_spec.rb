require 'rails_helper'

feature 'user authenticates' do
  scenario 'logs in' do

    # cria os dados necessários
    user = User.create!(email:'email@email.com', password: '123456')

    #simula ação do usuário
    visit root_path
    click_on "Entrar"
    fill_in "E-mail", with: 'email@email.com'
    fill_in "Senha", with: '123456'
    click_on 'Enviar'

    # como resolver o problema de ambiguidade?
    # within ("") do
    #   click_on 'Entrar'
    # end

    #expectativa do usuário após a ação
    expect(current_path).to eq(root_path)
    expect(page).to have_content('Bem-vinda(o) email@email.com')
  end

  scenario 'logs out' do

    # cria os dados necessários
    user = User.create!(email:'email@email.com', password: '123456')

    #simula ação do usuário
    visit root_path
    click_on "Entrar"
    fill_in "E-mail", with: 'email@email.com'
    fill_in "Senha", with: '123456'
    click_on 'Enviar'

    click_on 'Sair'

    #expectativa do usuário após a ação
    expect(current_path).to eq(root_path)
    expect(page).to have_link 'Entrar'
    expect(page).not_to have_link 'Sair'
  end
end
