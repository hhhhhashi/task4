Rails.application.routes.draw do
  scope module: :public do
    resources :adresses, only: [:index, :show, :create, :update, :destroy]
  end

  scope module: :public do
    resources :orders, only: [:show, :new, :index, :create]
    post 'confirm' => 'orders#confirm'
    get 'confirm' => 'orders#confirm'
    get 'complete' => 'orders#complete'
  end

  scope module: :public do
    delete 'cart_items' => 'cart_items#destroy_all'
    resources :cart_items, only: [:index, :update, :destroy, :create]
  end

  scope module: :public do
    get 'my_page' => 'customers#show'
    get 'information/edit' => 'customers#edit'
    patch 'information/edit' => 'customers#update'
    get 'unsubscribe' => 'customers#unsubscribe'
    patch 'withdrawal' => 'customers#withdrawal'

  end

  scope module: :public do
    resources :items, only: [:show, :index]
  end

  scope module: :public do
    root to:"homes#top"
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
