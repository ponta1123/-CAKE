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
get 'customers/withdrawal' => 'public/customers#withdrawal'


 namespace :admin do
  resources :items, only: [:index, :new, :show, :edit, :create, :update]
  resources :genres, only: [:index, :edit, :update, :create]
  resources :customers, only: [:index, :show, :edit, :update]
 end

namespace :public do
  resources :customers, only: [:show, :edit, :update]
  resources :items, only: [:index, :show]
  resources :cart_items, only: [:index, :create, :update, :destroy, :destroy_all]

end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
