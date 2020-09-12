class CurriculumsController < ApplicationController
  before_action :set_curriculum, only: %i[show update destroy]

  # GET /curriculus
  def index
    @curriculums = Curriculum.order(:id)
    if @curriculums
      render json: @curriculums
    else
      render json: 'some prob'
    end
  end

  # GET /curriculus/1
  def show
    render json: @curriculum
  end

  # POST /curriculus
  def create
    @curriculum = Curriculum.new(curriculum_params)

    if @curriculum.save
      render json: @curriculum, status: :created
    else
      render json: @curriculum.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /curriculus/1
  def update
    if @curriculum.update(curriculum_params)
      render json: @curriculum

    else
      render json: @curriculum.errors, status: :unprocessable_entity
    end
  end

  # DELETE /curriculus/1
  def destroy
    @curriculum.destroy
    if @curriculum.destroy
      head :no_content, status: :ok
    else
      render json: @curriculum.errors, status: :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_curriculum
    @curriculum = Curriculum.find(params[:id])
  end

  # Only allow a trusted parameter "white curriculum" through.
  def curriculum_params
    params.require(:curriculum).permit(:user_id, :entry_date,
                                       :name, :hours_done, :hours_target, :modules_done, :modules_target)
  end
end
