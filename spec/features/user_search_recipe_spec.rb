require 'rails_helper'

feature 'user search for recipe' do
  scenario 'exact recipe name and finds recipe' do
    # cria os dados necessários
    recipe_type = RecipeType.create(name: 'Sobremesa')
    recipe = Recipe.create(title: 'Bolo de cenoura', recipe_type: recipe_type,
                           cuisine: 'Brasileira', difficulty: 'Médio',
                           cook_time: 60,
                           ingredients: 'Farinha, açucar, cenoura',
                           cook_method: 'Cozinhe a cenoura, corte em pedaços pequenos, misture com o restante dos ingredientes')
    another_recipe = Recipe.create(title: 'Bolo de chocolate', recipe_type: recipe_type,
                                   cuisine: 'Brasileira', difficulty: 'Médio',
                                   cook_time: 60,
                                   ingredients: 'Farinha, açucar, cenoura',
                                   cook_method: 'Cozinhe a cenoura, corte em pedaços pequenos, misture com o restante dos ingredientes')

    #simula ação do usuário
    visit root_path
    fill_in "Busca", with: 'Bolo de cenoura'
    click_on 'Buscar'

    #expectativa do usuário após a ação
    expect(page).to have_css('li', text: 'Bolo de cenoura')
    expect(page).not_to have_content('Bolo de chocolate')
  end

  scenario 'exact recipe name and do not find recipe' do
    # cria os dados necessários
    recipe_type = RecipeType.create(name: 'Sobremesa')
    recipe = Recipe.create(title: 'Bolo de cenoura', recipe_type: recipe_type,
                           cuisine: 'Brasileira', difficulty: 'Médio',
                           cook_time: 60,
                           ingredients: 'Farinha, açucar, cenoura',
                           cook_method: 'Cozinhe a cenoura, corte em pedaços pequenos, misture com o restante dos ingredientes')
    other_recipe = Recipe.create(title: 'Bolo de chocolate', recipe_type: recipe_type,
                                 cuisine: 'Brasileira', difficulty: 'Médio',
                                 cook_time: 60,
                                 ingredients: 'Farinha, açucar, cenoura',
                                 cook_method: 'Cozinhe a cenoura, corte em pedaços pequenos, misture com o restante dos ingredientes')

    #simula ação do usuário
    visit root_path
    fill_in "Busca", with: 'Pudim de chocolate'
    click_on 'Buscar'

    #expectativa do usuário após a ação
    expect(page).not_to have_css('li', text: 'Bolo de cenoura')
    expect(page).not_to have_css('li', text: 'Bolo de chocolate')
    expect(page).to have_content('Nenhuma receita encontrada')
  end

  scenario 'partial recipe name and finds multiple recipe' do
    # cria os dados necessários
    recipe_type = RecipeType.create(name: 'Sobremesa')
    recipe = Recipe.create(title: 'Bolo de cenoura', recipe_type: recipe_type,
                           cuisine: 'Brasileira', difficulty: 'Médio',
                           cook_time: 60,
                           ingredients: 'Farinha, açucar, cenoura',
                           cook_method: 'Cozinhe a cenoura, corte em pedaços pequenos, misture com o restante dos ingredientes')
    other_recipe = Recipe.create(title: 'Bolo de chocolate', recipe_type: recipe_type,
                                 cuisine: 'Brasileira', difficulty: 'Médio',
                                 cook_time: 60,
                                 ingredients: 'Farinha, açucar, cenoura',
                                 cook_method: 'Cozinhe a cenoura, corte em pedaços pequenos, misture com o restante dos ingredientes')
    another_recipe = Recipe.create(title: 'Pudim de chocolate', recipe_type: recipe_type,
                                   cuisine: 'Brasileira', difficulty: 'Médio',
                                   cook_time: 60,
                                   ingredients: 'Farinha, açucar, cenoura',
                                   cook_method: 'Cozinhe a cenoura, corte em pedaços pequenos, misture com o restante dos ingredientes')

    #simula ação do usuário
    visit root_path
    fill_in "Busca", with: 'Bolo'
    click_on 'Buscar'

    #expectativa do usuário após a ação
    expect(page).to have_css('li', text: 'Bolo de cenoura')
    expect(page).to have_css('li', text: 'Bolo de chocolate')
    expect(page).not_to have_content('Nenhuma receita encontrada')
    expect(page).not_to have_content('Pudim de chocolate')
  end
end