Rails.application.routes.draw do
  root 'tests#index'

  devise_for :users, path: :gurus, controllers: { sessions: 'sessions' }

  resources :badges, only: :index

  resources :tests, only: :index do
    post :start, on: :member
  end

  resources :test_passages, only: %i[show update] do
    get :result, on: :member
    post :gist, on: :member
  end

  resources :feedbacks, only: %i[index new create]


  namespace :admin do
    resources :gists, only: :index
    resources :badges

    resources :tests do
      patch :update_inline, on: :member
      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: :index
      end
    end
  end
end
