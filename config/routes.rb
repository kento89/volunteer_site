Rails.application.routes.draw do
  devise_for :customers, controllers: {
    sessions: 'customers/sessions',
    passwords: 'customers/passwords',
    registrations: 'customers/registrations'
  }
  devise_for :recruiters, controllers: {
    sessions: 'recruiters/sessions',
    passwords: 'recruiters/passwords',
    registrations: 'recruiters/registrations'
  }
  
  root to: 'homes#top'
  get 'homes/about' => 'homes#about'
  
  namespace :public do
    resource :customers, only: [:show, :edit, :update]
    get 'customers/unsustainable' => 'customers#unsustainable'
    patch 'customers/unsustainable' => 'customers#exit'
    resources :recruiters, only: [:show]
    resources :volunteers, only: [:index, :show]
  end
  
  namespace :recruiter do
    resources :recruiters, only: [:show, :edit, :update]
    get 'recruiters/unsustainable' => 'customers#unsustainable'
    patch 'recruiters/unsustainable' => 'customers#exit'
    resources :customers, only: [:show]
    resources :volunteers, only: [:new, :create, :index, :show, :edit, :update, :destroy]
  end
  
  resources :messages, only: [:create]
  resources :rooms, only: [:create, :show]

end
