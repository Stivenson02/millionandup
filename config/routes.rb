Rails.application.routes.draw do
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
