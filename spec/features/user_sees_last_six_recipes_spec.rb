require 'rails_helper'
  feature 'user sees last six recipes ih the home page' do
    scenario 'successfully' do
      #cria os dados necessários
      user = User.create!(email:'email@email.com', password: '123456')
      recipe_type = RecipeType.create(name: 'Sobremesa')
      cuisine = Cuisine.create(name: 'Brasileira')
      Recipe.create(title: 'Bolo de cenoura', difficulty: 'Médio',
                    recipe_type: recipe_type, cuisine: cuisine,
                    cook_time: 50, user: user,
                    ingredients: 'Farinha, açucar, cenoura',
                    cook_method: 'Cozinhe a cenoura, corte em pedaços pequenos, misture com o restante dos ingredientes')
      Recipe.create(title: 'Bolo de banana', difficulty: 'Médio',
                    recipe_type: recipe_type, cuisine: cuisine,
                    cook_time: 50, user: user,
                    ingredients: 'Farinha, açucar, cenoura',
                    cook_method: 'Cozinhe a cenoura, corte em pedaços pequenos, misture com o restante dos ingredientes')
      Recipe.create(title: 'Bolo de coco', difficulty: 'Médio',
                    recipe_type: recipe_type, cuisine: cuisine,
                    cook_time: 50, user: user,
                    ingredients: 'Farinha, açucar, cenoura',
                    cook_method: 'Cozinhe a cenoura, corte em pedaços pequenos, misture com o restante dos ingredientes')
      Recipe.create(title: 'Bolo de morango', difficulty: 'Médio',
                    recipe_type: recipe_type, cuisine: cuisine,
                    cook_time: 50, user: user,
                    ingredients: 'Farinha, açucar, cenoura',
                    cook_method: 'Cozinhe a cenoura, corte em pedaços pequenos, misture com o restante dos ingredientes')
      Recipe.create(title: 'Pudim', difficulty: 'Médio',
                    recipe_type: recipe_type, cuisine: cuisine,
                    cook_time: 50, user: user,
                    ingredients: 'Farinha, açucar, cenoura',
                    cook_method: 'Cozinhe a cenoura, corte em pedaços pequenos, misture com o restante dos ingredientes')
      Recipe.create(title: 'Gelatina', difficulty: 'Médio',
                    recipe_type: recipe_type, cuisine: cuisine,
                    cook_time: 50, user: user,
                    ingredients: 'Farinha, açucar, cenoura',
                    cook_method: 'Cozinhe a cenoura, corte em pedaços pequenos, misture com o restante dos ingredientes')
      Recipe.create(title: 'Massa carbonara', difficulty: 'Médio',
                    recipe_type: recipe_type, cuisine: cuisine,
                    cook_time: 50, user: user,
                    ingredients: 'Farinha, açucar, cenoura',
                    cook_method: 'Cozinhe a cenoura, corte em pedaços pequenos, misture com o restante dos ingredientes')

      # simula a ação do usuário
      visit root_path

      # expectativas do usuário após a ação
      expect(page).to have_css('h1', text: 'Massa carbonara')
      expect(page).to have_css('h1', text: 'Gelatina')
      expect(page).to have_css('h1', text: 'Pudim')
      expect(page).to have_css('h1', text: 'Bolo de morango')
      expect(page).to have_css('h1', text: 'Bolo de coco')
      expect(page).to have_css('h1', text: 'Bolo de banana')
      expect(page).not_to have_css('h1', text: 'Bolo de cenoura')

    end
  end
