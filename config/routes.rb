Rails.application.routes.draw do
  root 'homes#top' # ルートを Member::HomesController の top アクションに設定
  get '/about', to: 'homes#about'
  
  # メンバー用
  devise_for :members, skip: [:passwords], controllers: {
    registrations: "member/registrations",
    sessions: 'member/sessions'
  }

  # 管理者用
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: 'admin/sessions'
  }

  # Member routes
  namespace :member do
    resources :members, only: [:show, :edit, :update, :destroy] do
      collection do
        get 'confirm_withdraw', to: 'members#confirm_withdraw', as: :confirm_withdraw
        patch 'withdraw', to: 'members#withdraw'
      end
    end

    resources :facilities do
      collection do
        get 'search'
      end
      resources :comments, only: [:create, :destroy]
    end
  end

  namespace :admin do
    resources :members, only: [:index, :show, :edit, :update, :destroy]
    resources :facilities, only: [:index, :show, :destroy] do
      resources :comments, only: [:destroy]
    end
    resources :tags
    delete 'tag/delete_all' => "tags#delete_all"
  end
end