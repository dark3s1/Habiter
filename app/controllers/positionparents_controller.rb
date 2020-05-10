class PositionparentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_real, only: [:edit, :update, :destroy]
  before_action :set_habit

  # GET /positionparents
  def index
    @reals = Real.all.order(:position)
    @habits = current_user.habits.all
    @tags = current_user.tags.all
    @positionparents = Positionparent.all
  end

  def new
    @positionparent = Positionparent.new
    @real = @positionparent.reals.build
    @tags = current_user.tags.all
    @day = params[:date].to_date
  end

  # GET /reals/1/edit
  def edit
  end

  # POST /reals
  # POST /reals.json
  def create
    @positionparent = Positionparent.new(positionparent_params)
    if @positionparent.save
      @status = true
    else
      @status = false
    end
  end

  # PATCH/PUT /reals/1
  # PATCH/PUT /reals/1.json
  def update
    if @positionparent.update(positionparent_params)
      @status = true
    else
      @status = false
    end
  end

  # DELETE /reals/1
  # DELETE /reals/1.json
  def destroy
    @positionparent.destroy
    respond_to do |format|
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_real
      @real = Real.find(params[:id])
    end
    
    def set_habit
      @habits = current_user.habits.all
    end

    # Only allow a list of trusted parameters through.
    def real_params
      params.require(:real).permit(:time, :habit_id, :position, :positionparent_id)
    end
    
    def positionparent_params
      params.require(:positionparent).permit(:start_time, reals_attributes: [:id, :time, :habit_id, :position, :positionparent_id])
    end
end
