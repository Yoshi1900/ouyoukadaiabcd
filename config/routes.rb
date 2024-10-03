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
  end

  resources :books, only: [:index,:show,:edit,:create,:destroy,:update] do
    resource :favorite, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
    get :tags, on: :collection
  end

  resources :groups, except: [:destroy]


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end