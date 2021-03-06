BlogApplication::Application.routes.draw do

  namespace :mercury do
    resources :images
  end

  root to: 'pages#home'

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

  resources :pages, path: '/', only: [:show, :update]

  resources :pages do
    member do
      put :update
    end
  end

end
