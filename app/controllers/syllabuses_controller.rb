class SyllabusesController < ApplicationController
  before_action :set_syllabus, only: [:show, :edit, :update, :destroy]
  before_action :set_course

  # GET /syllabuses
  # GET /syllabuses.json
  def index
    @syllabuses = Syllabus.where(:course_id => @course.id)
  end

  # GET /syllabuses/1
  # GET /syllabuses/1.json
  def show
   
  end

  # GET /syllabuses/new
  def new
    @syllabus = Syllabus.new
  end

  # GET /syllabuses/1/edit
  def edit
  end

  # POST /syllabuses
  # POST /syllabuses.json
  def create
    @syllabus = Syllabus.new(syllabus_params)
    @syllabus.course_id = @course.id

    respond_to do |format|
      if @syllabus.save
        format.html { redirect_to course_syllabus_path(@course, @syllabus), notice: 'Syllabus was successfully created.' }
        format.json { render action: 'show', status: :created, location: @syllabus }
      else
        format.html { render action: 'new' }
        format.json { render json: @syllabus.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /syllabuses/1
  # PATCH/PUT /syllabuses/1.json
  def update
    respond_to do |format|
      if @syllabus.update(syllabus_params)
        format.html { redirect_to course_syllabus_path(@course, @syllabus), notice: 'Syllabus was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @syllabus.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /syllabuses/1
  # DELETE /syllabuses/1.json
  def destroy
    @syllabus.destroy
    respond_to do |format|
      format.html { redirect_to course_syllabuses_url(@course) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:course_id])
    end

    def set_syllabus
      @syllabus = Syllabus.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def syllabus_params
      params.require(:syllabus).permit(:name, :description, :status, :course_id)
    end
end
