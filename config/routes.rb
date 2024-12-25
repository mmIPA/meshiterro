Rails.application.routes.draw do
  
  devise_for :admin, skip: [:registrations, :password], controllers: {
    sessions: 'admin/sessions'
  }
  
  namespace :admin do
    get 'dashboards', to: 'dashboards#index'
    resources :users, only: [:destroy]
  end
  
  scope module: :public do
    root 'homes#top'
    get 'about', to: 'homes#about', as: :about
  
    devise_for :users
  
    resources :post_images, only: [:new, :create, :index, :show, :destroy] do
      resource :favorite, only: [:create, :destroy]
      resources :post_comments, only: [:create, :destroy]
    end
    resources :users, only: [:show, :edit, :update]
  end

  resource :map, only: [:show]
end
