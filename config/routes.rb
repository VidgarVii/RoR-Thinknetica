Rails.application.routes.draw do
  root 'tests#index'

  devise_for :users, path: :gurus, controllers: { sessions: 'sessions' }

  resources :tests, only: :index do
    post :start, on: :member
  end

  resources :test_passages, only: %i[show update] do
    get :result, on: :member
    post :gist, on: :member
  end

  namespace :admin do
    resources :gists, only: :index

    resources :tests do
      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: :index
      end
    end
  end
end
