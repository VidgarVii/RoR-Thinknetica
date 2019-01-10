Rails.application.routes.draw do
  root 'tests#index'

  get :signup, to: 'users#new'
  get :signin, to: 'sessions#new'
  get :signout, to: 'sessions#destroy'

  resources :users, only: :create
  resources :sessions, only: :create

  resources :tests do
    post :start, on: :member
    resources :questions, shallow: true, except: :index
  end

  resources :test_passages, only: %i[show update] do
    get :result, on: :member
  end
end
