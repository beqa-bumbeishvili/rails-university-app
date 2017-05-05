class InsertTeacherDataToLectures < ActiveRecord::Migration[5.0]
  def change
      Lecture.update_all("teacher_id = #{2}")
  end
end
