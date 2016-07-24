Rails.application.routes.draw do
  root 'posts#index'
  resources :posts, path: '/', only: [:index, :create, :destroy]
end
