Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # get "restaurants/new", to: "restaurants#new", as: 'new_restaurant'
  resources :restaurants do
    collection do
      get :top
    end

    member do 
      get :chef
    end
    resources :reviews, only:
    [:index, :new, :create]
  end
  resources :reviews, only:
  [:show, :edit, :update, :destroy]
  # get "restaurant", to: "restaurants#index"
  # post "restaurants", to: "restaurants#create"
  # get "restaurants/:id", to: "restaurants#show", as: 'restaurant'
  # get "restaurants/:id/edit", o: "restaurants#edit", as: "edit_restaurant"
  # patch "restaurants/:id", to: "restaurants#update"
  # delete "restaurants/:id", to: "restaurants#destroy", as: "delete_restaurants"
  # Defines the root path route ("/")
  # root "posts#index"
end
