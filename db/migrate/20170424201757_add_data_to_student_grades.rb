class AddDataToStudentGrades < ActiveRecord::Migration[5.0]
  def up
    (1..11).each do |i|
      (1..6).each do |j|
        StudentGrade.create(student_id: i, lecture_id: j, student_grade: Random.new.rand(50..100))
      end
    end
  end

  def down
    StudentGrade.delete_all
  end
end
