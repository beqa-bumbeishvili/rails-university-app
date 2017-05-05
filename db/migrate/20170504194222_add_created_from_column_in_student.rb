class AddCreatedFromColumnInStudent < ActiveRecord::Migration[5.0]
  def change
    add_column :students, :created_from, :string
  end
end
