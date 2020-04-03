class HabitsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_habit, only: [:show, :edit, :update, :destroy]

  # GET /habits
  # GET /habits.json
  def index
    @habits = current_user.habits.all
  end

  # GET /habits/new
  def new
    @habit = current_user.habits.new
  end

  # GET /habits/1/edit
  def edit
  end

  # POST /habits
  # POST /habits.json
  def create
    @habit = current_user.habits.new(habit_params)
    respond_to do |format|
      if @habit.save
        format.html { @status = true }
        format.json { render :show, status: :created, location: @habit }
      else
        format.html { @status = false }
        format.json { render json: @habit.errors, status: :unprocessable_entity }
        format.js { @status = "fail" }
      end
    end
  end

  # PATCH/PUT /habits/1
  # PATCH/PUT /habits/1.json
  def update
    respond_to do |format|
      if @habit.update(habit_params)
        format.html { @status = true }
        format.json { render :show, status: :ok, location: @habit }
      else
        format.html { @status = false }
        format.json { render json: @habit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /habits/1
  # DELETE /habits/1.json
  def destroy
    @habit.destroy
  end

  private
  def set_habit
    @habit = current_user.habits.find_by(id: params[:id])
    redirect_to(habits_url, alert: "ERROR!!") if @habit.blank?
  end

  def habit_params
    params.require(:habit).permit(:name, :color, :length, :target, :real, :date)
  end
end
