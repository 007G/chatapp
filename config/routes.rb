Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
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

 resources :posts do
  member do
    get 'mypost'
  end
end

mount ActionCable.server => '/cable'


end
