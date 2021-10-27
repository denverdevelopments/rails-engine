Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      resources :merchants, only: [:index, :show] do
        resources :items, only: [:index], as: "goods"
      end
      # get '/merchants/:merchant_id/items', to: 'goods#index'
      resources :items  #, only: [:index, :show]
    end
  end
end
