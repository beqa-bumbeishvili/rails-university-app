class CreateTeachers < ActiveRecord::Migration[5.0]
  def change
    create_table :teachers do |t|
      t.string :name
      t.string :last_name
      t.references :school, foreign_key: true
    end
    add_reference :lectures, :teacher, index: true, foreign_key: true

    10.times do |i|
      Teacher.create(name: "Teacher ##{i}", last_name: "Last_Name#{i}", school_id: "#{i}")
    end
  end
end
