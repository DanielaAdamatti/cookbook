require 'rails_helper'
  feature 'user view recipes by type' do
    scenario 'successfully' do
      #cria os dados necessários
      user = User.create!(email:'email@email.com', password: '123456')
      recipe_type = RecipeType.create(name: 'Sobremesa')
      other_recipe_type = RecipeType.create(name: 'Prato principal')
      another_recipe_type = RecipeType.create(name: 'Entrada')
      cuisine = Cuisine.create(name: 'Brasileira')

      Recipe.create(title: 'Bolo de cenoura', difficulty: 'Médio',
                    recipe_type: recipe_type, cuisine: cuisine,
                    cook_time: 50, user: user,
                    ingredients: 'Farinha, açucar, cenoura',
                    cook_method: 'Cozinhe a cenoura, corte em pedaços pequenos, misture com o restante dos ingredientes')
      Recipe.create(title: 'Bolo de banana', difficulty: 'Médio',
                    recipe_type: other_recipe_type, cuisine: cuisine,
                    cook_time: 50, user: user,
                    ingredients: 'Farinha, açucar, cenoura',
                    cook_method: 'Cozinhe a cenoura, corte em pedaços pequenos, misture com o restante dos ingredientes')
      Recipe.create(title: 'Bolo de coco', difficulty: 'Médio',
                    recipe_type: another_recipe_type, cuisine: cuisine,
                    cook_time: 50, user: user,
                    ingredients: 'Farinha, açucar, cenoura',
                    cook_method: 'Cozinhe a cenoura, corte em pedaços pequenos, misture com o restante dos ingredientes')
      Recipe.create(title: 'Bolo de morango', difficulty: 'Médio',
                    recipe_type: recipe_type, cuisine: cuisine,
                    cook_time: 50, user: user,
                    ingredients: 'Farinha, açucar, cenoura',
                    cook_method: 'Cozinhe a cenoura, corte em pedaços pequenos, misture com o restante dos ingredientes')
      Recipe.create(title: 'Pudim', difficulty: 'Médio',
                    recipe_type: other_recipe_type, cuisine: cuisine,
                    cook_time: 50, user: user,
                    ingredients: 'Farinha, açucar, cenoura',
                    cook_method: 'Cozinhe a cenoura, corte em pedaços pequenos, misture com o restante dos ingredientes')
      Recipe.create(title: 'Gelatina', difficulty: 'Médio',
                    recipe_type: another_recipe_type, cuisine: cuisine,
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
      click_on "Receitas"

      # expectativas do usuário após a ação
      expect(page).to have_css('h1', text: 'Escolha sua receita')
      expect(page).to have_css('h4', text: 'Navegue por tipo de receita')
      expect(page).to have_css('li', text: 'Sobremesa')
      expect(page).to have_css('li', text: 'Prato principal')
      expect(page).to have_css('li', text: 'Entrada')
    end

    scenario 'and sees recipes from a certain type' do
      #cria os dados necessários
      user = User.create!(email:'email@email.com', password: '123456')
      recipe_type = RecipeType.create(name: 'Sobremesa')
      other_recipe_type = RecipeType.create(name: 'Prato principal')
      another_recipe_type = RecipeType.create(name: 'Entrada')
      cuisine = Cuisine.create(name: 'Brasileira')

      Recipe.create(title: 'Bolo de cenoura', difficulty: 'Médio',
                    recipe_type: recipe_type, cuisine: cuisine,
                    cook_time: 50, user: user,
                    ingredients: 'Farinha, açucar, cenoura',
                    cook_method: 'Cozinhe a cenoura, corte em pedaços pequenos, misture com o restante dos ingredientes')
      Recipe.create(title: 'Bolo de banana', difficulty: 'Médio',
                    recipe_type: other_recipe_type, cuisine: cuisine,
                    cook_time: 50, user: user,
                    ingredients: 'Farinha, açucar, cenoura',
                    cook_method: 'Cozinhe a cenoura, corte em pedaços pequenos, misture com o restante dos ingredientes')
      Recipe.create(title: 'Bolo de coco', difficulty: 'Médio',
                    recipe_type: another_recipe_type, cuisine: cuisine,
                    cook_time: 50, user: user,
                    ingredients: 'Farinha, açucar, cenoura',
                    cook_method: 'Cozinhe a cenoura, corte em pedaços pequenos, misture com o restante dos ingredientes')
      Recipe.create(title: 'Bolo de morango', difficulty: 'Médio',
                    recipe_type: recipe_type, cuisine: cuisine,
                    cook_time: 50, user: user,
                    ingredients: 'Farinha, açucar, cenoura',
                    cook_method: 'Cozinhe a cenoura, corte em pedaços pequenos, misture com o restante dos ingredientes')
      Recipe.create(title: 'Pudim', difficulty: 'Médio',
                    recipe_type: other_recipe_type, cuisine: cuisine,
                    cook_time: 50, user: user,
                    ingredients: 'Farinha, açucar, cenoura',
                    cook_method: 'Cozinhe a cenoura, corte em pedaços pequenos, misture com o restante dos ingredientes')
      Recipe.create(title: 'Gelatina', difficulty: 'Médio',
                    recipe_type: another_recipe_type, cuisine: cuisine,
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
      click_on "Receitas"
      click_on "Sobremesa"

      # expectativas do usuário após a ação
      expect(page).to have_css('li', text: 'Bolo de cenoura')
      expect(page).to have_css('li', text: 'Bolo de morango')
      expect(page).to have_css('li', text: 'Massa carbonara')
      expect(page).not_to have_css('li', text: 'Bolo de coco')
      expect(page).not_to have_css('li', text: 'Bolo de banana')
      expect(page).not_to have_css('li', text: 'Pudim')
      expect(page).not_to have_css('li', text: 'Gelatina')
    end
  end
