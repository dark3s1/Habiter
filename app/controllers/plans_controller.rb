class PlansController < ApplicationController
  before_action :authenticate_user!
  before_action :set_plan, only: [:show, :edit, :update, :destroy]

  # GET /plans
  # GET /plans.json
  def index
  end

  # GET /plans/1
  # GET /plans/1.json
  def show
  end

  # GET /plans/new
  def new
    @plan = current_user.plans.new
  end

  # GET /plans/1/edit
  def edit
  end

  # POST /plans
  # POST /plans.json
  def create
    @plan = current_user.plans.new(plan_params)
    @habits = current_user.habits.all
      if @plan.save
        @status = true
      else
        @status = false
      end
  end

  # PATCH/PUT /plans/1
  # PATCH/PUT /plans/1.json
  def update
    if @plan.update(plan_params)
      @status = true
    else
      @status = false
    end
  end

  # DELETE /plans/1
  # DELETE /plans/1.json
  def destroy
    @plan.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_plan
      @plan = current_user.plans.find_by(id: params[:id])
    end

    # Only allow a list of trusted parameters through.
    def plan_params
      params.require(:plan).permit(:time, :date, :habit_id)
    end
end
