Rails.application.routes.draw do
  resources :friend_requests
  get 'friends/index'
  get 'friends/destroy'
  root to: redirect('/dashboards')

  resources :dashboards
  devise_for :users
  resources :flights do
    get :set_copilot
  end
  resources :airports
  resources :pilots do
    get :add_friend
  end



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
