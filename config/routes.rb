Rails.application.routes.draw do
  get 'user/show'
  devise_for :users 


  resources :posts do
    resources :likes do
    collection do 
      get :search
    end
      resources :comments
    end
  end
   
    resources :posts do 
      resources :likes 
    end 
  



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "posts#index"
  get 'users/:id', :to => 'user#show', :as => :user 
  get 'posts/:id', :to => 'posts#show'
  
end
