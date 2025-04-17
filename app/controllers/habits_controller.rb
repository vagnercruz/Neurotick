class HabitsController < ApplicationController
  def index
    @habits = Habit.all
  end

  def show
    @habit = Habit.find(params[:id])
    @dates = (0..6).map { |i| Date.today - i }
  end

  def new
    @habit = Habit.new
  end

  def create
    @habit = Habit.new(habit_params)
    if @habit.save
      redirect_to habits_path, notice: "Hábito criado!"
    else
      render :new
    end
  end

  private

  def habit_params
    params.require(:habit).permit(:name, :user)
  end
end
