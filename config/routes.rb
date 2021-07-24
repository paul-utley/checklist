Rails.application.routes.draw do
  get "/app", to: "list#index"
  namespace :api do
    namespace :v1 do
      get 'list-item/', to: 'list_item#index'
      get 'list-item/:id', to: 'list_item#show'
      post 'list-item/:id', to: 'list_item#create' 
      delete 'list-item/:id', to: 'list_item#destroy'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
