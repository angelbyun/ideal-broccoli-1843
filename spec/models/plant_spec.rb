require 'rails_helper'

RSpec.describe Plant, type: :model do
  let!(:garden_1) { Garden.create!(name: "Turing Community Garden", organic: true) }

  let!(:plot_1) { Plot.create!(number: 5, size: "Large", direction: "East", garden: garden_1) }
  let!(:plot_2) { Plot.create!(number: 10, size: "Medium", direction: "West", garden: garden_1) }
  let!(:plot_3) { Plot.create!(number: 15, size: "Small", direction: "North", garden: garden_1) }

  let!(:plant_1) { Plant.create!(name: "Bell Pepper", description: "Needs lots of water", days_to_harvest: 90) }
  let!(:plant_2) { Plant.create!(name: "Tomatoes", description: "Keep the bugs away", days_to_harvest: 60) }
  let!(:plant_3) { Plant.create!(name: "Carrots", description: "Needs a song sang to it every Tuesday", days_to_harvest: 30) }
  let!(:plant_4) { Plant.create!(name: "Potatoes", description: "Introvert and likes its space", days_to_harvest: 45) }
  let!(:plant_5) { Plant.create!(name: "Apple Tree", description: "Doesn't get along with others", days_to_harvest: 120) }
  let!(:plant_6) { Plant.create!(name: "Peach Tree", description: "Smells nice", days_to_harvest: 200) }

  before do
    PlotPlant.create!(plot: plot_1, plant: plant_1)
    PlotPlant.create!(plot: plot_1, plant: plant_2)
    PlotPlant.create!(plot: plot_2, plant: plant_3)
    PlotPlant.create!(plot: plot_2, plant: plant_4)
    PlotPlant.create!(plot: plot_3, plant: plant_5)
    PlotPlant.create!(plot: plot_3, plant: plant_6)
  end

  describe 'relationships' do
    it { should have_many(:plot_plants) }
    it { should have_many(:plots).through(:plot_plants) }
    it { should have_many(:gardens).through(:plots) }
  end

  describe 'class methods' do
    it 'should list all of the plants in its garden plots that take less than 100 days to harvest' do
      expect(Plant.plant_list_by_harvest_date).to eq("Bell Pepper, Tomatoes, Carrots, and Potatoes")
    end
  end
end
