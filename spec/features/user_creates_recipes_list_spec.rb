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

    scenario 'and must fill in name' do
      # cria os dados necessários
      User.create!(email:'email@email.com', password: '123456')

      #simula ação do usuário
      visit root_path
      click_on 'Entrar'
      fill_in "E-mail", with: "email@email.com"
      fill_in "Senha", with: "123456"
      click_on "Enviar"

      click_on 'Criar lista de receitas'
      fill_in 'Nome da lista', with: ''
      click_on 'Enviar'

      #expectativa do usuário após a ação
      expect(page).to have_content('O nome da lista deve ser informado')
    end

    scenario "and a user can see all his lists" do
      #cria os dados necessários
      user = User.create!(email:'email@email.com', password: '123456')
      another_user=User.create!(email:"email2@email.com", password:"123456")
      list= List.create!(name: "Receitas de Natal",user: user)
      other_list=  List.create!(name: "Receitas de Páscoa",user: user)
      another_list= List.create!(name: "Receitas de Aniversário",user:another_user)

      #simula ação do usuário
      visit root_path
      click_on 'Entrar'
      fill_in "E-mail", with: "email@email.com"
      fill_in "Senha", with: "123456"
      click_on "Enviar"

      click_on 'Minhas Listas'

      #expectativa do usuário após a ação
      expect(page).to have_content(list.name)
      expect(page).to have_content(other_list.name)
      expect(page).not_to have_content(another_list.name)
    end

    scenario 'and a user can not create two lists with the same name' do
      user = User.create!(email:'email@email.com', password: '123456')
      list= List.create!(name: "Receitas de Natal",user: user)

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
      expect(page).to have_content('Lista já existe')
    end

    scenario 'and another user can create a list with the same name' do
      user = User.create!(email:'email@email.com', password: '123456')
      list= List.create!(name: "Receitas de Natal",user: user)
      other_user = User.create!(email:'otheremail@email.com', password: '123456')

      #simula ação do usuário
      visit root_path
      click_on 'Entrar'
      fill_in "E-mail", with: "otheremail@email.com"
      fill_in "Senha", with: "123456"
      click_on "Enviar"

      click_on 'Criar lista de receitas'
      fill_in 'Nome da lista', with: 'Receitas de Natal'
      click_on 'Enviar'

      #expectativa do usuário após a ação
      expect(page).not_to have_content('Lista já existe')
    end
  end
