Rails.application.routes.draw do
  # devise_for :users

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resource :session, only: [:create, :destroy]
      resources :users, only: [:index, :create, :show, :update, :destroy]
    end
  end
end
