class SchoolsController < ApplicationController
before_action :set_school, only: [:show, :edit, :update, :destroy] 
  # GET /schools
def index
  @school = School.all
end
  # GET /schools/1
def show
end
  # GET /schools/new
def new
  @school = School.new
end
  # GET /schools/edit
def edit
end
  # POST /schools
def create
  @school = School.new(school_params)
  
  if @school.save
    redirect_to @school, notice: 'We have put up a new school!'
  else
    render :new
  end
end
def update
  if @school.update(school_params)
    redirect_to @school, notice: "School has been updated!"
  else
    render :edit
  end
end
  # DELETE /schools
def destroy
  @school.destroy
  redirect_to @school, notice: "School was washed away in the flood."
end
  private
  def set_school
    @school = School.find(params[:id])
  end

    # Use callbacks to share common setup or constraints between actions.
  def school_params
    params.require(:school).permit(:name, :address, :principal, :capacity, :private_school)
  end
    # Only allow a trusted parameter "white list" through.

end
