Rails.application.routes.draw do

devise_for :admin,skip: [:registrations, :passwords] , controllers: {
  sessions: "admin/sessions"
}

namespace :admin do
    root to: "homes#top"
    resources :cosmetics, only: [:index, :show, :new, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
  end


devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
devise_scope :customer do
    post 'customers/guest_sign_in', to: 'public/sessions#new_guest'
  end

scope module: :public do
    root to: "homes#top"
    get '/about' => 'homes#about'
    resources :cosmetics, only: [:index, :show]
    get 'customers/unsubscribe', to: 'customers#unsubscribe', as: 'unsubscribe_customer'
    patch 'customers/withdrawal', to: 'customers#withdrawal', as: 'withdrawal_customer'
    get 'customers/mypage', to: 'customers#show', as: 'mypage_customer'
    get 'customers/information/edit', to: 'customers#edit', as: 'information_edit_customer'
    patch 'customers/information', to: 'customers#update', as: 'information_customer'
    resources :reviews, only: [:index, :show, :new ,:create]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
