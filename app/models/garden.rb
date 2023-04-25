class Garden < ApplicationRecord
  has_many :plots
  has_many :plants, through: :plots
  has_many :gardens, through: :plots

  # We want to create an instance method where Gardens are able to query the database for all plants associated with the plots within a garden
  # Once we join Garden and Plant, we should create relationships between Garden and Plant so that Garden may call on Plant through the controller
  # We will pluck only the names from plants since that is all we will need for user story 3

  def list_of_plants
    @gardens.joins(:plants).pluck(plant: :name)
  end
end
