class QueryInterfacesController < ApplicationController
  def index
    ordered_first_lecturer = Lecturer.order(:last_name).last

    ordered_first_lecture = Lecture.order(:name).first

    first_lecturer = Lecturer.
                             joins('INNER JOIN lectures on lectures.owner_object_id = lecturers.id').
                             order('lectures.name DESC').first

    teacher_calculus_lectures = Teacher.
                                        joins('INNER JOIN lectures on lectures.owner_object_id = teachers.id').
                                        where('lectures.name = \'Calculus\'').
                                        select('lectures.name, lectures.passing_grade')

    take_first_school = School.all.take(1)

    find_school = School.find_by(name: 'School #1')

    students = []

    Student.find_each(batch_size: 5) do |student|
      students << student
    end

    lecturers_distinct_names = Lecturer.select(:name).distinct

    math_lecturers = Lecturer.
        joins('INNER JOIN lectures on lectures.owner_object_id = lecturers.id').
        where('lectures.name = \'Math\'').
        order('lectures.created_at DESC').
        select('lecturers.name, lecturers.last_name')

    teachers = Teacher.select('name, last_name')

  @data = {
      ordered_first_lecturer: ordered_first_lecturer,
      ordered_first_lecture: ordered_first_lecture,
      first_lecturer: first_lecturer,
      teacher_calculus_lectures: teacher_calculus_lectures,
      take_first_school: take_first_school,
      find_school: find_school,
      students: students,
      lecturers_distinct_names: lecturers_distinct_names,
      math_lecturers: math_lecturers,
      teachers: teachers
  }

end


end