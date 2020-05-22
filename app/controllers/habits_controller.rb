class HabitsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_habit, only: [:edit, :update, :destroy]
  before_action :set_real, only: [:update, :destroy]
  include HabitsHelper

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
      @habits = current_user.habits.all
    else
      @status = false
    end
  end

  # DELETE /habits/1
  # DELETE /habits/1.json
  def destroy
    @real_s = []
    @real_ids = @reals.ids
    @real_co = @real_ids.count
    @reals.each do |real|
      nextcheck(real.position, real.start_time)
      if @real_next != nil
        @real_s.push(@real_next.id)
      end
    end
    @habit.destroy
  end

  private
  def set_habit
    @habit = current_user.habits.find_by(id: params[:id])
  end
  
  def set_real
    @reals = current_user.reals.where(habit_id: params[:id])
  end

  def habit_params
    params.require(:habit).permit(:name, :color, :target, :user_id, tag_ids: [])
  end
end
