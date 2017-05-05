class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]

  # GET /students
  # GET /students.json
  def index
    @students = Student.includes(:school).all
  end

  # GET /students/1
  # GET /students/1.json
  def show
  end

  # GET /students/new
  def new
    @student = Student.new
    @student.created_from = 'From student'
  end

  # GET /students/1/edit
  def edit
  end

  # POST /students
  # POST /students.json
  def create
    @student = Student.new(student_params)

    respond_to do |format|
      if @student.save
        format.html { redirect_to @student, notice: 'Student was successfully created.' }
        format.json { render :show, status: :created, location: @student }
      else
        format.html { render :new }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /students/1
  # PATCH/PUT /students/1.json
  def update
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to @student, notice: 'Student was successfully updated.' }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    @student.destroy
    respond_to do |format|
      format.html { redirect_to students_url, notice: 'Student was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def good_students
    @students = Student.
        joins('LEFT JOIN student_grades ON student_grades.student_id = students.id').
        joins('LEFT JOIN lectures ON lectures.id = student_grades.lecture_id').
        joins('LEFT JOIN schools ON schools.id = students.school_id').
        where('students.id NOT IN(SELECT student_id FROM student_grades WHERE student_grade < 60)'). #AND schools.id IN (1,2,6)
        distinct.
        select('students.id,students.name, lectures.name AS lecture_name, students.last_name,student_grades.student_grade as student_grade').to_a
  end

  def passed_students
    @students = Student.
        joins('LEFT JOIN student_grades ON student_grades.student_id = students.id').
        joins('LEFT JOIN lectures ON lectures.id = student_grades.lecture_id').
        joins('LEFT JOIN schools ON schools.id = students.school_id').
        where('student_grades.student_grade > lectures.passing_grade'). #AND schools.id IN (1,2,6)
        distinct.
        select('students.id,students.name, lectures.name AS lecture_name, students.last_name,student_grades.student_grade as student_grade').to_a
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_params
      params.require(:student).permit(:name, :last_name, :school_id, :created_from)
    end
end
