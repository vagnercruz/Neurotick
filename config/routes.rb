Rails.application.routes.draw do
  root "habits#index"
  resources :habits, only: [:index, :show, :new, :create] do
    post "toggle", to: "completions#toggle", as: :toggle
  end

  resources :completions, only: [:index, :destroy] # se/quando precisar

  devise_for :users



end
