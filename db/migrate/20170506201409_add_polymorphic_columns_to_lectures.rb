class AddPolymorphicColumnsToLectures < ActiveRecord::Migration[5.0]
  def change
    add_column :lectures, :mentor_id, :integer
    add_column :lectures, :mentor_type, :string
    add_index :lectures, [:mentor_id, :mentor_type]
  end
end
