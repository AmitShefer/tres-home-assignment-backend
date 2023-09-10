Rails.application.routes.draw do
  namespace :v1 do
    post 'authenticate', to: 'auth#authenticate'

    resources :user_transactions, :path => '/user-transactions'

    resources :users
  end
end
