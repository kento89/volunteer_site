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
  get '/search' => 'search#search'

  namespace :public do
    resource :customers, only: [:show, :edit, :update]
    get 'customers/unsustainable' => 'customers#unsustainable'
    patch 'customers/unsustainable' => 'customers#exit'
    resources :recruiters, only: [:show]
    resources :volunteers, only: [:index, :show] do
      resources :applies, only: %i[index create destroy]
      resources :volunteer_customers, only: %i[index create destroy]
      end
  end

  namespace :recruiter do
    resources :recruiters, only: [:show, :edit, :update]
    get 'recruiters/unsustainable' => 'customers#unsustainable'
    patch 'recruiters/unsustainable' => 'customers#exit'
    resources :customers, only: [:show, :index]
    resources :volunteers, only: [:new, :create, :index, :show, :edit, :update, :destroy]
  end


  resources :image, only: [:create, :update, :destroy]
  resources :rooms, only: [:create, :show]
  resource :messages, only: [:create]
  resources :notifications, only: [:index, :update]
end
