Rails.application.routes.draw do

  get 'tags/index'
  get 'tags/show'
  #mount Ckeditor::Engine => '/ckeditor'
  #get 'all_tags/index'
  #get 'all_tags/show'
  #get 'caetgory/index'
  #get 'category/index'
  #get 'category/show'
  devise_for :users 


  resources :posts do
    resources :likes do
    collection do 
      get :search
    end
      resources :comments, only: [:create, :delete]
    end
    resources :tags, only: [:index, :show]
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
