Ideabox::Application.routes.draw do
  resources :ideas do
    
    #resources :comments
    
    resources :votes
    
  
  end


  root "ideas#index"

end
