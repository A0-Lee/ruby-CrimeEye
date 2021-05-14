# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

Rails.application.routes.draw do
  get 'registration/new'
  # get 'json/police_api'
  # get 'json/twitter_api'
  get 'main/home'
  get 'main/about'
  get 'main/emergency'

  get 'sign_up', to: 'registration#new'
  post 'sign_up', to: 'registration#create'

  get 'login', to: 'session#new'
  post 'login', to: 'session#create'
  delete 'logout', to: 'session#destroy'

  get 'password', to: 'password#edit', as: :edit_password
  patch 'password', to: 'password#update'
  get 'password/reset', to: 'password#new', as: :reset_password
  post 'password/reset', to: 'password#create'
  # Mailer functions
  get 'password/reset/edit', to: 'password#mailer_edit'
  patch 'password/reset/edit', to: 'password#mailer_update'

  get '/auth/twitter/callback', to: 'omniauth_callbacks#create'

  get 'account', to: 'session#account'

  root 'session#new'

  get 'contact_us', to: 'contact#index'
  post 'contact_us', to: 'contact#create'
end
