Rails.application.routes.draw do
  	
  	root 	'pages#index'

	get 	'/signup',	to: 'users#new'
	post 	'/signup',	to: 'users#create'

	get 	'/login',	to: 'sessions#new'
	post 	'/login',	to: 'sessions#create'
	delete	'/logout',	to: 'sessions#destroy'

	get 	'/broadcast', to: 'messages#broadcast' 
	post    '/broadcast', to: 'messages#create_broadcast' 
	resources :users
	resources :messages
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
