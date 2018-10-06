Rails.application.routes.draw do
  get 'user/show'
  devise_for :users 


  resources :posts do
    collection do 
      get :search
    end
      resources :comments do
    end
  end

  resources :posts do 
    resources :likes 
  end 



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "posts#index"
  get 'users/:id', :to => 'user#show', :as => :user 
  get 'posts/:id', :to => 'posts#show'
  get 'post/', :to => 'likes#index', :as => 'likes'
end
