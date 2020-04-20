class RealsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_real, only: [:show, :edit, :update, :destroy]
  before_action :set_habit

  # GET /reals
  def index
    @reals = @habit.reals
    @habits = current_user.habits.all
    @tags = current_user.tags.all
  end

  # GET /reals/1
  # GET /reals/1.json
  def show
  end

  # GET /reals/new
  def new
    @real = Real.new

  end

  # GET /reals/1/edit
  def edit
  end

  # POST /reals
  # POST /reals.json
  def create
    @habit = current_user.habits.find_by(id: params[:id])
    @real = Real.new(real_params)
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
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_real
      @real = current_user.reals.find_by(id: params[:id])
    end
    def set_habit
      @habits = current_user.habits.all
    end

    # Only allow a list of trusted parameters through.
    def real_params
      params.require(:real).permit(:time, :date)
    end
end
