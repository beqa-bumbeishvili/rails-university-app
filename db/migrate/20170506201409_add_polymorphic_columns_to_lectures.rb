class AddPolymorphicColumnsToLectures < ActiveRecord::Migration[5.0]
  def change
    add_column :lectures, :owner_object_id, :integer
    add_column :lectures, :owner_object_type, :string
    add_index :lectures, [:owner_object_id, :owner_object_type]
  end
end
