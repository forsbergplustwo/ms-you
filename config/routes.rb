Rails.application.routes.draw do
  resources :symptoms
  resources :measurements, only: %i[ destroy ]

  root "symptoms#index"
end
