require "sidekiq/web"
Rails.application.routes.draw do
  resources :addresses
  get "address/index"
  get "address/new"
  get "address/edit"
  get "address/create"
  get "address/update"
  get "address/destroy"
  # get 'cart/index'
  # get 'cart/create'
  resources :cart
  # post 'cart/create', to: 'cart#create', as: 'cart_create'
  get "orders/confirm", to: "orders#confirm", as: "confirm"
  resources :orders
  mount Sidekiq::Web => "/sidekiq"
  # resources :orders, only => [:new, :confirm, :create, :destroy, :index, :cart]

  # , only: [:index, :create, :destroy, :show] do     #⇒（従来のnewアクションを削除）
  #   get :cart, on: :collection        #⇒（getメソッドに基づく、cartアクションのルートを追加）
  #   put :new, on: :collection         #⇒（PUTメソッドに基づく、newアクションのルートを追加）
  # end
  resources :products
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  devise_for :users, :controllers => {
                       :registrations => "users/registrations",
                       :sessions => "users/sessions",
                     }

  devise_scope :user do
    get "user/:id", :to => "users/registrations#detail"
    get "signup", :to => "users/registrations#new"
    get "sign_in", :to => "users/sessions#new"
    get "sign_out", :to => "users/sessions#destroy"
  end
end
