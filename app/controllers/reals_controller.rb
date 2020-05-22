class RealsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_real, only: [:edit, :update, :destroy, :move]
  include RealHelper
  

  # GET /reals
  def index
    @reals = current_user.reals.all.order(:position)
    @habits = current_user.habits.all
    @tags = current_user.tags.all
  end

  # GET /reals/new
  def new
    @real = current_user.reals.new
    @day = params[:date].to_date
  end

  # GET /reals/1/edit
  def edit
  end

  # POST /reals
  # POST /reals.json
  def create
    @real = current_user.reals.new(real_params)
    @day = params[:date].to_d
    if @real.save
      @status = true
      sortcheck(@real.position, @real.start_time)
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
  
  def move
      params[:move]
      sortcheck(@real.position, @real.start_time)
      upper = @real.position
      downer = @mposi.first.position
      @mposi.first.insert_at(upper)
      @real.insert_at(downer)
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_real
      @real = current_user.reals.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def real_params
      params.require(:real).permit(:time, :start_time, :habit_id)
    end
end
