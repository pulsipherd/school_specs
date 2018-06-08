class SchoolsController < ApplicationController

  # GET /schools
def index
  @school = schools.all
end
  # GET /schools/1
def show
end
  # GET /schools/new
def new
  @school = school.new
end
  # GET /schools/edit
def edit
end
  # POST /schools
def create
  @school = school.ne(school_params)
  
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
  redirect_to school_path, notice: "School was washed away in the flood."
end
  private
  def set_school
    @school = school.find(params[:id])
  end

    # Use callbacks to share common setup or constraints between actions.
  def school_params
    params.require(:school).permit(:name, :address, :principal, :capacity, :private_school)
  end
    # Only allow a trusted parameter "white list" through.

end
