Rails.application.routes.draw do
  namespace :admin do
    resources :users
    resources :resenas
    resources :turnos
    resources :chats
    resources :messages
    resources :requests
    resources :members

    root to: 'users#index'
  end
  resources :messages
  resources :chats
  resources :members
  # resources :mensajes
  resources :requests
  resources :resenas
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' },
                     path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
  resources :users, only: [:show]
  resources :users, only: [:index]
  resources :turnos
  get 'search', to: 'turnos#search'
  get 'home/about'
  root 'home#index'
end
