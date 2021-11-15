Rails.application.routes.draw do
  namespace :v1, default: { format: 'json' } do
    get '/:username/reservations', to: 'reservations#index'
    resources :reservations, only: [:create, :destroy]
  end
end
