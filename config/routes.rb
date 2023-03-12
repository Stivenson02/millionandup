Rails.application.routes.draw do

  root 'home#index'
  resources :products do
    resource :products, module: 'products'
  end
  resources :home do
    member do
      get :search
    end
  end

end
