Rails.application.routes.draw do
  root to: redirect('/dashboards')

  resources :dashboards
  devise_for :users
  resources :flights do
    get :set_copilot
  end
  resources :airports
  resources :pilots


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
