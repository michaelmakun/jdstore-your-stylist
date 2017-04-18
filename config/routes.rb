Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords',
  }

  root 'products#index'

  resources :products do
    resources :works
    member do
      post :add_to_cart
    end
  end

  resources :carts do
    collection do
      delete :clean
      post :checkout
    end
  end

  resources :cart_items

  resources :orders do
    member do
      post :pay_with_alipay
      post :pay_with_wechat
      post :apply_to_cancel
    end
  end

  namespace :account do
    resources :orders
    resources :products do
      resources :works
    end
  end

  namespace :admin do
    resources :products
    resources :orders do
      member do
        post :ship
        post :shipped
        post :return
        post :cancel
      end
    end
  end

  namespace :stylist do
    resources :orders do
      member do
        post :ship
        post :shipped
        post :return
        post :cancel
      end
    end
  end
end
