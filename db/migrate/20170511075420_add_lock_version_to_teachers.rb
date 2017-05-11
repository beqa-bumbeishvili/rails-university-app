class AddLockVersionToTeachers < ActiveRecord::Migration[5.0]
  def change
    add_column :teachers, :lock_version, :integer, default: 0, null: false
  end
end
