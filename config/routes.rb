Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      resources :merchants, only: [:index, :show] do
        scope module: :merchants do
          resources :items, only: :index
        end
      end
      namespace :merchants do
        resources :find_one, only: :show
      end
      resources :items  do
        resources :merchant, only: [:index], to: 'items/merchants#index'
        # get '/merchant', to: 'items/merchants#show'
      end
      namespace :items do
        resources :find_all, only: :index
      end
    end
  end
end
