Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'api/auth', skip: [:omniauth_callback]
  
  namespace :api do
      resources :products, only: [:index]
  end
end