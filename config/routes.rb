Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/dogs', to: 'dogs#index'
  get '/dogs/new', to: 'dogs#new'
  get '/dogs/:id', to: 'dogs#show'
  get '/dogs/:id/edit', to: 'dogs#edit'
  post '/dogs', to: 'dogs#create'
  patch '/dogs/:id', to: 'dogs#update'
  delete '/dogs/:id', to: 'dogs#destroy'

  # nested routing
  get '/dogs/:dog_id/tricks', to: 'tricks#index'
  get '/dogs/:dog_id/tricks/new', to: 'tricks#new'
  post '/dogs/:dog_id/tricks', to: 'tricks#create'

  # Non RESTful routes
  get '/hello', to: 'nonrestful#hello'
  get '/greetings/:name', to: 'nonrestful#what_is_your_name'
  patch '/items/:the_item_id/deactivate', to: 'nonrestful#deactivate'
  delete '/subtract/:x/from/:y', to: 'nonrestful#subtract'

  # namespaced routing
  get 'admin/users/:id', to: 'admin/users#show'
  get 'admin/dogs', to: 'admin/dogs#index'
  get '/admin/dogs/:dog_id/tricks', to: 'admin/tricks#index'
  delete '/admin/tricks/:id', to: 'admin/tricks#destroy'
end
