Rails.application.routes.draw do



  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :comments
  resources :episodes do
    resources :comments
  end

  resources :users, only: [:show, :edit, :update]
  resources :votes, only: [:create, :destroy]

  resources :tags, only: [] do
    resources :episodes, only: [:index]
  end

  root to: 'episodes#index'

  get 'about' => 'info#about', as: :about

  ###
  # 管理后台
  ###
  namespace :admin do
    root 'home#index'
  end
end
