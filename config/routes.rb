Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  namespace :product do
    resources :categories
  end

  root 'home#index'

  resources :home do
    collection do
      post :search
    end
  end

  resource :trolley, only: [:create]

end
