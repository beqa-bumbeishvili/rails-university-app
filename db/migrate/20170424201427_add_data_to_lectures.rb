class AddDataToLectures < ActiveRecord::Migration[5.0]
  def up
    Lecture.create(name: 'Calculus', passing_grade: 80)
    Lecture.create(name: 'Algebra', passing_grade: 70)
    Lecture.create(name: 'History', passing_grade: 60)
    Lecture.create(name: 'Geography', passing_grade: 75)
    Lecture.create(name: 'Chemistry', passing_grade: 60)
    Lecture.create(name: 'Biology', passing_grade: 85)
  end

  def down
    Lecture.delete_all
  end
end
