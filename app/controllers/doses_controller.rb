class DosesController < ApplicationController

  def index         # GET /restaurants
    @doses = Dose.all
  end

  def show          # GET /restaurants/:id
    @dose = Dose.find(params[:id])
  end

  def new           # GET /restaurants/new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create        # POST /restaurants
    @dose = Dose.new(dose_params)
    @dose.cocktail = Cocktail.find(params[:cocktail_id])
    if @dose.save
      redirect_to cocktail_path(@dose.cocktail)
    else
      render 'new'
    end
  end

  def edit          # GET /restaurants/:id/edit
  end

  def update        # PATCH /restaurants/:id
  end

  def destroy       # DELETE /restaurants/:id
    @dose = Dose.find(params[:id])
    @dose.destroy
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
