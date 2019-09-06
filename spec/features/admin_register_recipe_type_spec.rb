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

    click_on "Cadastrar Tipo de Receita"
    fill_in "Nome", with: 'Entrada'
    click_on 'Enviar'

    #expectativa do usuário após a ação
    expect(page).to have_css('h1', text: 'Entrada')
  end

  scenario 'and must fill in name' do
    user = User.create!(email:"admin@email.com", password:"123456",admin: true)

    visit root_path
    click_on "Entrar"
    fill_in "E-mail", with: 'admin@email.com'
    fill_in "Senha", with: '123456'
    click_on 'Enviar'

    click_on "Cadastrar Tipo de Receita"
    fill_in "Nome", with: ''
    click_on 'Enviar'

    #expectativa do usuário após a ação
    expect(page).to have_content('Você deve informar o nome do tipo de receita')
  end

  scenario 'and checks uniqueness' do
    user = User.create!(email:"admin@email.com", password:"123456",admin: true)

    visit root_path
    click_on "Entrar"
    fill_in "E-mail", with: 'admin@email.com'
    fill_in "Senha", with: '123456'
    click_on 'Enviar'

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

  scenario 'and must be loged in as admin to register recipe type' do
    user = User.create!(email:"admin@email.com", password:"123456",admin: false)

    #simula ação do usuário
    visit root_path
    click_on "Entrar"
    fill_in "E-mail", with: 'admin@email.com'
    fill_in "Senha", with: '123456'
    click_on 'Enviar'

    #expectativa do usuário após a ação
    expect(page).not_to have_link('Cadastrar Tipo de Receita')
  end

end
