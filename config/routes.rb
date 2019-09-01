Rails.application.routes.draw do
  root to: 'home#index'

  resources :recipes, only: [:show, :new, :create, :edit, :update, :index]
  resources :recipe_types, only: [:new, :create, :show]
end
