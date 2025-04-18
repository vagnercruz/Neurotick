class HabitsController < ApplicationController
  before_action :authenticate_user!

  def index
    @habits = current_user.habits
  end

  def show
    @habit = current_user.habits.find(params[:id])
    @dates = (0..6).map { |i| Date.today - i }
  end

  def new
    @habit = Habit.new
  end

  def create
    @habit = Habit.new(habit_params)
    @habit.user = current_user
    if @habit.save
      redirect_to habits_path, notice: "Hábito criado!"
    else
      render :new
    end
  end

  private

  def habit_params
    params.require(:habit).permit(:name)
  end
end
