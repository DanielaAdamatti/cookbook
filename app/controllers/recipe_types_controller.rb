class RecipeTypesController < ApplicationController

def new
  @recipe_type = RecipeType.new
end

def create
  @recipe_type = RecipeType.create(params.require(:recipe_type).permit(:name))
end

end
