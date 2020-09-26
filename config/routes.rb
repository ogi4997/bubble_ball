Rails.application.routes.draw do
  devise_for :admins
  devise_for :users, controllers: {
    sessions: 'public/sessions',
    registrations: 'public/registrations',
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope module: :public do
    root 'home#top'
    get 'about' => 'home#about', as: 'about'
    get 'users/mypage' => 'users#mypage', as: 'mypage'
    get 'users/unsubscribe' => 'users#unsubscribe', as: 'confirm_unsubscribe'
    patch 'users/withdraw' => 'users#withdraw', as: 'withdraw_user'
    put 'users/withdraw' => 'users#withdraw'
    resources :users do
        resource :relationships, only: [:create, :destroy]
        get 'follows' => 'relationships#follower', as: 'follows'
        get 'followers' => 'relationships#followed', as: 'followers'
        get 'matcher' => 'relationships#matcher', as: 'matcher'
    end
    resources :rooms, only: [:index, :create, :show]
    resources :messages, only: [:create, :edit, :update, :destroy]

    resources :events
  end
end
