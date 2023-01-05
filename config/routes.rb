Rails.application.routes.draw do
  devise_for :customers, controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

devise_for :admin, controllers: {
  sessions: "admin/sessions"
}

root to: 'public/homes#top'

get 'admin' => 'admin/homes#top'
get '/about' => 'public/homes#about'
get 'customers/unsubscribe' => 'public/customers#unsubscribe'
patch 'customers/withdrawal' => 'public/customers#withdrawal'
delete 'cart_items/destroy_all' => 'public/cart_items#destroy_all'



 namespace :admin do
  resources :items, only: [:index, :new, :show, :edit, :create, :update]
  resources :genres, only: [:index, :edit, :update, :create]
  resources :customers, only: [:index, :show, :edit, :update]
 end

  scope module: :public do
  post '/order_informations/confirm' => 'order_informations#confirm'
  get '/order_informations/completion' => 'order_informations#completion'
  get '/customers/my_page' => 'customers#show'
  get '/customers/information/edit' => 'customers#edit'
  patch '/customers/information' => 'customers#update'
  resources :items, only: [:index, :show]
  resources :cart_items, only: [:index, :create, :update, :destroy]
  resources :order_informations, only: [:new, :index, :show, :create]
  resources :addresses, only: [:index, :edit, :create, :update, :destroy]

end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
