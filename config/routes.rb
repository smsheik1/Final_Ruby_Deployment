Rails.application.routes.draw do
	get '/' =>'users#index'
	post '/users' =>'users#create'
	post '/sessions' =>'sessions#create'
	get '/bright_ideas' =>'posts#index'
	post '/posts' => 'posts#create'
	delete '/posts/:id' =>'posts#destroy'
	get '/users/:id' =>'posts#show_user'
	get '/bright_ideas/:id' => 'posts#show'
	post '/posts/:id' =>'posts#create_like'
	delete '/sessions/:id' =>'sessions#destroy'
end
