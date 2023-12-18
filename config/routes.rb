Rails.application.routes.draw do

devise_for :users
root to: 'homes#top'
get 'home/about' => 'homes#about'

resources :books, only: [:create, :index, :show, :destroy, :edit]
resources :users, only: [:show, :edit, :update, :index ]

# get 'home/about' , as: 'about'


end