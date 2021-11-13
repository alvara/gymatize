Rails.application.routes.draw do
  root to: 'pages#home'

  resources :gyms, only: [:index, :show, :new, :create] do
    collection do
      # get :nearby
      get :favorite
    end
  end
  resources :equipments  
end
