Rails.application.routes.draw do

    namespace :api do 
        resources :users
        
        get 'user', to: 'users#show', as: 'user_show'
        post 'signup', to: 'users#create', as: 'user_signup'
        post 'login', to: 'users#login', as: 'user_login'
        
        resources :trips do
            resources :comments, only: [:index, :create, :destroy]
        end
    end
end

