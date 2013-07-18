BlogApplication::Application.routes.draw do

  namespace :mercury do
    resources :images
  end

  root to: 'pages#home'

  get '/art', to: 'pages#find_page_by_permalink'
  get '/home', to: 'pages#find_page_by_permalink'
  get '/gallery', to: 'pages#find_page_by_permalink'
  get '/graphicdesign', to: 'pages#find_page_by_permalink'
  get '/blog', to: 'pages#find_page_by_permalink'
  get '/about', to: 'pages#find_page_by_permalink'
  get '/contact', to: 'pages#find_page_by_permalink'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :posts do
    member do
      delete :destroy
      post :create
    end
  end

  get :destroy_unpublished, to: 'posts#destroy_unpublished'

  mount Mercury::Engine => '/'

  resources :pages do
    member do
      put :update
    end
  end

end
