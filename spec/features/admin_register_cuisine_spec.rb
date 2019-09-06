require 'rails_helper'

feature 'admin register recipe type' do
  scenario 'successfully' do
    user = User.create!(email:"admin@email.com", password:"123456",admin: true)

    #simula ação do usuário
    visit root_path
    click_on "Entrar"
    fill_in "E-mail", with: 'admin@email.com'
    fill_in "Senha", with: '123456'
    click_on 'Enviar'

    click_on "Cadastrar Cozinha"
    fill_in "Nome", with: 'Árabe'
    click_on 'Enviar'

    #expectativa do usuário após a ação
    expect(page).to have_css('h1', text: 'Árabe')
  end
end
