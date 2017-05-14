class HashConditionsController < ApplicationController

  def index
    lecture_names = Lecture.
        joins('INNER JOIN student_grades ON lecture_id = lectures.id').
        where('student_grade > 60').
        select(:name)

    easy_lectures = Lecture.
                    joins('INNER JOIN student_grades ON lecture_id = lectures.id').
                    joins('INNER JOIN students on students.id = student_grades.student_id').
                    where('students.id NOT IN(SELECT student_id FROM student_grades WHERE student_grades.student_grade < 60)').
                    select(:name).
                    distinct

    tbilisi_lecturers = Lecturer.
                        joins('INNER JOIN schools ON schools.id = lecturers.school_id').
                        where('schools.city = \'Tbilisi\'').
                        select('lecturers.name, lecturers.last_name')


    georgia_lecturers = Lecturer.
        joins('INNER JOIN countries ON countries.id = lecturers.country_id').
        where('countries.name = \'Georgia\'').
        select('lecturers.name, lecturers.last_name')



    good_students = Lecture.
        joins('INNER JOIN student_grades ON lecture_id = lectures.id').
        joins('INNER JOIN students on students.id = student_grades.student_id').
        where('students.id NOT IN(SELECT student_id FROM student_grades WHERE student_grades.student_grade < 60)').
        select('students.name, students.last_name').
        distinct

    schools = School.
              joins('LEFT JOIN countries on countries.id = schools.id').
              where('city = \'Tbilisi\' OR countries.name = \'Germany\'').
              order('countries.name asc, city asc')


    max_grade = Student.
                joins('LEFT JOIN schools ON schools.id = students.school_id').
                joins('LEFT JOIN countries ON countries.id = schools.country_id').
                select('students.name, students.last_name, schools.name, countries.name')


    students = Student.
               joins('INNER JOIN student_grades ON lecture_id = lectures.id').
               joins('LEFT JOIN schools ON schools.id = students.school_id').
               select('students.name, students.last_name, schools.name, avg(student_grade)')
  end
end
