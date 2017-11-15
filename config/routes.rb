Rails.application.routes.draw do
  resources :users, only: [:index] do
  	collection do
        post 'import'
    end
  end
  root 'users#index'
end
