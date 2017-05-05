class AddDataToSchools < ActiveRecord::Migration[5.0]
  def up
    10.times do |i|
      School.create(name: "School ##{i}", city: "City ##{i}")
    end
  end

  def down
    School.delete_all
  end
end
