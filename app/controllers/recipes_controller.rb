class RecipesController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create, :edit, :update]

  def index
    if params[:recipe_type_id]
      @recipes = Recipe.find(params[:recipe_type_id]).includes(:recipe_types).recipes
    else
      @recipes = Recipe.all
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
    @recipe_types = RecipeType.all
    @cuisines = Cuisine.all
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user

      if @recipe.save
        redirect_to @recipe
      else
        flash[:alert] = 'Não foi possível salvar a receita'
        @recipe_types = RecipeType.all
        @cuisines = Cuisine.all
        render :new
      end
  end

  def edit
    @recipe = Recipe.find(params[:id])
    @recipe_types = RecipeType.all
    @cuisines = Cuisine.all
    redirect_to root_path unless current_user == @recipe.user
  end

  def update
    @recipe = Recipe.find(params[:id])

    if @recipe.update(recipe_params)
      redirect_to @recipe
    else
      flash[:alert] = 'Não foi possível salvar a receita'
      @recipe_types = RecipeType.all
      @cuisines = Cuisine.all
      render :edit
    end
  end

  def search
    @recipes = Recipe.where("title LIKE ?", "%#{params[:q]}%")
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :recipe_type_id, :cuisine_id, :difficulty,
                                   :cook_time, :ingredients, :cook_method, :recipe_image)
  end

end
