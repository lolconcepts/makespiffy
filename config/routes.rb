Rails.application.routes.draw do
  resources :bonus
  resources :cashouts
  resources :carriers
  get 'dashboard/index'
  resources :chores
  resources :statuses
  resources :spiffy_tasks
  devise_for :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  match 'all_users/', :to => 'dashboard#all_users', :via => :get
  match '/adminify',:to => 'dashboard#adminify', :via => :get
  match '/approve',:to => 'dashboard#approve', :via => :get
  match '/rejection',:to => 'dashboard#reject', :via => :get
  match '/list',:to => 'dashboard#all_tasks', :via => :get
  
  match '/approve_cashout',:to => 'cashouts#approve', :via => :get
  match '/reject_cashout',:to => 'cashouts#reject', :via => :get
  match '/locked', :to => 'dashboard#locked', :via => :get

  match '/print',:to => 'spiffy_tasks#print_task', :via => :get
  match '/printall',:to => 'spiffy_tasks#print_all_cards', :via => :get
  match 'users/:id' => 'dashboard#destroy', :via => :delete, :as => :admin_destroy_user
  root to: "dashboard#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
