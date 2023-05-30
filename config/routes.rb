Rails.application.routes.draw do
  resources :symptoms
  resources :measurements, only: %i[ destroy ]

  resources :users do
    scope module: :users do
      resource :preferred_languages, only: :show
    end
  end

  constraints Clearance::Constraints::SignedIn.new do
    root to: "symptoms#index", as: :signed_in_root
  end

  constraints Clearance::Constraints::SignedOut.new do
    root to: "users#sign_in"
  end
end
