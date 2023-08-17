Rails.application.routes.draw do
  get 'lists/index'
  get 'lists/show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :lists, only: [:index, :show, :new, :create] do
    resources :bookmarks, except: [:destroy] do
      resources :movies
    end
  end
  resources :bookmarks, only: [:destroy]
end
