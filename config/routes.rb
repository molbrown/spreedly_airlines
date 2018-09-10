Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :flights 
  
  resources :transactions
  resources :saved_cards

  root 'flights#index'

end
