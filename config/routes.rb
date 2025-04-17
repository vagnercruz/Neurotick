Rails.application.routes.draw do
  root "habits#index"
  resources :habits, only: [ :index, :show, :new, :create ]
  post "/habits/:habit_id/toggle/:date", to: "completions#toggle", as: "toggle_completion"
end
