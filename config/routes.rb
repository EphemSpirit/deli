Rails.application.routes.draw do
  devise_for :admins
  get 'menu', to: 'menu#index'
  get 'search', to: 'menu#search'
  root 'static_pages#home'
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
end
