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


 namespace :admin do
  resources :items, only: [:index, :new, :show, :edit, :create, :update]
  resources :genres, only: [:index, :edit, :update, :create]
  resources :customers, only: [:index, :show, :edit, :update]
 end

namespace :public do
  resources :customers, only: [:show, :edit, :update, :unsubscribe, :withdrawal]
  resources :items, only: [:index, :show]

end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
