Rails.application.routes.draw do
  resources :symptoms
  resources :measurements, only: %i[ destroy ]

  scope module: :users do
    resource :preferred_languages, only: :show
  end

  delete "/users/:id", to: "users#destroy", as: :delete_user

  constraints Clearance::Constraints::SignedIn.new do
    root to: "symptoms#index", as: :signed_in_root
  end

  constraints Clearance::Constraints::SignedOut.new do
    root to: "clearance/sessions#new"
  end
end
