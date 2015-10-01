Rails.application.routes.draw do
  root 'lunches#index'
  devise_for :users
  resources :lunches, only: [:index, :show, :create, :new, :delete] do
    resources :groups
  end
end
