Rails.application.routes.draw do

  resources :destinations

 resources :posts
 resources :bloggers

 post 'posts/:id/like', to: 'posts#like'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
