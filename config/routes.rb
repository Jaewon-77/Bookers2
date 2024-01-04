Rails.application.routes.draw do

  get 'relationships/followings'
  get 'relationships/followers'
  get "search" => "searches#search"
devise_for :users
root to: 'homes#top'
get 'home/about' => 'homes#about'

resources :books, only: [:create, :index, :show, :destroy, :edit, :update] do
  resources :book_comments, only: [:create, :destroy]
  resource :favorite, only: [:create, :destroy]
end
resources :users, only: [:show, :edit, :update, :index ]

# get 'home/about' , as: 'about'
resources :users do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end


end