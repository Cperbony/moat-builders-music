Rails.application.routes.draw do
  # devise_for :users

  namespace :api, defaults: { format: :json } do
    resource :session, only: [:create, :destroy]
    resources :users, only: [:create, :show, :destroy]
  end

end
