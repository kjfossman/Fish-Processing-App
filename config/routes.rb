Rails.application.routes.draw do
  resources :fish_processors
  resources :tenders
  resources :boats
  resources :invoices
  
  resources :boats do 
    resources :invoices
  end

  resources :tenders do 
    resources :fish_tickets
  end

  resources :boats do
    resources :fish_tickets
  end

  resources :fish_tickets

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  delete '/logout', to: 'sessions#delete'

  get '/auth/google_oauth2/callback', to: 'sessions#omniauth'

  root('static#home')

  get '/fish_tickets/:date/date', to: 'fish_tickets#date', as: 'date'
 
  get '/fish_ticket/search', to: 'fish_tickets#search', as: 'fish_ticket_search'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
