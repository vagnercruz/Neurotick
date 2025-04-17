class CompletionsController < ApplicationController
  def toggle
    habit = Habit.find(params[:habit_id])
    date = Date.parse(params[:date])
    habit.toggle_completion(date)
    redirect_to habit_path(habit)
  end
end
