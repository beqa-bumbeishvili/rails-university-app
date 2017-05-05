class CreateLecturers < ActiveRecord::Migration[5.0]
  def change
    create_table :lecturers do |t|
      t.string :name
      t.string :last_name
      t.references :school, foreign_key: true

    end
  end
end
