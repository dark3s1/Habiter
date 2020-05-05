Rails.application.routes.draw do
  devise_for :users
  resources :plans
  resources :reals do
    member do
      get :move
    end
    member do
      get :sort
    end
  end
  resources :tags
  resources :habits
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "home#index"
end
