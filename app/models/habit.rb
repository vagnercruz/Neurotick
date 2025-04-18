class Habit < ApplicationRecord
  has_many :completions, dependent: :destroy
  belongs_to :user


  def completed_on?(date)
    completions.exists?(completed_on: date)
  end

  def toggle_completion(date)
    if completed_on?(date)
      completions.find_by(completed_on: date)&.destroy
    else
      completions.create(completed_on: date)
    end
  end
end
