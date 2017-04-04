Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/about', to: 'about#index'
  get '/contact', to: 'contact#index'
  post '/contact', to: 'contact#create', as: 'contact_submit'
  resources :products do
    resources :reviews
  end


  # get '/products', to: 'products#index'
  # get '/products/new', to: 'products#new'
  # post '/products/new', to: 'products#new'
  # delete '/questions/:id', to: 'questions#destroy'
  # get '/questions/:id/edit', to: 'questions#edit'
  # get '/questions/:id', to: 'questions#show'
  # post '/questions/:id/comments', to: 'comments#create'
  # get '/faq', to: 'home#faq'

  root 'home#index'

end
