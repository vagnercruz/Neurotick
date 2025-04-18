class CompletionsController < ApplicationController
  def toggle
    @habit = Habit.find(params[:habit_id])
    today = Date.today

    completion = @habit.completions.find_by(date: today)

    if completion
      completion.destroy
      flash[:notice] = "Hábito desmarcado para hoje!"
    else
      @habit.completions.create(date: today)
      flash[:notice] = "Hábito marcado como feito hoje!"
    end

    redirect_to habit_path(@habit)
  end
end
