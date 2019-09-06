require 'rails_helper'

feature 'admin register cuisine' do
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

  scenario 'and must fill in name' do
    user = User.create!(email:"admin@email.com", password:"123456",admin: true)

    visit root_path
    click_on "Entrar"
    fill_in "E-mail", with: 'admin@email.com'
    fill_in "Senha", with: '123456'
    click_on 'Enviar'

    click_on "Cadastrar Cozinha"
    fill_in "Nome", with: ''
    click_on 'Enviar'

    #expectativa do usuário após a ação
    expect(page).to have_content('Você deve informar o nome da Cozinha')
  end

  scenario 'and checks uniqueness' do
    user = User.create!(email:"admin@email.com", password:"123456",admin: true)

    visit root_path
    click_on "Entrar"
    fill_in "E-mail", with: 'admin@email.com'
    fill_in "Senha", with: '123456'
    click_on 'Enviar'

    click_on "Cadastrar Cozinha"
    fill_in "Nome", with: 'Arabe'
    click_on 'Enviar'

    visit root_path
    click_on "Cadastrar Cozinha"
    fill_in "Nome", with: 'Arabe'
    click_on 'Enviar'

    #expectativa do usuário após a ação
    expect(page).to have_content('Cozinha já cadastrada')
  end

  scenario 'and must be loged in as admin to register cuisine' do
    user = User.create!(email:"admin@email.com", password:"123456",admin: false)

    #simula ação do usuário
    visit root_path
    click_on "Entrar"
    fill_in "E-mail", with: 'admin@email.com'
    fill_in "Senha", with: '123456'
    click_on 'Enviar'

    #expectativa do usuário após a ação
    expect(page).not_to have_link('Cadastrar Cozinha')
  end
end
