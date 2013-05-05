BlogApplication::Application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  resources :posts do 
    member do
      delete :destroy
      post :create
    end
  end  

  mount Mercury::Engine => '/'

  resources :pages do
    member do
      put :update
    end
  end

  root to: 'pages#home'
end
