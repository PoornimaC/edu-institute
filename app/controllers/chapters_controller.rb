class ChaptersController < ApplicationController
  before_action :set_chapter, only: [:show, :edit, :update, :destroy]
  before_action :set_syllabus_and_course

  # GET /chapters
  # GET /chapters.json
  def index
    @chapters = Chapter.where(:syllabus_id => @syllabus.id)
  end

  # GET /chapters/1
  # GET /chapters/1.json
  def show
  end

  # GET /chapters/new
  def new
    @chapter = Chapter.new
  end

  # GET /chapters/1/edit
  def edit
  end

  # POST /chapters
  # POST /chapters.json
  def create
    @chapter = Chapter.new(chapter_params)
    @chapter.syllabus_id = @syllabus.id
    respond_to do |format|
      if @chapter.save
        format.html { redirect_to course_syllabus_chapter_path(@course, @syllabus, @chapter), notice: 'Chapter was successfully created.' }
        format.json { render action: 'show', status: :created, location: @chapter }
      else
        format.html { render action: 'new' }
        format.json { render json: @chapter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /chapters/1
  # PATCH/PUT /chapters/1.json
  def update
    respond_to do |format|
      if @chapter.update(chapter_params)
        format.html { redirect_to course_syllabus_chapter_path(@course, @syllabus, @chapter), notice: 'Chapter was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @chapter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chapters/1
  # DELETE /chapters/1.json
  def destroy
    @chapter.destroy
    respond_to do |format|
      format.html { redirect_to course_syllabus_chapters_url(@course, @syllabus) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_syllabus_and_course
      @course = Course.find(params[:course_id])
      @syllabus = Syllabus.find(params[:syllabus_id])
    end
    
    def set_chapter
      @chapter = Chapter.find(params[:id])
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def chapter_params
      params.require(:chapter).permit(:name, :description, :status, :syllabus_id)
    end
end
