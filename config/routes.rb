Rails.application.routes.draw do
  get 'messages/create'
  get 'chatrooms/show'
  mount ActionCable.server => '/cable'
  
  devise_for :users
  resources :chatrooms, param: :slug, only: [:show]
  resources :messages, only: [:create]
  root 'static_pages#home'
  get 'static_pages/help'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
