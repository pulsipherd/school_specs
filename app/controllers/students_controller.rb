class StudentsController < ApplicationController
  # before_action :set_school
  before_action :set_student, only: [:show, :edit, :update, :destroy]

  # GET /schools/1/students
  def index
    @student = Student.all
  end

  # GET /schools/1/students/1
  def show
  end

  # GET /schools/1/students/new
  def new
    @student = Student.new
    render :new
  end

  # GET /schools/1/students/1/edit
  def edit
  end

  # POST /schools/1/students
  def create
    @student = Student.new(student_params)
    
    if @student.save
      redirect_to [@student], notice: 'School is created'
    else
      render :new
    end
  end

  # PUT/PATCH /schools/1/students/1
  def update
    if @student.update(student_params)
      redirect_to @student, notice: 'School is updated'
    else
      render :edit
    end
  end

  # DELETE /schools/1/students/1
  def destroy
    @student.destroy
    redirect_to Student.all, notice: 'Student is deleted'
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_school
      @school = School.find(params[:id])
    end

    def set_student
    
      @student = Student.school.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def student_params
      params.require(:student).permit(:name, :student_number, :gpa)
    end
end
