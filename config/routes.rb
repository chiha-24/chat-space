Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "groups#index"
  resources :users, only: [:edit, :update, :index]
  resources :groups, only: [:edit, :update, :new, :create] do
    resources :messages, only: [:create, :index]
    namespace :api do
      resources :messages, only: :index, defaults: {format: 'json'}
    end
  end  

end
