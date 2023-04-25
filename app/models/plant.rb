class Plant < ApplicationRecord
  has_many :plot_plants
  has_many :plots, through: :plot_plants

  def self.plant_list_by_harvest_date
    Plant.where("days_to_harvest < 100").pluck(:name).uniq.to_sentence
  end
end
