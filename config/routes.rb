Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  get '/about', to: 'home#about'

  resource :user, only: [:index] do
    resources :posts,only: [:index, :show, :edit, :update, :destroy],
              as: 'manage_posts',
              controller: 'manage_posts'
  end
  resources :posts, only: [:show, :new, :create] do
    resources :comments, only: [:create, :destroy]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
