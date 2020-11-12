Rails.application.routes.draw do
  devise_for :users
  root to: "tweets#index"
  resources :tweets do
    resources :accesses, only: [:new, :create, :show, :edit, :update]
  end
  resources :users, only: [:new, :show, :edit, :update]
end