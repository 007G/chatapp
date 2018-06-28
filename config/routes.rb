Rails.application.routes.draw do
  devise_for :users
  get 'posts/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root 'welcome#index'  

resources :posts do
  resources :comments
 end 

 resources :posts do
  member do
    get 'verified'
  end
end

end
