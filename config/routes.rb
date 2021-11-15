Rails.application.routes.draw do
  namespace :api do
    namespace :v1, default: { format: 'json' } do
      get '/:username/reservations', to: 'reservations#index'
      post '/:username/reservations', to: 'reservations#create'
      resources :reservations, only: [:destroy]
    end
  end
end
