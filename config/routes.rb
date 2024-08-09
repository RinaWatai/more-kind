Rails.application.routes.draw do
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
    root 'homes#top' # ルートを Member::HomesController の top アクションに設定
    get '/about', to: 'homes#about'
    
    resources :facilities, except: [:new]
    resources :comments
    resources :tags, only: [:index, :show]
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  end

  namespace :admin do
    root 'homes#top'
    
    resources :members, only: [:index, :show, :edit, :update, :destroy]
    resources :facilities, except: [:new]
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  end
end