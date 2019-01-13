Rails.application.routes.draw do

  root 'tests#index'

  devise_for :users, path: :gurus

  resources :tests do
    post :start, on: :member
    resources :questions, shallow: true, except: :index
  end

  resources :test_passages, only: %i[show update] do
    get :result, on: :member
  end
end
