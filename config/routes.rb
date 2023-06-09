Rails.application.routes.draw do
  resources :notes, except: %i[show]
  resources :symptoms
  resources :measurements, only: %i[new destroy]

  patch "/users/:id", to: "users#update", as: :user
  get "/users/:id/edit", to: "users#edit", as: :edit_user
  delete "/users/:id", to: "users#destroy", as: :delete_user

  resources :users, only: [:create] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end

  constraints Clearance::Constraints::SignedIn.new do
    root to: "symptoms#index", as: :signed_in_root
  end

  constraints Clearance::Constraints::SignedOut.new do
    root to: "clearance/sessions#new"
  end
end
