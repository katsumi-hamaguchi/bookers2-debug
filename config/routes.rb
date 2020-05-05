Rails.application.routes.draw do
  devise_for :users
  resources :users,only: [:show,:index,:edit,:update]
  resources :books do
  	resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
#フォロー、フォロワー機能のルーティング
  resources :relationships, only: [:create, :destroy]

  root 'home#top'
  get 'home/about' => 'home#about'

end
