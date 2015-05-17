Ideabox::Application.routes.draw do

	get 'tags/:tag', to: 'ideas#index', as: :tag


	resources :ideas do
	    
	    #resources :comments
	    
	    resources :votes
	    
	  
	end


  root "ideas#index"

end
