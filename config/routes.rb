Rails.application.routes.draw do
  
  root 'homes#top'
  get 'about', to: 'homes#about', as: :about
  
  devise_for :users
  
  resources :post_images, only: [:new, :create, :index, :show, :destroy] do
    resource :favorite, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  end
  resources :users, only: [:show, :edit, :update]
  

end
