Rails.application.routes.draw do
  root 'homes#top' # ルートを Member::HomesController の top アクションに設定
  get '/about', to: 'homes#about'
  
  # 顧客用
  # URL /customers/sign_in ...
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
    
    resources :members, only: [:index, :show, :edit, :update, :destroy]
    resources :facilities do
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
  end
    
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end