class GardensController < ApplicationController
  def show
    # We should be able to call on a method from the Garden model that will allow Garden to call on Plant Objects so that the plant_list_by_harvest_date will list a unique list of all plants that have a harvest date of under 100 days
    # The purpose of the list_of_plants instance method was to be able allow Gardens to be able to pull the names of plants so once we do call on the plant_list_by_harvest date method, it will list all of the plants for that list execept for plant_5 and plant_6 (which have harvest dates of over 100)
    @garden = Garden.find(params[:id])
    @plots = Plot.all
  end
end