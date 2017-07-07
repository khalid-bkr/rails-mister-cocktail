class CocktailsController < ApplicationController

  def index         # GET /restaurants
    @cocktails = Cocktail.all
  end

  def show          # GET /restaurants/:id
    @cocktail = Cocktail.find(params[:id])
  end

  def new           # GET /restaurants/new
    @cocktail = Cocktail.new
  end

  def create        # POST /restaurants
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render 'new'
    end
  end

  def edit          # GET /restaurants/:id/edit
  end

  def update        # PATCH /restaurants/:id
  end

  def destroy       # DELETE /restaurants/:id
    @cocktail = Cocktail.find(params[:id])
    @cocktail.destroy
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name, :photo, :photo_cache)
  end

  # def product_params
  #   params.require(:product).permit(:name, :photo, :photo_cache)
  # end

end
