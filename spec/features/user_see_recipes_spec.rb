require 'rails_helper'

feature 'User acces his recipes' do
  scenario 'and view recipes succesffully' do
    user = User.create(email: 'email@email.com', password: '123456')
    another_user = User.create(email: 'anotheremail@email.com', password: '123456')
    recipe_type = RecipeType.create(name: 'Sobremesa')
    cuisine = Cuisine.create(name: 'Brasileira')

    recipe = Recipe.create(title: 'Bolo de cenoura', difficulty: 'Médio',
                  recipe_type: recipe_type, user: user, cuisine: cuisine,
                  cook_time: 50, ingredients: 'Farinha, açucar, cenoura',
                  cook_method: 'Cozinhe a cenoura, corte em pedaços pequenos, misture com o restante dos ingredientes')

    Recipe.create(title: 'Bolo de chocolate', difficulty: 'Médio',
                  recipe_type: recipe_type, user: user, cuisine: cuisine,
                  cook_time: 50, ingredients: 'Farinha, açucar, cenoura',
                  cook_method: 'Cozinhe a cenoura, corte em pedaços pequenos, misture com o restante dos ingredientes')

    Recipe.create(title: 'Pudim', difficulty: 'Médio',
                  recipe_type: recipe_type, user: another_user, cuisine: cuisine,
                  cook_time: 50, ingredients: 'Farinha, açucar, cenoura',
                  cook_method: 'Cozinhe a cenoura, corte em pedaços pequenos, misture com o restante dos ingredientes')

    visit root_path
    click_on 'Entrar'
    fill_in "E-mail", with: "email@email.com"
    fill_in "Senha", with: "123456"
    click_on "Enviar"

    click_on "Minhas receitas"

    expect(page).to have_link('Bolo de cenoura')
    expect(page).to have_link('Bolo de chocolate')
    expect(page).not_to have_link('li', text:'Pudim')

  end

  scenario 'and do not have any recipe' do
    user = User.create(email: 'email@email.com', password: '123456')

    visit root_path
    click_on 'Entrar'
    fill_in "E-mail", with: "email@email.com"
    fill_in "Senha", with: "123456"
    click_on "Enviar"

    click_on "Minhas receitas"

    expect(page).to have_content('Você não tem receitas cadastradas')

  end

end
