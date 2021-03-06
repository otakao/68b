Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
   }

  root 'items#index'
  resources :items do 
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
    
    member do
      get 'confirm'
      post 'pay'
    end
    resources :comments, only: :create
  end 
  resources :users, only: :show
  resources :addresses, only:[:new, :create, :edit, :update]
  resources :cards, only: [:new, :create, :edit, :destroy]
end