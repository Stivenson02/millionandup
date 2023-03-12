Rails.application.routes.draw do

  root 'home#index'
  resources :products do
    resource :products, module: 'products'
  end
  resources :home do
    collection do
      post :search
    end
  end

end
