Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'top#index'
  get "users/" => "user#index"
  get "users/index" => "user#index"
  get "users/:id" => "user#show"
  get "users/:id/edit" => "user#edit"
  post "users/:id/update" => "user#update"
  resources :list, only: %i(new create edit update destroy) do
    resources :card, except: %i(index)
  end
end
