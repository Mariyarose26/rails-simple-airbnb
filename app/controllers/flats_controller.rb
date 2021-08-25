class FlatsController < ApplicationController
  before_action :find_flat, only: [:show, :edit, :update, :destroy]
  def index
    @flats = Flat.all
  end
  def new
    @flat = Flat.new
  end
  def show
  end
  def create
    @flat = Flat.new(flat_params)
    @flat.save
    redirect_to flat_path(@flat)
  end
  def edit
  end

  def update
    @flat.update(flat_params)
    redirect_to flat_path(@flat)
  end

  def destroy
    @flat.destroy
    redirect_to root_path(@flat)
  end

  private

  def flat_params
    #params.require(dynamic_id_for_the_model).permit(fields_required)
    params.require(:flat).permit(:name, :address, :description, :price_per_night, :number_of_guests)
  end
  def find_flat
    @flat= Flat.find(params[:id])
  end
end