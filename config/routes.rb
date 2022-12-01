Rails.application.routes.draw do
  #order_detailもありわかりません質問
  
  namespace :admin do
    get 'orders/show'
    #updateもあり
  end
  
  namespace :admin do
    get 'customers/index'
    get 'customers/show'
    get 'customers/edit'
    #updataもあり
  end
  
  namespace :admin do
    get 'items/index'
    get 'items/new'
    get 'items/show'
    get 'items/edit'
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
