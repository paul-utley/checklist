Rails.application.routes.draw do
  get "/app", to: "list#index"
  namespace :api do
    namespace :v1 do
      get 'list-item/', to: 'list_item#index'
      post 'list-item/', to: 'list_item#create'
      get 'list-item/:id', to: 'list_item#show' 
      delete 'list-item/:id', to: 'list_item#destroy'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
