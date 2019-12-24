Rails.application.routes.draw do
  resources :room_messages
  resources :rooms
  devise_for :users
  root 'static_pages#home'
  get 'static_pages/help'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
