Rails.application.routes.draw do
  devise_for :users
  resources :posts
  resources :messages
  resources :liderancas
  resources :contatos, only: [:new, :create]
  get 'templates/historia'
  get 'templates/jesus'
  get 'welcome/index'
  root 'welcome#index'

  get '*path' => redirect('/')
end
