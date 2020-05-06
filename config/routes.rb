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
  get 'users/follows/:id' => 'users#following',as:"follows_show"
  get 'users/followers/:id' => 'users#followers',as:"followers_show"

#検索機能
  get 'search' => 'search#search',as:'search'


end
