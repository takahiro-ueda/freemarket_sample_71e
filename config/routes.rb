Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end
  root 'items#index'
  resources :users, :only => [:index, :show,]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :items
  resources :address, only: [:show, :edit, :update]
  resources :items, only: [:index,:new,:create] 
  resources :categories ,only: :new
  resources :items do 
    collection do
      get 'category_children', defaults: { format: 'json' }
      get 'category_grandchildren', defaults: { format: 'json' }
    end
  end

  resources :credit, only: [:new, :show] do
    collection do
      post 'show', to: 'credit#show'
      post 'pay', to: 'credit#pay'
      post 'delete', to: 'credit#delete'
    end
  end
end
