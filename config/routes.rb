Rails.application.routes.draw do
  namespace :api do
    namespace :v1, default: { format: 'json' } do
      get '/:username/reservations', to: 'reservations#index'
      post '/:username/reservations', to: 'reservations#create'
      delete '/:username/reservations/:id', to: 'reservations#destroy'
    end
  end
end
