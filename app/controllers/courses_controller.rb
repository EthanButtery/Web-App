class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user, only: [:index, :show, :edit, :update, :destroy]
  # GET /courses
  # GET /courses.json
  
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please log in!"
      redirect_to login_url
    end
  end
  
  def search
    name = '%' + params[:search] + '%'
    @courses = Course.where(['course_name LIKE ? OR instructor LIKE ? OR department LIKE ? OR credits LIKE ?', name, name, name, name])
    respond_to do |format|
      format.html
      format.js
    end
  end
  
  def index
    @courses = Course.all
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
  end

  # GET /courses/new
  def new
    @course = Course.new
  end

  # GET /courses/1/edit
  def edit
  end

  # POST /courses
  # POST /courses.json
  def create
    @course = Course.new(course_params.merge(user_id: current_user.id))

    respond_to do |format|
      if @course.save
        format.html { redirect_to '/courses' }
        flash[:success] = 'Course successfully created'
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to @course }
        flash[:success] = 'Course successfully updated'
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course.destroy
    respond_to do |format|
      format.html { redirect_to courses_url }
      flash[:success] = 'Course successfully destroyed'
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
      if logged_in?
        params.require(:course).permit(@current_user.id, :semester_id, :course_name, :department, :instructor, :credits, :grade)
      end
    end
end
