Rails.application.routes.draw do
  get 'index/show'
  get 'category/index'
  get 'category/show'
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
      resources :comments
  end

  #root to: "categories#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "posts#index"

  get 'users/:id', :to => 'user#show', :as => :user 
  get 'post/:id', :to => 'comments#show', :as => :comments
  get "/category" => "category#index"



  
 
  
end
