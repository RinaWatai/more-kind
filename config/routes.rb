Rails.application.routes.draw do
  root 'homes#top' # ルートを Member::HomesController の top アクションに設定
  get '/about', to: 'homes#about'
  
  # メンバー用
  # URL /members/sign_in ...
  devise_for :members, skip: [:passwords], controllers: {
    registrations: "member/registrations",
    sessions: 'member/sessions'
  }

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: 'admin/sessions'
  }

  # Member routes
  namespace :member do
    resources :members, only: [:show, :edit, :update, :destroy] do
      get 'members/confirm_withdraw' => 'members#confirm_withdraw', as: :members_confirm_withdraw
      patch 'members/withdraw' => 'members#withdraw'
    end
    resources :facilities do
      collection do
        get 'search'
      end
      resources :comments, only: [:create, :edit, :update, :destroy]
    end

    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  end

  namespace :admin do
    resources :members, only: [:index, :show, :edit, :update, :destroy]
    resources :facilities, only: [:index, :show, :destroy] do
      resources :comments, only: [:destroy]
    end
    resources :tags
    delete 'tag/delete_all' => "tags#delete_all"
    get 'users/confirm_withdraw' => 'users#confirm_withdraw', as: :users_confirm_withdraw
    patch 'users/withdraw' => 'users#withdraw'
  end
    
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end