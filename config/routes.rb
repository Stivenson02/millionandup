Rails.application.routes.draw do
  devise_for :users, path: 'users', controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations"
  }
  devise_for :admins, path: 'admins', controllers: {
    sessions: "admins/sessions",
    registrations: "admins/registrations"
  }

  devise_scope :user do
    authenticated :user do
      namespace :users do
        get 'dashboard/index', as: :authenticated_root
      end
    end
  end

  devise_scope :admin do
    authenticated :admin do
      namespace :admins do
        get 'dashboard/index', as: :authenticated_root
      end
    end
  end

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
