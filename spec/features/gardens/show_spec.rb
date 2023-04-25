require 'rails_helper'

RSpec.describe 'gardens show page' do
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
  
  describe 'As a visitor when I visit the gardens show page' do
    it 'I see a list of plants that are included in that gardens plots and I see this list is unique; this list only includes plants that take less than 100 days to harvest' do
      visit "/gardens/#{garden_1.id}"

      expect(page).to have_content(plant_1.name)
      expect(page).to have_content(plant_2.name)
      expect(page).to have_content(plant_3.name)
      expect(page).to have_content(plant_4.name)
      expect(page).to_not have_content(plant_5.name)
      expect(page).to_not have_content(plant_6.name)
    end
  end
end