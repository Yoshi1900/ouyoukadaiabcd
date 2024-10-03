Rails.application.routes.draw do
  get "/search", to: "searches#search"
  get 'tagsearches/search', to: 'tagsearches#search'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users
  root :to =>"homes#top"
  get "home/about"=>"homes#about"

  resources :users, only: [:index,:show,:edit,:update] do
    resource :relationships, only: [:create, :destroy]
       get "followings" => "relationships#followings", as: "followings"
       get "followers" => "relationships#followers", as: "followers"
       get "search" => "users#search"
  end

  resources :books, only: [:index,:show,:edit,:create,:destroy,:update] do
    resource :favorite, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
    get :tags, on: :collection
  end

  resources :groups, only: [:new, :index, :show, :create, :edit, :update] do
    resource :group_users, only: [:create, :destroy]
    get "join" => "groups#join"
    get "new/mail" => "groups#new_mail"
    get "send/mail" => "groups#send_mail"
    
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end