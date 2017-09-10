Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'main#home'
  # get '/', to: 'main#home', as: 'home'
  get '/login', to: 'sessions#new', as: 'user_login'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/home/:user_id', to: 'users#home', as: 'user_home'
  get '/home/:user_id/choose_recipes', to: 'grocery_lists#choose_recipes', as: 'user_choose_recipes'
  post '/home/:user_id/choose_recipes', to: 'grocery_lists#create_grocery_list', as: 'create_grocery_list'
  get '/home/:user_id/grocery_list', to: 'grocery_lists#show', as: 'user_grocery_list'

  resources :users, only: [:show, :create, :new] do
    resources :recipes do
      resources :recipe_ingredients, only: [:destroy]
    end
    resources :pantry, only: [:show, :update] do
      resources :pantry_ingredients, only: [:destroy]
    end
  end
end
