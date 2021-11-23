Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :items, only: [:index, :show, :create, :destroy]
      resources :users, only: [:create]

      get '/:username/reservations', to: 'reservations#index'
      post '/login', to: 'users#login'
      post '/:username/reservations', to: 'reservations#create'
      delete '/:username/reservations/:id', to: 'reservations#destroy'
    end
  end
end
