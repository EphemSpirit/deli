Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :admins

  root 'static_pages#home'

  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'

  # get '/my_dishes', to: 'products#index'
  # get '/new_dish', to: 'products#new'
  # post '/new_dish', to: 'products#create'
  # get '/dish/:id', to: 'products#show'
  # get '/edit_dish/:id', to: 'products#edit'
  # patch '/edit_dish/:id', to: 'products#update'
  # delete '/remove_dish/:id', to: 'products#destroy'

  # scope :admin do
  #   resources :products
  # end

  resources :carts
  resources :line_items

  get 'menu', to: 'menu#index'
  get 'search', to: 'menu#search'
end
