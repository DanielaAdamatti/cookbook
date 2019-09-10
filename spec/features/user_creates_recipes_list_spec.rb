require 'rails_helper'
  feature 'user creates recipes list' do
    scenario 'successfully' do
      # cria os dados necessários
      user = User.create!(email:'email@email.com', password: '123456')

      #simula ação do usuário
      visit root_path
      click_on 'Entrar'
      fill_in "E-mail", with: "email@email.com"
      fill_in "Senha", with: "123456"
      click_on "Enviar"

      click_on 'Criar lista de receitas'
      fill_in 'Nome da lista', with: 'Receitas de Natal'
      click_on 'Enviar'

      #expectativa do usuário após a ação
      expect(page).to have_css('h1', text: 'Receitas de Natal')

    end
  end
