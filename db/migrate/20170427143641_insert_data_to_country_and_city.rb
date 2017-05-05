class InsertDataToCountryAndCity < ActiveRecord::Migration[5.0]
  def change
    10.times { |i| Country.create(name: "country #{i}", code: i) }
    10.times { |i| City.create(name: "city #{i}", code: i, country_id: rand(1...9) )}
  end
end
