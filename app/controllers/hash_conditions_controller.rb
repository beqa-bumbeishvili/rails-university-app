class HashConditionsController < ApplicationController

  def index
    lecture_names = Lecture.
        joins('INNER JOIN student_grades ON lecture_id = lectures.id').
        where('student_grade > 60').
        select(:name)



    'debugger'
  end

end
