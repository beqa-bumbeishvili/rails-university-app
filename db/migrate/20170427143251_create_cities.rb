class CreateCities < ActiveRecord::Migration[5.0]
  def change
    create_table :cities do |t|
      t.string :name
      t.integer :code
      t.references :country, foreign_key: true
    end
  end
end
