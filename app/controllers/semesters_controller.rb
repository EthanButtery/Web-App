class SemestersController < ApplicationController
   before_action :set_semester, only: [:show, :edit, :update, :destroy]
   before_action :logged_in_user, only: [:index, :show, :edit, :update, :destroy]

  # GET /semesters
  # GET /semesters.json
  
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please log in!"
      redirect_to login_url
    end
  end
  
  def index
    @semesters = Semester.all.includes(:courses)
  end

  # GET /semesters/1
  # GET /semesters/1.json
  def show
  end

  # GET /semesters/new
  def new
    @semester = Semester.new
  end

  # GET /semesters/1/edit
  def edit
  end

  # POST /semesters
  # POST /semesters.json
  def create
    @semester = Semester.new(semester_params.merge(user_id: current_user.id))

    respond_to do |format|
      if @semester.save
        format.html { redirect_to @semester, notice: 'Semester was successfully created.' }
        format.json { render :show, status: :created, location: @semester }
      else
        format.html { render :new }
        format.json { render json: @semester.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /semesters/1
  # PATCH/PUT /semesters/1.json
  def update
    respond_to do |format|
      if @semester.update(semester_params)
        format.html { redirect_to @semester, notice: 'Semester was successfully updated.' }
        format.json { render :show, status: :ok, location: @semester }
      else
        format.html { render :edit }
        format.json { render json: @semester.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /semesters/1
  # DELETE /semesters/1.json
  def destroy
    @semester.destroy
    respond_to do |format|
      format.html { redirect_to semesters_url, notice: 'Semester was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_semester
      @semester = Semester.find(params[:id]) 
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def semester_params
      if logged_in?
        params.require(:semester).permit(@current_user.id, :id, :term, :year)
      end
    end
end
