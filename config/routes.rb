Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'main#home'
  # get '/', to: 'main#home', as: 'home'
  resources :users, only: [:show, :create, :new] do
    resources :recipes
    resources :grocery_lists, only: [:show, :create, :new]
    resources :pantry, only: [:show]
  end

end
