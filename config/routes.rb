Rails.application.routes.draw do

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

  namespace :admin do
    get "/" => "homes#top"
    resources :items, only: [:index, :new, :show, :edit]
    resources :customers, only: [:index, :show, :edit]
  end


# 顧客用
# URL /customers/sign_in ...
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  scope module: :public do
    root to: "homes#top"
    get "about" => "homes#about"
    resources :items, only: [:index, :show]
    get "/customers/editpage" => "customers#edit"
    get "/customers/mypage" => "customers#show"
    get "/customers/check" => "customers#check"
    patch "/customers/withdraw" => "customers#withdraw"
    resources :customers, only: [:update]
    resources :cart_items, only: [:index, :create, :destroy, :update]
    delete "/cart_items/destroy_all" => "cart_items#destroy_all"
    resources :orders, only: [:new, :create, :index, :show]
    post "/orders/check" => "orders#check"
    get "/orders/thanks" => "orders#thanks"
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
