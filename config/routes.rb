Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'api/v1/auth', skip: [:omniauth_callback]
  
  namespace :api do
    resources :products, only: [:index]

    namespace :v1 do
    end
  end
end