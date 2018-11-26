Rails.application.routes.draw do
  resources :courses
  resources :semesters
  resources :users
  get '/user', to: 'users#index'
  root 'users#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
