Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/dogs', to: 'dogs#index'
  get '/dogs/new', to: 'dogs#new'
  get '/dogs/:id', to: 'dogs#show'
  get '/dogs/:id/edit', to: 'dogs#edit'
  post '/dogs', to: 'dogs#create'
  patch '/dogs/:id', to: 'dogs#update'
  delete '/dogs/:id', to: 'dogs#destroy'

  get '/dogs/:id/tricks', to: 'tricks#index'
  get '/dogs/:id/tricks/new', to: 'tricks#new'

end
