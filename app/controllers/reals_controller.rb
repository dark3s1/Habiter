class RealsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_real, only: [:edit, :update, :destroy, :move]
  before_action :set_habit

  # GET /reals
  def index
    @reals = Real.all.order(:position)
    @habits = current_user.habits.all
    @tags = current_user.tags.all
  end

  # GET /reals/new
  def new
    @real = Real.new
    @tags = current_user.tags.all
    @day = params[:date].to_date
  end

  # GET /reals/1/edit
  def edit
  end

  # POST /reals
  # POST /reals.json
  def create
    @real = Real.new(real_params)
    @habits = current_user.habits.all
    @tags = current_user.tags.all
    if @real.save
      @status = true
    else
      @status = false
    end
  end

  # PATCH/PUT /reals/1
  # PATCH/PUT /reals/1.json
  def update
    if @real.update(real_params)
      @status = true
    else
      @status = false
    end
  end

  # DELETE /reals/1
  # DELETE /reals/1.json
  def destroy
    @real.destroy
    respond_to do |format|
      format.js
    end
  end
  
  def move
    case params[:move]
    when 'up'
      @real.move_higher
      @tar = @reals.lower_item
    when 'down'
      @real.move_lower
      @tar = @reals.higher_item
    else
    end
  end
  
  def sort
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
      params.require(:real).permit(:time, :start_time, :habit_id)
    end
end
