json.results do
json.array! @plants do |plant|
  json.extract! plant, :id, :name, :sunshine_rate, :watering, :img_url, :season, :user_level, :price_cents, :description, :price
end
end
