Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :zombies
  post 'zombies/search', to: 'zombies#search'

  resources :weapons
  resources :armors
end
