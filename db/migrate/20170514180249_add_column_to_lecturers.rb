class AddColumnToLecturers < ActiveRecord::Migration[5.0]
  def change
    add_reference :lecturers, :country
  end
end
