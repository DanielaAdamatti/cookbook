require 'rails_helper'
  feature 'user uploads image when creating recipe' do
    scenario 'successfully' do
      user = User.create(email: 'email@email.com', password: '123456')
      RecipeType.create(name: 'Entrada')
      Cuisine.create(name: 'Arabe')

      visit root_path
      click_on 'Entrar'
      fill_in "E-mail", with: "email@email.com"
      fill_in "Senha", with: "123456"
      click_on "Enviar"

      click_on 'Enviar uma receita'

      fill_in 'Título', with: 'Tabule'
      select 'Entrada', from: 'Tipo da Receita'
      select 'Arabe', from: 'Cozinha'
      fill_in 'Dificuldade', with: 'Fácil'
      fill_in 'Tempo de Preparo', with: '45'
      fill_in 'Ingredientes', with: 'Trigo para quibe, cebola, tomate picado, azeite, salsinha'
      fill_in 'Como Preparar', with: 'Misturar tudo e servir. Adicione limão a gosto.'

      attach_file('Imagem', 'spec/fixtures/bolo.jpg')

      click_on 'Enviar'

      #Expectativa
      expect(page).to have_css("img[src*='bolo.jpg']")
    end
  end
