Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # get '/', to: 'home#index' # controller e action 
  root to: 'home#index' 
  
  resources :study_items, only: [:show, :new, :create]
end
