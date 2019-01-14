Rails.application.routes.draw do

  get 'answers/new'
  get 'answers/edit'
  root 'tests#index'

  devise_for :users, path: :gurus

  resources :tests do
    post :start, on: :member
    resources :questions, shallow: true, except: :index
  end

  resources :test_passages, only: %i[show update] do
    get :result, on: :member
  end

  namespace :admin do
    resources :tests do
      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: :index
      end
    end
  end
end
