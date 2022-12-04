Rails.application.routes.draw do
  scope module: :public do
    resources :adresses, only: [:indx, :show, :create, :update, :destroy]
  end

  scope module: :public do
    resources :orders, only: [:show, :new, :index, :confirm, :complete]
  end

  scope module: :public do
    resources :cart_items, only: [:index, :update, :destroy, :destroy_all, :create]
  end

  scope module: :public do
    resources :customers, only: [:update, :unsubscribe, :withdrawal]
    get 'my_page' => 'customers#show'
    get 'information/edit' => 'customers#edit'

  end

  scope module: :public do
    resources :items, only: [:show, :index]
  end

  scope module: :public do
    get '/' => 'homes#top'
    get 'about' => 'homes#about', as: 'about'
  end



  #order_detailもありわかりません質問

  namespace :admin do
    resources :orders, only: [:show, :update]
    #updateもあり
  end

  namespace :admin do
    resources :customers, only: [:index, :show, :edit, :update]
    #updataもあり
  end

  namespace :admin do
    resources :items, only: [:new, :create, :index, :show, :edit, :update]
    #create,updateも
  end

  namespace :admin do
    root to: 'homes#top'
  end



  # 顧客用
# URL /customers/sign_in ...
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
