require 'rails_helper'
  feature 'user updates his own recipes' do
    scenario 'can not edit without beeing loged in' do
      # cria os dados necessários
      user = User.create!(email:'email@email.com', password: '123456')
      recipe_type = RecipeType.create(name: 'Sobremesa')
      cuisine = Cuisine.create(name: 'Brasileira')
      recipe = Recipe.create!(title: 'Bolo de cenoura', recipe_type: recipe_type,
                    cuisine: cuisine, difficulty: 'Médio',
                    cook_time: 60, user: user,
                    ingredients: 'Farinha, açucar, cenoura',
                    cook_method: 'Cozinhe a cenoura, corte em pedaços pequenos, misture com o restante dos ingredientes')


      #simula ação do usuário
      visit root_path
      click_on 'Bolo de cenoura'

      expect(page).not_to have_link('Editar')

    end

    scenario 'and must be loged in and be the owner to edit recipe' do
      # cria os dados necessários
      user = User.create!(email:'email@email.com', password: '123456')
      recipe_type = RecipeType.create(name: 'Sobremesa')
      cuisine = Cuisine.create(name: 'Brasileira')
      recipe = Recipe.create!(title: 'Bolo de cenoura', recipe_type: recipe_type,
                              cuisine: cuisine, difficulty: 'Médio',
                              cook_time: 60, user: user,
                              ingredients: 'Farinha, açucar, cenoura',
                              cook_method: 'Cozinhe a cenoura, corte em pedaços pequenos, misture com o restante dos ingredientes')
      another_user = User.create!(email:'abc@email.com', password: '123456')
      recipe = Recipe.create!(title: 'Bolo de banana', recipe_type: recipe_type,
                                  cuisine: cuisine, difficulty: 'Médio',
                                  cook_time: 60, user: another_user,
                                  ingredients: 'Farinha, açucar, cenoura',
                                  cook_method: 'Cozinhe a cenoura, corte em pedaços pequenos, misture com o restante dos ingredientes')


      #simula ação do usuário
      visit root_path
      click_on 'Entrar'
      fill_in "E-mail", with: "email@email.com"
      fill_in "Senha", with: "123456"
      click_on "Enviar"

      click_on 'Bolo de banana'

      expect(page).not_to have_link('Editar')

    end

    scenario 'and another user can not acces edit route of another user recipe' do

      user = User.create!(email:'email@email.com', password: '123456')
      another_user = User.create!(email:'abc@email.com', password: '123456')
      recipe_type = RecipeType.create(name: 'Sobremesa')
      cuisine = Cuisine.create(name: 'Brasileira')
      recipe = Recipe.create!(title: 'Bolo de banana', recipe_type: recipe_type,
                                  cuisine: cuisine, difficulty: 'Médio',
                                  cook_time: 60, user: another_user,
                                  ingredients: 'Farinha, açucar, cenoura',
                                  cook_method: 'Cozinhe a cenoura, corte em pedaços pequenos, misture com o restante dos ingredientes')

      visit root_path
      click_on 'Entrar'
      fill_in "E-mail", with: "email@email.com"
      fill_in "Senha", with: "123456"
      click_on "Enviar"

      visit edit_recipe_path(recipe)

      expect(current_path).to eq(root_path)
    end

    scenario 'and a not loged in user can not acces edit route' do

      another_user = User.create!(email:'abc@email.com', password: '123456')
      recipe_type = RecipeType.create(name: 'Sobremesa')
      cuisine = Cuisine.create(name: 'Brasileira')
      recipe = Recipe.create!(title: 'Bolo de banana', recipe_type: recipe_type,
                                  cuisine: cuisine, difficulty: 'Médio',
                                  cook_time: 60, user: another_user,
                                  ingredients: 'Farinha, açucar, cenoura',
                                  cook_method: 'Cozinhe a cenoura, corte em pedaços pequenos, misture com o restante dos ingredientes')

      visit edit_recipe_path(recipe)

      expect(current_path).to eq(new_user_session_path)
    end
  end
