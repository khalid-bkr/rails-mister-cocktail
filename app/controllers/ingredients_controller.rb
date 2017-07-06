class IngredientsController < ApplicationController

  def index         # GET /restaurants
    @ingredients = Ingredient.all
  end

  def show          # GET /restaurants/:id
    @ingredient = Ingredient.find(params[:id])
  end

  def new           # GET /restaurants/new
    @ingredient = Ingredient.new
  end

  def create        # POST /restaurants
    @ingredient = Ingredient.new(ingredient_params)
    if @ingredient.save
      redirect_to ingredient_path(@ingredient)
    else
      render 'new'
    end
  end

  def edit          # GET /restaurants/:id/edit
  end

  def update        # PATCH /restaurants/:id
  end

  def destroy       # DELETE /restaurants/:id
    @ingredient = Ingredient.find(params[:id])
    @ingredient.delete
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:name)
  end

end
