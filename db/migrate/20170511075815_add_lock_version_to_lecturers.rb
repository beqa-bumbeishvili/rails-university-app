class AddLockVersionToLecturers < ActiveRecord::Migration[5.0]
  def change
    add_column :lecturers, :lock_version, :integer, default: 0, null: false
  end
end
