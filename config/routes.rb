Rails.application.routes.draw do
  namespace :v1, default: { format: 'json' } do
    resources :reservations, only: [:index, :create, :destroy]
  end
end
