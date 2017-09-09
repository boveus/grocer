Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'main#home'
  # get '/', to: 'main#home', as: 'home'
  get '/home/:user_id', to: 'user#home', as: 'user_home'
  resources :users, only: [:show, :create, :new] do
    resources :grocery_lists, only: [:show, :create, :new]
    resources :recipes do
      resources :recipe_ingredients, only: [:destroy]
    end
    resources :pantry, only: [:show] do
      resources :pantry_ingredients, only: [:destroy]
    end
  end
end
