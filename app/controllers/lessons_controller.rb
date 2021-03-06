class LessonsController < ApplicationController
  before_action :set_lesson, only: [:show, :edit, :update, :destroy]

  # GET /lessons
  # GET /lessons.json
  def index
    if params[:user_id]
      @lessons = Lesson.where(user_id: params[:user_id])
    elsif params[:category_key]
      @lessons = Lesson.where('category LIKE ?', "%#{params[:category_key]}%")
    else
      @lessons = Lesson.all
    end
  end

  # GET /lessons/1
  # GET /lessons/1.json
  def show
  end

  # GET /lessons/new
  def new
    @lesson = Lesson.new
  end

  # GET /lessons/1/edit
  def edit
  end

  # POST /lessons
  # POST /lessons.json
  def create
    @lesson = Lesson.new(lesson_params)

    respond_to do |format|
      if @lesson.save
        format.html { redirect_to @lesson, notice: 'Lesson was successfully created.' }
        format.json { render :show, status: :created, location: @lesson }
      else
        format.html { render :new }
        format.json { render json: @lesson.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lessons/1
  # PATCH/PUT /lessons/1.json
  def update
    if @lesson.user_id == current_user.id
      respond_to do |format|
        if @lesson.update(lesson_params)
          format.html { redirect_to @lesson, notice: 'Lesson was successfully updated.' }
          format.json { render :show, status: :ok, location: @lesson }
        else
          format.html { render :edit }
          format.json { render json: @lesson.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to lessons_path
    end
  end

  # DELETE /lessons/1
  # DELETE /lessons/1.json
  def destroy
    if @lesson.user_id == current_user.id
      @lesson.destroy
      respond_to do |format|
        format.html { redirect_to lessons_url, notice: 'Lesson was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      redirect_to lessons_path
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lesson
      @lesson = Lesson.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lesson_params
      params.require(:lesson).permit(:category, :content, :date_and_time, :start, :dead_line, :term, :place, :price, :user_id, :max)
    end
end
