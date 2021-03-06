Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: :registrations }
  resources :users, only: [:show, :update, :destroy]
  resources :categories do
    resources :products do
      resources :reviews
    end
  end

  root 'categories#index'
end
