# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Garden.destroy_all
Plot.destroy_all
Plant.destroy_all
PlotPlant.destroy_all

@garden_1 = Garden.create!(name: "Turing Community Garden", organic: true)

@plot_1 = Plot.create!(number: 5, size: "Large", direction: "East", garden: @garden_1)
@plot_2 = Plot.create!(number: 10, size: "Medium", direction: "West", garden: @garden_1)
@plot_3 = Plot.create!(number: 15, size: "Small", direction: "North", garden: @garden_1)

@plant_1 = Plant.create!(name: "Bell Pepper", description: "Needs lots of water", days_to_harvest: 90)
@plant_2 = Plant.create!(name: "Tomatoes", description: "Keep the bugs away", days_to_harvest: 60)
@plant_3 = Plant.create!(name: "Carrots", description: "Needs a song sang to it every Tuesday", days_to_harvest: 30)
@plant_4 = Plant.create!(name: "Potatoes", description: "Introvert and likes its space", days_to_harvest: 45)
@plant_5 = Plant.create!(name: "Apple Tree", description: "Doesn't get along with others", days_to_harvest: 120)
@plant_6 = Plant.create!(name: "Peach Tree", description: "Smells nice", days_to_harvest: 200)

  
PlotPlant.create!(plot: @plot_1, plant: @plant_1)
PlotPlant.create!(plot: @plot_1, plant: @plant_2)
PlotPlant.create!(plot: @plot_2, plant: @plant_3)
PlotPlant.create!(plot: @plot_2, plant: @plant_4)
PlotPlant.create!(plot: @plot_3, plant: @plant_5)
PlotPlant.create!(plot: @plot_3, plant: @plant_6)
