Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :items, only: [:index, :show, :create, :destroy]
      resources :users, param: :username, only: [:create] do
        resources :reservations, only: [:index, :create, :destroy]
      end
      resources :sessions, only: [:create]
    end
  end
end
