class CreateLectures < ActiveRecord::Migration[5.0]
  def change
    create_table :lectures do |t|
      t.string :name
      t.integer :passing_grade

      t.timestamps
    end
  end
end
