Rails.application.routes.draw do
  get 'favorites/create'
  get 'favorites/destroy'
  get 'book_comments/create'
  get 'book_comments/destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users
  root :to =>"homes#top"
  get "home/about"=>"homes#about"
  resources :users, only: [:index,:show,:edit,:update]
  resources :books, only: [:index,:show,:edit,:create,:destroy,:update] do
    resource :favorite, only: [:create, :destroy]
    resources :book_comments, onyl: [:create, :destroy]
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end