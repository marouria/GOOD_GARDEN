# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

puts 'clean db'
KitPlant.destroy_all
KitMaterial.destroy_all
Order.destroy_all
Material.destroy_all
Kit.destroy_all
Plant.destroy_all
User.destroy_all
# Van.destroy_all
# User.destroy_all
puts 'create seed db'



csv_plants = File.read(Rails.root.join('db', 'Seeds Good Garden - PLANTS.csv'))
csv = CSV.parse(csv_plants, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  t = Plant.new
  t.name = row['name']
  t.sunshine_rate = row ['sunshine_rate']
  t.watering = row ['watering']
  t.season = row ['season']
  t.user_level = row ['user_level']
  t.price_cents = row ['price_cents']
  t.stock = row ['stock']
  t.description = row ['description']
  if
    row['img_url'].include?('http')
    t.img_url = row['img_url']
  else
    t.img_url = "https://source.unsplash.com/#{row ['img_url']}/1000x1000"
  end
  t.save
  puts "#{t.name} saved !"
end
puts "There are now #{Plant.count} rows in the plants table"


csv_users = File.read(Rails.root.join('db', 'Seeds Good Garden - USERS.csv'))
csvp = CSV.parse(csv_users, :headers => true, :encoding => 'ISO-8859-1')
csvp.each do |row|
  t = User.new
  t.first_name = row['first_name']
  t.last_name = row['last_name']
  t.address = row['address']
  t.email = row['email']
  t.password = row['password']
  t.save!
  puts "#{t.first_name} saved !"
end
puts "There are now #{User.count} rows in the users table"

csv_kits = File.read(Rails.root.join('db', 'Seeds Good Garden - KITS.csv'))
csvk = CSV.parse(csv_kits, :headers => true, :encoding => 'ISO-8859-1')
csvk.each do |row|
  t = Kit.new
  t.name = row['name']
  t.user_id = User.ids.first
  t.slot = row['slot']
  t.img_url = row['img_url']
  t.price_cents = row['price_cents']
  t.tools = row['tools']
  t.save!
  puts "User has is #{t.slot} kit saved !"
end
puts "There are now #{Kit.count} rows in the users table"

puts "creating kits plants"

KitPlant.create!(plant_id: "#{Plant.first.id}", kit_id:"#{Kit.last.id}")
KitPlant.create!(plant_id: "#{Plant.last.id}", kit_id:"#{Kit.last.id}")
KitPlant.create!(plant_id: "#{Plant.first.id}", kit_id:"#{Kit.last.id}")
KitPlant.create!(plant_id: "#{Plant.last.id}", kit_id:"#{Kit.last.id}")
KitPlant.create!(plant_id: "#{Plant.first.id}", kit_id:"#{Kit.last.id}")
KitPlant.create!(plant_id: "#{Plant.last.id}", kit_id:"#{Kit.last.id}")
KitPlant.create!(plant_id: "#{Plant.first.id}", kit_id:"#{Kit.first.id}")
KitPlant.create!(plant_id: "#{Plant.last.id}", kit_id:"#{Kit.first.id}")

puts "#{KitPlant.count} kits created ! "

puts "creating orders"

Order.create!(user_id: "#{User.first.id}", kit_id:"#{Kit.first.id}", status:"confirmed")
Order.create!(user_id: "#{User.first.id}", kit_id:"#{Kit.last.id}", status:"confirmed")
Order.create!(user_id: "#{User.last.id}", kit_id:"#{Kit.last.id}", status:"confirmed")
Order.create!(user_id: "#{User.last.id}", kit_id:"#{Kit.first.id}", status:"confirmed")

puts "#{Order.count} orders created !"

Material.create!(name: "Terreau 5kg", description: "Rempotez comme jamais avec ce sac de 5kg de terreau fraîchement déporté des flandres intérieures.", price: 15)
Material.create!(name: "Lot de 3 outils", description: "Magnifique ensemble de jardinage comprenant une petite pelle, une truelle et un rateau. Tuteurs et fils de dressage fournis. Le tour transportable dans une boîte en bois vintage.", price: 20)
Material.create!(name: "Gants de jardinage tendances", description: "Pour couper, déserber et piquer en toute sécurité!", price: 5)

puts "#{Material.count} material created !"
