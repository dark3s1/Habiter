class HabitsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_habit, only: [:edit, :update, :destroy]

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
      if @habit.save
        @status = true
      else
        @status = false
      end
  end

  # PATCH/PUT /habits/1
  # PATCH/PUT /habits/1.json
  def update
      if @habit.update(habit_params)
        @status = true
      else
        @status = false
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
  end

  def habit_params
    params.require(:habit).permit(:name, :color, :length, :target, :real, :date)
  end
end
