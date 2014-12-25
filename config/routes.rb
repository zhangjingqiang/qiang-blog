Rails.application.routes.draw do
  resources :blogs
  get 'archive/:year_month', to: 'blogs#archive', as: 'archive'
  get 'tag/:tag_id', to: 'blogs#tag', as: 'tag', constraints: { tag_id: /.+/ }
  
  get 'archives', :to => 'archives#index', :as => 'archives'
  get 'tags', :to => 'tags#index', :as => 'tags'
  get 'about', :to => 'about#index', :as => 'about'
  
  devise_for :admins
  get 'admin', :to => 'admin#index'
  get 'admins', :to => 'admin#index'
  
  namespace :admin do
    get 'search', to: 'search#index'
    resources :blogs
    resources :tags, constraints: { id: /[^\/]+/ }
    resources :tags, only: [], constraints: { id: /[^\/]+/ } do
      resources :blogs, only: [:index]
    end
    resources :abouts
    get 'clicks', :to => 'clicks#index'
    get 'logins', :to => 'logins#index'
  end
  
  root 'blogs#index'
end
