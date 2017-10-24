Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: :json } do
    resources :clients, :only => [:show, :create, :update, :destroy]
    resources :comments, :only => [:show, :create, :update, :destroy]
    get '/comments/client/:client_id', to: 'comments#client_comments'
  end
  authenticated do
	  root :to => 'users#view_tasks', as: :authenticated
	end
	root :to => 'pages#landing'
end
