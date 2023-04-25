require 'rails_helper'

RSpec.describe 'plots index page' do
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

  describe 'As a visitor when I visit the plots index page' do
    it 'shows a list of all plot numbers' do
      visit "/plots"

      expect(page).to have_content(plot_1.number)
      expect(page).to have_content(plot_2.number)
      expect(page).to have_content(plot_3.number)
    end

    it 'lists all the names of the plants for each plot' do
      visit "/plots"

      expect(page).to have_content(plant_1.name)
      expect(page).to have_content(plant_2.name)
      expect(page).to have_content(plant_3.name)
      expect(page).to have_content(plant_4.name)
      expect(page).to have_content(plant_5.name)
      expect(page).to have_content(plant_6.name)
    end

    it 'creates a button to remove plant from a plot' do
      visit "/plots"

      within "#plant-#{plant_1.id}" do
        click_button("Remove Plant")
      end

      expect(current_path).to eq("/plots")
      expect(page).to_not have_content(plant_1.id)
      
      within "#plant-#{plant_2.id}" do
        click_button("Remove Plant")
      end

      expect(current_path).to eq("/plots")
      expect(page).to_not have_content(plant_2.id)

      within "#plant-#{plant_3.id}" do
        click_button("Remove Plant")
      end

      expect(current_path).to eq("/plots")
      expect(page).to_not have_content(plant_3.id)

      within "#plant-#{plant_4.id}" do
        click_button("Remove Plant")
      end

      expect(current_path).to eq("/plots")
      expect(page).to_not have_content(plant_4.id)

      within "#plant-#{plant_5.id}" do
        click_button("Remove Plant")
      end

      expect(current_path).to eq("/plots")
      expect(page).to_not have_content(plant_5.id)

      within "#plant-#{plant_6.id}" do
        click_button("Remove Plant")
      end

      expect(current_path).to eq("/plots")
      expect(page).to_not have_content(plant_6.id)
    end
  end
end