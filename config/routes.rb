Rails.application.routes.draw do
  resources :sales
  resources :groupings
  resources :teams
  resources :questions do
    resources :answers
  end
  resources :suppliers
  resources :clients
  resources :products
  root 'tops#index'
  get '/menus', to: 'menus#index' # 「get 'menus/index'」-> menus_index_pathになる

   # それぞれ設定することにより、userとadminで個別のコントローラを使えるようになる。
  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'users/passwords',
    registrations: 'admins/registrations'
  }

  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end

  devise_scope :admin do
    post 'admins/guest_sign_in', to: 'admins/sessions#guest_sign_in'
  end
end
