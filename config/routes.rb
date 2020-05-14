Rails.application.routes.draw do

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books
  resources :users
  root 'home#top'
  get 'home/about'
  # rootがわからない, ログイン後のリダイレクト先　users/show
end
