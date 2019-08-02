Rails.application.routes.draw do
  namespace :admin do
    get 'users/new'
    get 'users/edit'
    get 'users/index'
    get 'users/show'
  end
  resources :tasks

  root to: 'tasks#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
