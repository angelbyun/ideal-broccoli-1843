class PlotsController < ApplicationController
  def index
    @plots = Plot.all
    @plants = Plant.all
  end

  def destroy
    @plot = Plot.find(params[:plot_id])
    plant = Plant.find(params[:plant_id])
    @plot.plants.delete(plant)
    redirect_to "/plots"
  end
end