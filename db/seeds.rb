# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

puts 'clean db'
Plant.destroy_all
# Van.destroy_all
# User.destroy_all
puts 'create seed db'



csv_plants = File.read(Rails.root.join('db', 'Seeds Good Garden - PLANTS (1).csv'))
csv = CSV.parse(csv_plants, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  t = Plant.new
  t.name = row['name']
  t.sunshine_rate = row ['sunshine_rate']
  t.watering = row ['watering']
  t.img_url = "https://source.unsplash.com/#{row ['img_url']}/1000x1000"
  t.season = row ['season']
  t.user_level = row ['user_level']
  t.price = row ['price']
  t.stock = row ['stock']
  t.save
  puts "#{t.name} saved !"
end
puts "There are now #{Plant.count} rows in the plants table"


