class RecipesController < ApplicationController
  before_action :set_param,only:[:show,:edit,:update]

  def index
    @recipes = Recipe.all
  end

  def show
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.chef = Chef.first
    if @recipe.save
      flash[:success] = "Recipe was created succesfully"
      redirect_to recipe_path(@recipe)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @recipe.update(recipe_params)
      flash[:success]="Your recipe was edited succesfully"
      redirect_to recipe_path(@recipe)
    else
      render 'edit'
    end
  end

private
  def recipe_params
      params.require(:recipe).permit(:name,:description)
  end

  def set_param
    @recipe = Recipe.find(params[:id])
  end



end
