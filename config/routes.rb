TaskManagement::Application.routes.draw do
  devise_for :users

  resources :task_items
  resources :users
  
  root :controller => 'task_items', :action => 'index'
end
