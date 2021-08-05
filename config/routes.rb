Rails.application.routes.draw do
  root 'estates#index'
  resources :estates
    get :stations, on: :collection
end
