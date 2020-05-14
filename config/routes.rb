Rails.application.routes.draw do

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#top'
  get 'home/about'
  # rootがわからない, ログイン後のリダイレクト先　users/show
  resources :books
  resources :users
end
