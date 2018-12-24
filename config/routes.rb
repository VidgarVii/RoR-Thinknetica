Rails.application.routes.draw do
  root 'tests#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :tests do
    post :start, on: :member
    resources :questions, shallow: true, except: :index
  end

  resources :test_passages, only: %i[show update] do
    get :result, on: :member
  end
end
