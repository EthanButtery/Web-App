Rails.application.routes.draw do
  get 'static_pages/home'
  get 'sessions/new'
  resources :courses
  resources :semesters
  resources :users
  get '/user', to: 'users#index'
  root 'static_pages#home'
  get  '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
