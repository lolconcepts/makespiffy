Rails.application.routes.draw do
  resources :carriers
  get 'dashboard/index'
  resources :chores
  resources :statuses
  resources :spiffy_tasks
  devise_for :users
  match 'all_users/', :to => 'dashboard#all_users', :via => :get
  match '/adminify',:to => 'dashboard#adminify', :via => :get
  match '/print',:to => 'spiffy_tasks#print_task', :via => :get
  root to: "dashboard#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
