Rails.application.routes.draw do

  resources :users, only: [:create, :update] do
    collection do
      post 'confirm'
      post 'login'
      post 'email_update'
    end
  end

  post 'jobs', to: 'jobs#create'
  get  'jobs', to: 'jobs#index'
  get  'jobs/:id',  to: 'jobs#show'

  post 'password/forgot', to: 'password#forgot'
  post 'password/reset', to: 'password#reset'
  put 'password/update', to: 'password#update'

end
