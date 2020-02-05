Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    resources :orders, only: :create
  end

  root 'orders#index'

  resources :orders, only: %i[index new]
end
