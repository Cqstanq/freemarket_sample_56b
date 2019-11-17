Rails.application.routes.draw do
  devise_for :users

  #仮のルーティング
  root 'items#index'
  resources :items, only: [:show, :new] do
    collection{ get "search"}
  end

  resources :signup, only: [:crate] do
    collection do
      get  'index'
      get  'registration'
      get  'phone'
      post 'phone' => 'signup#send_sms'
      get  'phone2'
      post 'phone2' => 'signup#check_sms'
      get  'address'
      get  'payment'
      post 'create'
      get  'complete'
    end
  end

  get 'users/show', to: 'users#show'
  get 'user/edit', to: 'users#edit'
  get 'item/confirmation', to: 'items#confirmation'
  get 'identification', to: 'users#identification'
  get 'logout', to: 'users#logout'
  get 'card', to: 'users#card'
  # get 'signup', to: 'tests#signup'
  get 'login', to: 'tests#login'
  # get 'phone', to: 'tests#phone'
  # get 'registration', to: 'tests#registration'
  # get 'address', to: 'tests#address'
  # get 'payment', to: 'tests#payment'
  # get 'phone2', to: 'tests#phone2'
  # get 'complete', to: 'tests#complete'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
