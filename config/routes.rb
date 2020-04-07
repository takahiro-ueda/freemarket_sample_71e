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
  resources :address, only: [:show, :edit, :update]

  resources :credit, only: [:new, :show] do
    collection do
      post 'show', to: 'credit#show'
      post 'pay', to: 'credit#pay'
      post 'delete', to: 'credit#delete'
    end
  end


  resources :items do
    resources :purchase, only: [:index] do
      collection do
        get 'done', to: 'purchase#done'
        post 'pay', to: 'purchase#pay'
      end
    end
  end

  resources :users, only: [:show, :edit, :update] do
    resources :items, only: [:new, :create, :show] do
      resources :likes, only: [:create, :destroy]
    end
  end

end