Rails.application.routes.draw do

  root 'home#index'

  resources :home do
    collection do
      post :search
    end
  end

  resource :trolley, only: [:create]

end
