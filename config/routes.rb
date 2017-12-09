Rails.application.routes.draw do
  resources :buckets
  devise_for :users
  root 'pages#home'
  namespace :webhooks do
    post '/:access_code', to: 'buckets#receive'
  end
end
