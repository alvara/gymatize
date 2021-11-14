Rails.application.routes.draw do

  # get 'equipments/new'
  # get 'equipments/create'
  root to: 'pages#home'

  resources :gyms, only: [:index, :show, :new, :create,:edit, :update] do
    collection do
      get :favorites
      
    end

    member do
      patch :toggle_favorite
    end
  end

  resources :equipments
end
