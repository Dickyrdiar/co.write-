Rails.application.routes.draw do
  get 'category/index'
  get 'category/show'
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
      resources :comments
  end


  #root to: "categories#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "posts#index"

  #routes to access path 
  get 'users/:id', :to => 'user#show', :as => :user
  get "/category" => "category#index"
  
end
